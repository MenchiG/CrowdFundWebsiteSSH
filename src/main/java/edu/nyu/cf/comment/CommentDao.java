package edu.nyu.cf.comment;


import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by guomengqi on 5/5/17.
 */
public class CommentDao extends HibernateDaoSupport {

    public void postComment(Comment comment) {
        this.getHibernateTemplate().save(comment);
    }

    public List<Comment> findByPid(Integer pid) {
        return (List<Comment>) this.getHibernateTemplate().find("from Comment where project.pid=?", pid);
    }

    public List<Comment> findByUid(Integer uid) {
        return (List<Comment>) this.getHibernateTemplate().find("from Comment where user.uid=?", uid);
    }

    public List<Comment> findFollowCommentByUid(Integer uid) {
        return (List<Comment>) this.getHibernateTemplate()
                .find("select c from Comment as c, Follow as f " +
                        "where c.user.uid =f.followUser.uid and f.user.uid =? order by c.timestamp DESC ", uid);
    }
}
