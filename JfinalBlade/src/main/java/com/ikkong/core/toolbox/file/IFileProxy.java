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

import java.io.File;

public interface IFileProxy {
	
	/**
	 * 返回物理路径
	 * @param file
	 * @return
	 */
	String path(File file);
	
	/**
	 * 返回相对路径
	 * @param file
	 * @return
	 */
	String virtualPath(File file);

	/**
	 * 文件重命名策略
	 * @param file
	 * @return
	 */
	File rename(File file);
	
	/**
	 * 获取入库id
	 * @return
	 */
	Object getFileId(BladeFile bf);
	
}
