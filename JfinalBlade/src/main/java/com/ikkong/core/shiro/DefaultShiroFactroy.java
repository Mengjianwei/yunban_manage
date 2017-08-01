/**
 * Copyright (c) 2015-2016, Chill Zhuang 庄骞 (smallchill@163.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.ikkong.core.shiro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;

import com.ikkong.common.vo.ShiroUser;
import com.ikkong.common.vo.User;
import com.ikkong.core.constant.ConstCache;
import com.ikkong.core.dao.Blade;
import com.ikkong.core.dao.Db;
import com.ikkong.core.interfaces.IShiro;
import com.ikkong.core.toolbox.Func;
import com.ikkong.core.toolbox.Record;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

public class DefaultShiroFactroy implements IShiro{
	
	public User user(String account) {
		User user = Blade.create(User.class).findFirstBy("account = #{account}", Record.create().set("account", account));
		// 账号不存在
		if (null == user) {
			return null;
		}
		// 账号未审核
		if (user.getStatus() == 3 || user.getStatus() == 4) {
			return null;
		}
		// 账号被冻结
		if (user.getStatus() == 2 || user.getStatus() == 5) {
			return null;
		}
		return user;
	}

	public ShiroUser shiroUser(User user) {
		List<String> roleList = new ArrayList<>();
		String[] roles = user.getRoleid().split(",");
		for (int i = 0; i < roles.length; i++) {
			roleList.add(roles[i]);
		}
		return new ShiroUser(user.getId(), user.getDeptid(), user.getAccount(), user.getName(), roleList);
	}

	public List<Map<String, Object>> findPermissionsByRoleId(final Object userId, String roleId) {
		Map<String, Object> userRole = CacheKit.get(ConstCache.MENU_CACHE, "role_ext_" + userId, new IDataLoader() {
			@Override
			public Object load() {
				return Db.init().selectOne("select * from TFW_ROLE_EXT where USERID=#{userId}", Record.create().set("userId", userId));
			}
		}); 


		String roleIn = "0";
		String roleOut = "0";
		if (!Func.isEmpty(userRole)) {
			Record map = Record.parse(userRole);
			roleIn = map.getStr("ROLEIN");
			roleOut = map.getStr("ROLEOUT");
		}
		
		final StringBuilder sql = new StringBuilder();
		sql.append("select ID,CODE,URL from TFW_MENU  ");
		sql.append(" where ( ");
		sql.append("	 (status=1)");
		sql.append("	 and (url is not null) ");
		sql.append("	 and (id in (select menuId from TFW_RELATION where roleId in (" + roleId + ")) or id in (" + roleIn + "))");
		sql.append("	 and id not in(" + roleOut + ")");
		sql.append("	)");
		sql.append(" order by levels,pCode,num");

		List<Map<String, Object>> permissions = CacheKit.get(ConstCache.MENU_CACHE, "permissions_" + userId, new IDataLoader() {
			@Override
			public Object load() {
				return Db.init().selectList(sql.toString());
			}
		}); 
		
		return permissions;
	}

	public String findRoleNameByRoleId(final String roleId) {
		Map<String, Object> map = CacheKit.get(ConstCache.ROLE_CACHE, "findRoleNameByRoleId" + roleId, new IDataLoader() {
			@Override
			public Object load() {
				return Db.init().selectOne("select TIPS from tfw_role where id = #{id}", Record.create().set("id", roleId));
			}
		});
		return Func.format(map.get("TIPS"));
	}

	public SimpleAuthenticationInfo info(ShiroUser shiroUser, User user, String realmName) {
		String credentials = user.getPassword();
		// 密码加盐处理
		String source = user.getSalt();
		ByteSource credentialsSalt = new Md5Hash(source);
		return new SimpleAuthenticationInfo(shiroUser, credentials, credentialsSalt, realmName);
	}

}
