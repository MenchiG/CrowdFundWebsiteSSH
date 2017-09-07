package edu.nyu.cf.project;

import edu.nyu.cf.utils.PageBean;
import org.springframework.transaction.annotation.Transactional;
import sun.jvm.hotspot.debugger.Page;

import java.util.List;

/**
 * Created by guomengqi on 5/5/17.
 */
@Transactional
public class ProjectService {
    private ProjectDao projectDao;

    public void setProjectDao(ProjectDao projectDao) {
        this.projectDao = projectDao;
    }

    public List<Project> findNew() {
        return projectDao.findNew();
    }

    public List<Project> findAll() {
        return projectDao.findAll();
    }

    public Project findByPid(Integer pid) {
        return projectDao.findByPid(pid);
    }

    public PageBean<Project> findByPage(Integer page) {
        int limit = 5;
        int totalPage = 0;
        PageBean<Project> pageBean = new PageBean<>();
        pageBean.setPage(page);
        pageBean.setLimit(limit);

        Integer totalCount = projectDao.findAll().size();
        pageBean.setTotalCount(totalCount);

        if(totalCount % limit == 0) {
            totalPage = totalCount / limit;
        } else {
            totalPage = totalCount / limit + 1;
        }
        pageBean.setTotalPage(totalPage);

        int begin = (page - 1) * limit;
        List<Project> list = projectDao.findByPage(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }

    public void newProject(Project project) {
        projectDao.save(project);
    }

    public void updateProject(Project project) {
        projectDao.update(project);
    }

    public List<Project> findByUid(Integer uid) {
        return projectDao.findByUid(uid);
    }

    public void update(Project project) {
        projectDao.update(project);
    }

    public List<Project> findByTag(String category) {
        return projectDao.findByTag(category);
    }

    public List<Project> findByName(String projectName) {
        return projectDao.findByName(projectName);
    }
}
