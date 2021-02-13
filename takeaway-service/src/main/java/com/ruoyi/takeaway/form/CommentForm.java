package com.ruoyi.takeaway.form;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 评论查询条件对象
 *
 * @Author Huhuitao
 * @Date 2021/1/29 17:11
 */
@Data
@ToString
@NoArgsConstructor
public class CommentForm {
    private String foodName;

    private String nickName;

    private Integer status;
}
