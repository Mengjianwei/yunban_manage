package com.ikkong.platform.model;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

@Table(name = "yb_course_phase")
@BindID(name = "id")
@SuppressWarnings("serial")
public class CoursePhase extends BaseModel {
	//id
	private Integer id;
	//阶段编码
	private String phase_code;
	//阶段名称
	private String phase_name;
	//一级表外键
	private Integer typeid;
	
	
	@AutoID
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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

	
	

}
