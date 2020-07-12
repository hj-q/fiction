<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/29 0029
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>天天小说主页</title>
    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="static/css/index.css">
</head>
<body>
<div class="container" style="background-image: url(static/img/backroundimg.jpg);min-width: 1000px;">
    <div class="row">
        <ul class="nav nav-tabs">
            <li><a href="javascript:location.reload();">天天小说网</a></li>
            <li class="col-md-3 col-md-offset-3">
                <form action="#" method="post" class="navbar-form">
                    <input type="text" id="search1" class="Search">
                    <button type="submit" class="btn-danger">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </form>
            </li>
            <li class="col-md-1 col-md-offset-2"><a href="${bp}/reader/login.jsp" id="login">登录</a></li>
            <li class="col-md-1"><a href="${bp}/reader/login.jsp" id="register">注册</a></li>
            <li class="col-md-2 col-md-offset-1" style="display:none;">
                <img src="static/img/fuchuang2.png" alt="touxiang"><span>xxx欢迎您</span>
            </li>
        </ul>
    </div>
</div>
<div class="container" style="background-image: url(static/img/bgimg.jpg);">
    <div class="row " style="min-width: 1000px;">
        <div class="col-md-2" id="logo" style="display: inline-block;">
            <a href=""> <img src="static/img/logo.png" alt="logo" width="200px"></a>
        </div>
        <div class="col-md-4 col-md-offset-2" id="search" style="display: inline-block;">
            <form action="#" method="post" class="">
                <input type="text" id="search2" name="search" value="" placeholder="少字也不要错字哦!" size="30px"
                       style="height: 45px;">
                <button type="submit" class="btn btn-lg btn-danger"><span>搜索</span></button>
            </form>
        </div>
        <div class="col-md-2 col-md-offset-1" style="display: inline-block;">
            <div class="book-shelf">
                <span class="glyphicon glyphicon-book"></span>
                我的书
            </div>
        </div>
    </div>
</div>
<br>
<div class="container" style="min-width: 1200px;">
    <div class="row">
        <ul class="nav nav-pills" id="typeList">
            <li class="col-1"><a id="shouye" href="javascript:location.reload();">首页</a></li>
            <c:forEach items="${typeList}" var="type" varStatus="status">

                <li class="col-1"><a href="${bp}/type?typeId=${type.id}" target="_blank">${type.name}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div style="min-width: 75rem;">
        <div id="box01">
            <c:forEach items="${fourFiction}" var="fiction" varStatus="status">
                <div class="book1">
                    <div class="image">
                        <img src="${fiction.image}" alt="${fiction.book_name}" width="120" height="150">
                    </div>
                    <dl>
                        <dt>
                            <span>${fiction.author_name}</span>
                            <a href="${bp}/fiction?method=detail&id=${fiction.id}">${fiction.book_name}</a>
                        </dt>
                        <dd>
                                ${fiction.intro}
                        </dd>
                    </dl>
                </div>
            </c:forEach>
        </div>
        <div class="box02">
            <h2>公告</h2>
            <ul>
                <li>
                    <span class="s1">公告</span>
                    <span class="s2">
							<a href="#" target="_blank" rel="nofollow">
								发现章节未及时更新请联系我们
							</a>
						</span>
                </li>
            </ul>
            <h2>上期强推</h2>
            <ul>
                <c:forEach items="${qiangtuiFiction}" var="fiction" varStatus="status">
                    <li>
                        <span class="s1">[${fiction.name}]</span>
                        <span class="s2">
							<a href="${bp}/fiction?method=detail&id=${fiction.id}">${fiction.book_name}</a>
						</span>
                        <span class="s5">${fiction.author_name}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="box03">
            <h2>友情链接</h2>
            <ul class="nav nav-tabs">
                <li><a href="https://www.qidian.com/">起点中文网</a></li>
                <li><a href="http://www.xbiquge.la/">新笔趣阁</a></li>
                <li><a href="https://b.faloo.com/">飞卢小说网</a></li>
                <li><a href="http://chuangshi.qq.com/">创世中文网</a></li>
                <li><a href="http://http://www.zongheng.com//">纵横中文网</a></li>
                <li><a href="http://https://www.xxsy.net//">潇湘书院</a></li>
                <li><a href="http://www.jjwxc.net//">晋江文学城</a></li>
            </ul>
        </div>
    </div>
    <div class="box04">
        <c:forEach items="${types}" var="type" varStatus="typeStatus">
            <div class="content">
                <h2>${type.name}小说</h2>
                <c:forEach items="${type.fictionList}" var="fiction" varStatus="vs">
                    <c:if test="${vs.index eq 0}">
                        <div class="top">
                            <div class="image">
                                <img src="${fiction.image}" alt="${fiction.book_name}" width="67" height="82">
                            </div>
                            <dl>
                                <dt>
                                    <a href="${bp}/fiction?method=detail&id=${fiction.id}">${fiction.book_name}</a>
                                </dt>
                                <dd>
                                        ${fiction.intro}
                                </dd>
                            </dl>
                            <div class="clear"></div>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="row nav nav-tabs">
                    <ul>
                        <c:forEach items="${type.fictionList}" var="fiction" varStatus="vs2">
                            <c:if test="${vs2.index != 0}">
                                <c:if test="${vs2.index%2 != 0}">
                                    <li class="col-md-4">
                                        <a href="${bp}/fiction?method=detail&id=${fiction.id}"> ${fiction.book_name}</a>/${fiction.author_name}
                                    </li>
                                </c:if>
                                <c:if test="${vs2.index%2 == 0}">
                                    <li><a href="${bp}/fiction?method=detail&id=${fiction.id}">${fiction.book_name}</a>/${fiction.author_name}</li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="box05">
        <div class="left">
            <h2>最新更新小说列表</h2>
            <ul>
                <c:forEach items="${newSections}" var="section">
                    <li>
                        <span class="s1">[${section.name}]</span>
                        <span class="s2">
							<a href="${bp}/fiction?method=detail&id=${section.fiction_id}" target="_blank">${section.fiction_name}</a>
						</span>
                        <span class="s3">
							<a href="${bp}/fiction?method=content&id=${section.id}" target="_blank">${section.section_name}</a>
						</span>
                        <span class="s4">${section.author_name}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="right">
            <h2>最新入库小说</h2>
            <ul>
                <c:forEach items="${newFictions}" var="newfiction" varStatus="vs2">
                    <li>
                        <span class="s1">[${newfiction.name}]</span>
                        <span class="s2"><a href="">${newfiction.book_name}</a></span>
                        <span class="s5">${newfiction.author_name}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="foot_link">
    </div>
</div>


<script type="text/javascript" src="static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

</body>
</html>
