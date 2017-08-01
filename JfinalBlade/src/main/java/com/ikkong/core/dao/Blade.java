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
package com.ikkong.core.dao;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.annotatoin.Table;
import org.beetl.sql.core.db.ClassDesc;
import org.beetl.sql.core.db.KeyHolder;
import org.beetl.sql.ext.jfinal.JFinalBeetlSql;

import com.ikkong.core.annotation.BindID;
import com.ikkong.core.constant.Const;
import com.ikkong.core.constant.Cst;
import com.ikkong.core.toolbox.Func;
import com.ikkong.core.toolbox.Record;
import com.ikkong.core.toolbox.support.BladePage;


@SuppressWarnings({"unchecked","rawtypes"})
public class Blade {
	private static Map<Class<?>, Blade> pool = new ConcurrentHashMap<Class<?>, Blade>();
	private volatile SQLManager sql = null;
	private Class<?> modelClass;
	private String table;
	private String pk;

	private SQLManager getSqlManager() {
		if (null == sql) {
			synchronized (Blade.class) {
				if (null == sql) {
					sql = dao();
				}
			}
		}
		return sql;
	}
	
	/**
	 * 返回SQLManager(主库)
	 * @return
	 */
	public static SQLManager dao() {
		return JFinalBeetlSql.dao();
	}
	
	/**
	 * 返回针对实体封装的dao
	 * @param modelClass 实体类
	 * @return
	 */
	public static Blade create(Class<?> modelClass) {
		Blade blade = pool.get(modelClass);
		if (null == blade) {
			synchronized (Blade.class) {
				blade = pool.get(modelClass);
				if (null == blade) {
					blade = new Blade(modelClass);
					pool.put(modelClass, blade);
				}
			}
		}
		return blade;
	}

	private Blade() {
		
	}
	
	private Blade(Class<?> modelClass) {
		if(modelClass != Blade.class){
			setTable(modelClass);			
		}
		setSource();
	}

	private void setTable(Class<?> modelClass) {
		this.modelClass = modelClass;
		Table Table = this.modelClass.getAnnotation(Table.class);
		if (null != Table) {
			this.table = Table.name();
		} else {
			throw new RuntimeException("未给 " + this.modelClass.getName() + " 绑定表名!");
		}
		BindID BindID = this.modelClass.getAnnotation(BindID.class);
		if (null != BindID) {
			this.pk = BindID.name();
		} else {
			throw new RuntimeException("未给 " + this.modelClass.getName() + " 绑定主键! ");
		}
	}
	
	private void setSource() {
		if (null == sql) {
			synchronized (Blade.class) {
				if (null == sql) {
					sql = dao();
				}
			}
		}
	}
	
	/**
	 * 获取map
	 * @param columns		字段名
	 * @return
	 */
	public Record findOneColBy(String columns){
		List<Map> list = getSqlManager().execute(getSelectSql(columns) + getFromSql(), Map.class, Record.create(), 1, 1);
		if(list.size() == 0){
			return null;
		} else {
			return Record.parse(list.get(0));
		}
	}
	
	/**
	 * 获取map
	 * @param columns		字段名
	 * @param where			条件
	 * @param modelOrMap	实体类或map
	 * @return
	 */
	public Record findOneColBy(String columns, String where, Object modelOrMap){
		List<Map> list = getSqlManager().execute(getSelectSql(columns) + getFromSql() + getWhere(where), Map.class, modelOrMap, 1, 1);
		if (list.size() == 0){
			return null;
		} else {
			return Record.parse(list.get(0));
		}
	}
	
	/**
	 * 获取map集合
	 * @param columns		字段名
	 * @param modelOrMap	实体类或map
	 * @return
	 */
	public List<Record> findColBy(String columns){
		List<Map> list = getSqlManager().execute(getSelectSql(columns) + getFromSql(), Map.class, Record.create());
		List<Record> maps = new ArrayList<>();
		for (Map m : list){
			maps.add(Record.parse(m));
		}
		return maps;
	}
	
	/**
	 * 获取map集合
	 * @param columns		字段名
	 * @param where			条件
	 * @param modelOrMap	实体类或map
	 * @return
	 */
	public List<Record> findColBy(String columns, String where, Object modelOrMap){
		List<Map> list = getSqlManager().execute(getSelectSql(columns) + getFromSql() + getWhere(where), Map.class, modelOrMap);
		List<Record> maps = new ArrayList<>();
		for (Map m : list){
			maps.add(Record.parse(m));
		}
		return maps;
	}

