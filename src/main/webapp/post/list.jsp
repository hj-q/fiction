<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帖子列表页</title>
<link href="${ bp }/static/css/main.css" rel="stylesheet">
<link href="${ bp }/static/css/pager.css" rel="stylesheet">
</head>
<body>

	<div id="pageContent">
		
		<div id="search">
			<form id="search-from" action="${ bp }/fiction?method=pager" method="post">
				<span>标题：<input type="search" name="book_name" ></span>
				
				<span><input type="submit" value="查询"></span>
			</form>
		</div>
		${ pager.data }
		
		
		
				
			
		
		<%@ include file="../common/pager.jsp" %>
		
	</div>
	
	<script type="text/javascript" src="${ bp }/static/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${ bp }/static/js/pager.js"></script>
	<script type="text/javascript">
		// 初始化分页
		initPager($('#search-from'));
		
		
	</script>
	
</body>
</html>