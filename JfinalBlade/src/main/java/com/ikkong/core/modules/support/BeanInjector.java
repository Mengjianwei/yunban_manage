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
package com.ikkong.core.modules.support;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import com.ikkong.core.constant.Const;
import com.ikkong.core.jfinal.ext.kit.JStrKit;
import com.ikkong.core.toolbox.Func;
import com.ikkong.core.toolbox.Record;
import com.ikkong.core.toolbox.kit.BeanKit;
import com.jfinal.kit.StrKit;

/**
 * javabean 、 maps映射
 *
 */
public class BeanInjector {

	public static final <T> T inject(Class<T> beanClass, HttpServletRequest request, boolean skipConvertError) {
		try {
			return BeanKit.mapToBeanIgnoreCase(request.getParameterMap(), beanClass);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static final <T> T inject(Class<T> beanClass, Map<String, Object> switchMap, HttpServletRequest request,
			boolean skipConvertError) {
		try {
			return BeanKit.mapToBeanIgnoreCase(BeanKit.map2Map(request.getParameterMap(), switchMap), beanClass);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static final <T> T inject(Class<T> beanClass, String recordName, HttpServletRequest request, boolean skipConvertError) {
		try {
			Map<String, Object> map = injectPara(recordName, request, skipConvertError);
			return BeanKit.mapToBeanIgnoreCase(map, beanClass);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static final <T> T inject(Class<T> beanClass, Map<String, Object> switchMap, String recordName, HttpServletRequest request, boolean skipConvertError) {
		try {
			Map<String, Object> map = injectPara(recordName, request, skipConvertError);
			return BeanKit.mapToBeanIgnoreCase(BeanKit.map2Map(map, switchMap), beanClass);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
	public static final Record injectMaps(HttpServletRequest request, boolean skipConvertError) {
		return Record.parse(request.getParameterMap());
	}

	public static final Record injectMaps(Map<String, Object> switchMap, HttpServletRequest request, boolean skipConvertError) {
		return Record.parse(BeanKit.map2Map(request.getParameterMap(), switchMap));
	}

	public static final Record injectMaps(String recordName, HttpServletRequest request, boolean skipConvertError) {
		Map<String, Object> map = injectPara(recordName, request, skipConvertError);
		return Record.parse(map);
	}

	public static final Record injectMaps(Map<String, Object> switchMap, String recordName, HttpServletRequest request, boolean skipConvertError) {
		Map<String, Object> map = injectPara(recordName, request, skipConvertError);
		return Record.parse(BeanKit.map2Map(map, switchMap));
	}

	private static final Map<String, Object> injectPara(String recordName, HttpServletRequest request, boolean skipConvertError) {
		Map<String, String[]> paramMap = request.getParameterMap();
		Map<String, Object> map = new HashMap<>();
		String start = recordName.toLowerCase() + ".";
		String[] value = null;
		for (Entry<String, String[]> param : paramMap.entrySet()) {
			if (!param.getKey().toLowerCase().startsWith(start)) {
				continue;
			}
			value = param.getValue();
			if (value !=null && !Func.isEmpty(value) && null != value[0]) {
				Object o = value[0];
				map.put(JStrKit.removePrefix(param.getKey().toLowerCase(), start).toLowerCase(), o);

			} else {
				map.put(JStrKit.removePrefix(param.getKey().toLowerCase(), start).toLowerCase(), null);
			}
		}
		String versionL = request.getParameter(Const.OPTIMISTIC_LOCK.toLowerCase());
		String versionU = request.getParameter(Const.OPTIMISTIC_LOCK);
	    if (StrKit.notBlank(versionL)){
			map.put(Const.OPTIMISTIC_LOCK.toLowerCase(), Func.toInt(versionL) + 1);
		} else if(StrKit.notBlank(versionU)){
			map.put(Const.OPTIMISTIC_LOCK.toLowerCase(), Func.toInt(versionU) + 1);
		}
		return map;
	}


}
