package com.ikkong.platform.meta.intercept;

import java.util.List;
import java.util.Map;

import com.ikkong.core.aop.AopContext;
import com.ikkong.core.dao.Blade;
import com.ikkong.core.meta.PageIntercept;
import com.ikkong.core.toolbox.Record;
import com.ikkong.core.toolbox.support.BladePage;
import com.ikkong.platform.model.Major;

public class StudentIntercept extends PageIntercept {

	/**
	 * 查询后附加字典项
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void queryAfter(AopContext ac) {
		
		BladePage<Map<String, Object>> page = (BladePage<Map<String, Object>>) ac.getObject();
		List<Map<String, Object>> list = page.getRows();
		for (Map<String, Object> map : list) {
			Object majorid = map.get("majorid");
			Major major = Blade.create(Major.class).findFirstBy("id = #{id}", Record.create().set("id", majorid));
			map.put("major_name", major.getDescription());
		}
	}
	
}
