package org.jgs1905.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Pager;
import org.jgs1905.entity.Section;
import org.jgs1905.service.CommentService;
import org.jgs1905.service.FictionService;
import org.jgs1905.service.SectionService;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;

/**
 * 	小说控制器
 */
@WebServlet("/fiction")
public class FictionController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private FictionService regionService = new FictionService();
	private SectionService sectionService = new SectionService();
	private CommentService commentService = new CommentService();
		

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");
		
		switch (method) {
		case "list":
			list(request, response);
			break;
		case "pager":
			pager(request, response);
			break;
		case "hits":
			hits(request, response);
			break;
		case "detail":
			detail(request, response);
			break;
		case "content":
			content(request, response);
			break;
		case "next":
			next(request, response);
			break;
		case "export":
			export(request, response);
			break;
		
		case "catalog":
			catalog(request, response);
			break;
		default:
			response.sendRedirect(request.getContextPath() + "/error/404.jsp");
			break;
		}
		
	}

	private void pager(HttpServletRequest request, HttpServletResponse response) {
		// 获取分页参数
				String pageNumStr = request.getParameter("pageNum");
				String pageSizeStr = request.getParameter("pageSize");
				
				Long pageNum = 1L;
				Long pageSize = 5L;
				
				if (StringUtils.isNumeric(pageNumStr)) {
					pageNum = Long.valueOf(pageNumStr);
				}
				
				if (StringUtils.isNumeric(pageSizeStr)) {
					pageSize = Long.valueOf(pageSizeStr);
				}
				
				// 封装查询参数
				Fiction fiction = new Fiction();
				try {
					BeanUtils.populate(fiction, request.getParameterMap());
				} catch (IllegalAccessException | InvocationTargetException e1) {
					e1.printStackTrace();
				}
				
				// 获取数据
				Pager<Fiction> pager = null;
				try {
					pager = regionService.getList(fiction, pageNum, pageSize);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// 转发页面
				request.setAttribute("fiction", fiction);
				request.setAttribute("pager", pager);
				try {
					request.getRequestDispatcher("/post/list.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
						
	}

	private void hits(HttpServletRequest request, HttpServletResponse response) {
		String book_name = request.getParameter("count");
		Long id = Long.valueOf(book_name);
		Fiction hiFiction= Fiction.builder().hits(id).build();	
		
			try {
				FictionService.hits(hiFiction);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

	private void catalog(HttpServletRequest request, HttpServletResponse response) {
		String book_name = request.getParameter("id");
		Long id = Long.valueOf(book_name);
		Section section= Section.builder().fiction_id(id).build();
		List<Section> sections = new ArrayList<>();
		try {
			  sections=sectionService.getById(section);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("sections", sections);
		try {
			request.getRequestDispatcher("/post/catalog.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
		
	

	/**
	 * 导出excel表格
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void export(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String book_name = request.getParameter("id");
		Long id = Long.valueOf(book_name);
		Fiction section= Fiction.builder().id(id).build();

		// 1.查询所有数据
		List<Fiction> postList = new ArrayList<Fiction>();
		try {
			postList = regionService.getById(section);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 2.创建easypoi核心工作簿对象
		Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("帖子数据表", "sheet1"), Fiction.class, postList);
		
		// 3.设置响应参数
		// 设置响应内容类型
		response.setContentType("application/vnd.ms-excel"); 
		// 设置文件名
		String filename = new String("书籍表.xls".getBytes("UTF-8"), "ISO8859-1");
		response.addHeader("Content-Disposition", "attachment; filename=" + filename);
		
		// 4.通过响应流将文件传输到浏览器
		workbook.write(response.getOutputStream());
		
	}

	private void next(HttpServletRequest request, HttpServletResponse response) {
		String book_name = request.getParameter("id");
		String fiction_i = request.getParameter("fiction_id");
		Long id = Long.valueOf(book_name);
		Long fiction_id = Long.valueOf(fiction_i);
		Section section= Section.builder().fiction_id(fiction_id)
				.id(id)
				.build();
		List<Section> sections = new ArrayList<>();
		try {
			  sections=sectionService.getNext(section);

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

	private void detail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String book_name = request.getParameter("id");
		Long id = Long.valueOf(book_name);
		Fiction fiction = null;
		try {
			fiction = commentService.getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 转发到页面
		
		
		
		request.setAttribute("fiction", fiction);
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

	/**
	 * 小说目录
	 * @param request
	 * @param response
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) {
		//String parentIdStr = request.getParameter("type");
		int  typeId=12;
		//调用小说类别服务，查询所有小说类别

		List<Section> sections = new ArrayList<>();

		
		Fiction fiction= Fiction.builder().type_id(typeId).build();
		List<Fiction> fictionList = new ArrayList<>();
		try {
			fictionList = regionService.getById(fiction);
			sections=sectionService.getByTime();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("sections", sections);

		request.setAttribute("fictionList", fictionList);
		try {
			request.getRequestDispatcher("/post/list2.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	}

	
		
	


	

