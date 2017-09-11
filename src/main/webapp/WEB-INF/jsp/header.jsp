<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Buy the Future</title>
  <!-- Bootstrap Core CSS -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom Fonts -->
  <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet"
        type="text/css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/patros.css">
</head>
<body data-spy="scroll">

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html"><img src="${pageContext.request.contextPath}/images/logo.png"
                                                     alt="company logo"/></a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right custom-menu">
        <li><a href="<s:url action="index"/>">Home</a></li>
        <s:if test="#session.existUser != null">
          <li><a href="<s:url action="user_userPage">
                           <s:param name="uid"><s:property value="#session.existUser.uid"/></s:param>
                       </s:url>"><s:property value="#session.existUser.username"/></a></li>
          <li><a href="<s:url action="user_logout"/>">Log out</a></li>
        </s:if>
        <s:else>
          <li><a href="<s:url action="user_loginPage"/>">Login</a></li>
          <li><a href="<s:url action="user_registerPage"/>">Register</a></li>
        </s:else>


        <li><a href="<s:url action="project_findByPage?page=1"/>">Projects</a></li>
        <s:if test="#session.existUser != null">
          <li><a href="<s:url action="project_newProjectPage"/>">NewProject</a></li>
        </s:if>
      </ul>
    </div>
  </div>
</nav>

<!-- Header Carousel -->
<header id="home" class="carousel slide">
  <ul class="cb-slideshow">
    <li><span>image1</span>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="text-center"><h3>Buy what you want!</h3></div>
          </div>
        </div>
        <h4>Is there something interests you?</h4>
      </div>
    </li>
    <li><span>image2</span>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="text-center"><h3>Start your business!</h3></div>
          </div>
        </div>
        <h4>We can help you.</h4>
      </div>
    </li>
    <li><span>image3</span>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="text-center"><h3>Buy what you want!</h3></div>
          </div>
        </div>
        <h4>Is there something interests you?</h4>
      </div>
    </li>
    <li><span>image4</span>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="text-center"><h3>Start your business!</h3></div>
          </div>
        </div>
        <h4>We can help you.</h4>
      </div>
    </li>
  </ul>
  <div class="intro-scroller">
    <a class="inner-link" href="#about">
      <div class="mouse-icon" style="opacity: 1;">
        <div class="wheel"></div>
      </div>
    </a>
  </div>
</header>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Portfolio -->
<script src="${pageContext.request.contextPath}/js/jquery.quicksand.js"></script>


</body>
</html>