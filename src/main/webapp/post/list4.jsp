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
		<%-- <c:forEach items="${ names }" var="name" varStatus="vs">
				${ vs.count }--${ name }<br>
			</c:forEach> --%>
			
	<c:forEach items="${sections}" var="i" varStatus="vs">
    <p>	 ${i.section_name}</p>
		<p>	${i.content}</p>
		<p>	
	<a id="a" href="${ bp }/fiction?method=next&id=${ i.id }&fiction_id=${ i.fiction_id }">下一章</a>
		
		</p>
	</c:forEach>
	
	<script type="text/javascript" src="${ bp }/static/js/jquery-3.5.1.js"></script>
	<script type="text/javascript">
	$(function() {
		let count=0;
	$('#a').click(function() {
		
count++;
		location.href = "${bp}/fiction?method=hits&count="+count;
	})
	})
	</script>
	
</body>
</html>