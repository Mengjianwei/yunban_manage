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
package com.ikkong.system.meta.intercept;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.ikkong.core.aop.AopContext;
import com.ikkong.core.constant.Cst;
import com.ikkong.core.dao.Db;
import com.ikkong.core.meta.MetaIntercept;
import com.ikkong.core.toolbox.Func;
import com.ikkong.core.toolbox.Record;
import com.ikkong.core.toolbox.support.BladePage;
import com.jfinal.kit.PathKit;

public class AttachIntercept extends MetaIntercept {
	/**
	 * 查询后操作
	 * 
	 * @param ac
	 */
	@SuppressWarnings("unchecked")
	public void queryAfter(AopContext ac) {
		BladePage<Map<String, Object>> page = (BladePage<Map<String, Object>>) ac.getObject();
		List<Map<String, Object>> list = page.getRows();
		for (Map<String, Object> map : list) {
			map.put("ATTACHURL", Cst.me().getContextPath() + "/kindeditor/renderFile/" + map.get("ID"));
			map.put("STATUSNAME", Func.getDictName(902, map.get("STATUS")));
			map.put("CREATERNAME", Func.getUserName(map.get("CREATER")));
		}
	}

	/**
	 * 查看转向前操作
	 * 
	 * @param ac
	 */
	public void renderViewBefore(AopContext ac) {
		Record maps = (Record) ac.getObject();
		maps
		.set("attachUrl", Cst.me().getContextPath() + "/kindeditor/renderFile/" + maps.get("id"))
		.set("statusName", Func.getDictName(902, maps.get("status")))
		.set("createrName", Func.getUserName(maps.get("creater")));
	}
	
	/**
	 * 物理删除前操作(事务内)
	 * 
	 * @param ac
	 */
	public void removeBefore(AopContext ac) {
		Map<String, Object> file = Db.init().findById("TFW_ATTACH", ac.getId().toString());
		if (Func.isEmpty(file)) {
			throw new RuntimeException("文件不存在!");
		} else {
			String url = file.get("URL").toString();
			File f = new File((Cst.me().isRemoteMode() ? "" : PathKit.getWebRootPath()) + url);
			if(null == f || !f.isFile()){
				throw new RuntimeException("文件不存在!");
			}
			f.delete();
		}
	}
	
}