<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/12 0012
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/content.css">
</head>
<body>
<div class="container-fluid" style="min-width: 1300px; background-color: #080808;">
    <div class="row left-header" id="top-nav">
        <ul class="nav nav-pills" >
            <li>
                <a href="#"><img src="static/img/logo.png" alt="logo" height="25px" width="80px"></a>
            </li>
            <li><a href="type?typeId=1">玄幻</a></li>
            <li><a href="type?typeId=2">奇幻</a></li>
            <li><a href="type?typeId=3">武侠</a></li>
            <li><a href="type?typeId=4">仙侠</a></li>
            <li><a href="type?typeId=5">都市</a></li>
            <li><a href="type?typeId=6">军事</a></li>
            <li><a href="type?typeId=8">游戏</a></li>
            <li>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    更多 <span class="caret"></span>
                    <ul class="dropdown-menu">
                        <li><a href="type?typeId=6">历史</a></li>
                        <li><a href="type?typeId=9">科幻</a></li>
                        <li><a href="type?typeId=10">悬疑</a></li>
                        <li><a href="type?typeId=11">其他</a></li>
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
        </ul>
    </div>
</div>

<div class="container">
    <div class="path-nav">
        <ol class="breadcrumb ">
            <li><a href="index">首页</a></li>
            <li><a href="">玄幻</a></li>
            <li class="active">伏天氏</li>
        </ol>

    </div>

    <div class="leftNav">
        <ul class="nav">
            <li>
                <div class="leftNav-box1">
                    <span class="glyphicon glyphicon-th-list"></span>
                    <span>目录</span>
                </div>
            </li>

            <li>
                <div class="leftNav-box1">
                    <span class="glyphicon glyphicon-oil"></span>
                    <span>书架</span>
                </div>
            </li>

            <li>
                <div class="leftNav-box1">
                    <span class="glyphicon glyphicon-file"></span>
                    <span>书页</span>
                </div>
            </li>
        </ul>

    </div>
    <div class="content">
        <h2>${section.section_name}</h2>
        ${section.content}
    </div>

    <div class="foot-box">
        <div class="col-md-3 col-md-offset-3">
            <a href="${ bp }/fiction?method=last&id=${ section.id }&fiction_id=${ section.fiction_id }">上一章</a>
        </div>
        <div class="col-md-3">
            <a href="fiction?method=detail&id=${section.fiction_id}">目录</a>
        </div>
        <div class="col-md-3"><a href="${ bp }/fiction?method=next&id=${ section.id }&fiction_id=${ section.fiction_id }">下一章</a></div>

        <div style="height: 100px;width: 100%"></div>
    </div>

</div>
<script type="text/javascript" src="static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script>
    window.addEventListener('scroll', function() {
        let t = $('body, html').scrollTop();   // 目前监听的是整个body的滚动条距离
        if (t > 150) {
            $('.leftNav').addClass('leftNav-active')
        } else {
            $('.leftNav').removeClass('leftNav-active')
        }
    })

</script>
</body>
</html>
