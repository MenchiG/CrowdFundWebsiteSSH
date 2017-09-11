<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/header.jsp"/>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/jquery.ui/1.11.4/jquery-ui.min.css">
</head>
<body data-spy="scroll">

<section id="register">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="col-lg-12">
          <div class="text-center color-elements">
            <h2>Post Your Project</h2>
          </div>
        </div>
        <div class="col-lg-12 col-md-12">
          <form class="inline" id="registerForm" action="${pageContext.request.contextPath}/project_newProject"
                method="post">
            <input type="hidden" name="pid" value="<s:property value="model.pid"/>"/>
            <s:if test="model.pid == null">
              <div class="row">
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="projectName" class="form-control custom-labels" id="projectName"
                           placeholder="projectName"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="description" class="form-control custom-labels" id="description"
                           placeholder="description"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="category" class="form-control custom-labels" id="category"
                           placeholder="category"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="endTime" class="form-control custom-labels" id="datepicker"
                           placeholder="endTime"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="minimum" class="form-control custom-labels" id="minimum"
                           placeholder="minimum"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="maximum" class="form-control custom-labels" id="maximum"
                           placeholder="maximum"/>
                  </div>
                </div>
                <div class="col-sm-3 col-xs-6 height-contact-element">
                  <div class="form-group">
                    <input type="submit" class="btn btn-md btn-custom btn-noborder-radius" value="submit"/>
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
            </s:if>
            <s:else>
              <div class="row">
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="projectName" class="form-control custom-labels" id="projectName1"
                           placeholder="projectName" readonly value="<s:property value="model.projectName"/>"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="description" class="form-control custom-labels" id="description1"
                           placeholder="description" value="<s:property value="model.description"/>"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="category" class="form-control custom-labels" id="category1"
                           placeholder="category" value="<s:property value="model.category"/>"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="endTime" class="form-control custom-labels" id="datepicker1"
                           placeholder="endTime" readonly value="<s:property value="model.endTime"/>"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="minimum" class="form-control custom-labels" id="minimum1"
                           placeholder="minimum" readonly value="<s:property value="model.minimum"/>"/>
                  </div>
                </div>
                <div class="col-sm-12 height-contact-element">
                  <div class="form-group">
                    <input type="text" name="maximum" class="form-control custom-labels" id="maximum1"
                           placeholder="maximum" readonly value="<s:property value="model.maximum"/>"/>
                  </div>
                </div>
                <div class="col-sm-3 col-xs-6 height-contact-element">
                  <div class="form-group">
                    <input type="submit" class="btn btn-md btn-custom btn-noborder-radius" value="submit"/>
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
                    <div id="response_holder1"><s:fielderror/></div>
                  </div>
                </div>
                <div class="col-sm-12 contact-msg">
                  <div id="success1"></div>
                </div>
              </div>
            </s:else>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.ui/1.11.4/jquery-ui.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Portfolio -->
<script src="${pageContext.request.contextPath}/js/jquery.quicksand.js"></script>
<script>
    $(function () {
        $("#datepicker").datepicker({dateFormat: 'yy-mm-dd'});
    })

</script>
</body>
</html>