package edu.nyu.cf.comment;

import edu.nyu.cf.follow.Follow;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by guomengqi on 5/5/17.
 */
@Transactional
public class CommentService {
    private CommentDao commentDao;

    public void setCommentDao(CommentDao commentDao) {
        this.commentDao = commentDao;
    }

    public void postComment(Comment comment) {
        commentDao.postComment(comment);
    }

    public List<Comment> findByPid(Integer pid) {
        return commentDao.findByPid(pid);
    }

    public List<Comment> findByUid(Integer uid) {
        return commentDao.findByUid(uid);
    }

    public List<Comment> findFollowCommentByUid(Integer uid) {
        return commentDao.findFollowCommentByUid(uid);
    }
}
