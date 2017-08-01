package com.ikkong.platform.controller;

import com.ikkong.core.dao.Blade;
import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.core.toolbox.Func;
import com.ikkong.core.toolbox.Record;
import com.ikkong.platform.model.Notice;
import com.ikkong.system.controller.base.UrlPermissController;

import java.util.Map;

public class NoticeController extends UrlPermissController {
	private static String CODE = "notice";
	private static String PERFIX = "TB_TFW_TZGG";
	private static String DATA_SOURCE = "Notice.data";
	private static String LIST_SOURCE = "Notice.list";
	private static String BASE_PATH = "/platform/notice/";
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "notice.html");
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "notice_add.html");
	}
	
	public void edit() {
		String id = getPara(0);
		Map<String, Object> map = Blade.dao().selectSingle(DATA_SOURCE, Record.create().set("id", id), Map.class);
		setAttr("model", JsonKit.toJson(map));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "notice_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Notice notice = Blade.create(Notice.class).findById(id);
		//将javabean转化为maps
		Record maps = Record.parse(notice);
		//使用Func.getDictName方法从缓存中获取对应字典项的中文值
		maps.set("dic_f_it_lx", Func.getDictName(102, notice.getF_it_lx()));
		//将maps传回前台
		setAttr("model", JsonKit.toJson(maps));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "notice_view.html");
	}

	public void list() {
		Object grid = paginate(LIST_SOURCE);
		renderJson(grid);
	}

	public void save() {
		Notice notice = mapping(PERFIX, Notice.class);
		boolean temp = Blade.create(Notice.class).save(notice);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}

	}

	public void update() {
		Notice notice = mapping(PERFIX, Notice.class);
		notice.setVersion(notice.getVersion()+1);
		boolean temp = Blade.create(Notice.class).update(notice);
		if (temp) {
			renderJson(success(UPDATE_SUCCESS_MSG));
		} else {
			renderJson(error(UPDATE_FAIL_MSG));
		}
	}

	public void remove() {
		String ids = getPara("ids");
		int cnt = Blade.create(Notice.class).deleteByIds(ids);
		if (cnt > 0) {
			renderJson(success(DEL_SUCCESS_MSG));
		} else {
			renderJson(error(DEL_FAIL_MSG));
		}
	}

}
