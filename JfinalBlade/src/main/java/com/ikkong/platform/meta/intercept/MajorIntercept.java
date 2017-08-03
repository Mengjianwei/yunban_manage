package com.ikkong.platform.meta.intercept;

import java.util.List;
import java.util.Map;

import com.ikkong.core.aop.AopContext;
import com.ikkong.core.dao.Blade;
import com.ikkong.core.meta.PageIntercept;
import com.ikkong.core.toolbox.Func;
import com.ikkong.core.toolbox.Record;
import com.ikkong.core.toolbox.support.BladePage;
import com.ikkong.platform.model.CourseType;
import com.ikkong.platform.model.Flavor;
import com.ikkong.platform.model.Major;
import com.ikkong.platform.model.Mirror;
import com.ikkong.platform.model.Net;

public class MajorIntercept extends PageIntercept {

	/**
	 * 查询后附加字典项
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void queryAfter(AopContext ac) {
		
		BladePage<Map<String, Object>> page = (BladePage<Map<String, Object>>) ac.getObject();
		List<Map<String, Object>> list = page.getRows();
		for (Map<String, Object> map : list) {
			Object typeid = map.get("typeid");
			CourseType type = Blade.create(CourseType.class).findFirstBy("id = #{id}", Record.create().set("id", typeid));
			map.put("type_name", type.getType_name());
		}
	}
	
}
