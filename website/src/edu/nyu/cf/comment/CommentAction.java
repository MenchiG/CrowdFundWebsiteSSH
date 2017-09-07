package edu.nyu.cf.comment;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import edu.nyu.cf.project.Project;
import edu.nyu.cf.project.ProjectService;
import edu.nyu.cf.user.User;
import org.apache.struts2.ServletActionContext;

import java.time.LocalDateTime;

/**
 * Created by guomengqi on 5/7/17.
 */
public class CommentAction extends ActionSupport implements ModelDriven<Comment> {
    private Comment comment = new Comment();
    private CommentService commentService;
    private ProjectService projectService;
    private Integer pid;

    public String postComment(){
        Project project = projectService.findByPid(pid);
        User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        comment.setProject(project);
        comment.setUser(existUser);
        comment.setTimestamp(LocalDateTime.now());
        comment.setRate(5.0);
        commentService.postComment(comment);
        return "postCommentSuccess";
    }

    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPid() {
        return pid;
    }

    @Override
    public Comment getModel() {
        return comment;
    }
}
