package edu.nyu.cf.sponser;

import edu.nyu.cf.project.Project;
import edu.nyu.cf.user.User;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

/**
 * Created by guomengqi on 5/6/17.
 */
@Transactional
public class SponserService {
    private SponserDao sponserDao;

    public void setSponserDao(SponserDao sponserDao) {
        this.sponserDao = sponserDao;
    }

    public void sponse(Sponser sponser) {
        sponserDao.save(sponser);
    }

    public List<Sponser> findByPid(Integer pid) {
        return sponserDao.findByPid(pid);
    }

    public Double sumByPid(Integer pid) {
        return sponserDao.sumByPid(pid);
    }

    public void chargeSponser(Integer pid) {
        sponserDao.chargeSponser(pid);
    }

    public void refundSponser(Integer pid) {
        sponserDao.refundSponser(pid);
    }
}
