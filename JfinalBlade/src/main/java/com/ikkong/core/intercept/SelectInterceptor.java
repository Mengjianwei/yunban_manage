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
package com.ikkong.core.intercept;

import com.ikkong.core.interfaces.IQuery;
import com.ikkong.core.interfaces.ISelect;


/**
 * select查询拦截器工厂类
 */
public class SelectInterceptor implements ISelect{
	
	@Override
	public IQuery userIntercept() {
		return new QueryInterceptor();
	}

	@Override
	public IQuery deptIntercept() {
		return new QueryInterceptor();
	}

	@Override
	public IQuery dictIntercept() {
		return new QueryInterceptor();
	}

	@Override
	public IQuery roleIntercept() {
		return new QueryInterceptor();
	}

	@Override
	public IQuery costreeIntercept() {
		return new QueryInterceptor();
	}
	
}
