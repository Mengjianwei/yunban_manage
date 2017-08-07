package com.ikkong.platform.controller;

import com.ikkong.core.dao.Blade;
import com.ikkong.core.jfinal.ext.kit.JStrKit;
import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.core.jfinal.ext.shiro.ShiroKit;
import com.ikkong.core.toolbox.Func;
import com.ikkong.core.toolbox.Record;
import com.ikkong.platform.meta.intercept.CostreeIntercept;
import com.ikkong.platform.model.Costree;
import com.ikkong.system.controller.base.AdminBaseController;
import com.ikkong.system.controller.base.UrlPermissController;
import com.ikkong.system.meta.intercept.RoleIntercept;
import com.ikkong.system.meta.intercept.RoleValidator;
import com.ikkong.system.model.Dept;
import com.ikkong.system.model.Role;
import com.ikkong.system.service.RoleService;
import com.ikkong.system.service.impl.RoleServiceImpl;
import com.jfinal.aop.Before;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.ehcache.CacheKit;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;

import static com.ikkong.core.constant.ConstShiro.ADMIN;
import static com.ikkong.core.constant.ConstShiro.ADMINISTRATOR;

public class CostreeController extends UrlPermissController {

	private static String LIST_SOURCE = "Costree.list";
	private static String BASE_PATH = "/platform/costree/";
	private static String CODE = "costree";
	private static String PERFIX = "yb_course_tree";
	

	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "costree.html");
	}
	
	public void list() {
		Object gird = paginate(LIST_SOURCE,new CostreeIntercept());
		renderJson(gird);
	}
	
	public void add() {
		String id = getPara(0);
		if (StrKit.notBlank(id)) {
			Costree costree = Blade.create(Costree.class).findById(id);
			setAttr("pid", id);
			setAttr("level", costree.getLevel() + 1);
			setAttr("num", findLastNum(id));
		}
		setAttr("code", CODE);
		render(BASE_PATH + "costree_add.html");
	}
	
	public void edit() {
		String id = getPara(0);
		Costree costree = Blade.create(Costree.class).findById(id);
		setAttr("model", JsonKit.toJson(costree));
		setAttr("code", CODE);
		setAttr("level", costree.getLevel());
		render(BASE_PATH + "costree_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Blade blade = Blade.create(Costree.class);
		Costree Costree = blade.findById(id);
		Costree parent = blade.findById(Costree.getPid());
		String pName = (null == parent) ? "" : parent.getName();
		Record maps = Record.parse(Costree);
		maps.set("pName", pName);
		setAttr("model", JsonKit.toJson(maps));
		setAttr("code", CODE);
		render(BASE_PATH + "costree_view.html");
	}
	
	public void save() {
		Costree costree = mapping(PERFIX, Costree.class);
		boolean temp = Blade.create(Costree.class).save(costree);
		if (temp) {
			CacheKit.removeAll(COURSE_TREE_CACHE);
			renderJson(success("新增成功"));
		} else {
			renderJson(error("新增失败"));
		}
	}

	public void update() {
		Costree costree = mapping(PERFIX, Costree.class);
		boolean temp = Blade.create(Costree.class).update(costree);
		if (temp) {
			CacheKit.removeAll(COURSE_TREE_CACHE);
			renderJson(success("修改成功"));
		} else {
			renderJson(error("修改失败"));
		}
	}

	public void remove() {
		String ids = getPara("ids");
		int cnt = Blade.create(Costree.class).deleteByIds(ids);
		if (cnt > 0) {
			CacheKit.removeAll(COURSE_TREE_CACHE);
			renderJson(success("删除成功!"));
		} else {
			renderJson(error("删除失败!"));
		}
	}
	
	private int findLastNum(String id){
		try{
			Blade blade = Blade.create(Costree.class);
			Costree costree = blade.findFirstBy("pid = #{pid} order by num desc", Record.create().set("pid", id));
			return costree.getNum() + 1;
		}
		catch(Exception ex){
			return 1;
		}
	}
	
}
