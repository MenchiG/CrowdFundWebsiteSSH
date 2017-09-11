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
            <h2>Register</h2>
          </div>
        </div>
        <div class="col-lg-12 col-md-12">
          <form class="inline" id="registerForm" action="${pageContext.request.contextPath}/user_register"
                method="post">
            <div class="row">
              <div class="col-sm-12 height-contact-element">
                <div class="form-group">
                  <input type="hidden" name="uid" value="<s:property value="model.uid"/>"/>
                  <s:if test="model.uid == null">
                    <input type="text" name="username" class="form-control custom-labels" id="username"
                           placeholder="Username" required data-validation-required-message="Please write your name"
                           onblur="checkUserName()"/>
                    <br><span id="span1"/>
                  </s:if>
                  <s:else>
                    <input type="text" name="username" class="form-control custom-labels" id="username"
                           placeholder="Username" value="<s:property value="model.username"/>" readonly/>
                  </s:else>
                </div>
              </div>
              <div class="col-sm-12 height-contact-element">
                <div class="form-group">
                  <input type="password" name="password" class="form-control custom-labels" id="password"
                         placeholder="Password" required data-validation-required-message="Please write a password"
                         value="<s:property value="model.password"/>"/>
                </div>
              </div>
              <div class="col-sm-12 height-contact-element">
                <div class="form-group">
                  <input type="password" name="password_again" class="form-control custom-labels" id="password_again"
                         placeholder="Confirm Password" required
                         data-validation-required-message="Please write confirm password"/>
                </div>
              </div>
              <div class="col-sm-12 height-contact-element">
                <div class="form-group">
                  <input type="email" name="email" class="form-control custom-labels" id="email" placeholder="Email"
                         required data-validation-required-message="Please write your email"
                         value="<s:property value="model.email"/>"/>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-sm-6 height-contact-element">
                <div class="form-group">
                  <input type="text" name="hometown" class="form-control custom-labels" id="hometown"
                         placeholder="Hometown" value="<s:property value="model.hometown"/>"/>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-sm-6 height-contact-element">
                <div class="form-group">
                  <input type="text" name="interest" class="form-control custom-labels" id="interest"
                         placeholder="Interest" value="<s:property value="model.interest"/>"/>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-sm-6 height-contact-element">
                <div class="form-group">
                  <input type="text" name="credit_card" class="form-control custom-labels" id="credit_card"
                         placeholder="Credit Card Number" required
                         data-validation-required-message="Please write your credit card Number!"
                         value="<s:property value="model.credit_card"/>"/>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-sm-3 col-xs-6 height-contact-element">
                <div class="form-group">
                  <s:if test="model.uid == null">
                    <input type="submit" class="btn btn-md btn-custom btn-noborder-radius" value="register"/>
                  </s:if>
                  <s:else>
                    <input type="submit" class="btn btn-md btn-custom btn-noborder-radius" value="apply"/>
                  </s:else>
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
                  <div id="response_holder"><s:fielderror/></div>
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
</section>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Portfolio -->
<script src="${pageContext.request.contextPath}/js/jquery.quicksand.js"></script>
<script>
    // just for the demos, avoids form submit
    $("#registerForm").validate({
        rules: {
            password_again: {
                equalTo: "#password"
            }
        }
    });

    function checkUserName() {
        var username = $("#username").val();
        $("#span1").load("${pageContext.request.contextPath}/user_checkUserName.action?" + new Date().getTime(), {'username': username});
    }
</script>
</body>
</html>