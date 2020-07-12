package org.jgs1905.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.jgs1905.entity.Comment;
import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.User;
import org.jgs1905.service.CommentService;
import org.jgs1905.service.FictionService;

/**
 * 	评论控制器
 * @author junki
 * @date 2020年6月5日
 */
@WebServlet("/comment")
public class CommentController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private FictionService fictionService = new FictionService();

	private CommentService commentService = new CommentService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");
		switch (method) {
		case "add":
			add(request, response);
			break;
		case "detail":
			detail(request, response);
			break;
			
		case "dcomment":
			dcomment(request, response);
			break;
		default:
			response.sendRedirect(request.getContextPath() + "/error/404.jsp");
			break;
		}
		
	}

	/**
	 * 	发表评论方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		Comment comment = new Comment();
		String book_name = request.getParameter("fiction_id");
		Long id = Long.valueOf(book_name);
		try {
			BeanUtils.populate(comment, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		// 设置userId
		User onlineUser = (User)request.getSession().getAttribute("onlineUser");
		comment.setReader_id(onlineUser.getId());
		comment.setNickname(onlineUser.getNickname());
		
		// 设置创建时间
		comment.setCreate_time(new Date());
		// 调用service方法
		int result = 0;
		try {
			result = commentService.add(comment);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 判断是否评论成功
		if (result == 0) {
			request.setAttribute("message", "评论失败，请重试！");
			request.setAttribute("content", comment.getContent());
			request.getRequestDispatcher("/comment?method=detail").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/fiction?method=detail&id="+id);
		}
		
	}
	
	private void detail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//String idStr = request.getParameter("id");
		// 判断是否可以转为数字
		String idStr="1038";
		if (!StringUtils.isNumeric(idStr)) {
			response.sendRedirect(request.getContextPath() + "/error/404.jsp");
			return;
		}
		
		int id = Integer.valueOf(idStr);
		Fiction fiction2 =Fiction.builder().id(id).build();
		// 调用service，通过id获取一篇帖子
		List<Fiction>  fictions= new ArrayList<Fiction>();
		try {
			fictions = fictionService.getById(fiction2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 转发到页面
		request.setAttribute("fictions", fictions);
		request.getRequestDispatcher("/comment?method=dcomment&id="+id).forward(request, response);
		
	}
	private void dcomment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String idStr = request.getParameter("id");
		// 判断是否可以转为数字
		if (!StringUtils.isNumeric(idStr)) {
			response.sendRedirect(request.getContextPath() + "/error/404.jsp");
			return;
		}
		
		int id = Integer.valueOf(idStr);
		
		// 调用service，通过id获取一篇帖子
		Fiction fiction = null;
		try {
			fiction = commentService.getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 转发到页面
		request.setAttribute("fiction", fiction);
		request.getRequestDispatcher("/detail.jsp").forward(request, response);
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
