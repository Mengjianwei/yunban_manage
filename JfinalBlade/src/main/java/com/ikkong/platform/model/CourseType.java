package com.ikkong.platform.model;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;



@Table(name = "yb_course_type")
@BindID(name = "id")
@SuppressWarnings("serial")
public class CourseType extends BaseModel {
	//id
	private Integer id;
    //类型编码
	private String type_code;
	//类型名称
	private String type_name;
	//专业编码
	private Integer major_id;
	
	
	@AutoID
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType_code() {
		return type_code;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public Integer getMajor_id() {
		return major_id;
	}
	public void setMajor_id(Integer major_id) {
		this.major_id = major_id;
	}
	
	
}
