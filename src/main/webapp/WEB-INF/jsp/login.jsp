<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/header.jsp"/>
<html>
<body data-spy="scroll">

<section id="register">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="col-lg-12">
          <div class="text-center color-elements">
            <h2>Log in</h2>
          </div>
        </div>
        <div class="col-lg-12 col-md-12">
          <form class="inline" id="loginForm" action="${pageContext.request.contextPath}/user_login" method="post">
            <div class="row">
              <div class="col-sm-6 height-contact-element">
                <div class="form-group">
                  <input type="text" name="username" class="form-control custom-labels" id="username"
                         placeholder="Username" required data-validation-required-message="Please write your name!"/>
                </div>
              </div>
              <div class="col-sm-6 height-contact-element">
                <div class="form-group">
                  <input type="password" name="password" class="form-control custom-labels" id="password"
                         placeholder="Password" required data-validation-required-message="Please write a password!"/>
                </div>
              </div>
              <div class="col-sm-3 col-xs-6 height-contact-element">
                <div class="form-group">
                  <input type="submit" class="btn btn-md btn-custom btn-noborder-radius" value="login"/>
                </div>
              </div>
              <div class="col-sm-3 col-xs-6 height-contact-element">
                <div class="form-group">
                  <button type="reset" class="btn btn-md btn-noborder-radius btn-custom" name="reset">RESET
                  </button>
                </div>
              </div>
              <div class="col-sm-3 col-xs-6 height-contact-element">
                <div class="form-group">
                  <div id="response_holder"><s:actionerror/></div>
                </div>
              </div>
              <div class="col-sm-12 contact-msg">
                <div id="success"></div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Portfolio -->
<script src="${pageContext.request.contextPath}/js/jquery.quicksand.js"></script>

</body>
</html>