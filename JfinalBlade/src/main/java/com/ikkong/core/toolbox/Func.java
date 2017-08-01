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
package com.ikkong.core.toolbox;

import com.ikkong.common.config.MainConfig;
import com.ikkong.common.vo.User;
import com.ikkong.core.constant.ConstCache;
import com.ikkong.core.dao.Blade;
import com.ikkong.core.jfinal.ext.kit.JStrKit;
import com.ikkong.platform.model.Major;
import com.ikkong.system.model.Dept;
import com.ikkong.system.model.Dict;
import com.ikkong.system.model.Parameter;
import com.ikkong.system.model.Role;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;
import java.util.Map.Entry;


/**
 * what：高频常用方法集合<br>
 * where：Func.xxx简短快捷的输入操作<br>
 * why：整合高频常用方法,编码速度+50%,代码量-70%
 * 
 */
public class Func {

	/**
	 * 比较两个对象是否相等。<br>
	 * 相同的条件有两个，满足其一即可：<br>
	 * 1. obj1 == null && obj2 == null; 2. obj1.equals(obj2)
	 * 
	 * @param obj1
	 *            对象1
	 * @param obj2
	 *            对象2
	 * @return 是否相等
	 */
	public static boolean equals(Object obj1, Object obj2) {
		return (obj1 != null) ? (obj1.equals(obj2)) : (obj2 == null);
	}

	/**
	 * 计算对象长度，如果是字符串调用其length函数，集合类调用其size函数，数组调用其length属性，其他可遍历对象遍历计算长度
	 * 
	 * @param obj
	 *            被计算长度的对象
	 * @return 长度
	 */
	public static int length(Object obj) {
		if (obj == null) {
			return 0;
		}
		if (obj instanceof CharSequence) {
			return ((CharSequence) obj).length();
		}
		if (obj instanceof Collection) {
			return ((Collection<?>) obj).size();
		}
		if (obj instanceof Map) {
			return ((Map<?, ?>) obj).size();
		}

		int count;
		if (obj instanceof Iterator) {
			Iterator<?> iter = (Iterator<?>) obj;
			count = 0;
			while (iter.hasNext()) {
				count++;
				iter.next();
			}
			return count;
		}
		if (obj instanceof Enumeration) {
			Enumeration<?> enumeration = (Enumeration<?>) obj;
			count = 0;
			while (enumeration.hasMoreElements()) {
				count++;
				enumeration.nextElement();
			}
			return count;
		}
		if (obj.getClass().isArray() == true) {
			return Array.getLength(obj);
		}
		return -1;
	}

