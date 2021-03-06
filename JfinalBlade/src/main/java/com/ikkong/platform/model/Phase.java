package com.ikkong.platform.model;

import java.util.Date;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

/**
 * Generated by Blade. 2016-10-08 15:59:45
 */
@Table(name = "yb_course_phase")
@BindID(name = "id")
@SuppressWarnings("serial")
public class Phase extends BaseModel {

	// 主键
	private Integer id;
	// 编码
	private String phase_code;
	// 专业名
	private String phase_name;

	private Integer typeid;
	

	public String getPhase_code() {
		return phase_code;
	}
	public void setPhase_code(String phase_code) {
		this.phase_code = phase_code;
	}
	public String getPhase_name() {
		return phase_name;
	}
	public void setPhase_name(String phase_name) {
		this.phase_name = phase_name;
	}
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	@AutoID
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
