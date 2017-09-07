package edu.nyu.cf.follow;

import edu.nyu.cf.user.User;

/**
 * Created by guomengqi on 5/5/17.
 */
public class Follow {
    private Integer fid;
    private User user;
    private User followUser;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getFollowUser() {
        return followUser;
    }

    public void setFollowUser(User followUser) {
        this.followUser = followUser;
    }
}
