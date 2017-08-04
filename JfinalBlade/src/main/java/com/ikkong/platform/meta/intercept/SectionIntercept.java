package com.ikkong.platform.meta.intercept;

import java.util.List;
import java.util.Map;

import com.ikkong.core.aop.AopContext;
import com.ikkong.core.dao.Blade;
import com.ikkong.core.meta.PageIntercept;
import com.ikkong.core.toolbox.Record;
import com.ikkong.core.toolbox.support.BladePage;
import com.ikkong.platform.model.Course;
import com.ikkong.platform.model.Doc;
import com.ikkong.platform.model.Major;

public class SectionIntercept extends PageIntercept {
	
	/**
	 * 查询后附加字典项
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void queryAfter(AopContext ac) {
		
		BladePage<Map<String, Object>> page = (BladePage<Map<String, Object>>) ac.getObject();
		List<Map<String, Object>> list = page.getRows();
		for (Map<String, Object> map : list) {
			Object courseid = map.get("courseid");
			Object docid = map.get("docid");
			Course course = Blade.create(Course.class).findFirstBy("id = #{id}", Record.create().set("id", courseid));
			Doc doc = Blade.create(Doc.class).findFirstBy("id = #{id}", Record.create().set("id", docid));
			map.put("course_name", course.getCourse_name());
			map.put("doc_name", doc.getDoc_name());
		}
	}

}
