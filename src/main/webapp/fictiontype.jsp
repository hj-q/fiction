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
    <title>天天${type.name}</title>
    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="static/css/type.css">
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
            <c:forEach items="${typeList}" var="type" begin="0" end="6" varStatus="status">

                <li class="col-1"><a href="${bp}/type?typeId=${type.id}" target="_blank">${type.name}</a></li>
            </c:forEach>
            <li>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    更多 <span class="caret"></span>
                    <ul class="dropdown-menu">
                        <c:forEach items="${typeList}" var="type" begin="7" end="8" varStatus="status">
                            <li class="col-1"><a href="${bp}/type?typeId=${type.id}" target="_blank">${type.name}</a></li>
                        </c:forEach>
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
                <a href="${bp}/reader/login.jsp">登录</a>
            </li>
            <li><a href="${bp}/reader/login.jsp">注册</a></li>
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
            ${type.name}热度排行榜
        </div>
        <ul class="nav">
           <c:forEach items="${fictionList}" var="fiction" end="10" varStatus="vs">
               <li><a href="">${fiction.book_name}</a><span>${fiction.author_name}</span></li>
           </c:forEach>

        </ul>
    </div>
    <div class="container">
        <h3><strong>${type.name}新书</strong></h3>
        <div class="line"></div>
        <div class="row">
            <div class="col-md-12 ">
                <ul class="nav">
                    <li>
                      <c:forEach items="${newFictions}" end="2" var="fiction" varStatus="vs">
                          <div class="col-md-4 book1">
                              <div class="book-img">
                                  <a href="#">
                                      <img src="${fiction.image}" height="96" width="72"/>
                                  </a>
                              </div>
                              <dl>
                                  <dt>
                                      <a href="#">${fiction.book_name}</a>
                                  </dt>
                                  <dd>
                                      ${fiction.intro}
                                  </dd>
                                  <br>
                                  <a href="#">${fiction.author_name}</a>
                              </dl>

                          </div>
                      </c:forEach>

                    </li>
                    <li>
                        <c:forEach items="${newFictions}" begin="3" end="5" var="fiction" varStatus="vs">
                            <div class="col-md-4 book1">
                                <div class="book-img">
                                    <a href="#">
                                        <img src="${fiction.image}" height="96" width="72"/>
                                    </a>
                                </div>
                                <dl>
                                    <dt>
                                        <a href="#">${fiction.book_name}</a>
                                    </dt>
                                    <dd>
                                            ${fiction.intro}
                                    </dd>
                                    <br>
                                    <a href="#">${fiction.author_name}</a>
                                </dl>

                            </div>
                        </c:forEach>
                    </li>
                    <li>
                        <c:forEach items="${newFictions}" begin="6" end="8" var="fiction" varStatus="vs">
                            <div class="col-md-4 book1">
                                <div class="book-img">
                                    <a href="#">
                                        <img src="${fiction.image}" height="96" width="72"/>
                                    </a>
                                </div>
                                <dl>
                                    <dt>
                                        <a href="#">${fiction.book_name}</a>
                                    </dt>
                                    <dd>
                                            ${fiction.intro}
                                    </dd>
                                    <br>
                                    <a href="#">${fiction.author_name}</a>
                                </dl>

                            </div>
                        </c:forEach>
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
