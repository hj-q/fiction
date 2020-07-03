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
<link href="${ bp }/static/css/validate.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="${ bp }/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ bp }/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${ bp }/ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
	p {
		margin: 10px 0;
	}
	
	#postDetail,#commentList {
		width: 100%;
		border: 1px solid green;
		padding: 5px;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<div id="pageContent">
	
		<div id="postDetail">
			<p>书名：${ fiction.book_name }</p>
		<span><input type="button" value="导出书籍" id="export"></span>
		
			<p> 
			<img src="${fiction.image}" alt="图片加载失败" title="这是一个头像" width="100px" height="100px">
			 
			</p>
			
			<p>类别：${ fiction.name }</p>
				<p>作者：${ fiction.author_name }</p>
			
			<p>简介：</p>
			<div id="content">${ fiction.intro }</div>
		</div>
		
		<br><br>
		
		<div id="commentList">
		<c:forEach items="${ fictions }" var="fiction" varStatus="vs">
				
			<form action="${ bp }/comment?method=add&fiction_id=${ fiction.id  }" method="post">
				<p>内容：</p>
				<p>
				<script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
				<input type="hidden" name="content" id="conten">
				<input type="hidden" name="contentTxt" id="contentTxs">
			</p>
				<p>
					<input type="submit" value="发表评论" id="submit">
					<span>${ message }</span>
				</p>
			</form>
			</c:forEach>
			<hr>
			<c:forEach items="${ fiction.comments }" var="comment" varStatus="vs">
				<p>${ comment.content }</p>
				<p align="right">${ comment.nickname }--<fmt:formatDate value="${ comment.create_time }" pattern="yyyy年MM月dd日 HH点mm分ss秒"/></p>
				<hr>
			</c:forEach>
		</div>
		
	</div>
	<script type="text/javascript" src="${ bp }/static/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${ bp }/static/js/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$(function() {
			
			
			// 实例化ue编辑器
			var ue = UE.getEditor('editor');
			
			$('#submit').click(function() {
				// 将富文本存放到content隐藏域
				let content = ue.getContent();
				$('#conten').val(content);
				
				let contentTxt = ue.getContentTxt();
				$('#contentTx').val(contentTxt);
			});
		})
		
		$('#export').click(function() {
			location.href = "${bp}/fiction?method=export&id=${fiction.id}";
		})
	</script>
</body>
</html>