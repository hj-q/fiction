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

import org.apache.commons.lang3.StringUtils;
import org.jgs1905.entity.Region;
import org.jgs1905.entity.ResultBean;
import org.jgs1905.service.RegionService;

import com.alibaba.fastjson.JSON;

/**
 * 	区划控制器
 * @author junki
 * @date 2020年6月18日
 */
@WebServlet("/region")
public class RegionController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private RegionService regionService = new RegionService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");
		
		switch (method) {
		case "province":
			province(request, response);
			break;
		case "child":
			child(request, response);
			break;
		default:
			response.sendRedirect(request.getContextPath() + "/error/404.jsp");
			break;
		}
		
	}

	/**
	 * 根据父id获取子区划列表
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void child(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String parentIdStr = request.getParameter("parent_id");
		Long parentId = null;
		if (StringUtils.isNumeric(parentIdStr)) {
			parentId = Long.valueOf(parentIdStr);
		}
		
		List<Region> regionList = new ArrayList<>();
		try {
			regionList = regionService.getChildByParentId(parentId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultBean result = ResultBean.builder().code(200).message("请求成功！").data(regionList).build();
		
		response.getWriter().print(JSON.toJSONString(result));
	}

	/**
	 * 获取所有省份数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void province(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Region> regionList = new ArrayList<Region>();
		
		try {
			regionList = regionService.getProvinceList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultBean result = ResultBean.builder().code(200).message("请求成功！").data(regionList).build();
		
		response.getWriter().print(JSON.toJSONString(result));
	}

	
}
