<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<link href="${ bp }/static/css/main.css" rel="stylesheet">
</head>
<body>
	<div id="pageContent">
		<h3>修改密码页面</h3>
		<form action="${ bp }/user?method=updatePwd" method="post">
			<p>邮箱验证码：<input type="text" name="code"></p>
			<p>新密码：<input type="password" name="password"></p>
			<p><input type="submit" value="修改"></p>
			<p id="message" style="color:red">${ message }</p>
		</form>
	</div>
</body>
</html>