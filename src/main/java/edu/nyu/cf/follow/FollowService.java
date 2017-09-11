package edu.nyu.cf.follow;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by guomengqi on 5/5/17.
 */
@Transactional
public class FollowService {
    private FollowDao followDao;

    public void setFollowDao(FollowDao followDao) {
        this.followDao = followDao;
    }

    public void follow(Follow follow) {
        followDao.follow(follow);
    }

    public void unfollow(Follow follow) {
        followDao.unfollow(follow);
    }

    public List<Follow> findByUid(Integer uid) {
        return followDao.findById(uid);
    }

    public Follow findByUidAndFuid(Integer uid, Integer fuid) {
        return followDao.findByUidAndFuid(uid, fuid);
    }
}
