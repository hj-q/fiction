package org.jgs1905.service;

import java.sql.SQLException;
import java.util.List;

import org.jgs1905.dao.FictionDao;
import org.jgs1905.entity.Fiction;

public class FictionService {
	
	private FictionDao fictionDao = new FictionDao();
	
	

	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public List<Fiction> getById(Fiction function) throws SQLException {
		List<Fiction> list=fictionDao.findListByType(function);
		
		return  list;
	}

}
