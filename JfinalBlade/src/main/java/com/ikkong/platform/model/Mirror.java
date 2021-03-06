package com.ikkong.platform.model;

import java.util.Date;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

/**
 * Generated by Blade. 2016-10-08 15:59:45
 */
@Table(name = "yb_mirror")
@BindID(name = "id")
@SuppressWarnings("serial")
public class Mirror extends BaseModel {

	// 主键
	private Integer id;
	// 编码
	private String mirror_code;
	// 专业名
	private String mirror_name;


	public String getMirror_code() {
		return mirror_code;
	}
	public void setMirror_code(String mirror_code) {
		this.mirror_code = mirror_code;
	}
	public String getMirror_name() {
		return mirror_name;
	}
	public void setMirror_name(String mirror_name) {
		this.mirror_name = mirror_name;
	}
	@AutoID
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
