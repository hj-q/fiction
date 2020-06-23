package org.jgs1905.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Job;
 import org.jgs1905.entity.Section;
import org.jgs1905.utils.DataSourceUtil;

import com.alibaba.druid.sql.ast.expr.SQLSequenceExpr.Function;

/**
 * 51job岗位数据操作类
 * @author junki
 * @date 2020年6月13日
 */
public class FictionDao {
	
	public int insert(Fiction job) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into fiction(intro,book_name,author_name,author_id,type,image) value(?,?,?,?,?,?)";
		int result = qr.update(sql, job.getIntro(),job.getBook_name(),job.getAuthor_name(),job.getAuthor_id(),job.getType(),job.getImage());
		return result;
	}

	public Fiction selectIdByBook_name(Fiction fiction) throws SQLException {
      QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		
		String sql = "SELECT id FROM fiction WHERE book_name=?";
		
		 Fiction result = qr.query(sql, new BeanHandler<>(Fiction.class),fiction.getBook_name() );
		
		return result;
	}

	public List<Fiction> findListByType(Fiction function) throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuilder sbSql = new StringBuilder("select * from fiction where 1=1");
		List<Object> params = new ArrayList<>();
		if (function.getType() != null) {
			sbSql.append(" and type = ?");
			params.add(function.getType());
		}

		if (function.getBook_name() != null) {
			sbSql.append(" and book_name = ?");
			params.add(function.getBook_name());
		}

		List<Fiction> result = qr.query(sbSql.toString(), new BeanListHandler<>(Fiction.class), params.toArray());

		return result;

	}
	
	
}
