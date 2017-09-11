package edu.nyu.cf.sponser;

import org.springframework.transaction.annotation.Transactional;

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
