package org.jgs1905.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.jgs1905.entity.Region;
import org.jgs1905.utils.DataSourceUtil;

/**
 * 区划数据库操作类
 * @author junki
 * @date 2020年6月18日
 */
public class RegionDao {

	/**
	 * 查询所有数据
	 * @param region
	 * @return
	 * @throws SQLException 
	 */
	public List<Region> findAll(Region region) throws SQLException {
		
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		
		StringBuilder sbSql = new StringBuilder("select * from region where 1=1");
		List<Object> params = new ArrayList<>();
		
		if (region.getLevel() != null) {
			sbSql.append(" and level = ?");
			params.add(region.getLevel());
		}
		
		if (region.getParent_id() != null) {
			sbSql.append(" and parent_id = ?");
			params.add(region.getParent_id());
		}
		
		List<Region> result = qr.query(sbSql.toString(), new BeanListHandler<>(Region.class), params.toArray());
		
		return result;
	}

}
