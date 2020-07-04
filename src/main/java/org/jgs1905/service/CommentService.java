package org.jgs1905.service;

import java.sql.SQLException;
import java.util.List;

import org.jgs1905.dao.CommentDao;
import org.jgs1905.dao.FictionDao;
import org.jgs1905.entity.Comment;
import org.jgs1905.entity.Fiction;

public class CommentService {
	
	private CommentDao commentDao = new CommentDao();
	private FictionDao fictionDao = new FictionDao();

	/**
	 * 
	 * @param comment
	 * @return
	 * @throws SQLException 
	 */
	public int add(Comment comment) throws SQLException {
		return commentDao.insert(comment);
	}
	public Fiction getById(int id) throws SQLException {
		Fiction fiction = fictionDao.findOneById(id);
		List<Comment> comments = commentDao.findByPostId(fiction.getId());
		fiction.setComments(comments);
		return fiction;
	}

}
