package edu.nyu.cf.follow;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by guomengqi on 5/5/17.
 */
public class FollowDao extends HibernateDaoSupport {
    public void follow(Follow follow) {
        this.getHibernateTemplate().save(follow);
    }

    public void unfollow(Follow follow) {
        this.getHibernateTemplate().delete(follow);
    }

    public List<Follow> findById(Integer uid) {
        List<Follow> list = (List<Follow>) this.getHibernateTemplate().find("from Follow where user.uid = ?", uid);
        return list;
    }

    public Follow findByUidAndFuid(Integer uid, Integer fuid) {
        List<Follow> list = (List<Follow>) this.getHibernateTemplate()
                .find("from Follow where user.uid = ? and followUser.uid = ?", uid, fuid);
        return list.isEmpty() ? null : (Follow) list.get(0);
    }
}
