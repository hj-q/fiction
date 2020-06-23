package org.jgs1905.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Section;
import org.jgs1905.service.FictionService;
import org.jgs1905.service.SectionService;

/**
 * 	小说控制器
 */
@WebServlet("/fiction")
public class FictionController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private FictionService regionService = new FictionService();
	private SectionService sectionService = new SectionService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");
		
		switch (method) {
		case "list":
			list(request, response);
			break;
		case "detail":
			detail(request, response);
			break;
		case "d":
			content(request, response);
			break;
			
		
		default:
			response.sendRedirect(request.getContextPath() + "/error/404.jsp");
			break;
		}
		
	}

	private void detail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String book_name = request.getParameter("book_name");
		Fiction fiction= Fiction.builder().book_name(book_name).build();
		Section section= Section.builder().fiction_name(book_name).build();
		List<Fiction> f = new ArrayList<>();
		List<Section> sections = new ArrayList<>();
		try {
			f = regionService.getById(fiction);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			  sections=sectionService.getById(section);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("f", f);
		request.setAttribute("sections", sections);
		try {
			request.getRequestDispatcher("/post/list3.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 展示每一章节具体内容
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void content(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String book_name = request.getParameter("id");
		Long id = Long.valueOf(book_name);
		Section section= Section.builder().id(id).build();
		List<Section> sections = new ArrayList<>();
		try {
			  sections=sectionService.getById(section);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("sections", sections);
		try {
			request.getRequestDispatcher("/post/list4.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response) {
		//String parentIdStr = request.getParameter("type");
		String parentIdStr="体育";
		
		
		Fiction fiction= Fiction.builder().type(parentIdStr).build();
		List<Fiction> f = new ArrayList<>();
		try {
			f = regionService.getById(fiction);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("f", f);
		try {
			request.getRequestDispatcher("/post/list2.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		 
	}
	}

	
		
	


	

