package org.jgs1905.service;

import java.sql.SQLException;
import java.util.List;

import org.jgs1905.dao.RegionDao;
import org.jgs1905.entity.Region;

/**
 * 区划业务处理类
 * @author junki
 * @date 2020年6月18日
 */
public class RegionService {

	private RegionDao regionDao = new RegionDao();
	
	/**
	 * 获取所有省份数据
	 * @return
	 * @throws SQLException 
	 */
	public List<Region> getProvinceList() throws SQLException {
		Region region = Region.builder().level((byte)1).build();
		return regionDao.findAll(region);
	}

	/**
	 * 根据parentId获取子区划
	 * @param parentId
	 * @return
	 * @throws SQLException 
	 */
	public List<Region> getChildByParentId(Long parentId) throws SQLException {
		Region region = Region.builder().parent_id(parentId).build();
		return regionDao.findAll(region);
	}

}
