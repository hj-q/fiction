<%@page import="org.jgs1905.entity.Fiction"%>
 <%@page import="org.jgs1905.enums.PostTypeEnum"%>
<%@page import="java.util.List"%>
<%@page import="org.jgs1905.service.FictionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帖子列表页</title>
</head>
<body>
		
	<c:forEach items="${sections}" var="i" varStatus="vs">
		<p>	
	<a href="${ bp }/fiction?method=d&id=${ i.id }">${ i.section_name }</a>
		
		</p>
	</c:forEach>
	
</body>
</html>