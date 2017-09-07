package edu.nyu.cf.user;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by guomengqi on 5/3/17.
 */
public class UserDao extends HibernateDaoSupport{
    public void save(User user) {
        this.getHibernateTemplate().save(user);
    }

    public void update(User user) {
        this.getHibernateTemplate().update(user);
    }

    public User login(User user) {
        List list = this.getHibernateTemplate().find("from User where username = ? and password = ?",
                user.getUsername(), user.getPassword());
        return list.isEmpty() ? null : (User)list.get(0);
    }

    public User findByUserName(String username) {
        List list = this.getHibernateTemplate().find("from User where username = ?", username);
            return list.isEmpty() ? null : (User)list.get(0);
    }

    public User findByUid(Integer uid) {
        List list = this.getHibernateTemplate().find("from User where uid = ?", uid);
        return list.isEmpty() ? null : (User)list.get(0);
    }
}
