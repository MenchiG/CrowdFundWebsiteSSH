package edu.nyu.cf.user;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import edu.nyu.cf.follow.Follow;
import edu.nyu.cf.follow.FollowService;
import edu.nyu.cf.project.Project;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by guomengqi on 5/3/17.
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {
    private User user = new User();

    private UserService userService;
    private FollowService followService;

    private List<Follow> followList;
    private Follow isFollowing;

    public String registerPage() {
        if(user.getUid() != null) {
            user = userService.findByUid(user.getUid());
        }
        return "registerPage";
    }

    @InputConfig(resultName = "loginPage")
    public String register(){
        if(user.getUid() == null) {
            userService.register(user);
            return "loginPage";
        } else {
            userService.update(user);
            ServletActionContext.getRequest().getSession().setAttribute("existUser", user);
            return "backToUserPage";
        }

    }

    public String checkUserName() throws IOException {
        User existUser = userService.findByUserName(user.getUsername());
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        if (existUser == null) {
            response.getWriter().print("<font color = 'green'>valid username</font>");
        } else {
            response.getWriter().print("<font color = 'red'>Username has been used</font>");
        }
        return NONE;
    }
    public String loginPage() {
        return "loginPage";
    }

    @InputConfig(resultName = "loginPage")
    public String login() {
        User existUser = userService.login(user);
        if(existUser == null) {
            this.addActionError("Wrong Password");
            return "loginPage";
        } else {
            ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
            return "backToIndex";
        }

    }
    public String logout() {
        ServletActionContext.getRequest().getSession().invalidate();
        return "backToIndex";
    }

    public String update() {
        userService.update(user);
        return "backToUserPage";
    }

    public String userPage(){
        user = userService.findByUid(user.getUid());

        User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        followList = followService.findByUid(user.getUid());
        isFollowing = (existUser != null) ? followService.findByUidAndFuid(existUser.getUid(),user.getUid()) : null;

        return "userPage";
    }

    public String followUser(){
        Follow follow = new Follow();
        User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        follow.setUser(existUser);
        follow.setFollowUser(userService.findByUid(user.getUid()));
        followService.follow(follow);
       return "backToUserPage";
    }

    public String unfollowUser(){
        User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        isFollowing = followService.findByUidAndFuid(existUser.getUid(),user.getUid());
        followService.unfollow(isFollowing);
        return "backToUserPage";
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setFollowService(FollowService followService) {
        this.followService = followService;
    }

    @Override
    public User getModel() {
        return user;
    }

    public List<Follow> getFollowList() {
        return followList;
    }

    public Follow getIsFollowing() {
        return isFollowing;
    }
}
