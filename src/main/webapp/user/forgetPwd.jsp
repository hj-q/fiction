<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘记密码</title>
<link href="${ bp }/static/css/main.css" rel="stylesheet">
</head>
<body>
	<div id="pageContent">
		<h3>忘记密码页面</h3>
		<form action="${ bp }/user?method=forgetPwd" method="post">
			<p>用户名：<input type="text" name="username"></p>
			<p><img alt="验证码加载失败" title="看不清？点击换一张！" src="${ bp }/kaptcha" onclick="this.src=this.src" id="captcha-img"></p>
			<p>验证码：<input type="text" name="captcha"></p>
			<p><input type="submit" value="下一步"></p>
			<p id="message" style="color:red">${ message }</p>
		</form>
	</div>
</body>
</html>