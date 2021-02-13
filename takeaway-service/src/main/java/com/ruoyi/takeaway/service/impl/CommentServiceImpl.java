package com.ruoyi.takeaway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.takeaway.domain.Comment;
import com.ruoyi.takeaway.form.CommentForm;
import com.ruoyi.takeaway.mapper.CommentMapper;
import com.ruoyi.takeaway.service.CommentService;
import com.ruoyi.takeaway.vo.CommentVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author hht
 * @Date 2021/1/29 16:14
 */
@Service
@Slf4j
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    /**
     * 查看好评列表
     *
     * @return 返回评论视图对象集合
     */
    @Override
    public List<CommentVO> getGoodComments() {
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        queryWrapper.gt("level", 3);
        List<Comment> commentList = baseMapper.selectList(queryWrapper);
        //将comment对象转换成视图对象
        return commentList.stream().map(c -> new CommentVO(c.getId(), c.getNickname(), c.getFoodName(), c.getLevel(), c.getContent(), c.getStatus(), c.getCreateTime())).collect(Collectors.toList());
    }

    /**
     * 查看差评列表
     *
     * @return 返回评论视图对象集合
     */
    @Override
    public List<CommentVO> getPoorComments() {
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        queryWrapper.lt("level", 3);
        List<Comment> commentList = baseMapper.selectList(queryWrapper);
        //将comment对象转换成视图对象
        return commentList.stream().map(c -> new CommentVO(c.getId(), c.getNickname(), c.getFoodName(), c.getLevel(), c.getContent(), c.getStatus(), c.getCreateTime())).collect(Collectors.toList());
    }

    /**
     * 根据条件查询评论列表
     *
     * @param comment
     * @return 返回评论视图对象集合
     */
    @Override
    public List<CommentVO> queryList(CommentForm comment) {
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotBlank(comment.getFoodName())) {
            queryWrapper.like("food_name", comment.getFoodName());
        }
        if (StringUtils.isNotBlank(comment.getNickName())) {
            queryWrapper.like("nickname", comment.getNickName());
        }
        if (StringUtils.isNotNull(comment.getStatus())) {
            queryWrapper.eq("status", comment.getStatus());
        }
        List<Comment> commentList = this.list(queryWrapper);
        //将comment对象转换成视图对象
        return commentList.stream().map(c -> new CommentVO(c.getId(), c.getNickname(), c.getFoodName(), c.getLevel(), c.getContent(), c.getStatus(), c.getCreateTime())).collect(Collectors.toList());

    }

    @Override
    public int reviewSuccess(String id) {

        return commentMapper.updateStatusById(id);
    }
}
