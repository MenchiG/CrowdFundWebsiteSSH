<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/header.jsp"/>
<html>
<body data-spy="scroll">

<section id="about">
  <div class="container">
    <div class="row">
      <div class="col-md-offset-1 col-md-10">
        <div class="text-center">
          <h2><s:property value="model.username"/></h2>
          <img class="img-responsive displayed" src="images/short.png" alt="Company about"/>
          <div class="row">
            <div class="col-md-12">
              <div class="text-center">
                <s:if test="#session.existUser.uid != null">
                  <s:if test="#session.existUser.uid == model.uid">
                    <a class="btn btn-primary btn-noborder-radius hvr-bounce-to-bottom" href="
                    <s:url action="user_registerPage">
                      <s:param name="uid"><s:property value="model.uid"/></s:param>
                    </s:url>">Edit</a>
                  </s:if>
                  <s:elseif test="isFollowing == null">
                    <a class="btn btn-primary btn-noborder-radius hvr-bounce-to-bottom" href="
                           <s:url action="user_followUser">
                           <s:param name="uid"><s:property value="model.uid"/></s:param>
                           </s:url>">Follow</a>
                  </s:elseif>
                  <s:else>
                    <a class="btn btn-primary btn-noborder-radius hvr-bounce-to-bottom" href="
                           <s:url action="user_unfollowUser">
                           <s:param name="uid"><s:property value="model.uid"/></s:param>
                           </s:url>">Unfollow</a>
                  </s:else>
                </s:if>
              </div>
              <p>
                Email:<s:property value="model.email"/><br>
                Hometown:<s:property value="model.hometown"/><br>
                Interest:<s:property value="model.interest"/><br>
                <s:if test="#session.existUser.uid == model.uid">
                  Credit Card:<s:property value="model.credit_card"/><br>
                </s:if>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="portfolio1">
  <div class="container">
    <div class="row">
      <div class="col-md-offset-1 col-md-10">
        <div class="text-center">
          <h2>Friend List</h2>
          <img class="img-responsive displayed" src="images/short.png" alt="Company about"/>
          <div class="row">
            <div class="col-md-12">
              <p>
                <s:iterator var="f" value="followList">
              <li><a href="<s:url action="user_userPage">
                           <s:param name="uid"><s:property value="#f.followUser.uid"/></s:param>
                       </s:url>"><s:property value="#f.followUser.username"/></a>
              </li>
              </s:iterator>
              </p>
            </div>
          </div>
        </div>
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

</body>
</html>