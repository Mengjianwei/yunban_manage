package com.ikkong.platform.model;

import java.util.Date;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

/**
 * Generated by Blade. 2016-10-08 15:59:45
 */
@Table(name = "yb_match")
@BindID(name = "id")
@SuppressWarnings("serial")
public class Match extends BaseModel {

	// 主键
	private Integer id;
	// 姓名
	private String match_name;
	// 密码
	private String match_code;
	private Integer mirrorid;
	private Integer netid;
	private Integer flavorid;
	private String image_url;
	private Date create_time;
	private String status;
	private String description;
	
	@AutoID
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	

	public void setMirrorid(Integer mirrorid) {
		this.mirrorid = mirrorid;
	}
	public Integer getNetid() {
		return netid;
	}
	public void setNetid(Integer net_id) {
		this.netid = net_id;
	}
	public Integer getFlavorid() {
		return flavorid;
	}
	public void setFlavorid(Integer flavorid) {
		this.flavorid = flavorid;
	}

	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMatch_name() {
		return match_name;
	}
	public void setMatch_name(String match_name) {
		this.match_name = match_name;
	}
	public String getMatch_code() {
		return match_code;
	}
	public void setMatch_code(String match_code) {
		this.match_code = match_code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getMirrorid() {
		return mirrorid;
	}

}
