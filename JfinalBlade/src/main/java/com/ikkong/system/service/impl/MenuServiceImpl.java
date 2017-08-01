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
package com.ikkong.system.service.impl;

import com.ikkong.core.base.service.impl.BaseService;
import com.ikkong.core.dao.Blade;
import com.ikkong.core.toolbox.Record;
import com.ikkong.system.model.Menu;
import com.ikkong.system.service.MenuService;

public class MenuServiceImpl extends BaseService<Menu> implements MenuService {

	@Override
	public int findLastNum(String code) {
		try{
			Blade blade = Blade.create(Menu.class);
			Menu menu = blade.findFirstBy("pCode = #{pCode} order by num desc", Record.create().set("pCode", code));
			return menu.getNum() + 1;
		}
		catch(Exception ex){
			return 1;
		}
	}

	@Override
	public boolean isExistCode(String code) {
		Blade blade = Blade.create(Menu.class);
		String sql = "select * from tfw_menu where code = #{code}";
		boolean temp = blade.isExist(sql, Record.create().set("code", code));
		return temp;
	}

	@Override
	public boolean updateStatus(String ids, Object status) {
		Record paras = Record.create().set("status", status).set("ids", ids.split(","));
		/*SQLManager sql = Blade.dao();
		int cnt = sql.executeUpdate("update tfw_menu set status=#{status} where id in (#{join(ids)})", paras);
		return cnt > 0;*/
		Blade blade = Blade.create(Menu.class);
		boolean temp = blade.updateBy("status=#{status}", "id in (#{join(ids)})", paras);
		return temp;
	}

}
