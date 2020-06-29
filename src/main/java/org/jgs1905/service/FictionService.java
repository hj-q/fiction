package org.jgs1905.service;

import java.sql.SQLException;
import java.util.List;

import org.jgs1905.dao.FictionDao;
import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Pager;

public class FictionService {
	
	private static FictionDao fictionDao = new FictionDao();
	
	

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

	public Long getIdByBookName(String book_name) throws SQLException {
	 Fiction fiction=fictionDao.selectIdByBook_name(book_name);
		return  fiction.getId();
	}

	public int addFiction(Fiction fiction) throws SQLException {
		
		return fictionDao.insert(fiction);
	}

	public static void hits(Fiction hiFiction) throws Exception {
		fictionDao.update(hiFiction);
	}

	public Pager<Fiction> getList(Fiction fiction, Long pageNum, Long pageSize) throws SQLException {
			// 查询总数据量
			Long total = fictionDao.count(fiction);
			
			// 构建pager对象
			Pager<Fiction> pager = new Pager<>(pageNum, pageSize, total);
			
			// 分页查询数据
			List<Fiction> list = fictionDao.findList(fiction, pager.getStartIndex(), pager.getPageSize());
			pager.setData(list);
			
			return pager;
		}

	}


