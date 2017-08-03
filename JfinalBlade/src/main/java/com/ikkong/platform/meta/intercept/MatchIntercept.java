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

public class MatchIntercept extends PageIntercept {

	/**
	 * 查询后附加字典项
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void queryAfter(AopContext ac) {
		
		BladePage<Map<String, Object>> page = (BladePage<Map<String, Object>>) ac.getObject();
		List<Map<String, Object>> list = page.getRows();
		for (Map<String, Object> map : list) {
			Object mirrorid = map.get("mirrorid");
			Object netid = map.get("netid");
			Object flavorid = map.get("flavorid");
			Mirror mirror = Blade.create(Mirror.class).findFirstBy("id = #{id}", Record.create().set("id", mirrorid));
			Net net = Blade.create(Net.class).findFirstBy("id = #{id}", Record.create().set("id", netid));
			Flavor flavor = Blade.create(Flavor.class).findFirstBy("id = #{id}", Record.create().set("id", flavorid));
			map.put("mirror_name", mirror.getMirror_name());
			map.put("net_name", net.getNet_name());
			map.put("flavor_name", flavor.getFlavor_describe());
			map.put("status", Func.getDictName(902, map.get("status")));
		}
	}
	
}
