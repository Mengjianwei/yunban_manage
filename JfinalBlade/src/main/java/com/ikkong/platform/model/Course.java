package com.ikkong.platform.model;



import java.util.Date;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

@Table(name = "yb_course")
@BindID(name = "id")
@SuppressWarnings("serial")
public class Course extends BaseModel{
	
	//ID
	private Integer id;
	//课程编码
	private String course_code;
	//课程名称
	private String course_name;
	//阶段外键
	private Integer phaseid;
	//镜像外键
	private Integer mirrorid;
	//图片路径
	private String image_url;
	//课程描述
	private String description;
	//上线状态
	private String status;
	//创建时间
	private Date create_time;
	//网络外键
	private Integer netid;
	//硬件外键
	private Integer flavorid;
	
	
	@AutoID
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCourse_code() {
		return course_code;
	}
	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public Integer getPhaseid() {
		return phaseid;
	}
	public void setPhaseid(Integer phaseid) {
		this.phaseid = phaseid;
	}
	public Integer getMirrorid() {
		return mirrorid;
	}
	public void setMirrorid(Integer mirrorid) {
		this.mirrorid = mirrorid;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Integer getNetid() {
		return netid;
	}
	public void setNetid(Integer netid) {
		this.netid = netid;
	}
	public Integer getFlavorid() {
		return flavorid;
	}
	public void setFlavorid(Integer flavorid) {
		this.flavorid = flavorid;
	}
	
	
	
	

}
