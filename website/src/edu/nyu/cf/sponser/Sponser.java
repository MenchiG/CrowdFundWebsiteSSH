package edu.nyu.cf.sponser;

import edu.nyu.cf.project.Project;
import edu.nyu.cf.user.User;

/**
 * Created by guomengqi on 5/6/17.
 */
public class Sponser {
    private Integer sid;
    private User user;
    private Project project;
    private Double amount;
    private String state;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}