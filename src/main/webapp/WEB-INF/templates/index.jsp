<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Login App</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import Google Text Font-->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">
<!-- Compiled and minified JavaScript from Materialize -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<!-- W3.css -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="static/css/style.css">
<script>
function togNav() {
    $('#nav-icon1').toggleClass('open');
    $('#mySidebar').toggleClass('open');
    $('#main').toggleClass('open');
    $('#navBarid').toggleClass('open');
    $('#closetxt').toggleClass('open');
}
</script>
</head>
    <body class="w3-theme">
        <!-- Sidebar -->
        <div id="nav-icon1" onclick="togNav()">
                <span></span>
                <span></span>
                <span></span>
            </div>
        <div id="mySidebar" class="sidebar">
            <a href="javascript:void(0)" onclick="togNav()" style="text-align: right;" id="closetxt">
                    Close
            </a><br>
            <img class="w3-circle center-block" src="static/images/user.png" height="150" width="150" style="background:white;">
            <c:choose>
                <c:when test="${loggedin}">
                    <a href="/about">${username}</a>
                    <a href="/about">About</a>
                    <a href="#">Contact</a>
                </c:when>
                <c:otherwise>
                    <a href="/login" >Login</a>
                    <a href="/register" >Register</a>
                </c:otherwise>
            </c:choose>
        </div>
    <div id="main">
        <nav class="navbar navbar-inverse" id="navBarid">
            <div class="container-fluid">
                <!--items-->
                <div class="collapse navbar-collapse" id="topNavBar">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="/">
                                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp; IDeaS
                            </a>
                        </li>
                        <li class="active">
                            <a href="/homepage">
                                <span class="glyphicon glyphicon-grain" aria-hidden="true"></span>&nbsp; Polls
                            </a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search" method="get" action="#">
                        <div class="form-group">
                            <input type="text" class="form-control" name="q" value="">
                        </div>
                        <button type="submit" class="btn btn-default">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;
                            Search
                        </button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <c:choose>
                            <c:when test="${loggedin}">
                                <li class="">
                                    <a href="#">
                                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp; ${username}
                                    </a>
                                </li>
                                <li class="">
                                    <a href="/logout">
                                        <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp; Logout
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="">
                                    <a href="/login">
                                        <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp; Login
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
        <c:forEach var="message" items="$messages">
            <script>M.toast({html: ${message}, classes: 'w3-theme-red rounded', displayLength: 10000});</script>
        </c:forEach>
        <script>M.toast({html: ${SPRING_SECURITY_LAST_EXCEPTION.message}, classes: 'w3-theme-red rounded', displayLength: 10000});</script>
        <div class="w3-row-padding w3-stretch w3-padding w3-margin">
            <c:choose>
                <c:when test="${mode == 'MODE_LOGIN'}">
                    <%@ include file="login.jsp"%>
                </c:when>
                <c:when test="${mode == 'MODE_REGISTER'}">
                    <%@ include file="register.jsp"%>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${loggedin}">
                            <h1>Hello, ${username}!</h1>
                        </c:when>
                        <c:otherwise>
                            <h1>This is Welcome Page.</h1>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    </body>
</html>