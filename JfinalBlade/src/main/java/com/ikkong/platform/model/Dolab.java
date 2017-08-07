package com.ikkong.platform.model;

import java.util.Date;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

@Table(name = "yb_stu_dolab")
@BindID(name = "id")
@SuppressWarnings("serial")
public class Dolab extends BaseModel {
	//ID
	private Integer id;
	//用户名
	private String user_name;
	//实验课程名称
	private String course_name;
	//学生启动的虚拟机编码
	private String server_code;
	//开始实验时间
	private Date create_time;
	//当前做实验状态
	private Integer status;
	//实验报告id
	private Integer reportid;
	//实验分数
	private Double score;
	//优秀、良好、及格
	private Integer level;
	
	@AutoID
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getServer_code() {
		return server_code;
	}
	public void setServer_code(String server_code) {
		this.server_code = server_code;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getReportid() {
		return reportid;
	}
	public void setReportid(Integer reportid) {
		this.reportid = reportid;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	
	
	

}
