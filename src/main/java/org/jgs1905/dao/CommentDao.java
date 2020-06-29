package org.jgs1905.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.jgs1905.entity.Comment;
import org.jgs1905.utils.DataSourceUtil;

/**
 * 	评论数据操作类
 * @author junki
 * @date 2020年6月5日
 */
public class CommentDao {
	
	/**
	 * 	根据帖子id查询所有评论
	 * @param postId
	 * @return
	 * @throws SQLException 
	 */
	public List<Comment> findByPostId(Long postId) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		
		String sql = "SELECT `comments`.* FROM comments WHERE `comments`.fiction_id = ? ORDER BY `comments`.create_time DESC";
		
		List<Comment> result = qr.query(sql, new BeanListHandler<>(Comment.class), postId);
		
		return result;
	}

	/**
	 * 
	 * @param comment
	 * @return
	 * @throws SQLException 
	 */
	public int insert(Comment comment) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into comments(content,create_time,reader_id,fiction_id,nickname) value(?,?,?,?,?)";
		int result = qr.update(sql, comment.getContent(), comment.getCreate_time(), comment.getReader_id(), comment.getFiction_id(),comment.getNickname());
		return result;
	}
	
}
