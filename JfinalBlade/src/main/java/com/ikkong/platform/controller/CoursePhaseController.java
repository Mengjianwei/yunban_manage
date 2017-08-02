package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.meta.intercept.CoursePhaseIntercept;
import com.ikkong.platform.model.CoursePhase;
import com.ikkong.platform.model.Student;
import com.ikkong.platform.service.CoursePhaseService;
import com.ikkong.platform.service.StudentService;
import com.ikkong.platform.service.impl.CoursePhaseServiceImpl;
import com.ikkong.platform.service.impl.StudentServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

public class CoursePhaseController extends UrlPermissController {
	
	private static String CODE = "coursePhase";
	private static String PERFIX = "yb_course_phase";
	private static String LIST_SOURCE = "CoursePhase.list";
	private static String BASE_PATH = "/platform/coursePhase/";
	
	CoursePhaseService service = new CoursePhaseServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "coursePhase.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "coursePhase_add.html");
	}

	public void edit() {
		String id = getPara(0);
		CoursePhase coursePhase = service.findById(id);
		setAttr("model", JsonKit.toJson(coursePhase));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "coursePhase_edit.html");
	}

	public void view() {
		String id = getPara(0);
		CoursePhase coursePhase = service.findById(id);
		setAttr("model", JsonKit.toJson(coursePhase));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "coursePhase_view.html");
	}

	public void list() {
		//因为有下拉框，需要将数字转换成文字，所以需要拦截器
		Object grid = paginate(LIST_SOURCE,new CoursePhaseIntercept());
		renderJson(grid);
	}

	public void save() {
		CoursePhase coursePhase = mapping(PERFIX, CoursePhase.class);
		boolean temp = service.save(coursePhase);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		CoursePhase coursePhase = mapping(PERFIX, CoursePhase.class);
		boolean temp = service.update(coursePhase);
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
