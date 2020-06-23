<%@page import="org.jgs1905.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<link href="${ bp }/static/css/main.css" rel="stylesheet">
<link href="${ bp }/static/css/validate.css" rel="stylesheet">
</head>
<body>
	
	<div id="pageContent">
		<h3>注册页面</h3>
		<form action="${ bp }/user?method=regist" method="post" id="registForm" enctype="multipart/form-data">
			<p>昵称：<input type="text" name="nickname" value="${ user.nickname }"></p>
			<p>用户名：<input type="text" name="username" value="${ user.username }"></p>
			<p>密码：<input type="password" name="password"></p>
			<p>确认密码：<input type="password" name="repassword"></p>
			<p>
				所在区域：
				<select name="province" id="province">
					<option value="0">--请选择--</option>
				</select>
				<select name="city" id="city">
					<option value="0">--请选择--</option>
				</select>
				<select name="region_id" id="county">
					<option value="0">--请选择--</option>
				</select>
			</p>
			<p>头像：<input type="file" name="photo" accept="image/*"></p>
			<p><input type="submit" value="注册"></p>
			<p><a href="${ bp }/user/login.jsp">已有账号？立即登录！</a></p>
			<p style="color:red;">${ message }</p>
		</form>
	</div>

	<script type="text/javascript" src="${ bp }/static/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${ bp }/static/js/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$(function() {
			// 自定义规则
			// 数字字母下划线
			$.validator.addMethod('numWordUline', function(value, element, param) {
				let usernameRegx = /^\w+$/;
				return this.optional(element) || usernameRegx.test(value);
			});
			
			// 用户名重复性校验
			$.validator.addMethod('usernameEnable', function(value, element, param) {
				let result = false;
				$.ajax({
					// 请求的地址
					url: '${bp}/user?method=check', 
					// 请求方式(get,post,put,delete...)
					type: 'get',
					// 携带的请求参数
					data: {
						'username': value
					},
					// 将ajax请求该为同步，保证返回结果判断成功
					async: false,
					// 指定请求返回数据类型
					dataType: 'json',
					// 请求成功之后执行的函数
					success: function(r) {
						console.log(r); // 此时r已经被转为了js对象
						result = r.data;
					},
					// 请求失败之后执行的函数
					error: function() {
						console.log("检查用户名接口请求失败！");
					}
				});
				return result;
			});
			
			// 指定表单进行校验
			$('#registForm').validate({
				rules: {
					nickname: {
						required: true,
						maxlength: 10,
					},
					username: {
						required: true,
						minlength: 6,
						maxlength: 20,
						numWordUline: true,
						usernameEnable: true
					},
					password: 'required',
					repassword: {
						required: true,
						equalTo: "[name='password']"
					}
				},
				messages: {
					nickname: {
						required: "昵称不能为空",
						maxlength: "昵称不能超过10位",
					},
					username: {
						required: "用户名不能为空",
						minlength: "用户名不能少于6位",
						maxlength: "用户名不能超过20位",
						numWordUline: "用户名必须是数字字母下划线组合",
						usernameEnable: "该用户名已存在"
					},
					password: "密码不能为空",
					repassword: {
						required: "重复密码不能为空",
						equalTo: "两次输入密码不一致"
					}
				}
			});
			
			// ajax获取所有省份
			$.ajax({
				url: '${bp}/region?method=province', 
				type: 'get',
				dataType: 'json',
				success: function(result) {
					console.log(result);
					let provinceList = result.data;
					for (let province of provinceList) {
						$('#province').append($('<option value="'+province.id+'">'+province.name+'</option>'));
					}
				},
				error: function() {
					console.log("获取所有省份接口请求失败！");
				}
			});
			
			// 当省份改变时，获取市级数据
			$('#province').change(function() {
				
				$('#city').html('<option value="0">--请选择--</option>');
				$('#county').html('<option value="0">--请选择--</option>');
				
				let parent_id = $('#province').val();
				$.ajax({
					url: '${bp}/region?method=child', 
					type: 'get',
					data: {
						'parent_id': parent_id
					},
					dataType: 'json',
					success: function(result) {
						console.log(result);
						let cityList = result.data;
						for (let city of cityList) {
							$('#city').append($('<option value="'+city.id+'">'+city.name+'</option>'));
						}
					},
					error: function() {
						console.log("获取所有城市接口请求失败！");
					}
				});
				
				
			});
			
			// 城市改变获取对应的区县数据
			$('#city').change(function() {
				
				$('#county').html('<option value="0">--请选择--</option>');
				
				let parent_id = $('#city').val();
				$.ajax({
					url: '${bp}/region?method=child', 
					type: 'get',
					data: {
						'parent_id': parent_id
					},
					dataType: 'json',
					success: function(result) {
						console.log(result);
						let countyList = result.data;
						for (let county of countyList) {
							$('#county').append($('<option value="'+county.id+'">'+county.name+'</option>'));
						}
					},
					error: function() {
						console.log("获取所有区县接口请求失败！");
					}
				});
				
				
			});
			
		})
	</script>
</body>
</html>