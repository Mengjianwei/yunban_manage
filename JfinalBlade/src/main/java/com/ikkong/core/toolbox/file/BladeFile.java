/**
 * Copyright (c) 2015-2016, Chill Zhuang 庄骞 (smallchill@163.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.ikkong.core.toolbox.file;

import com.ikkong.core.constant.Cst;
import com.ikkong.core.toolbox.kit.DateKit;
import com.jfinal.upload.UploadFile;

import java.io.File;

public class BladeFile {
	/**
	 * 上传文件在附件表中的id
	 */
	private Object fileId;
	
	/**
	 * 上传文件
	 */
	private UploadFile file;
	
	
	/**
	 * 上传物理路径
	 */
	private String uploadPath;
	
	/**
	 * 上传虚拟路径
	 */
	private String uploadVirtualPath;
	
	/**
	 * 文件名
	 */
	private String fileName;
	
	/**
	 * 真实文件名
	 */
	private String originalFileName;

	public BladeFile() {
		
	}

	public BladeFile(UploadFile file) {
		this.file = file;
		this.fileName = file.getFileName();
		this.originalFileName = file.getOriginalFileName();
		this.uploadPath = Cst.me().getUploadRealPath() + File.separator + DateKit.getDays() + File.separator + this.originalFileName;
		this.uploadVirtualPath = Cst.me().getUploadCtxPath().replace(Cst.me().getContextPath(), "") + File.separator + DateKit.getDays() + File.separator + this.originalFileName;
	}

	public BladeFile(UploadFile file, String uploadPath) {
		this(file);
		if (null != uploadPath){
			this.uploadPath = uploadPath;
			this.uploadVirtualPath = null;
		}
	}

	public void transfer() {
		IFileProxy fileFactory = FileProxyManager.me().getDefaultFileProxyFactory();
		this.transfer(fileFactory);
	}

	public void transfer(IFileProxy fileFactory) {
		try {
			File file = new File(uploadPath);
			
			if(null != fileFactory){
				this.uploadPath = fileFactory.path(file);
				if(Cst.me().isRemoteMode()){
					this.uploadVirtualPath = null;
				} else{
					this.uploadVirtualPath = fileFactory.virtualPath(file).replace(Cst.me().getContextPath(), "");	
				}
				file = fileFactory.rename(file);
			}
			
			File dir = file.getParentFile();
			if (!dir.exists()) {
				dir.mkdirs();
			}
			
//			this.file.transferTo(file);
			UploadFileUtils.forChannel(this.file.getFile(), file);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Object getFileId() {
		if(null == this.fileId) {
			IFileProxy fileFactory = FileProxyManager.me().getDefaultFileProxyFactory();
			this.fileId = fileFactory.getFileId(this);
		}
		return fileId;
	}
	
	public void setFileId(Object fileId) {
		this.fileId = fileId;
	}

	public UploadFile getFile() {
		return file;
	}

	public void setFile(UploadFile file) {
		this.file = file;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUploadVirtualPath() {
		return uploadVirtualPath;
	}

	public void setUploadVirtualPath(String uploadVirtualPath) {
		this.uploadVirtualPath = uploadVirtualPath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

}
