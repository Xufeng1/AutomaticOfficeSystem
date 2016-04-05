<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="../style/css/main.css"/>
    <script type="text/javascript" src="../style/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../style/js/main.js"></script>
</head>
<body>
<div class="nav-top">
    <span>个人后台管理系统</span>

    <div class="nav-topright">
        <span>您好：
            <c:if test="${curruser.type == 2}">管理员-</c:if>
            <c:if test="${curruser.type == 1}">普通用户-</c:if>
            ${curruser.userName}
        </span>
        <span><a style="color:#FFFF00" href="/outLogin">注销</a></span>
    </div>
</div>
<div class="nav-down">
    <div class="leftmenu1">
        <div class="menu-oc"><img src="../images/menu-all.png"/></div>
        <ul>
            <li>
                <a class="a_list a_list1">个人设置</a>

                <div class="menu_list menu_list_first">
                    <a href="/private/UserInformation.jsp" target="right_ifream">个人信息</a>
                    <a href="/private/UserChangePassword.jsp" target="right_ifream">修改密码</a>
                </div>
            </li>
            <li>
                <a class="a_list a_list2">会员信息</a>

                <div class="menu_list">
                    <a href="/UserSearch" target="right_ifream">所有会员</a>
                    <c:if test="${curruser.type == 2}">
                        <a href="#">分配权限</a>
                        <a href="#">权限管理</a>
                        <a href="#">成员管理</a>
                    </c:if>
                </div>
            </li>
            <%--<li>
                <a class="a_list a_list3">新闻管理</a>
                <div class="menu_list">
                    <a href="#">新闻中心</a>
                    <a href="#">添加新闻</a>
                    <a href="#">修改新闻</a>
                    <a href="#">删除新闻</a>
                </div>
            </li>--%>
        </ul>
    </div>
    <div class="leftmenu2">
        <div class="menu-oc1"><img src="../images/menu-all.png"/></div>
        <ul>
            <li>
                <a class="j_a_list j_a_list1"></a>

                <div class="j_menu_list j_menu_list_first">
                    <span class="sp1"><i></i>个人信息</span>
                    <a href="/private/UserInformation.jsp" target="right_ifream">个人信息</a>
                    <a href="/private/UserChangePassword.jsp" target="right_ifream">修改密码</a>
                </div>
            </li>
            <li>
                <a class="j_a_list j_a_list2"></a>

                <div class="j_menu_list">
                    <span class="sp2"><i></i>会员信息</span>
                    <a href="/UserSearch" target="right_ifream">所有会员</a>
                    <c:if test="${curruser.type == 2}">
                        <a href="#">分配权限</a>
                        <a href="#">权限管理</a>
                        <a href="#">成员管理</a>
                    </c:if>
                </div>
            </li>
            <%--<li>
                <a class="j_a_list j_a_list3"></a>

                <div class="j_menu_list">
                    <span class="sp3"><i></i>权限管理</span>
                    <a href="#">基本权限</a>
                    <a href="#">分配权限</a>
                    <a href="#">权限管理</a>
                    <a href="#">成员管理</a>
                </div>
            </li>--%>
        </ul>

    </div>
    <!--<div class="rightcon">
    	<div class="right_con">
        	<p style="text-align:left; margin-top:50px">右侧内容自适应哦！我是左对齐</p>
            <p style="text-align:center">右侧内容自适应哦！我是居中</p>
            <p style="text-align:right">右侧内容自适应哦！我是右对齐</p>
            <h1>我是标题1。。。</h1>
            <h2>我是标题2。。。</h2>
            <h3>我是标题3。。。</h3>
            <h4>我是标题4。。。</h4>
            <h5>我是标题5。。。</h5>
        </div>
    </div>-->
    <div class="rightcon">
        <iframe name="right_ifream" src="/private/UserWelcome.jsp" width="920px" height="500px" frameborder="0"
                scrolling="no"></iframe>
    </div>
</div>
</body>
</html>