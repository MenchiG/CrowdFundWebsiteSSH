package edu.nyu.cf.sponser;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import javax.management.Query;
import java.util.List;

/**
 * Created by guomengqi on 5/6/17.
 */
public class SponserDao extends HibernateDaoSupport{

    public void save(Sponser sponser) {
        this.getHibernateTemplate().save(sponser);
    }

    public List<Sponser> findByPid(Integer pid) {
        return (List<Sponser>) this.getHibernateTemplate().find("from Sponser where project.pid=?", pid);

    }

    public Double sumByPid(Integer pid) {
        List list = this.getHibernateTemplate().find("select sum(amount) from Sponser where project.pid=?", pid);
        return list.get(0) == null ? 0 : (Double) list.get(0);
    }

    public void chargeSponser(Integer pid) {
        this.getHibernateTemplate().execute(session -> {
            org.hibernate.query.Query query = session
                    .createQuery("update Sponser set state ='charged' where project.pid=" + pid);
            return query.executeUpdate();
        });
    }

    public void refundSponser(Integer pid) {
        this.getHibernateTemplate().execute(session -> {
            org.hibernate.query.Query query = session
                    .createQuery("update Sponser set state ='refund' where project.pid=" + pid);
            return query.executeUpdate();
        });
    }
}
