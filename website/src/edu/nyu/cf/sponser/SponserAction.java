package edu.nyu.cf.sponser;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import edu.nyu.cf.project.Project;
import edu.nyu.cf.project.ProjectService;
import edu.nyu.cf.user.User;
import org.apache.struts2.ServletActionContext;

/**
 * Created by guomengqi on 5/6/17.
 */
public class SponserAction extends ActionSupport implements ModelDriven<Sponser> {
    private Sponser sponser = new Sponser();

    private SponserService sponserService;
    private ProjectService projectService;
    private Integer pid;

    public String sponseProject() {
        Project project = projectService.findByPid(pid);
        sponser.setProject(project);

        User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        sponser.setUser(existUser);
        sponser.setState("pending");
        sponserService.sponse(sponser);
        return "sponseProjectSuccess";
    }

    @Override
    public Sponser getModel() {
        return sponser;
    }

    public void setSponserService(SponserService sponserService) {
        this.sponserService = sponserService;
    }

    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPid() {
        return pid;
    }
}
