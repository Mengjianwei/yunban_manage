package com.ikkong.platform.model;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

@Table(name = "yb_doc")
@BindID(name = "id")
@SuppressWarnings("serial")
public class Doc extends BaseModel {
	//ID
	private Integer id;
	//编号
	private String doc_code;
	//文档名称
	private String doc_name;
	//文本
	private String doc_info;
	@AutoID
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDoc_code() {
		return doc_code;
	}
	public void setDoc_code(String doc_code) {
		this.doc_code = doc_code;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_info() {
		return doc_info;
	}
	public void setDoc_info(String doc_info) {
		this.doc_info = doc_info;
	}
	
	
	

}
