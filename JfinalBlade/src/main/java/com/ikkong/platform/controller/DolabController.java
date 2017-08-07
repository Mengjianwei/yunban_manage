package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.model.Dolab;
import com.ikkong.platform.service.DolabService;
import com.ikkong.platform.service.impl.DolabServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

public class DolabController extends UrlPermissController {
	
	private static String CODE = "dolab";
	private static String PERFIX = "yb_stu_dolab";
	private static String LIST_SOURCE = "Dolab.list";
	private static String BASE_PATH = "/platform/dolab/";
	
	DolabService service = new DolabServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "dolab.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "dolab_add.html");
	}

	public void edit() {
		String id = getPara(0);
		Dolab dolab = service.findById(id);
		setAttr("model", JsonKit.toJson(dolab));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "dolab_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Dolab dolab = service.findById(id);
		setAttr("model", JsonKit.toJson(dolab));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "dolab_view.html");
	}

	public void list() {
		//因为有下拉框，需要将数字转换成文字，所以需要拦截器
		Object grid = paginate(LIST_SOURCE);
		renderJson(grid);
	}

	public void save() {
		Dolab dolab = mapping(PERFIX, Dolab.class);
		boolean temp = service.save(dolab);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Dolab dolab = mapping(PERFIX, Dolab.class);
		boolean temp = service.update(dolab);
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
