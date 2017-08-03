package com.ikkong.platform.model;

import java.util.Date;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.Table;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.model.BaseModel;

@Table(name = "yb_section")
@BindID(name = "id")
@SuppressWarnings("serial")
public class Section extends BaseModel{
	
	    //id
		private Integer id;
		private String section_code;
		private String section_name;
		private Integer courseid;
		private Integer docid;
		private String section_describe;
		private Date create_time;
		private String doc_url;
		
		
		
		@AutoID
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getSection_code() {
			return section_code;
		}
		public void setSection_code(String section_code) {
			this.section_code = section_code;
		}
		public String getSection_name() {
			return section_name;
		}
		public void setSection_name(String section_name) {
			this.section_name = section_name;
		}
		public Integer getCourseid() {
			return courseid;
		}
		public void setCourseid(Integer courseid) {
			this.courseid = courseid;
		}
		public Integer getDocid() {
			return docid;
		}
		public void setDocid(Integer docid) {
			this.docid = docid;
		}
		public String getSection_describe() {
			return section_describe;
		}
		public void setSection_describe(String section_describe) {
			this.section_describe = section_describe;
		}
		public Date getCreate_time() {
			return create_time;
		}
		public void setCreate_time(Date create_time) {
			this.create_time = create_time;
		}
		public String getDoc_url() {
			return doc_url;
		}
		public void setDoc_url(String doc_url) {
			this.doc_url = doc_url;
		}
		
		
		
	
		

}
