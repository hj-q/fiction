<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/30 0030
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公共头</title>
    <style>
        .container-fluid a{
            color: white;
        }
        .left-header{
            display: inline-block;
            margin-left: 1.25rem;
        }
        .right-header{
            display: inline-block;
            margin-top: 1.25rem;
            margin-right: 2%;
            margin-left: 12rem;
        }
        .right-header>ul>li{
            margin-right: 0.625rem;

        }
        .right-header>ul>li>form>input{
            outline: none;
            border-top: none;
            border-left: none;
            border-top-color: #97dcfe;
            border-left-color: #97dcfe;
            border-right-color:#97dcfe;
            border-bottom-color:whitesmoke;
            background-color: transparent;
            margin-top: 8px;
        }
        .shelf{
            margin-bottom: 5px;
        }
        #top-nav a:hover{
            color: black;
        }
        #top-nav2 a:hover{
            color: black;
        }
    </style>
</head>
<body>
<div class="container-fluid" style="min-width: 1300px; background-color: #080808;">
    <div class="row left-header" >
        <ul class="nav nav-pills" id="top-nav">
            <li>
                <a href="#"><img src="./static/img/logo.png" alt="logo" height="25" width="80"></a>
            </li>
            <li id="xuanhuan"><a href="#">玄幻</a></li>
            <li id="qihuan"><a href="#">奇幻</a></li>
            <li id="wuxia"><a href="#">武侠</a></li>
            <li id="xianxia"><a href="#">仙侠</a></li>
            <li id="dushi"><a href="#">都市</a></li>
            <li id="junshi"><a href="#">军事</a></li>
            <li id="youxi"><a href="#">游戏</a></li>
            <li>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    更多 <span class="caret"></span>
                    <ul class="dropdown-menu">
                        <li id="kehuan"><a href="#">科幻</a></li>
                        <li id="xuanyi"><a href="#">悬疑</a></li>
                        <li id="qita"><a href="#">其他</a></li>
                    </ul>
                </a>
            </li>
        </ul>
    </div>
    <div class="row right-header" id="top-nav2">
        <ul class="nav nav-pills">
            <li>
                <form action="#" method="post">
                    <input type="text" name="search"/>
                    <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                </form>
            </li>
            <li>
                <a href="">登录</a>
            </li>
            <li><a href="">注册</a></li>
            <li >
                <a class="shelf" href="">
                    <img class="image" src="./static/img/bookshelf.jpg" width="20">我的书架
                </a>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="./static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="./static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

</body>
</html>
