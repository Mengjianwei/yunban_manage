package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.meta.intercept.BlogIntercept;
import com.ikkong.platform.meta.intercept.StudentIntercept;
import com.ikkong.platform.model.Blog;
import com.ikkong.platform.model.Student;
import com.ikkong.platform.service.BlogService;
import com.ikkong.platform.service.StudentService;
import com.ikkong.platform.service.impl.BlogServiceImpl;
import com.ikkong.platform.service.impl.StudentServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

/**
 * Generated by Blade.
 * 2016-10-08 15:59:45
 */
public class StudentController extends UrlPermissController {
	private static String CODE = "student";
	private static String PERFIX = "yb_student";
	private static String LIST_SOURCE = "Student.list";
	private static String BASE_PATH = "/platform/student/";
	
	StudentService service = new StudentServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "student.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "student_add.html");
	}

	public void edit() {
		String id = getPara(0);
		Student student = service.findById(id);
		setAttr("model", JsonKit.toJson(student));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "student_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Student student = service.findById(id);
		setAttr("model", JsonKit.toJson(student));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "student_view.html");
	}

	public void list() {
		//因为有下拉框，需要将数字转换成文字，所以需要拦截器
		Object grid = paginate(LIST_SOURCE,new StudentIntercept());
		renderJson(grid);
	}

	public void save() {
		Student student = mapping(PERFIX, Student.class);
		boolean temp = service.save(student);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Student student = mapping(PERFIX, Student.class);
		boolean temp = service.update(student);
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
