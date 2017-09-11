package edu.nyu.cf.index;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import edu.nyu.cf.comment.Comment;
import edu.nyu.cf.comment.CommentService;
import edu.nyu.cf.project.Project;
import edu.nyu.cf.project.ProjectService;
import edu.nyu.cf.user.User;
import org.apache.struts2.ServletActionContext;

import java.util.List;

/**
 * Created by guomengqi on 5/3/17.
 */
public class IndexAction extends ActionSupport {

    private ProjectService projectService;
    private CommentService commentService;

    private List<Comment> commentOfFollowList;
    private List<Project> projectList;

    @Override
    public String execute() throws Exception {
        List<Project> newList = projectService.findNew();
        ActionContext.getContext().getSession().put("newList", newList);
        User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        if (existUser != null) {
            commentOfFollowList = commentService.findFollowCommentByUid(existUser.getUid());
            projectList = projectService.findByUid(existUser.getUid());
        }
        return "indexSuccess";
    }

    public List<Comment> getCommentOfFollowList() {
        return commentOfFollowList;
    }

    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

}
