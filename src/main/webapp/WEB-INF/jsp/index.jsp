<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/header.jsp"/>
<html>
<body data-spy="scroll">


<!-- Page Content -->
<section id="bloghome">
  <div class="container">
    <div class="text-center"><h2>Latest Blog Posts</h2>
      <img class="img-responsive displayed" src="images/short.png" alt="about">
    </div>
    <div class="row">
      <div class="col-md-12 homeport1">
        <s:iterator value="#session.newList">
          <div class="col-md-4 col-sm-12 col-xs-12 portfolio-item">
            <figure class="effect-oscar">
              <img src="images/blog1.jpg" alt="img09" class="img-responsive"/>
              <figcaption>
                <h2><s:property value="projectName"/></h2>
                <a href="<s:url action="project_findByPid">
                           <s:param name="pid"><s:property value="pid"/></s:param>
                         </s:url>">View more</a>
              </figcaption>
            </figure>
            <p class="text-center"><s:property value="description"/></p>
            <div class="text-center"><a class="btn btn-primary btn-noborder-radius hvr-bounce-to-bottom"
                                        href="<s:url action="project_findByPid">
                           <s:param name="pid"><s:property value="pid"/></s:param>
                         </s:url>">Read More</a></div>
          </div>
        </s:iterator>
      </div>
    </div>
  </div>
</section>
<s:if test="#session.existUser != null">
  <section id="portfolio1">
    <div class="container">
      <div class="row">
        <div class="col-md-offset-1 col-md-10">
          <div class="text-center">
            <h2>Follow's comments</h2>
            <img class="img-responsive displayed" src="images/short.png" alt="Company about"/>
          </div>

            <%--following commentList--%>
          <s:iterator value="commentOfFollowList" var="c">
            <div class="media">
              <a class="pull-left" href="#">
                <img class="media-object" src="images/avatar1.png" alt="">
              </a>
              <div class="media-body">
                <h4 class="media-heading"><a href="<s:url action="user_userPage">
                         <s:param name="uid"><s:property value="#c.user.uid"/></s:param>
                     </s:url>"><s:property value="#c.user.username"/></a>
                  <small><s:property value="#c.timestamp"/></small>
                  On
                  <a href="<s:url action="project_findByPid">
                          <s:param name="pid"><s:property value="#c.project.pid"/></s:param>
                       </s:url>"><s:property value="#c.project.projectName"/></a>
                </h4>
                <s:property value="#c.context"/>
              </div>
            </div>
          </s:iterator>

        </div>
      </div>
    </div>
  </section>
  <s:if test="projectList.size() > 0">
    <section id="bloghome">
      <div class="container">
        <div class="text-center"><h2>My project</h2>
          <img class="img-responsive displayed" src="images/short.png" alt="about">
        </div>
        <div class="row">
          <div class="col-md-12 homeport1">
            <s:iterator value="projectList">
              <div class="col-md-4 col-sm-12 col-xs-12 portfolio-item">
                <figure class="effect-oscar">
                  <img src="images/blog1.jpg" alt="img09" class="img-responsive"/>
                  <figcaption>
                    <h2><s:property value="projectName"/></h2>
                    <a href="<s:url action="project_findByPid">
                           <s:param name="pid"><s:property value="pid"/></s:param>
                         </s:url>">View more</a>
                  </figcaption>
                </figure>
                <p class="text-center"><s:property value="description"/></p>
                <div class="text-center"><a class="btn btn-primary btn-noborder-radius hvr-bounce-to-bottom"
                                            href="<s:url action="project_findByPid">
                           <s:param name="pid"><s:property value="pid"/></s:param>
                         </s:url>">Read More</a></div>
              </div>
            </s:iterator>
          </div>
        </div>
      </div>
    </section>
  </s:if>
</s:if>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Portfolio -->
<script src="${pageContext.request.contextPath}/js/jquery.quicksand.js"></script>


</body>
</html>