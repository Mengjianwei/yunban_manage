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
package com.ikkong.system.controller;

import com.ikkong.common.vo.OperationLog;
import com.ikkong.core.interfaces.IMeta;
import com.ikkong.system.meta.factory.OLogFactory;

public class OlogController extends CurdController<OperationLog>{

	@Override
	protected Class<? extends IMeta> metaFactoryClass() {
		return OLogFactory.class;
	}

}
