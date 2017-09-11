<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/header.jsp"/>
<html>
<body data-spy="scroll">

<!-- Page Content -->
<div class="container blog singlepost">
  <div class="row">
    <article class="col-md-8">
      <h1 class="page-header sidebar-title"><s:property value="model.projectName"/></h1>
      <img src="images/unsplash1.jpg" class="img-responsive" alt="photo"/>
      <hr>
      <div class="row">
        <div class="col-md-12">
          <div class="entry-meta">
            <span><i class="fa fa-calendar-o"></i><s:property value="model.postTime"/></span>
            <span><i class="fa fa-user"></i> Posted by <a href="<s:url action="user_userPage">
                           <s:param name="uid"><s:property value="model.user.uid"/></s:param>
                       </s:url>"><s:property value="model.user.username"/></a></span>
            <span> <i class="fa fa-tag"></i> <a href="<s:url action="project_findByTag">
                      <s:param name="category"><s:property value="model.category"/></s:param>
                    </s:url>" rel="tag"><s:property value="model.category"/></a></span>
            <div class="pull-right"><span><i class="fa fa-eye"></i> 184</span> <span><i
                    class="fa fa-comment"></i> 4</span></div>
          </div>
        </div>
      </div>
      <h3>End time:<s:property value="model.endTime"/></h3>
      <h3>Minimum Money:<s:property value="model.minimum"/></h3>
      <h3>Maximum Money:<s:property value="model.maximum"/></h3>
      <h3>Current Money:<s:property value="sumSponser"/></h3>
      <h3>project Status:<s:property value="model.projectStatus"/></h3>
      <h3>Description</h3>
      <p><s:property value="model.description"/></p>
      <div class="text-center">
        <s:if test="#session.existUser.uid == model.user.uid">
          <a class="btn btn-primary btn-noborder-radius hvr-bounce-to-bottom" href="
                    <s:url action="project_newProjectPage">
                      <s:param name="pid"><s:property value="model.pid"/></s:param>
                    </s:url>">Edit</a>
        </s:if>
      </div>
      <!-- Sponser List -->
      <p>
        <s:if test="sponserList.size() != 0">
      <h3>People who take part in:</h3>
      <s:iterator var="sponser" value="sponserList">
        <li><a href="<s:url action="user_userPage">
                           <s:param name="uid"><s:property value="#sponser.user.uid"/></s:param>
                       </s:url>"> <s:property value="#sponser.user.username"/></a></li>
      </s:iterator>
      </s:if>
      <s:else>
        <h3>Nobody support this project. Be the first one!</h3>
      </s:else>
      </p>

      <s:if test="#session.existUser != null">
        <!-- Sponser -->
        <s:if test="model.projectStatus == 'funding'">
          <div class="comments1">
            <div class="well">
              <h4>Sponser this item</h4>
              <form action="${pageContext.request.contextPath}/sponser_sponseProject?pid=<s:property value="model.pid"/>"
                    method="post">
                <div class="form-group">
                  <input type="text" name="amount" class="form-control" id="amount" placeholder="amount"/>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
            </div>
            <hr>
          </div>
        </s:if>
        <!-- Blog Comments -->
        <div class="comments1">
          <div class="well">
            <h4>Leave a Comment:</h4>
            <form action="comment_postComment?pid=<s:property value="model.pid"/>" method="post">
              <div class="form-group">
                <textarea name="context" id="context" class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
          <hr>
        </div>
      </s:if>

      <%--commentList--%>
      <s:iterator value="commentList" var="c">
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
              <a href="#"><s:property value=""/></a>
            </h4>
            <s:property value="#c.context"/>
          </div>
        </div>
      </s:iterator>

    </article>
    <!-- Blog Sidebar Column -->
    <aside class="col-md-4 sidebar-padding">
      <%-- Search bar--%>
      <div class="blog-sidebar">
        <div class="input-group searchbar">
          <form action="project_findByName" method="post">
            <input type="text" name="projectName" class="form-control searchbar" placeholder="Search for...">
            <span class="input-group-btn">
							<button class="btn btn-default" type="submit">Search</button>
							</span>
          </form>
        </div><!-- /input-group -->
      </div>

      <!-- Recent Posts -->
      <div class="blog-sidebar">
        <h4 class="sidebar-title"><i class="fa fa-align-left"></i> Recent Posts</h4>
        <hr style="margin-bottom: 5px;">
        <s:iterator value="#session.newList">
          <div class="media">
            <a class="pull-left" href="<s:url action="project_findByPid">
                                     <s:param name="pid"><s:property value="pid"/></s:param>
                                     </s:url>">
              <img class="img-responsive media-object" src="images/blog1.jpg" alt="Media Object"></a>
            <div class="media-body">
              <h4 class="media-heading">
                <a href="<s:url action="project_findByPid">
                          <s:param name="pid"><s:property value="pid"/></s:param>
                       </s:url>"><s:property value="projectName"/></a></h4>
              <s:property value="description"/>
            </div>
          </div>
        </s:iterator>

      </div>

      <div class="blog-sidebar">
        <h4 class="sidebar-title"><i class="fa fa-comments"></i> Recent Comments</h4>
        <hr style="margin-bottom: 5px;">
        <ul class="sidebar-list">
          <li><h5 class="blog-title">Author Name</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
              dolore</p>
          </li>
          <li><h5 class="blog-title">Author Name</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
              dolore</p>
          </li>
          <li><h5 class="blog-title">Author Name</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
              dolore</p>
          </li>
        </ul>
      </div>

    </aside>
  </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Portfolio -->
<script src="${pageContext.request.contextPath}/js/jquery.quicksand.js"></script>


</body>
</html>