package org.jgs1905.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.jgs1905.entity.Author;
import org.jgs1905.utils.DataSourceUtil;

/**
 * 51job岗位数据操作类
 * @author junki
 * @date 2020年6月13日
 */
public class AuthorDao {
	
	public int insert(Author job) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into author(name) value(?)";
		int result = qr.update(sql, job.getName());
		return result;
	}

	

	public Author selectIdByAuthor_name(Author author2) throws SQLException {
     QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		
		String sql = "SELECT id FROM author WHERE name=?";
		
		 Author result = qr.query(sql, new BeanHandler<>(Author.class), author2.getName());
		
		return result;
		
	}

	
	
}
