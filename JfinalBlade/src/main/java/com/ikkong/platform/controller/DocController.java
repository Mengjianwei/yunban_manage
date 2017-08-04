package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.model.Doc;
import com.ikkong.platform.service.DocService;
import com.ikkong.platform.service.impl.DocServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

public class DocController extends UrlPermissController {
	
	
	private static String CODE = "doc";
	private static String PERFIX = "yb_doc";
	private static String LIST_SOURCE = "Doc.list";
	private static String BASE_PATH = "/platform/doc/";
	
	DocService service = new DocServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "doc.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "doc_add.html");
	}

	public void edit() {
		String id = getPara(0);
		Doc doc = service.findById(id);
		setAttr("model", JsonKit.toJson(doc));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "doc_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Doc doc = service.findById(id);
		setAttr("model", JsonKit.toJson(doc));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "doc_view.html");
	}

	public void list() {
		//因为有下拉框，需要将数字转换成文字，所以需要拦截器
		Object grid = paginate(LIST_SOURCE);
		renderJson(grid);
	}

	public void save() {
		Doc doc = mapping(PERFIX, Doc.class);
		boolean temp = service.save(doc);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Doc doc = mapping(PERFIX, Doc.class);
		boolean temp = service.update(doc);
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
