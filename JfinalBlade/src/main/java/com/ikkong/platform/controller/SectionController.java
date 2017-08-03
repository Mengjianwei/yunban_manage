package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.meta.intercept.SectionIntercept;
import com.ikkong.platform.model.Section;
import com.ikkong.platform.service.SectionService;
import com.ikkong.platform.service.impl.SectionServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

public class SectionController extends UrlPermissController {
	
	
	private static String CODE = "section";
	private static String PERFIX = "yb_course_phase";
	private static String LIST_SOURCE = "Section.list";
	private static String BASE_PATH = "/platform/section/";
	
	SectionService service = new SectionServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "section.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "section_add.html");
	}

	public void edit() {
		String id = getPara(0);
		Section section = service.findById(id);
		setAttr("model", JsonKit.toJson(section));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "section_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Section section = service.findById(id);
		setAttr("model", JsonKit.toJson(section));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "section_view.html");
	}

	public void list() {
		//因为有下拉框，需要将数字转换成文字，所以需要拦截器
		Object grid = paginate(LIST_SOURCE,new SectionIntercept());
		renderJson(grid);
	}

	public void save() {
		Section section = mapping(PERFIX, Section.class);
		boolean temp = service.save(section);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Section section = mapping(PERFIX, Section.class);
		boolean temp = service.update(section);
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
