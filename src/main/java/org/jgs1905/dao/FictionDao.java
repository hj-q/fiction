package org.jgs1905.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang3.StringUtils;
import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Type;
import org.jgs1905.utils.DataSourceUtil;

/**
 * 小说数据操作类
 */
public class FictionDao {
	
	public int insert(Fiction fiction) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into fiction(intro,book_name,author_name,author_id,type_id,image,hits) value(?,?,?,?,?,?,?)";
		int result = qr.update(sql, fiction.getIntro(),fiction.getBook_name(),fiction.getAuthor_name(),fiction.getAuthor_id(),fiction.getType_id(),fiction.getImage(),fiction.getHits());
		return result;
	}

	public Fiction selectIdByBook_name(String book_name) throws SQLException {
      QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		
		String sql = "SELECT id FROM fiction WHERE book_name=?";
		
		 Fiction result = qr.query(sql, new BeanHandler<>(Fiction.class),book_name);
		
		return result;
	}

	public List<Fiction> findListByType(Fiction function) throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuilder sbSql = new StringBuilder("select * from fiction where 1=1");
		List<Object> params = new ArrayList<>();
		List<Fiction> result= new ArrayList<Fiction>();
		String val=function.getType_id() +"";
		if(!("0".equals(val))){
			sbSql.append(" and type_id = ?");
			params.add(function.getType_id());
		}
		if (function.getBook_name() != null) {
			sbSql.append(" and book_name = ?");
			params.add(function.getBook_name());
		}
		if (function.getId() != 0) {
			sbSql.append(" and id = ?");
			params.add(function.getId());
		
		}
		 result = qr.query(sbSql.toString(), new BeanListHandler<>(Fiction.class), params.toArray());

		return result ;

	}

	public Fiction findOneById(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select fiction.*,type.name from fiction INNER JOIN type on fiction.type_id=type.id where fiction.id = ?";
		Fiction result = qr.query(sql, new BeanHandler<>(Fiction.class), id);
		return result;
	}

	public int update(Fiction hiFiction) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "UPDATE fiction SET hits = hits+? WHERE id=1";
		int result = qr.update(sql, hiFiction.getHits());
		return result;
	}

	public Long count(Fiction fiction) throws SQLException {
		
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuilder sbSql = new StringBuilder("select count(*) from fiction WHERE 1=1");
		
		// 创建集合用于保存查询参数
		List<Object> params = new ArrayList<>();
		
		// 动态sql
		if (StringUtils.isNotBlank(fiction.getBook_name())) {
			sbSql.append(" AND fiction.book_name LIKE ?");
			params.add("%" + fiction.getBook_name() + "%");
		}
		
		
		Long result = (Long)qr.query(sbSql.toString(), new ScalarHandler<>(1), params.toArray());
		return result;
	}

	public List<Fiction> findList(Fiction fiction, Long startIndex, Long pageSize) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuilder sbSql = new StringBuilder("SELECT fiction.* FROM fiction WHERE 1=1");
		
		// 创建集合用于保存查询参数
		List<Object> params = new ArrayList<>();
		
		// 动态sql
		if (StringUtils.isNotBlank(fiction.getBook_name())) {
			sbSql.append(" AND fiction.book_name LIKE ?");
			params.add("%" + fiction.getBook_name() + "%");
		}
		
		
		// 拼接分页
		sbSql.append(" GROUP BY fiction.id  LIMIT ?,?");
		params.add(startIndex);
		params.add(pageSize);
		
		List<Fiction> result = qr.query(sbSql.toString(), new BeanListHandler<>(Fiction.class), params.toArray());
		return result;
	}

	/**
	 * 获取点击数为前四的四本小说
	 * @return
	 * @throws SQLException
	 */
	public List<Fiction> getFourList() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT * FROM fiction ORDER BY fiction.hits DESC LIMIT 0,4";
		List<Fiction> fictionList = qr.query(sql, new BeanListHandler<>(Fiction.class));
		return fictionList;
	}

	public List<Fiction> findQiangTui() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select fiction.*,type.name from fiction \n" +
				"INNER JOIN type on fiction.type_id=type.id ORDER BY hits DESC LIMIT 4,6";
		List<Fiction> qiangTUi = qr.query(sql, new BeanListHandler<>(Fiction.class));
		return qiangTUi;
	}

	public List<Fiction> fictionList(int type_id) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT fiction.* FROM fiction WHERE fiction.type_id =? ORDER BY fiction.hits DESC LIMIT 0,13";
		List<Fiction> fictions = qr.query(sql, new BeanListHandler<>(Fiction.class),type_id);
		return fictions;
	}

	public List<Fiction> getNewFiction() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select fiction.*,type.name from fiction \n" +
				"INNER JOIN type on fiction.type_id=type.id ORDER BY hits LIMIT 0,30";
		List<Fiction> newFiction = qr.query(sql, new BeanListHandler<>(Fiction.class));
		return newFiction;
	}

	public List<Fiction> getList(int typeId) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT fiction.* FROM fiction WHERE fiction.type_id =? ORDER BY fiction.hits";
		List<Fiction> fictions = qr.query(sql, new BeanListHandler<>(Fiction.class),typeId);
		return fictions;
	}
}
