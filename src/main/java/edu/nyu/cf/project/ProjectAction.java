package edu.nyu.cf.project;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import edu.nyu.cf.comment.Comment;
import edu.nyu.cf.comment.CommentService;
import edu.nyu.cf.sponser.Sponser;
import edu.nyu.cf.sponser.SponserService;
import edu.nyu.cf.user.User;
import edu.nyu.cf.utils.PageBean;
import org.apache.struts2.ServletActionContext;

import java.time.LocalDate;
import java.util.List;

/**
 * Created by guomengqi on 5/5/17.
 */
public class ProjectAction extends ActionSupport implements ModelDriven<Project> {
    private Project project = new Project();

    private ProjectService projectService;
    private SponserService sponserService;
    private CommentService commentService;

    private Integer page;

    private PageBean<Project> pageBean;
    private List<Sponser> sponserList;
    private Double sumSponser;

    private List<Comment> commentList;
    private List<Project> projectList;

    public String findByPage() {
        pageBean = projectService.findByPage(page);
        return "findByPageSuccess";

    }

    public String findByPid() {
        project = projectService.findByPid(project.getPid());
        if (("funding").equals(project.getProjectStatus())) {
            return "checkProject";
        } else {
            return "backToProjectPage";
        }
    }

    public String findByTag() {
        projectList = projectService.findByTag(project.getCategory());
        return "searchResultPage";
    }

    public String findByName() {
        projectList = projectService.findByName(project.getProjectName());
        return "searchResultPage";
    }

    public String showProject() {
        project = projectService.findByPid(project.getPid());
        sponserList = sponserService.findByPid(project.getPid());
        sumSponser = sponserService.sumByPid(project.getPid());
        commentList = commentService.findByPid(project.getPid());
        return "findByPidSuccess";
    }

    public String newProjectPage() {
        if (project.getPid() != null) {
            project = projectService.findByPid(project.getPid());
        }
        return "newProjectPageSuccess";
    }

    @InputConfig(resultName = "newProjectInput")
    public String newProject() {

        if (project.getPid() == null) {
            project.setPostTime(LocalDate.now());
            project.setProjectStatus("funding");
            User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
            project.setUser(existUser);
            projectService.newProject(project);
        } else {
            Project oldProject = projectService.findByPid(project.getPid());
//            project.setPostTime(oldProject.getPostTime());
            project.setProjectStatus(oldProject.getProjectStatus());
//            project.setUser(oldProject.getUser());
            projectService.update(project);
        }
        return "checkProject";

    }

    public String checkProject() {
        project = projectService.findByPid(project.getPid());
        sumSponser = sponserService.sumByPid(project.getPid());
        if (sumSponser >= project.getMaximum()) {
            project.setProjectStatus("success");
            sponserService.chargeSponser(project.getPid());
            projectService.updateProject(project);
        } else if (project.getEndTime().isBefore(LocalDate.now()) && sumSponser < project.getMinimum()) {
            project.setProjectStatus("failed");
            sponserService.refundSponser(project.getPid());
            projectService.updateProject(project);
        }
        return "backToProjectPage";
    }

    @Override
    public Project getModel() {
        return project;
    }

    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }

    public void setSponserService(SponserService sponserService) {
        this.sponserService = sponserService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public List<Project> getProjectList() {
        return projectList;
    }

    public PageBean<Project> getPageBean() {
        return pageBean;
    }

    public List<Sponser> getSponserList() {
        return sponserList;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public Double getSumSponser() {
        return sumSponser;
    }
}
