package com.ikkong.platform.controller;

import com.ikkong.core.jfinal.ext.kit.JsonKit;
import com.ikkong.platform.meta.intercept.BlogIntercept;
import com.ikkong.platform.meta.intercept.MatchIntercept;
import com.ikkong.platform.meta.intercept.StudentIntercept;
import com.ikkong.platform.model.Blog;
import com.ikkong.platform.model.Match;
import com.ikkong.platform.model.Mirror;
import com.ikkong.platform.model.Project;
import com.ikkong.platform.model.Student;
import com.ikkong.platform.service.BlogService;
import com.ikkong.platform.service.MatchService;
import com.ikkong.platform.service.MirrorService;
import com.ikkong.platform.service.ProjectService;
import com.ikkong.platform.service.StudentService;
import com.ikkong.platform.service.impl.BlogServiceImpl;
import com.ikkong.platform.service.impl.MatchServiceImpl;
import com.ikkong.platform.service.impl.MirrorServiceImpl;
import com.ikkong.platform.service.impl.ProjectServiceImpl;
import com.ikkong.platform.service.impl.StudentServiceImpl;
import com.ikkong.system.controller.base.UrlPermissController;

/**
 * Generated by Blade.
 * 2016-10-08 15:59:45
 */
public class MatchController extends UrlPermissController {
	private static String CODE = "match";
	private static String PERFIX = "yb_match";
	private static String LIST_SOURCE = "Match.list";
	private static String BASE_PATH = "/platform/match/";
	
	MatchService service = new MatchServiceImpl();
	
	
	public void index() {
		setAttr("code", CODE);
		render(BASE_PATH + "match.html");
		
	}

	public void add() {
		setAttr("code", CODE);
		render(BASE_PATH + "match_add.html");
	}

	public void edit() {
		String id = getPara(0);
		Match match = service.findById(id);
		setAttr("model", JsonKit.toJson(match));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "match_edit.html");
	}

	public void view() {
		String id = getPara(0);
		Match match = service.findById(id);
		setAttr("model", JsonKit.toJson(match));
		setAttr("id", id);
		setAttr("code", CODE);
		render(BASE_PATH + "match_view.html");
	}

	public void list() {
		Object grid = paginate(LIST_SOURCE,new MatchIntercept());
		renderJson(grid);
	}

	public void save() {
		Match match = mapping(PERFIX, Match.class);
		boolean temp = service.save(match);
		if (temp) {
			renderJson(success(SAVE_SUCCESS_MSG));
		} else {
			renderJson(error(SAVE_FAIL_MSG));
		}
	}

	public void update() {
		Match match = mapping(PERFIX, Match.class);
		boolean temp = service.update(match);
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
