<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/10 0010
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>小说详情页</title>
    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="static/css/detail.css">
</head>
<body>
<div class="container-fluid" style="min-width: 1300px; background-color: #080808;">
    <div class="row left-header" id="top-nav">
        <ul class="nav nav-pills" >
            <li>
                <a href="${bp}/index"><img src="static/img/logo.png" alt="logo" height="25px" width="80px"></a>
            </li>
            <li><a href="">玄幻</a></li>
            <li><a href="">奇幻</a></li>
            <li><a href="">武侠</a></li>
            <li><a href="">仙侠</a></li>
            <li><a href="">都市</a></li>
            <li><a href="">军事</a></li>
            <li><a href="">游戏</a></li>
            <li>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    更多 <span class="caret"></span>
                    <ul class="dropdown-menu">
                        <li><a href="">科幻</a></li>
                        <li><a href="">悬疑</a></li>
                        <li><a href="">女生</a></li>
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
                <span style="color: whitesmoke;display: none"> xxx 欢迎您！</span>
            </li>
            <li>
                <a href="">注册</a>
                <a href="" style="display: none">退出登录</a>
            </li>
            <li >
                <a class="shelf" href="">
                    <img class="image" src="static/img/bookshelf.jpg" width="20px">我的书架
                </a>
            </li>
        </ul>
    </div>
</div>

<div class="container">
    <div class="top-box">
        <div class="left-box">
            <img src="${fiction.image}" alt="${fiction.book_name}" width="140">
        </div>
        <div class="info-box">
            <h2><strong>${fiction.book_name}</strong></h2>
            <p>作&nbsp;&nbsp;者：${fiction.author_name}</p>
            <p>动&nbsp;&nbsp;作：
                <a href="#">加入书架</a>
            </p>
            <p>最后更新时间：${fiction.section.time}</p>
            <p>最新章节：
                <a href="#">${fiction.section.section_name}</a>
            </p>
            <div class="line">
               ${fiction.intro}
            </div>

        </div>

    </div>
    <div class="container">
        <div class="section-box">
            <div class="">
                <ul class="nav nav-tabs">
                    <c:forEach items="${fiction.sectionList}" var="section">
                    <li class="col-md-4" style="max-height: 35px;overflow: hidden"><a href="${bp}/fiction?method=content&id=${section.id}">${section.section_name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript" src="static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="./static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</body>
</html>
