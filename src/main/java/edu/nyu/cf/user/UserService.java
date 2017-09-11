package edu.nyu.cf.user;


import org.springframework.transaction.annotation.Transactional;

/**
 * Created by guomengqi on 5/3/17.
 */
@Transactional
public class UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public void register(User user) {
        userDao.save(user);
    }

    public User login(User user) {
        return userDao.login(user);
    }

    public void update(User user) {
        userDao.update(user);
    }

    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    public User findByUid(Integer uid) {
        return userDao.findByUid(uid);
    }

}
