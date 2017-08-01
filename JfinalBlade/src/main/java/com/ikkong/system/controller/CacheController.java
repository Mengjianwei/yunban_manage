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
package com.ikkong.system.controller;

import com.ikkong.common.vo.ShiroUser;
import com.ikkong.core.aop.AopContext;
import com.ikkong.core.base.BaseController;
import com.ikkong.core.constant.Cst;
import com.ikkong.core.dao.Db;
import com.ikkong.core.jfinal.ext.kit.JStrKit;
import com.ikkong.core.jfinal.ext.shiro.ShiroKit;
import com.ikkong.core.toolbox.Func;
import com.ikkong.core.toolbox.Record;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CacheController extends BaseController{

	public void index() {

	}

	/**
	 * 获取按钮组
	 */
	public void getBtn() {
		final String code = getPara("code");
		ShiroUser user = ShiroKit.getUser();
		final String userId = user.getId().toString();
		final String roleId = user.getRoles().toString();

		Map<String, Object> userRole = CacheKit.get(MENU_CACHE, "roleExt_" + userId,
				new IDataLoader() {
					public Object load() {
						return Db.init().selectOne("select * from TFW_ROLE_EXT where userId= #{id}", Record.create().set("id", userId));
					}
				});

		String roleIn = "0";
		String roleOut = "0";
		if (!Func.isEmpty(userRole)) {
			roleIn = Func.format(userRole.get("ROLEIN"));
			roleOut = Func.format(userRole.get("ROLEOUT"));
		}
		final StringBuilder sql = new StringBuilder();
		sql.append("select TFW_MENU.* ,(select name from TFW_MENU where code=#{code}) as PNAME  from TFW_MENU");
		sql.append(" where ( ");
		sql.append("	 (status=1)");
		sql.append("	 and (icon is not null and (icon like '%btn%' or icon like '%icon%' ) ) ");
		sql.append("	 and (pCode=#{code})");
		sql.append("	 and (id in (select menuId from TFW_RELATION where roleId in ("
				+ roleId + ")) or id in (" + roleIn + "))");
		sql.append("	 and id not in(" + roleOut + ")");
		sql.append("	)");
		sql.append(" order by num");

		List<Map<String, Object>> btnList = CacheKit.get(MENU_CACHE, "btnList_" + code + "_"
				+ userId, new IDataLoader() {
			public Object load() {
				return Db.init().selectList(sql.toString(), Record.create().set("code", code));
			}
		});
		renderJson(json(btnList));
	}

	/**
	 * 获取按钮组
	 */
	public void getChildBtn() {
		final String code = getPara("code");
		ShiroUser user = ShiroKit.getUser();
		final String userId = user.getId().toString();
		final String roleId = user.getRoles().toString();

		Map<String, Object> userRole = CacheKit.get(MENU_CACHE, "roleExt_" + userId,
				new IDataLoader() {
					public Object load() {
						return Db.init().selectOne("select * from TFW_ROLE_EXT where userId= #{id}", Record.create().set("id", userId));
					}
				});

		String roleIn = "0";
		String roleOut = "0";
		if (!Func.isEmpty(userRole)) {
			roleIn = Func.format(userRole.get("ROLEIN"));
			roleOut = Func.format(userRole.get("ROLEOUT"));
		}
		final StringBuilder sql = new StringBuilder();
		sql.append("select TFW_MENU.* ,(select name from TFW_MENU where code=#{code}) as PNAME  from TFW_MENU");
		sql.append(" where ( ");
		sql.append("	 (status=1)");
		sql.append("	 and (icon is not null and (icon like '%btn%' or icon like '%icon%' ) ) ");
		sql.append("	 and (pCode=#{code})");
		sql.append("	 and (id in (select menuId from TFW_RELATION where roleId in ("
				+ roleId + ")) or id in (" + roleIn + "))");
		sql.append("	 and id not in(" + roleOut + ")");
		sql.append("	)");
		sql.append(" order by num");

		List<Map<String, Object>> btnList = CacheKit.get(MENU_CACHE, "childBtnList_" + code + "_" + userId, new IDataLoader() {
			public Object load() {
				return Db.init().selectList(sql.toString(), Record.create().set("code", code));
			}
		});
		renderJson(json(btnList));
	}

	/**
	 * 根据字典编号获取下拉框
	 * 
	 * @return String
	 */
	public void getSelect() {
		final String code = getPara("code");
		final String num = getPara("num");
		List<Map<String, Object>> dict = CacheKit.get(DICT_CACHE, "dict_common_" + code,
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select num as ID,pId as PID,name as TEXT from  TFW_DICT where code=#{code} and num>0", Record.create().set("code", code));
					}
				});
		StringBuilder sb = new StringBuilder();
		sb.append("<select class=\"form-control\" style=\"margin-left:-3px;cursor:pointer;\" id=\"inputs"
				+ num + "\">");
		sb.append("<option value></option>");
		for (Map<String, Object> dic : dict) {
			sb.append("<option value=\"" + dic.get("ID") + "\">" + dic.get("TEXT") + "</option>");
		}
		sb.append("</select>");
		renderJson(json(sb.toString()));
	}

	public void getCombo() {
		final String code = getPara("code");
		List<Map<String, Object>> dict = CacheKit.get(DICT_CACHE, "dict_combo_" + code,
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select num as \"id\",name as \"text\" from  TFW_DICT where code=#{code} and num>0", Record.create().set("code", code), new AopContext("ztree"));
					}
				});

		renderJson(json(dict));;
	}

	public void getDeptSelect() {
		final String num = getPara("num");
		List<Map<String, Object>> dept = CacheKit.get(DEPT_CACHE, "dept_all",
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select ID,PID,simpleName as TEXT from  TFW_DEPT order by pId,num asc", Record.create(), new AopContext(), Cst.me().getDefaultSelectFactory().deptIntercept());
					}
				});
		StringBuilder sb = new StringBuilder();
		sb.append("<select class=\"form-control\" style=\"margin-left:-3px;cursor:pointer;\" id=\"inputs"
				+ num + "\">");
		sb.append("<option value></option>");
		for (Map<String, Object> _dept : dept) {
			sb.append("<option value=\"" + _dept.get("ID") + "\">" + _dept.get("TEXT") + "</option>");
		}
		sb.append("</select>");
		renderJson(json(sb.toString()));
	}

	public void getUserSelect() {
		final String num = getPara("num");
		List<Map<String, Object>> dept = CacheKit.get(DEPT_CACHE, "user_all",
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select ID,name TEXT from TFW_USER where status=1 and name is not null order by name ", Record.create(), new AopContext(), Cst.me().getDefaultSelectFactory().userIntercept());
					}
				});
		StringBuilder sb = new StringBuilder();
		sb.append("<select class=\"form-control\" style=\"margin-left:-3px;cursor:pointer;\" id=\"inputs"
				+ num + "\">");
		sb.append("<option value></option>");
		for (Map<String, Object> _dept : dept) {
			sb.append("<option value=\"" + _dept.get("ID") + "\">" + _dept.get("TEXT") + "</option>");
		}
		sb.append("</select>");
		renderJson(json(sb.toString()));
	}

	public void getRoleSelect() {
		final String num = getPara("num");
		List<Map<String, Object>> dept = CacheKit.get(ROLE_CACHE, "role_all",
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select ID,name TEXT from TFW_Role where  name is not null order by name ", Record.create(), new AopContext("ztree"));
					}
				});
		StringBuilder sb = new StringBuilder();
		sb.append("<select class=\"form-control\" style=\"margin-left:-3px;cursor:pointer;\" id=\"inputs"
				+ num + "\">");
		sb.append("<option value></option>");
		for (Map<String, Object> _dept : dept) {
			sb.append("<option value=\"" + _dept.get("ID") + "\">" + _dept.get("TEXT") + "</option>");
		}
		sb.append("</select>");
		renderJson(json(sb.toString()));
	}

	public void dicTreeList() {
		List<Map<String, Object>> dic = CacheKit.get(DICT_CACHE, "dict_all",
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select code \"code\",id \"id\",pId \"pId\",name \"name\",num \"num\",'false' \"open\" from TFW_DICT order by code asc,num asc", Record.create());
					}
				});

		renderJson(json(dic));
	}

	public void deptTreeList() {
		List<Map<String, Object>> dept = CacheKit.get(DEPT_CACHE, "dept_tree_all_" + ShiroKit.getUser().getId(),
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select id \"id\",pId \"pId\",simpleName as \"name\",(case when (pId=0 or pId is null) then 'true' else 'false' end) \"open\" from  TFW_DEPT ", Record.create(), new AopContext("ztree"), Cst.me().getDefaultSelectFactory().deptIntercept());
					}
				});

		renderJson(json(dept));
	}

	public void roleTreeList() {
		List<Map<String, Object>> dept = CacheKit.get(ROLE_CACHE, "role_tree_all_" + ShiroKit.getUser().getId(),
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select id \"id\",pId \"pId\",name as \"name\",(case when (pId=0 or pId is null) then 'true' else 'false' end) \"open\" from  TFW_ROLE ", Record.create(), new AopContext("ztree"), Cst.me().getDefaultSelectFactory().roleIntercept());
					}
				});

		renderJson(json(dept));
	}

	public void getDicById() {
		final int id = getParaToInt("id");
		List<Map<String, Object>> dict = CacheKit.get(DICT_CACHE, "dict_" + id,
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select CODE from TFW_DICT where id=#{id}",Record.create().set("id", id), new AopContext("ztree"));
					}
				});
		renderJson(json(dict));
	}

	public void menuTreeList() {
		List<Map<String, Object>> menu = CacheKit.get(MENU_CACHE, "menu_tree_all",
				new IDataLoader() {
					public Object load() {
						return Db.init().selectList("select code \"id\",pCode \"pId\",name \"name\",(case when levels=1 then 'true' else 'false' end) \"open\" from TFW_MENU where status=1 order by levels asc,num asc");
					}
				});

		renderJson(json(menu));
	}

	public void menuTreeListByRoleId() {
		final String roleId = getPara("roleId", "0");
		List<Map<String, Object>> menu = CacheKit.get(MENU_CACHE, "tree_role_" + roleId,
				new IDataLoader() {
					public Object load() {
						String table = "TFW_MENU";
						String pid = "";
						List<Record> record = Db.init().selectList("select PID from TFW_ROLE where id in (" + roleId + ")"); 
						for (Map<String, Object> p : record) {
							if (!Func.isEmpty(p.get("PID"))) {
								pid += p.get("PID").toString() + ",";
							}
						}
						if (!Func.isEmpty(pid)) {
							pid = JStrKit.removeSuffix(pid, ",");
							table = "(select * from TFW_MENU where id in( select MENUID from TFW_RELATION where roleId in ("
									+ pid + ") ))";
						}
						StringBuilder sb = new StringBuilder();
						sb.append("select m.id \"id\",(select id from TFW_MENU  where code=m.pCode) \"pId\",name \"name\",(case when m.levels=1 then 'true' else 'false' end) \"open\",(case when r.menuId is not null then 'true' else 'false' end) \"checked\"");
						sb.append(" from ");
						sb.append(table);
						sb.append(" m left join (select MENUID from TFW_RELATION where roleId in ("
								+ roleId
								+ ") GROUP BY MENUID) r on m.id=r.menuId where m.status=1 order by m.levels,m.num asc");
						return Db.init().selectList(sb.toString());
					}
				});

		renderJson(json(menu));
	}

	public void roleTreeListById() {
		final String Id = getPara("id");
		final String roleId = getPara("roleId", "0");
		List<Map<String, Object>> menu = CacheKit.get(ROLE_CACHE, "role_tree_" + Id,
				new IDataLoader() {
					public Object load() {
						String sql = "select id \"id\",pId \"pId\",name as \"name\",(case when (pId=0 or pId is null) then 'true' else 'false' end) \"open\" from  TFW_ROLE order by pId,num asc";
						if (Id.indexOf(",") == -1) {
							sql = "select r.id \"id\",pId \"pId\",name as \"name\",(case when (pId=0 or pId is null) then 'true' else 'false' end) \"open\",(case when (r1.ID=0 or r1.ID is null) then 'false' else 'true' end) \"checked\" from  TFW_ROLE r left join (select ID  from TFW_ROLE where ID in ("
									+ roleId
									+ ")) r1 on r.ID=r1.ID order by pId,num asc";
						}
						return Db.init().selectList(sql);
					}
				});

		renderJson(json(menu));
	}
	
	/**
	 * 获取自定义下拉框
	 * 
	 * @return String
	 */
	public void getSelectSelf() {
		
		final String col = getPara("col");
		final String num = getPara("num");
		List<Record> dict = new ArrayList<Record>();
		if (col.equals("major_name")) {
			dict = Db.init().selectList("select id as ID,major_name as TEXT from  yb_major");
		}
		StringBuilder sb = new StringBuilder();
		sb.append("<select class=\"form-control\" style=\"margin-left:-3px;cursor:pointer;\" id=\"inputs"
				+ num + "\">");
		sb.append("<option value></option>");
		for (Record dic : dict) {
			sb.append("<option value=\"" + dic.get("ID") + "\">" + dic.get("TEXT") + "</option>");
		}
		sb.append("</select>");
		renderJson(json(sb.toString()));
	}
}
