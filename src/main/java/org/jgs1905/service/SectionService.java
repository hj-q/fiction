package org.jgs1905.service;

import java.sql.SQLException;
import java.util.List;

import org.jgs1905.dao.SectionDao;
import org.jgs1905.entity.Section;

public class SectionService {
private SectionDao sectionDao = new SectionDao();
	
	

	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public List<Section> getById(Section function) throws SQLException {
		List<Section> list=sectionDao.findList(function);
		
		return  list;
	}



	public List<Section> getNext(Section section) throws SQLException {
		List<Section> list=sectionDao.getNext(section);
		return list;
	}



	public List<Section> getByTime() throws SQLException {
		List<Section> list=sectionDao.getByTime();

		return list;
	}



	



	
	

}