	/**
	 * 对象中是否包含元素
	 * 
	 * @param obj
	 *            对象
	 * @param element
	 *            元素
	 * @return 是否包含
	 */
	public static boolean contains(Object obj, Object element) {
		if (obj == null) {
			return false;
		}
		if (obj instanceof String) {
			if (element == null) {
				return false;
			}
			return ((String) obj).contains(element.toString());
		}
		if (obj instanceof Collection) {
			return ((Collection<?>) obj).contains(element);
		}
		if (obj instanceof Map) {
			return ((Map<?, ?>) obj).values().contains(element);
		}

		if (obj instanceof Iterator) {
			Iterator<?> iter = (Iterator<?>) obj;
			while (iter.hasNext()) {
				Object o = iter.next();
				if (equals(o, element)) {
					return true;
				}
			}
			return false;
		}
		if (obj instanceof Enumeration) {
			Enumeration<?> enumeration = (Enumeration<?>) obj;
			while (enumeration.hasMoreElements()) {
				Object o = enumeration.nextElement();
				if (equals(o, element)) {
					return true;
				}
			}
			return false;
		}
		if (obj.getClass().isArray() == true) {
			int len = Array.getLength(obj);
			for (int i = 0; i < len; i++) {
				Object o = Array.get(obj, i);
				if (equals(o, element)) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 对象是否为空
	 * 
	 * @param o
	 *            String,List,Map,Object[],int[],long[]
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static boolean isEmpty(Object o) {
		if (o == null) {
			return true;
		}
		if (o instanceof String) {
			if (o.toString().trim().equals("")) {
				return true;
			}
		} else if (o instanceof List) {
			if (((List) o).size() == 0) {
				return true;
			}
		} else if (o instanceof Map) {
			if (((Map) o).size() == 0) {
				return true;
			}
		} else if (o instanceof Set) {
			if (((Set) o).size() == 0) {
				return true;
			}
		} else if (o instanceof Object[]) {
			if (((Object[]) o).length == 0) {
				return true;
			}
		} else if (o instanceof int[]) {
			if (((int[]) o).length == 0) {
				return true;
			}
		} else if (o instanceof long[]) {
			if (((long[]) o).length == 0) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 对象组中是否存在 Empty Object
	 * 
	 * @param os
	 *            对象组
	 * @return
	 */
	public static boolean isOneEmpty(Object... os) {
		for (Object o : os) {
			if (isEmpty(o)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 对象组中是否全是 Empty Object
	 * 
	 * @param os
	 * @return
	 */
	public static boolean isAllEmpty(Object... os) {
		for (Object o : os) {
			if (!isEmpty(o)) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 是否为数字
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isNum(Object obj) {
		try {
			Integer.parseInt(obj.toString());
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	/**
	 * 如果为空, 则调用默认值
	 * 
	 * @param str
	 * @return
	 */
	public static Object getValue(Object str, Object defaultValue) {
		if (isEmpty(str)) {
			return defaultValue;
		}
		return str;
	}

	/**
	 * 格式化字符串 去掉前后空格
	 * 
	 * @param str
	 * @return
	 */
	public static String format(Object str) {
		if (null == str) {
			return "";
		}
		return str.toString().trim();
	}

	/**
	 * 格式化文本
	 * 
	 * @param template
	 *            文本模板，被替换的部分用 {} 表示
	 * @param values
	 *            参数值
	 * @return 格式化后的文本
	 */
	public static String format(String template, Object... values) {
		return JStrKit.format(template, values);
	}

	/**
	 * 格式化文本
	 * 
	 * @param template
	 *            文本模板，被替换的部分用 {key} 表示
	 * @param map
	 *            参数值对
	 * @return 格式化后的文本
	 */
	public static String format(String template, Map<?, ?> map) {
		return JStrKit.format(template, map);
	}

	/**
	 * 强转->int
	 * 
	 * @param obj
	 * @return
	 */
	public static int toInt(Object obj) {
		return toInt(obj, -1);
	}

	/**
	 * 强转->int
	 * 
	 * @param obj
	 * @param defaultValue
	 * @return
	 */
	public static int toInt(Object obj, int defaultValue) {
		try {
			if (isEmpty(obj)) {
				return defaultValue;
			}
			return Integer.parseInt(obj.toString());
		} catch (Exception ex) {
			return defaultValue;
		}
	}

	/**
	 * 强转->long
	 * 
	 * @param obj
	 * @return
	 */
	public static long toLong(Object obj) {
		return toLong(obj,-1);
	}

	/**
	 * 强转->long
	 * 
	 * @param obj
	 * @param defaultValue
	 * @return
	 */
	public static long toLong(Object obj, long defaultValue) {
		try {
			if (isEmpty(obj)) {
				return defaultValue;
			}
			return Long.parseLong(obj.toString());
		} catch (Exception ex) {
			return defaultValue;
		}
	}

	/**
	 * 强转->double
	 * 
	 * @param obj
	 * @return
	 */
	public static double toDouble(Object obj) {
		return Double.parseDouble(obj.toString());
	}

	public static String encodeUrl(String url) {
		try {
			url = isEmpty(url) ? "" : url;
			url = URLEncoder.encode(url, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return url;
	}

	public static String decodeUrl(String url) {
		try {
			url = isEmpty(url) ? "" : url;
			url = URLDecoder.decode(url, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return url;
	}

	/**
	 * map的key转为小写
	 * 
	 * @param map
	 * @return Map<String,Object>
	 */
	public static Map<String, Object> caseInsensitiveMap(Map<String, Object> map) {
		Map<String, Object> tempMap = new HashMap<>();
		for (String key : map.keySet()) {
			tempMap.put(key.toLowerCase(), map.get(key));
		}
		return tempMap;
	}
	
	/**
     * 获取map中第一个数据值
     *
     * @param <K> Key的类型
     * @param <V> Value的类型
     * @param map 数据源
     * @return 返回的值
     */
    public static <K, V> V getFirstOrNull(Map<K, V> map) {
        V obj = null;
        for (Entry<K, V> entry : map.entrySet()) {
            obj = entry.getValue();
            if (obj != null) {
                break;
            }
        }
        return obj;
    }

	/**
	 * 创建StringBuilder对象
	 * 
	 * @return StringBuilder对象
	 */
	public static StringBuilder builder(String... strs) {
		final StringBuilder sb = new StringBuilder();
		for (String str : strs) {
			sb.append(str);
		}
		return sb;
	}

	/**
	 * 创建StringBuilder对象
	 * 
	 * @return StringBuilder对象
	 */
	public static void builder(StringBuilder sb, String... strs) {
		for (String str : strs) {
			sb.append(str);
		}
	}

	/**
	 * 功能描述: 生成sql占位符 ?,?,?
	 * 
	 * @param size
	 * @return String
	 */
	public static String sqlHolder(int size) {
		String[] paras = new String[size];
		Arrays.fill(paras, "?");
		return JStrKit.join(paras, ',');
	}

	/**
	 * 生成sql占位符所需的list
	 * 
	 * @param ids
	 * @return List<Object>
	 */
	public static List<Object> listHolder(String ids) {
		final List<Object> parameters = new ArrayList<Object>();
		String[] idarr = ids.split(",");
		for (int i = 0; i < idarr.length; i++) {
			parameters.add(idarr[i]);
		}
		return parameters;
	}

	/**
	 * 获取字典表对应中文
	 * @param code 字典编号
	 * @param num  字典序号
	 * @return
	 */
	public static String getDictName(final Object code, final Object num) {
		Dict dict = CacheKit.get(ConstCache.DICT_CACHE, "getDictName_" + code + "_" + num, new IDataLoader() {
			@Override
			public Object load() {
				return Blade.create(Dict.class).findFirstBy("code=#{code} and num=#{num}", Record.create().set("code", code).set("num", num));
			}
		});
		if(null == dict){
			return "";
		}
		return dict.getName();
	}

	/**
	 * 获取对应角色名
	 * @param roleIds 角色id
	 * @return
	 */
	public static String getRoleName(final Object roleIds) {
		if(isEmpty(roleIds)){
			return "";
		}
		final String [] roleIdArr = roleIds.toString().split(",");
		StringBuilder sb = new StringBuilder();
		for(int i = 0 ; i < roleIdArr.length; i++){
			final String roleId = roleIdArr[i];
			Role role = CacheKit.get(ConstCache.ROLE_CACHE, "getRoleName" + "_" + roleId, new IDataLoader() {
				@Override
				public Object load() {
					return Blade.create(Role.class).findById(roleId);
				}
			});
			sb.append(role.getName()).append(",");
		}
		return JStrKit.removeSuffix(sb.toString(), ",");
	}

	/**
	 * 获取对应用户名
	 * @param userId 用户id
	 * @return
	 */
	public static String getUserName(final Object userId) {
		User user = CacheKit.get(ConstCache.USER_CACHE, "getUserName" + "_" + userId, new IDataLoader() {
			@Override
			public Object load() {
				return Blade.create(User.class).findById(userId);
			}
		});
		if(null == user){
			return "";
		}
		return user.getName();
	}

	/**
	 * 获取对应部门名
	 * @param deptIds 部门id集合
	 * @return
	 */
	public static String getDeptName(final Object deptIds) {
		if(isEmpty(deptIds)){
			return "";
		}
		final String [] deptIdArr = deptIds.toString().split(",");
		StringBuilder sb = new StringBuilder();
		for(int i = 0 ; i < deptIdArr.length; i++){
			final String deptId = deptIdArr[i];
			Dept dept = CacheKit.get(ConstCache.DEPT_CACHE, "getDeptName" + "_" + deptId, new IDataLoader() {
				@Override
				public Object load() {
					return Blade.create(Dept.class).findById(deptId);
				}
			});
			if(dept != null) {
				sb.append(dept.getSimplename()).append(",");
			}
		}
		return JStrKit.removeSuffix(sb.toString(), ",");
	}
	
	/**   
	 * 获取参数表参数值
	 * @param code 参数编号
	 * @return String
	*/
	public static String getParamByCode(String code){
		Parameter param = Blade.create(Parameter.class).findFirstBy("code = #{code} and status = 1", Record.create().set("code", code));
		return param.getPara();
	}
	
	public static boolean isOracle() {
		return (MainConfig.map.get("dbType").equals("oracle"));
	}

	public static boolean isMySql() {
		return (MainConfig.map.get("dbType").equals("mysql"));
	}
	
}