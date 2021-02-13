package com.ruoyi.takeaway.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.takeaway.domain.Comment;
import com.ruoyi.takeaway.form.CommentForm;
import com.ruoyi.takeaway.vo.CommentVO;

import java.util.List;

/**
 * @Author Huhuitao
 * @Date 2021/1/29 16:14
 */
public interface CommentService extends IService<Comment> {
    int reviewSuccess(String id);

    List<CommentVO> queryList(CommentForm comment);

    List<CommentVO> getGoodComments();

    List<CommentVO> getPoorComments();
}
