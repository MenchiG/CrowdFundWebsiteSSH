<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/header.jsp" />
<html>
<body data-spy="scroll">




<!-- Page Content -->
<section class="container blog">
  <div class="row">
    <!-- Blog Column -->
    <div class="col-md-8">
      <h1 class="page-header sidebar-title">
        Projects
      </h1>
      <!-- Project Post -->
      <s:iterator var="p" value="pageBean.list">
        <div class="row blogu">
        <div class="col-sm-4 col-md-4 ">
          <div class="blog-thumb">
            <a href="<s:url action="project_findByPid">
                           <s:param name="pid"><s:property value="#p.pid"/></s:param>
                       </s:url>">
              <img class="img-responsive" src="images/blog-photo1.jpg" alt="photo">
            </a>
          </div>
        </div>
        <div class="col-sm-8 col-md-8">
          <h2 class="blog-title">
              <a href="<s:url action="project_findByPid">
                           <s:param name="pid"><s:property value="#p.pid"/></s:param>
                       </s:url>"><s:property value="#p.projectName"/></a>
          </h2>
          <p><i class="fa fa-calendar-o"></i>PostTime:<s:property value="#p.postTime"/>
            <span class="comments-padding"></span>
            <i class="fa fa-comment"></i>0 comments<br>
            <i class="fa fa-calendar-o"></i>EndTime:<s:property value="#p.endTime"/><br>
            <i class="fa fa-play-circle"></i>Status:<s:property value="#p.projectStatus"/><br></p>
          <p><s:property value="#p.description"/></p>
        </div>
      </div><hr>
      </s:iterator>

      <div class="text-center">
        <ul class="pagination">
          <s:iterator var="i" begin="1" end="pageBean.totalPage" step="1">
            <s:if test="pageBean.page == #i">
              <li class="active">
            </s:if>
            <s:else>
              <li>
            </s:else>
              <a href="<s:url action="project_findByPage">
                       <s:param name="page"><s:property value="#i"/></s:param>
                       </s:url>"></a></li>
          </s:iterator>
        </ul>
      </div>


    </div>
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
          <li><h5 class="blog-title">Author Name</h5><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
          </li>
          <li><h5 class="blog-title">Author Name</h5><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
          </li>
          <li><h5 class="blog-title">Author Name</h5><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
          </li>
        </ul>
      </div>

    </aside>
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