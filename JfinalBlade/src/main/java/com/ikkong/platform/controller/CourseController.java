package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.meta.intercept.CourseIntercept;
import com.ikkong.platform.model.Course;
import com.ikkong.platform.service.CourseService;
import com.ikkong.platform.service.impl.CourseServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

public class CourseController extends UrlPermissController {

	
	private static String CODE = "coursee";
	private static String PERFIX = "yb_course";
	private static String LIST_SOURCE = "Course.list";
	private static String BASE_PATH = "/platform/course/";
	
	CourseService service = new CourseServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "course.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "course_add.html");
	}

	public void edit() {
		String id = getPara(0);
		Course course = service.findById(id);
		setAttr("model", JsonKit.toJson(course));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "course_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Course course = service.findById(id);
		setAttr("model", JsonKit.toJson(course));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "course_view.html");
	}

	public void list() {
		//因为有下拉框，需要将数字转换成文字，所以需要拦截器
		Object grid = paginate(LIST_SOURCE,new CourseIntercept());
		renderJson(grid);
	}

	public void save() {
		Course course = mapping(PERFIX, Course.class);
		boolean temp = service.save(course);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Course course = mapping(PERFIX, Course.class);
		boolean temp = service.update(course);
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
