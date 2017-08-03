package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.meta.intercept.CourseTypeIntercept;
import com.ikkong.platform.model.CourseType;
import com.ikkong.platform.service.CourseTypeService;
import com.ikkong.platform.service.impl.CourseTypeServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

public class CourseTypeController extends UrlPermissController {
	private static String CODE = "courseType";
	private static String PERFIX = "yb_course_type";
	private static String LIST_SOURCE = "CourseType.list";
	private static String BASE_PATH = "/platform/courseType/";
	
	CourseTypeService service = new CourseTypeServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "courseType.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "courseType_add.html");
	}

	public void edit() {
		String id = getPara(0);
		CourseType courseType = service.findById(id);
		setAttr("model", JsonKit.toJson(courseType));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "courseType_edit.html");
	}

	public void view() {
		String id = getPara(0);
		CourseType courseType = service.findById(id);
		setAttr("model", JsonKit.toJson(courseType));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "courseType_view.html");
	}

	public void list() {
		//因为有下拉框，需要将数字转换成文字，所以需要拦截器
		Object grid = paginate(LIST_SOURCE);
		renderJson(grid);
	}

	public void save() {
		CourseType courseType = mapping(PERFIX, CourseType.class);
		boolean temp = service.save(courseType);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		CourseType courseType = mapping(PERFIX, CourseType.class);
		boolean temp = service.update(courseType);
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
