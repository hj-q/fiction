<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/29 0029
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <link rel="stylesheet" href="static/css/index.css">
</head>
<body>
<div class="container" style="background-image: url(static/img/backroundimg.jpg);min-width: 1000px;">
    <div class="row">
        <ul class="nav nav-tabs">
            <li><a href="">天天小说网</a></li>
            <li class="col-md-3 col-md-offset-3">
                <form action="#" method="post" class="navbar-form">
                    <input type="text" id="search1" class="Search">
                    <button type="submit" class="btn-danger">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </form>
            </li>
            <li class="col-md-1 col-md-offset-2" ><a href="#" id="login">登录</a></li>
            <li class="col-md-1"><a href="#" id="register">注册</a></li>
            <li class="col-md-2 col-md-offset-2" style="display:none;">
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
                <input type="text" id="search2" name="search" value="" placeholder="少字也不要错字哦!" size="30px" style="height: 45px;">
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
    <div class="row" >
        <ul class="nav nav-pills" id="typeList">
            <li class="active col-1"><a href="">首页</a></li>
            <li class="col-1"><a href="type.html">玄幻</a></li>
            <li class="col-1"><a href="type.html">奇幻</a></li>
            <li class="col-1"><a href="type.html">武侠</a></li>
            <li class="col-1"><a href="type.html">仙侠</a></li>
            <li class="col-1"><a href="type.html">都市</a></li>
            <li class="col-1"><a href="type.html">军事</a></li>
            <li class="col-1"><a href="type.html">历史</a></li>
            <li class="col-1"><a href="type.html">游戏</a></li>
            <li class="col-1"><a href="type.html">科幻</a></li>
            <li class="col-1"><a href="type.html">悬疑</a></li>
            <li class="col-1"><a href="type.html">女生</a></li>
        </ul>
    </div>
    <div style="min-width: 75rem;">
        <div id="box01">
            <div class="book1">
                <div class="image">
                    <img src="static/img/10489s.jpg" alt="三寸人间" width="120" height="150">
                </div>
                <dl>
                    <dt>
                        <span>耳根</span>
                        <a href="#">三寸人间</a>
                    </dt>
                    <dd>
                        举头三尺无神明，掌心三寸是人间。这是耳根继《仙逆》《求魔》《我欲封天》《一念永恒》后，创作的第五部长篇小说《三寸人间》。
                    </dd>
                </dl>
            </div>
            <div class="book1">
                <div class="image">
                    <img src="static/img/10489s.jpg" alt="三寸人间" width="120" height="150">
                </div>
                <dl>
                    <dt>
                        <span>耳根</span>
                        <a href="#">三寸人间</a>
                    </dt>
                    <dd>
                        举头三尺无神明，掌心三寸是人间。这是耳根继《仙逆》《求魔》《我欲封天》《一念永恒》后，创作的第五部长篇小说《三寸人间》。
                    </dd>
                </dl>
            </div>
            <div class="book1">
                <div class="image">
                    <img src="static/img/10489s.jpg" alt="三寸人间" width="120" height="150">
                </div>
                <dl>
                    <dt>
                        <span>耳根</span>
                        <a href="#">三寸人间</a>
                    </dt>
                    <dd>
                        举头三尺无神明，掌心三寸是人间。这是耳根继《仙逆》《求魔》《我欲封天》《一念永恒》后，创作的第五部长篇小说《三寸人间》。
                    </dd>
                </dl>
            </div>
            <div class="book1">
                <div class="image">
                    <img src="static/img/10489s.jpg" alt="三寸人间" width="120" height="150">
                </div>
                <dl>
                    <dt>
                        <span>耳根</span>
                        <a href="#">三寸人间</a>
                    </dt>
                    <dd>
                        举头三尺无神明，掌心三寸是人间。这是耳根继《仙逆》《求魔》《我欲封天》《一念永恒》后，创作的第五部长篇小说《三寸人间》。
                    </dd>
                </dl>
            </div>
        </div>
        <div class="box02">
            <h2>公告</h2>
            <ul>
                <li>
                    <span class="s1">公告</span>
                    <span class="s2">
							<a href="" target="_blank" rel="nofollow">
								发现章节未及时更新请联系我们
							</a>
						</span>

                </li>
            </ul>
            <h2>上期强推</h2>
            <ul>
                <li>
                    <span class="s1">[修真]</span>
                    <span class="s2">
							<a href="#">剑卒过河</a>
						</span>
                    <span class="s5">惰堕</span>
                </li>
                <li>
                    <span class="s1">[修真]</span>
                    <span class="s2">
							<a href="#">剑卒过河</a>
						</span>
                    <span class="s5">惰堕</span>
                </li>
                <li>
                    <span class="s1">[修真]</span>
                    <span class="s2">
							<a href="#">剑卒过河</a>
						</span>
                    <span class="s5">惰堕</span>
                </li>
                <li>
                    <span class="s1">[修真]</span>
                    <span class="s2">
						<a href="#">剑卒过河</a>
					</span>
                    <span class="s5">惰堕</span>
                </li>
                <li>
                    <span class="s1">[修真]</span>
                    <span class="s2">
							<a href="#">剑卒过河</a>
						</span>
                    <span class="s5">惰堕</span>
                </li>
                <li>
                    <span class="s1">[修真]</span>
                    <span class="s2">
						<a href="#">剑卒过河</a>
					</span>
                    <span class="s5">惰堕</span>
                </li>
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

        <div class="content">
            <h2>玄幻小说</h2>
            <div class="top">
                <div class="image">
                    <img src="static/img/951s.jpg" alt="伏天氏" width="67" height="82">
                </div>
                <dl>
                    <dt>
                        <a href="#">伏天氏</a>
                    </dt>
                    <dd>
                        东方神州，有人皇立道统，有圣贤宗门传道，有诸侯雄踞一方王国，诸强林立，神州动乱千万载，执此之时，一代天骄叶青帝及东凰大帝横空出世，斩人皇，驭圣贤，诸侯臣服，东方神州一统！    然，叶青帝忽然暴毙，世间雕像尽皆被毁，于世间除名，沦为禁忌；从此...
                    </dd>
                </dl>
                <div class="clear"></div>
            </div>
            <div class="row">
                <ul>
                    <li class="col-md-6"><a href="#"> 沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                </ul>
            </div>
        </div>
        <div class="content">
            <h2>修真小说</h2>
            <div class="top">
                <div class="image">
                    <img src="static/img/951s.jpg" alt="伏天氏" width="67" height="82">
                </div>
                <dl>
                    <dt>
                        <a href="#">伏天氏</a>
                    </dt>
                    <dd>
                        东方神州，有人皇立道统，有圣贤宗门传道，有诸侯雄踞一方王国，诸强林立，神州动乱千万载，执此之时，一代天骄叶青帝及东凰大帝横空出世，斩人皇，驭圣贤，诸侯臣服，东方神州一统！    然，叶青帝忽然暴毙，世间雕像尽皆被毁，于世间除名，沦为禁忌；从此...
                    </dd>
                </dl>
                <div class="clear"></div>
            </div>
            <div class="row">
                <ul>
                    <li class="col-md-6"><a href="#"> 沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                </ul>
            </div>
        </div>
        <div class="content">
            <h2>都市小说</h2>
            <div class="top">
                <div class="image">
                    <img src="static/img/951s.jpg" alt="伏天氏" width="67" height="82">
                </div>
                <dl>
                    <dt>
                        <a href="#">伏天氏</a>
                    </dt>
                    <dd>
                        东方神州，有人皇立道统，有圣贤宗门传道，有诸侯雄踞一方王国，诸强林立，神州动乱千万载，执此之时，一代天骄叶青帝及东凰大帝横空出世，斩人皇，驭圣贤，诸侯臣服，东方神州一统！    然，叶青帝忽然暴毙，世间雕像尽皆被毁，于世间除名，沦为禁忌；从此...
                    </dd>
                </dl>
                <div class="clear"></div>
            </div>
            <div class="row">
                <ul>
                    <li class="col-md-6"><a href="#"> 沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="box04">

        <div class="content">
            <h2>穿越小说</h2>
            <div class="top">
                <div class="image">
                    <img src="static/img/951s.jpg" alt="伏天氏" width="67" height="82">
                </div>
                <dl>
                    <dt>
                        <a href="#">伏天氏</a>
                    </dt>
                    <dd>
                        东方神州，有人皇立道统，有圣贤宗门传道，有诸侯雄踞一方王国，诸强林立，神州动乱千万载，执此之时，一代天骄叶青帝及东凰大帝横空出世，斩人皇，驭圣贤，诸侯臣服，东方神州一统！    然，叶青帝忽然暴毙，世间雕像尽皆被毁，于世间除名，沦为禁忌；从此...
                    </dd>
                </dl>
                <div class="clear"></div>
            </div>
            <div class="row">
                <ul>
                    <li class="col-md-6"><a href="#"> 沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                </ul>
            </div>
        </div>
        <div class="content">
            <h2>科幻小说</h2>
            <div class="top">
                <div class="image">
                    <img src="static/img/951s.jpg" alt="伏天氏" width="67" height="82">
                </div>
                <dl>
                    <dt>
                        <a href="#">伏天氏</a>
                    </dt>
                    <dd>
                        东方神州，有人皇立道统，有圣贤宗门传道，有诸侯雄踞一方王国，诸强林立，神州动乱千万载，执此之时，一代天骄叶青帝及东凰大帝横空出世，斩人皇，驭圣贤，诸侯臣服，东方神州一统！    然，叶青帝忽然暴毙，世间雕像尽皆被毁，于世间除名，沦为禁忌；从此...
                    </dd>
                </dl>
                <div class="clear"></div>
            </div>
            <div class="row">
                <ul>
                    <li class="col-md-6"><a href="#"> 沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                </ul>
            </div>
        </div>
        <div class="content">
            <h2>网游小说</h2>
            <div class="top">
                <div class="image">
                    <img src="static/img/951s.jpg" alt="伏天氏" width="67" height="82">
                </div>
                <dl>
                    <dt>
                        <a href="#">伏天氏</a>
                    </dt>
                    <dd>
                        东方神州，有人皇立道统，有圣贤宗门传道，有诸侯雄踞一方王国，诸强林立，神州动乱千万载，执此之时，一代天骄叶青帝及东凰大帝横空出世，斩人皇，驭圣贤，诸侯臣服，东方神州一统！    然，叶青帝忽然暴毙，世间雕像尽皆被毁，于世间除名，沦为禁忌；从此...
                    </dd>
                </dl>
                <div class="clear"></div>
            </div>
            <div class="row">
                <ul>
                    <li class="col-md-6"><a href="#"> 沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                    <li class="col-md-6"><a href="">沧元图</a>/我吃西红柿</li>
                    <li><a href="">沧元图</a>/我吃西红柿</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="box05">
        <div class="left">
            <h2>最新更新小说列表</h2>
            <ul>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
                <li>
                    <span class="s1">[玄幻小说]</span>
                    <span class="s2">
							<a href="#" target="_blank">凰途似锦</a>
						</span>
                    <span class="s3">
							<a href="" target="_blank">第二百七十五章（觐见二）</a>
						</span>
                    <span class="s4">猫漫漫</span>
                </li>
            </ul>
        </div>
        <div class="right">
            <h2>最新入库小说</h2>
            <ul>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
                <li>
                    <span class="s1">[其他]</span>
                    <span class="s2"><a href="">坐在柳树底</a></span>
                    <span class="s5">心录</span>
                </li>
            </ul>
        </div>
    </div>
    <div class="foot_link">

    </div>
</div>



<script type="text/javascript" src="static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery.validate.min.js"></script>

<script>
    $(function(){
        $("#typeList li a").click(function(e){
            e.preventDefault();
            $(this).tab('show');
            /*当前标签下的a标签*/
            var obj = $(this).children("a");
            /*获取第一个a标签，进行跳转*/
            window.location.href=$(obj[0]).attr("href");

        });
        $(".book-shelf").click(function(){
            console.log("跳了")
            location="#";
        })

    })

</script>
</body>
</html>
