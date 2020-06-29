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
<%@ include file="../common/header.jsp" %>
<%-- <c:forEach begin="1" end="10" step="2" var="i" varStatus="vs">
				${ i }--${ vs.count }--${ vs.current }<br>
			</c:forEach> --%>
		<%-- <c:forEach items="${ names }" var="name" varStatus="vs">
				${ vs.count }--${ name }<br>
			</c:forEach> --%>
	<c:forEach items="${ f}" var="i" varStatus="vs">
		<p>	${i}
			<img src="${i.image}" alt="图片加载失败" title="这是一个头像" width="100px" height="100px">
		
		<a href="${ bp }/fiction?method=detail&id=${ i.id }">${ i.book_name }</a>
		
		
		</p>
		
	</c:forEach>
	<hr>
	<hr>
	<c:forEach items="${ sections }" var="section" varStatus="vs">
  
   ${ section.fiction_name }	    ---
   	<a href="${ bp }/fiction?method=d&id=${ section.id }">${ section.section_name }</a>
   
   
   		--		${ section.time }<br>
			</c:forEach>
	
	<hr>
	
	
</body>
</html>