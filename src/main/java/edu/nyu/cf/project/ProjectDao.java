package edu.nyu.cf.project;

import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by guomengqi on 5/5/17.
 */
public class ProjectDao extends HibernateDaoSupport {


    public List<Project> findNew() {
        List<Project> list = this.getHibernateTemplate().execute(session -> {
            Query query = session.createQuery("from Project where projectStatus = 'funding' order by postTime desc");
            query.setFirstResult(0);
            query.setMaxResults(6);
            return query.list();
        });
        return list;
    }

    public Project findByPid(Integer pid) {
        return this.getHibernateTemplate().get(Project.class, pid);
    }

    public List<Project> findAll() {
        List<Project> list = (List<Project>) this.getHibernateTemplate().find("from Project");
        return list;
    }

    public List<Project> findByPage(int begin, int limit) {

        List<Project> list = this.getHibernateTemplate().execute(session -> {
            Query query = session.createQuery("from Project order by postTime desc");
            query.setFirstResult(begin);
            query.setMaxResults(limit);
            return query.list();
        });
        return list;
    }

    public void save(Project project) {
        this.getHibernateTemplate().save(project);
    }

    public void update(Project project) {
        this.getHibernateTemplate().update(project);
    }

    public List<Project> findByUid(Integer uid) {
        List<Project> list = (List<Project>) this.getHibernateTemplate().find("from Project where user.uid=?", uid);
        return list;
    }

    public List<Project> findByTag(String category) {
        List<Project> list = (List<Project>) this.getHibernateTemplate()
                .find("from Project where category like ?", '%' + category + '%');
        return list;
    }

    public List<Project> findByName(String projectName) {
        List<Project> list = (List<Project>) this.getHibernateTemplate()
                .find("from Project where projectName like ?", '%' + projectName + '%');
        return list;
    }
}
