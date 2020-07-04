package org.jgs1905.service;

import java.sql.SQLException;
import java.util.List;

import org.jgs1905.dao.SectionDao;
import org.jgs1905.entity.Section;

public class SectionService {
private SectionDao sectionDao = new SectionDao();
	
	

	/**
	 * 
	 * @param section
	 * @return
	 * @throws SQLException 
	 */
	public List<Section> getById(Section section) throws SQLException {
		List<Section> list=sectionDao.findList(section);
		
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


    public List<Section> getNewSection() throws SQLException {

		return  sectionDao.getNewSection();
	}

	public Section getPublishTime(int id) throws SQLException {
		return sectionDao.getMixTime(id);
	}
}
