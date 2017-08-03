package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.meta.intercept.BlogIntercept;
import com.ikkong.platform.meta.intercept.StudentIntercept;
import com.ikkong.platform.model.Blog;
import com.ikkong.platform.model.Major;
import com.ikkong.platform.model.Mirror;
import com.ikkong.platform.model.Student;
import com.ikkong.platform.service.BlogService;
import com.ikkong.platform.service.MajorService;
import com.ikkong.platform.service.MirrorService;
import com.ikkong.platform.service.StudentService;
import com.ikkong.platform.service.impl.BlogServiceImpl;
import com.ikkong.platform.service.impl.MajorServiceImpl;
import com.ikkong.platform.service.impl.MirrorServiceImpl;
import com.ikkong.platform.service.impl.StudentServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

/**
 * Generated by Blade.
 * 2016-10-08 15:59:45
 */
public class MajorController extends UrlPermissController {
	private static String CODE = "major";
	private static String PERFIX = "yb_major";
	private static String LIST_SOURCE = "Major.list";
	private static String BASE_PATH = "/platform/major/";
	
	MajorService service = new MajorServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "major.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "major_add.html");
	}

	public void edit() {
		String id = getPara(0);
		Major major = service.findById(id);
		setAttr("model", JsonKit.toJson(major));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "major_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Major major = service.findById(id);
		setAttr("model", JsonKit.toJson(major));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "major_view.html");
	}

	public void list() {
		Object grid = paginate(LIST_SOURCE);
		renderJson(grid);
	}

	public void save() {
		Major major = mapping(PERFIX, Major.class);
		major.setDescription(major.getGrade_name()+major.getMajor_name()+major.getClass_name());
		boolean temp = service.save(major);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Major major = mapping(PERFIX, Major.class);
		major.setDescription(major.getGrade_name()+major.getMajor_name()+major.getClass_name());
		boolean temp = service.update(major);
		if (temp) {
			renderJson(success(UPDATE_SUCCESS_MSG));
		} else {
			renderJson(error(UPDATE_FAIL_MSG));
		}
	}

	public void remove() {
		String ids = getPara("ids");
		int cnt = service.deleteByIds(ids);
		if (cnt > 0) {
			renderJson(success(DEL_SUCCESS_MSG));
		} else {
			renderJson(error(DEL_FAIL_MSG));
		}
	}
}