	/**
	 * 根据主键查询一条数据
	 * @param id
	 * @return
	 */
	public <T> T findById(Object id) {
		try{
			return (T) getSqlManager().unique(this.modelClass, id);
		} catch (Exception ex){
			return null;
		}
	}

	/**
	 * 根据sql查询多条数据
	 * @param sqlTemplate sql语句
	 * @param modelOrMap  实体类或者Map(查询条件)
	 * @return
	 */
	public <T> List<T> find(String sqlTemplate, Object modelOrMap) {
		List<T> list = (List<T>) getSqlManager().execute(sqlTemplate, this.modelClass, modelOrMap);
		return list;
	}

	/**
	 * 查询第一条数据
	 * @param topNum 
	 * @param model
	 * @return
	 */
	public <T> T findTopOne(Object model) {
		List<T> list = (List<T>) getSqlManager().template(model, 1, 1);
		if(list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	/**
	 * 查询前几条数据
	 * @param topNum 
	 * @param model
	 * @return
	 */
	public <T> List<T> findTop(int topNum, Object model) {
		List<T> list = (List<T>) getSqlManager().template(model, 1, topNum);
		return list;
	}
	
	/**
	 * 查询前几条数据
	 * @param topNum
	 * @param sqlTemplate
	 * @return
	 */
	public <T> List<T> findTop(int topNum, String sqlTemplate) {
		List<T> list = (List<T>) getSqlManager().execute(sqlTemplate, this.modelClass, Record.create(), 1, topNum);
		return list;
	}
	
	/**
	 * 查询前几条数据
	 * @param topNum
	 * @param sqlTemplate
	 * @param modelOrMap
	 * @return
	 */
	public <T> List<T> findTop(int topNum, String sqlTemplate, Object modelOrMap) {
		List<T> list = (List<T>) getSqlManager().execute(sqlTemplate, this.modelClass, modelOrMap, 1, topNum);
		return list;
	}

	/**
	 * 查询所有数据
	 * @return
	 */
	public <T> List<T> findAll() {
		List<T> all = (List<T>) getSqlManager().all(this.modelClass);
		return all;
	}

	/**
	 * 根据条件查询数据
	 * @param where			sql条件
	 * @param modelOrMap	实体类或者Map(查询条件)
	 * @return
	 */
	public <T> List<T> findBy(String where, Object modelOrMap) {
		List<T> models = (List<T>) getSqlManager().execute(getSelectSql() + getFromSql() + getWhere(where), this.modelClass, modelOrMap);
		return models;
	}

	/**
	 * 根据条件查询数据,指定返回字段
	 * @param columns		字段
	 * @param where			sql条件
	 * @param modelOrMap	实体类或者Map(查询条件)
	 * @return
	 */
	public <T> List<T> findBy(String columns, String where, Object modelOrMap) {
		List<T> models = (List<T>) getSqlManager().execute(getSelectSql(columns) + getFromSql() + getWhere(where), this.modelClass, modelOrMap);
		return models;
	}

	/**
	 * 根据实体类查询与之符合的数据
	 * @param model 实体类
	 * @return
	 */
	public <T> List<T> findByTemplate(Object model) {
		return (List<T>) getSqlManager().template(model);
	}

	/**
	 * 查询第一条数据
	 * @param sqlTemplate	sql语句
	 * @param modelOrMap	实体类或者Map(查询条件)
	 * @return
	 */
	public <T> T findFirst(String sqlTemplate, Object modelOrMap) {
		List<T> list = this.findTop(1, sqlTemplate, modelOrMap);
		if (list.size() == 0){
			return null;
		} else {
			return list.get(0);
		}
	}

	/**
	 * 根据条件查询第一条数据
	 * @param where		 sql条件
	 * @param modelOrMap 实体类或者Map(查询条件)
	 * @return
	 */
	public <T> T findFirstBy(String where, Object modelOrMap) {
		List<T> list = this.findTop(1, getSelectSql() + getFromSql() + getWhere(where), modelOrMap);
		if (list.size() == 0){
			return null;
		} else {
			return list.get(0);
		}
	}

	/**
	 * 新增一条数据
	 * @param model 实体类
	 * @return
	 */
	public boolean save(Object model) {
		return getSqlManager().insert(this.modelClass, model, false) > 0;
	}
	
	/**
	 * 新增一条数据(UUID型主键)
	 * @param model 实体类
	 * @return
	 */
	/*public boolean saveAssign(Object model) {
		SQLManager sql = getSqlManager();
		String table = sql.getNc().getTableName(this.modelClass);
		ClassDesc desc = sql.getMetaDataManager().getTable(table).getClassDesc(this.modelClass, sql.getNc());
		Method getterMethod =  desc.getIdMethods().get(desc.getIdNames().get(0));
		String name = getterMethod.getName();
		String setterName = name.replaceFirst("get", "set");
		try{
			Class target = this.modelClass;
			Method setterMethod = target.getMethod(setterName, new Class[]{getterMethod.getReturnType()});
			Object value = UUID.randomUUID().toString().replace("-", "");
			value = ScalarHandler.convertValueToRequiredType(value, getterMethod.getReturnType());
			setterMethod.invoke(model, new Object[]{value});
		}catch(Exception ex){		
			throw new UnsupportedOperationException("autoAssignKey failure " + ex.getMessage());
		}
		return sql.insert(this.modelClass, model, false) > 0;
	}*/

	/**
	 * 新增一条数据,返回int型主键值
	 * @param model 实体类
	 * @return
	 */
	public int saveRtId(Object model) {
		KeyHolder key = new KeyHolder();
		int n = getSqlManager().insert(this.modelClass, model, key);
		if (n > 0) {
			return Integer.parseInt(key.getKey().toString());
		} else {
			return 0;
		}
	}

	/**
	 * 新增一条数据,返回String型主键值
	 * @param model
	 * @return
	 */
	public String saveRtStrId(Object model) {
		KeyHolder key = new KeyHolder();
		int n = getSqlManager().insert(this.modelClass, model, key);
		if (n > 0) {
			return key.getKey().toString();
		} else {
			return "";
		}
	}
	
	/**
	 * 新增一条数据,并自动将主键反射到字段中
	 * @param model
	 */
	public boolean saveAndSetKey(Object model){
		return getSqlManager().insert(this.modelClass, model, true) > 0;
	}

	/**
	 * 修改一条数据,只更新非空字段
	 * @param model 实体类
	 * @return
	 */
	public boolean update(Object model) {
		SQLManager sql = getSqlManager();
		String table = sql.getNc().getTableName(this.modelClass);
		ClassDesc desc = sql.getMetaDataManager().getTable(table).getClassDesc(this.modelClass, sql.getNc());
		Method getterMethod = (Method) desc.getIdMethods().get(desc.getIdCols().get(0));
		Object idValue = null;
		try {
			idValue = getterMethod.invoke(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(Func.isEmpty(idValue)){
			throw new RuntimeException("未取到ID的值,无法修改!");
		}
		
		if(Cst.me().isOptimisticLock()){
			// 1.数据是否还存在
			String sqlExist = new StringBuffer("select * from ").append(table).append(" where ").append(pk).append(" = #{idValue} ").toString();
			Record modelOld = Db.init().selectOne(sqlExist, Record.create().set("idValue", idValue));
			// 数据已经被删除
			if (null == modelOld) { 
				throw new RuntimeException("数据库中此数据不存在，可能数据已经被删除，请刷新数据后在操作");
			}
			// 2.乐观锁控制
			Record modelForm = Record.parse(model);
			if (modelForm.get(Const.OPTIMISTIC_LOCK.toLowerCase()) != null) { // 是否需要乐观锁控制
				int versionDB = modelOld.toLowerKey().getInt(Const.OPTIMISTIC_LOCK.toLowerCase()); // 数据库中的版本号
				int versionForm = modelForm.getInt(Const.OPTIMISTIC_LOCK.toLowerCase()); // 表单中的版本号
				if (!(versionForm > versionDB)) {
					throw new RuntimeException("表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑");
				}
			}
		}
		
		return sql.updateTemplateById(model) > 0;
	}

	/**
	 * 修改一条数据,为null的字段也更新
	 * @param model
	 * @return
	 */
	public boolean updateEveryCol(Object model) {
		SQLManager sql = getSqlManager();
		String table = sql.getNc().getTableName(this.modelClass);
		ClassDesc desc = sql.getMetaDataManager().getTable(table).getClassDesc(this.modelClass, sql.getNc());
		Method getterMethod = (Method) desc.getIdMethods().get(desc.getIdCols().get(0));
		Object idValue = null;
		try {
			idValue = getterMethod.invoke(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(Func.isEmpty(idValue)){
			throw new RuntimeException("未取到ID的值,无法修改!");
		}
		
		if(Cst.me().isOptimisticLock()){
			// 1.数据是否还存在
			String sqlExist = new StringBuffer("select * from ").append(table).append(" where ").append(pk).append(" = #{idValue} ").toString();
			Record modelOld = Db.init().selectOne(sqlExist, Record.create().set("idValue", idValue));
			// 数据已经被删除
			if (null == modelOld) { 
				throw new RuntimeException("数据库中此数据不存在，可能数据已经被删除，请刷新数据后在操作");
			}
			// 2.乐观锁控制
			Record modelForm = Record.parse(model);
			if (modelForm.get(Const.OPTIMISTIC_LOCK.toLowerCase()) != null) { // 是否需要乐观锁控制
				int versionDB = modelOld.getInt(Const.OPTIMISTIC_LOCK.toLowerCase()); // 数据库中的版本号
				int versionForm = modelForm.getInt(Const.OPTIMISTIC_LOCK.toLowerCase()); // 表单中的版本号
				if (!(versionForm > versionDB)) {
					throw new RuntimeException("表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑");
				}
			}
		}
		
		return sql.updateById(model) > 0;
	}

	/**
	 * 根据实体类字段,修改所有表数据(慎用)
	 * @param model
	 * @return
	 */
	public int updateAllRecords(Object model) {
		return getSqlManager().updateAll(this.modelClass, model);
	}

	/**
	 * 更新条件修改数据
	 * @param set		 set条件
	 * @param where		 where条件
	 * @param modelOrMap 实体类或者Map(查询条件)
	 * @return
	 */
	public boolean updateBy(String set, String where, Object modelOrMap) {
		int n = getSqlManager().executeUpdate(getUpdateSql() + getSet(set) + getWhere(where), modelOrMap);
		return n > 0;
	}

	/**
	 * 根据实体类集合批量更新
	 * @param list 实体类集合
	 * @return
	 */
	public int[] updateBathById(List<?> list) {
		int[] n = getSqlManager().updateByIdBatch(list);
		return n;
	}

	/**
	 * 根据id删除数据
	 * @param id 主键值
	 * @return
	 */
	public int delete(Object id) {
		int cnt = getSqlManager().deleteById(this.modelClass, id);
		return cnt;
	}

	/**
	 * 根据sql语句删除数据
	 * @param sqlTemplate sql语句
	 * @return
	 */
	public int deleteBy(String sqlTemplate) {
		int result = getSqlManager().executeUpdate(sqlTemplate, null);
		return result;
	}

	/**
	 * 根据条件删除数据
	 * @param where where条件
	 * @param paras 实体类或者Map(查询条件)
	 * @return
	 */
	public int deleteBy(String where, Object paras) {
		int result = getSqlManager().executeUpdate(getDeleteSql(where), paras);
		return result;
	}

	/**
	 * 根据多个id集合删除数据
	 * @param ids id集合(1,2,3)
	 * @return
	 */
	public int deleteByIds(String ids) {
		String sqlTemplate = getDeleteSql(this.table, this.pk);
		Record paras = Record.create().set("ids", ids.split(","));
		int result = getSqlManager().executeUpdate(sqlTemplate, paras);
		return result;
	}

	/**
	 * 根据字段及值删除数据
	 * @param col	字段名
	 * @param ids	字段值集合(1,2,3)
	 * @return
	 */
	public int deleteByCols(String col, String ids) {
		String sqlTemplate = getDeleteSql(this.table, col);
		Record paras = Record.create().set("ids", ids.split(","));
		int result = getSqlManager().executeUpdate(sqlTemplate, paras);
		return result;
	}

	/**
	 * 根据表名、字段名、值删除数据
	 * @param table	表名
	 * @param col	字段名
	 * @param ids	字段值集合(1,2,3)
	 * @return
	 */
	public int deleteTableByCols(String table, String col, String ids) {
		String sqlTemplate = getDeleteSql(table, col);
		Record paras = Record.create().set("ids", ids.split(","));
		int result = getSqlManager().executeUpdate(sqlTemplate, paras);
		return result;
	}

	/**
	 * 查询总数
	 * @return
	 */
	public long total() {
		long n = getSqlManager().allCount(this.modelClass);
		return n;
	}

	/**
	 * 查询符合实体类数据的总数
	 * @param model
	 * @return
	 */
	public long count(Object model) {
		long total = getSqlManager().templateCount(model);
		return total;
	}

	/**
	 * 查询sql语句查询结果的总数
	 * @param sqlTemplate sql语句
	 * @param modelOrMap  实体类或者Map(查询条件)
	 * @return
	 */
	public int countBy(String sqlTemplate, Object modelOrMap) {
		int n = getSqlManager().execute(sqlTemplate, this.modelClass, modelOrMap).size();
		return n;
	}

	/**
	 * 根据where条件查询总数
	 * @param where		 where条件
	 * @param modelOrMap 实体类或者Map(查询条件)
	 * @return
	 */
	public int count(String where, Object modelOrMap) {
		int n = getSqlManager().execute(getCountSql() + getWhere(where), this.modelClass, modelOrMap).size();
		return n;
	}

	/**
	 * 获取list
	 * @param start	页号
	 * @param size	每页数量
	 * @return
	 */
	public <T> List<T> getList(int start, int size) {
		List<T> all = (List<T>) getSqlManager().all(this.modelClass, (start - 1) * size + 1, size);
		return all;
	}

	/**
	 * 获取list
	 * @param model 实体类
	 * @param start 页号
	 * @param size	数量
	 * @return
	 */
	public <T> List<T> getList(Object model, int start, int size) {
		List<T> all = (List<T>) getSqlManager().template(model, (start - 1) * size + 1, size);
		return all;
	}
	

	/**
	 * 获取list
	 * @param sqlTemplate sql语句
	 * @param paras	参数		  
	 * @param start	页号		
	 * @param size	数量
	 * @return
	 */
	public <T> List<T> getList(String sqlTemplate, Object paras, int start, int size) {
		List<T> all = (List<T>) getSqlManager().execute(sqlTemplate, this.modelClass, paras, (start - 1) * size + 1, size);
		return all;
	}
	

	/**
	 * 获取list
	 * @param sqlTemplate sql语句
	 * @param clazz	返回类型
	 * @param paras	参数
	 * @param start	页号
	 * @param size	数量
	 * @return
	 */
	public <T> List<T> getList(String sqlTemplate, Class<?> clazz, Object paras, int start, int size) {
		List<T> all = (List<T>) getSqlManager().execute(sqlTemplate, clazz, paras, (start - 1) * size + 1, size);
		return all;
	}
	
	/**
	 * 分页
	 * @param sqlTemplate sql语句
	 * @param paras	参数
	 * @param start	页号
	 * @param size	数量
	 * @return
	 */
	public <T> BladePage<T> paginate(String sqlTemplate, Object paras, int start, int size){
		List<T> rows = getList(sqlTemplate, paras, start, size);
		long count = Db.init().queryInt(getCountSql(sqlTemplate), paras).longValue();
		BladePage<T> page = new BladePage<>(rows, start, size, count);
		return page;
	}
	
	/**
	 * 分页
	 * @param sqlTemplate sql语句
	 * @param clazz	返回类型
	 * @param paras	参数
	 * @param start	页号
	 * @param size	数量
	 * @return
	 */
	public <T> BladePage<T> paginate(String sqlTemplate, Class<?> clazz, Object paras, int start, int size){
		List<T> rows = getList(sqlTemplate, clazz, paras, start, size);
		long count = Db.init().queryInt(getCountSql(sqlTemplate), paras).longValue();
		BladePage<T> page = new BladePage<>(rows, start, size, count);
		return page;
	}
	

	/**
	 * 是否存在
	 * 
	 * @param sqlTemplate
	 * @param paras
	 * @return
	 */
	public boolean isExist(String sqlTemplate, Object modelOrMap) {
		int count = getSqlManager().execute(sqlTemplate, this.modelClass, modelOrMap).size();
		if (count != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 将本类的字段打印到控制台
	 */
	public void createPojoToConsole() {
		try {
			getSqlManager().genPojoCodeToConsole(this.table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 将指定表名的字段打印到控制台
	 * @param tableName
	 */
	public void createPojoToConsole(String tableName) {
		try {
			getSqlManager().genPojoCodeToConsole(tableName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*************************************************************************************************/

	private String getSet(String set) {
		if (set != null && !set.isEmpty() && !set.trim().toUpperCase().startsWith("SET")) {
			set = " SET " + set + " ";
		}
		return set;
	}

	private String getWhere(String where) {
		if (where != null && !where.isEmpty() && !where.trim().toUpperCase().startsWith("WHERE")) {
			where = " WHERE " + where + " ";
		}
		return where;
	}

	private String getSelectSql() {
		return " SELECT * ";
	}

	private String getSelectSql(String columns) {
		return " SELECT " + columns + " ";
	}

	private String getFromSql() {
		return " FROM " + this.table + " ";
	}

	private String getUpdateSql() {
		return " UPDATE " + this.table + " ";
	}

	private String getDeleteSql(String where) {
		return " DELETE FROM " + this.table + " WHERE " + where + " ";
	}

	private String getDeleteSql(String table, String col) {
		return " DELETE FROM " + table + " WHERE " + col + " IN (#{join(ids)}) ";
	}

	private String getCountSql() {
		return " SELECT " + this.pk + " FROM " + this.table + " ";
	}
	
	private String getCountSql(String sqlTemplate) {
		return " SELECT COUNT(*) CNT FROM (" + sqlTemplate + ") a";
	}
}

