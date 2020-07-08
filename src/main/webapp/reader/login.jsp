<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/30 0030
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="login.css">
    <style>
        label.error {
            margin-left: 10px;
            font-weight: bold;
            color: #EA5200;
            font-size: 2px;
        }
    </style>
</head>
<body>
<div class="page">

    <div class="panel">
        <div class="panel_visible">
            <!--注册表单-->
            <div class="panel_content" style="max-width: 240px">
                <h1 class="panel_title">  注册 </h1>
                <form class="form" action="${ bp }/user?method=regist" method="post" id="registForm" enctype="multipart/form-data">
                    <label class="form_label" for="e_mail">邮箱</label>
                    <input class="form_input" type="text" id="e_mail" name="e_mail">

                    <label class="form_label" for="username">用户名</label>
                    <input class="form_input" type="text" id="username" name="username">
                    <label class="form_label" for="password">密码</label>
                    <input class="form_input " type="password" id="password" name="password">

                    <label class="form_label" >住址</label>
                    <!--                    <input class="form_input" type="text" id="address" name="address">-->
                    <select  name="province" id="province" style="max-width: 80px;overflow: hidden">
                        <option value="0">-请选择-</option>
                    </select>
                    <select  name="city" id="city" style="max-width: 80px;overflow: hidden">
                        <option value="0">-请选择-</option>
                    </select>
                    <select  name="region_id" id="county" style="max-width: 80px;overflow: hidden">
                        <option value="0">-请选择-</option>
                    </select>
                    <button class="form_btn" type="submit" value="Submit">注册</button>
                    <button class="form_toggle js-formToggle" type="button">去登录</button>
                    <p style="color:red;">${ message3 }</p>
                </form>
            </div>
            <!--登录表单-->
            <div class="panel_content panel_content-overlay js-panel_content ">
                <h1 class="panel_title">  登录 </h1>
                <form class="form" id="loginForm">
                    <label class="form_label" for="usernameIn">用户名</label>
                    <input class="form_input" type="text" id="usernameIn" name="username1">
                    <label class="form_label" for="passwordIn">密码</label>
                    <input class="form_input " type="password" id="passwordIn" name="password1">
                    <label class="form_label" for="captcha">验证码:<img style="padding-top: 10px" alt="?" title="看不清？点击换一张！" src="${ bp }/kaptcha" onclick="this.src=this.src" id="captcha-img" width="90"height="30"></label>
                    <input class="form_input" type="text" id="captcha" name="captcha1">
                    <button class="form_btn" type="submit" value="Submit">登录</button>
                    <br>
                    <p style="color:red;" id="message"></p>
                    <button class="form_toggle js-formToggle" type="button">去注册</button>
                </form>
            </div>
        </div>
        <div class="panel_back js-imageAnimate">
            <img class="panel_img" src="login.jpg" />
        </div>
    </div>

</div>
<script src="../static/js/main.js"></script>
<script type="text/javascript" src="${ bp }/static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${ bp }/static/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function() {

        $('#loginForm').submit(function() {

            $.ajax({
                url: '${ bp }/user?method=login',
                type: 'post',
                data: {
                    'username': $('[name="username1"]').val(),
                    'password': $('[name="password1"]').val(),
                    'captcha': $('[name="captcha1"]').val(),
                    'rememberMe': $('[name="rememberMe"]').val()
                },
                dataType: 'json',
                success: function(result) {
                    console.log(result);
                    if (result.code == 200) {
                        location.href = "${bp}/index";
                    } else {
                        $('#message').text(result.message);
                        $('#captcha-img').attr('src', $('#captcha-img').attr('src'));
                    }
                },
                error: function() {
                    console.log('登录接口请求失败');
                }
            });

            return false;

        });

    });
    $(function() {
        // 自定义规则
        // 数字字母下划线
        $.validator.addMethod('numWordUline', function(value, element, param) {
            let usernameRegx = /^\w+$/;
            return this.optional(element) || usernameRegx.test(value);
        });
        $.validator.addMethod('emailRegx',function (value,element) {
            let emailRegx = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            return this.optional(element) || emailRegx.test(value);
        })

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

                e_mail: {
                    required:true,
                    emailRegx:true,
                },
                username: {
                    required: true,
                    minlength: 4,
                    maxlength: 20,
                    numWordUline: true,
                    usernameEnable: true
                },
                password:{
                    required:true,
                    minlength:6,
                }

            },
            messages: {
                e_mail:{
                    required:"邮箱不能为空",
                    emailRegx: "请输入正确的邮箱"
                },
                username: {
                    required: "用户名不能为空",
                    minlength: "用户名不能少于6位",
                    maxlength: "用户名不能超过20位",
                    numWordUline: "用户名必须是数字字母下划线组合",
                    usernameEnable: "该用户名已存在"
                },
                password: {
                    required:"密码不能为空",
                    minlength:"密码不能少于六位",
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
