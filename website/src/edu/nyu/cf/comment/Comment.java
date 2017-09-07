package edu.nyu.cf.comment;

import edu.nyu.cf.project.Project;
import edu.nyu.cf.user.User;

import java.time.LocalDateTime;

/**
 * Created by guomengqi on 5/5/17.
 */


public class Comment {
    private Integer cid;
    private User user;
    private Project project;
    private Double rate;
    private String context;
    private LocalDateTime timestamp;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
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

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }
}
