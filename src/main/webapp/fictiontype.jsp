<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/1 0001
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="static/css/type.css">
</head>
<body>
<%@include file="common/top.jsp" %>
<div class="header container-fluid">
    <div class="container">
        <div class="logo">
            <a href="">
                天天${type.name}
            </a>
        </div>
        <div class="search">
            <form action="#" method="post">
                <input type="text"/>
                <button class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-search"></span></button>
            </form>

        </div>
    </div>
</div>
<div class="container" style="border-top: 0.0625rem solid #000000;margin-top: 0.625rem;min-width: 1180px">
    <div class="xhleft">
        <div class="left-title">本周强推</div>
        <ul class="nav">
            <c:forEach items="${fictions}" var="fiction" end="10" varStatus="vs">
                <li><a href="">${fiction.book_name}</a><span>${fiction.author_name}</span></li>
            </c:forEach>

        </ul>
    </div>
    <div class="xhcenter">
        <ul class="nav nav-tabs">
            <c:forEach items="${fictions}" var="fiction" begin="5" end="9" varStatus="vs">
                <li>
                    <div class="imgbox ">
                        <a href="#" alt="${fiction.book_name}"><img src="${fiction.image}" height="130" alt="${fiction.book_name}"/></a>

                    </div>
                    <dl>
                        <dt>
                            <a href="#">${fiction.book_name}</a>
                        </dt>
                        <dd>
                            ${fiction.intro}
                        </dd>
                    </dl>

                </li>

            </c:forEach>
        </ul>
    </div>
    <div class="xhright">
        <div class="right-title">
            玄幻热度排行榜
        </div>
        <ul class="nav">
           <c:forEach items="${fictionList}" var="fiction" end="10" varStatus="vs">
               <li><a href="">${fiction.book_name}</a><span>${fiction.author_name}</span></li>
           </c:forEach>

        </ul>
    </div>
    <div class="container">
        <h3><strong>玄幻新书</strong></h3>
        <div class="line"></div>
        <div class="row">
            <div class="col-md-12 ">
                <ul class="nav">
                    <li>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>

                        </div>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>
                        </div>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>
                        </div>
                    </li>
                    <li>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>

                        </div>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>
                        </div>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>
                        </div>
                    </li>
                    <li>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>

                        </div>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>
                        </div>
                        <div class="col-md-4 book1">
                            <div class="book-img">
                                <a href="#">
                                    <img src="static/img/951s.jpg" height="96" width="72"/>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="#">伏天氏</a>
                                </dt>
                                <dd>
                                    东方神州，有人皇立道统
                                </dd>
                                <br>
                                <a href="#">净无痕</a>
                            </dl>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ bp }/static/js/jquery-3.5.1.js"></script>
<script>
    $(function () {
        $("#qihuan").click(function () {
            $(".header").css("background-image","url(${ bp }/static/img/qihuan.jfif)")
        })
    })
</script>
</body>
</html>
