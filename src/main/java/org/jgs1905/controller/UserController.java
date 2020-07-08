package org.jgs1905.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;
import org.jgs1905.entity.ResultBean;
import org.jgs1905.entity.User;
import org.jgs1905.service.UserService;
import org.jgs1905.utils.MailUtil;
import org.jgs1905.utils.Md5Util;

import com.alibaba.fastjson.JSON;
import com.google.code.kaptcha.Constants;

/**
 * 	用户控制器
 * @author junki
 * @date 2020年6月5日
 */
@WebServlet("/user")
public class UserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");
		
		switch (method) {
		case "login":
			login(request, response);
			break;
		case "regist":
			regist(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		case "check":
			check(request, response);
			break;
		case "forgetPwd":
			forgetPwd(request, response);
			break;
		case "updatePwd":
			updatePwd(request, response);
			break;
		default:
			response.sendRedirect(request.getContextPath() + "/error/404.jsp");
			break;
		}
		
	}

	/**
	 * 修改密码方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void updatePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取用户填写的验证码
		String code = request.getParameter("code");
		// 获取正确的验证码
		String realCode = (String)request.getSession().getAttribute("forgetPwdCode");
		request.getSession().removeAttribute("forgetPwdCode");
		if (StringUtils.isBlank(code)) {
			request.setAttribute("message", "验证码不能为空！");
			request.getRequestDispatcher("/user/updatePwd.jsp").forward(request, response);
			return;
		} 
		if (!code.equalsIgnoreCase(realCode)) {
			request.setAttribute("message", "验证码不正确！");
			request.getRequestDispatcher("/user/updatePwd.jsp").forward(request, response);
			return;
		}
		
		// 获取新密码
		String password = request.getParameter("password");
		try {
			password = Md5Util.encode(password);
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}
		
		// 获取用户id
		Long id = (Long)request.getSession().getAttribute("forgetPwdUserId");
		request.getSession().removeAttribute("forgetPwdUserId");
		
		// 调用service方法修改密码
		int result = 0;
		try {
			result = userService.updatePwd(password, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 判断是否修改成功
		if (result != 1) {
			request.setAttribute("message", "密码修改失败，请稍后重试！");
			request.getRequestDispatcher("/user/updatePwd.jsp").forward(request, response);
			return;
		}
		
		// 修改成功，重定向到login页面
		response.sendRedirect(request.getContextPath() + "/user/login.jsp");
	}

	/**
	 * 忘记密码请求
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void forgetPwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取用户输入验证码
		String userCaptcha = request.getParameter("captcha");
		// 获取正确的验证码
		String captcha = (String)request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (StringUtils.isBlank(userCaptcha)) {
			request.setAttribute("message", "验证码不能为空！");
			request.getRequestDispatcher("/user/forgetPwd.jsp").forward(request, response);
			return;
		} 
		if (!userCaptcha.equalsIgnoreCase(captcha)) {
			request.setAttribute("message", "验证码不正确！");
			request.getRequestDispatcher("/user/forgetPwd.jsp").forward(request, response);
			return;
		}
		
		// 通过用户名查询用户
		String username = request.getParameter("username");
		
		User user = null;
		try {
			user = userService.getByUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 判断用户是否存在
		if (user == null) {
			request.setAttribute("message", "该用户名不存在！");
			request.getRequestDispatcher("/user/forgetPwd.jsp").forward(request, response);
			return;
		}
		
		// 判断邮箱是否为空
		if (StringUtils.isBlank(user.getEmail())) {
			request.setAttribute("message", "该用户没有设置个人邮箱！");
			request.getRequestDispatcher("/user/forgetPwd.jsp").forward(request, response);
			return;
		}
		
		// 生成验证码
		String code = UUID.randomUUID().toString().substring(0, 4).toUpperCase();
		// 将验证码存放到session中
		request.getSession().setAttribute("forgetPwdCode", code);
		// 单独创建线程异步发送邮件
		String email = user.getEmail();
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					MailUtil.send(email, "JGS1905贴吧-忘记密码", "您的验证码是：" + code);
				} catch (Exception e) {
					e.printStackTrace();
				}				
			}
		}).start();
		
		// 将当前用户的id存放在session中
		request.getSession().setAttribute("forgetPwdUserId", user.getId());
		
		// 重定向到修改密码页面
		response.sendRedirect(request.getContextPath() + "/user/updatePwd.jsp");
		
	}

	/**
	 * 检查用户名是否重复
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void check(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取请求参数
		String username = request.getParameter("username");
		
		// 调用service方法
		boolean result = false;
		try {
			result = userService.checkUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 封装ajax请求结果对象
		ResultBean resutBean = ResultBean.builder().code(200).message("success").data(result).build();
		
		// 将ajax结果对象转为json字符串
		String jsonString = JSON.toJSONString(resutBean);
		
		// 将json字符串写回给前端
		//System.out.println(jsonString);
		// {"code":200,"data":false,"message":"success"}
		response.getWriter().print(jsonString);
		
	}

	/**
	 * 	注册方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1.创建磁盘文件工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		// 2.创建servlet文件上传对象
		ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
		
		// 3.将请求参数列表转为文件对象
		List<FileItem> fileItems = null;
		try {
			// 默认将所有参数转为FileItem对象
			fileItems = servletFileUpload.parseRequest(request);
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}
		
		// 创建map集合，用于保存普通表单字段
		Map<String, String> paramsMap = new HashMap<>();
		
		// 4.循环遍历fileItems集合
		for (FileItem fileItem : fileItems) {
			// 5.判断是否是普通表单字段
			if (fileItem.isFormField()) {
				// 将普通表单字段保存在map集合，方便之后使用beanutils封装数据
				paramsMap.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			} else {
				// 6.获取upload文件夹的真实磁盘路径
				// 根据自定义规则生成保存路径
				String savePath = "upload/userphoto/" + paramsMap.get("username"); 
				String realPath = request.getServletContext().getRealPath(savePath);
				
				// 7.上传文件
				// 获取真实文件名
				String realFileName = fileItem.getName();
				// 创建随机文件名
				String saveFileName = UUID.randomUUID().toString();
				// 获取文件后缀
				if (realFileName.contains(".")) {
					saveFileName += realFileName.substring(realFileName.indexOf("."));
				}
				
				// 写入到本地
				try {
					fileItem.write(new File(realPath + "/" + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// 8.将图片访问路径保存到map集合
				// http://localhost/tieba/upload/f2cb6896-acf0-449d-94f7-6ac1d6ffec87.jpg
				String photo = request.getContextPath() + "/" + savePath + "/" + saveFileName;
				paramsMap.put("photo", photo);
			}
		}
		
		// 获取请求参数并封装
		User user = new User();
		try {
			BeanUtils.populate(user, paramsMap);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		// 对用户密码进行加密
		
		try {
			String encodePassword = Md5Util.encode(user.getPassword());
			user.setPassword(encodePassword);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// 调用service方法保存用户
		int result = 0;
		try {
			result = userService.add(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 判断是否注册成功
		if (result == 0) {
			request.setAttribute("message", "注册失败，请重试！");
			request.setAttribute("user", user);
			request.getRequestDispatcher("/user/regist.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "注册成功，请点击登录！");
			response.sendRedirect(request.getContextPath() + "/user/login.jsp");
		}
		
	}

	/**
	 * 	退出登录方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute("onlineUser");
		response.sendRedirect(request.getContextPath() + "/user/login.jsp");
	}

	/**
	 * 	登录方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ResultBean resultBean = null;
		
		// 获取用户输入验证码
		String userCaptcha = request.getParameter("captcha");
		// 获取正确的验证码
		String captcha = (String)request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (StringUtils.isBlank(userCaptcha)) {
			resultBean = ResultBean.builder().code(400).message("验证码不能为空！").build();
			response.getWriter().print(JSON.toJSONString(resultBean));
			return;
		} 
		if (!userCaptcha.equalsIgnoreCase(captcha)) {
			resultBean = ResultBean.builder().code(400).message("验证码错误！").build();
			response.getWriter().print(JSON.toJSONString(resultBean));
			return;
		}
		
		// 判断用户名是否为空
		String username = request.getParameter("username");
		if (StringUtils.isBlank(username)) {
			resultBean = ResultBean.builder().code(400).message("用户名不能为空！").build();
			response.getWriter().print(JSON.toJSONString(resultBean));
			return;
		}
		
		// 判断密码是否为空
		String password = request.getParameter("password");
		if (StringUtils.isBlank(password)) {
			resultBean = ResultBean.builder().code(400).message("密码不能为空！").build();
			response.getWriter().print(JSON.toJSONString(resultBean));
			return;
		}
		
		// 对密码进行加密
		String encodePassword = "";
		try {
			encodePassword = Md5Util.encode(password);
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}
		
		// 调用登录业务方法
		User result = null;
		try {
			result = userService.login(User.builder().username(username).password(encodePassword).build());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 判断是否登录成功
		if (result == null) {
			resultBean = ResultBean.builder().code(400).message("用户名或密码错误！").build();
			response.getWriter().print(JSON.toJSONString(resultBean));
			return;
		} else {
//			// 保存session
			request.getSession().setAttribute("onlineUser", result);
			User onlineUser = (User)request.getSession().getAttribute("onlineUser");
		
			// 判断cookie
			String rememberMe = request.getParameter("rememberMe");
			if ("rememberMe".equals(rememberMe)) {
				Cookie usernameCookie = new Cookie("username", username);
				Cookie passwordCookie = new Cookie("password", password);
				Cookie rememberMeCookie = new Cookie("rememberMe", rememberMe);
				usernameCookie.setMaxAge(60 * 60 * 24 * 7);
				passwordCookie.setMaxAge(60 * 60 * 24 * 7);
				rememberMeCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(usernameCookie);
				response.addCookie(passwordCookie);
				response.addCookie(rememberMeCookie);
			} else {
				Cookie usernameCookie = new Cookie("username", null);
				Cookie passwordCookie = new Cookie("password", null);
				Cookie rememberCookie = new Cookie("rememberMe", null);
				usernameCookie.setMaxAge(0);
				passwordCookie.setMaxAge(0);
				rememberCookie.setMaxAge(0);
				response.addCookie(usernameCookie);
				response.addCookie(passwordCookie);
				response.addCookie(rememberCookie);
			}
			
			resultBean = ResultBean.builder().code(200).message("登陆成功！").build();
			response.getWriter().print(JSON.toJSONString(resultBean));
			return;
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
