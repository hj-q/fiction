package org.jgs1905.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.jgs1905.entity.*;
import org.jgs1905.entity.Section;
import org.jgs1905.entity.User;
import org.jgs1905.utils.DataSourceUtil;

/**
 * 51job岗位数据操作类
 * @author junki
 * @date 2020年6月13日
 */
public class SectionDao {
	
	public int insert(Section job) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into section(section_name,content,fiction_name,fiction_id,time) value(?,?,?,?,?)";
		int result = qr.update(sql, job.getSection_name(),job.getContent(),job.getFiction_name(),job.getFiction_id(),job.getTime());
		return result;
	}

	public List<Section> findList(Section function) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuilder sbSql = new StringBuilder("select * from section where 1=1");
		List<Object> params = new ArrayList<>();
		if (function.getSection_name() != null) {
			sbSql.append(" and section_name = ?");
			params.add(function.getSection_name());
		}
		if (function.getFiction_name() != null) {
			sbSql.append(" and fiction_name = ?");
			params.add(function.getFiction_name());
		}
		if (function.getId() != null) {
			sbSql.append(" and id = ?");
			params.add(function.getId());
		}
		if (function.getFiction_id() != null) {
			sbSql.append(" and fiction_id = ?");
			params.add(function.getFiction_id());
		}
		List<Section> result = qr.query(sbSql.toString(), new BeanListHandler<>(Section.class), params.toArray());
		return result;
 
	}

	public List<Section> getNext(Section section) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from section where  fiction_id=? and id >? order by id asc LIMIT 1";
		List<Section> result = qr.query(sql, new BeanListHandler<>(Section.class), section.getFiction_id(),section.getId());
		return result;
	}

	public List<Section> getByTime() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from section  order by time desc LIMIT 30";
		List<Section> result = qr.query(sql, new BeanListHandler<>(Section.class));
		return result;		
	}}


	

	
	
