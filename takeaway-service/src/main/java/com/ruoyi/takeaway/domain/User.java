package com.ruoyi.takeaway.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import com.ruoyi.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;
import java.util.HashMap;
import java.math.BigDecimal;

/**
 * 用户对象 t_user
 *
 * @author ruoyi
 * @date 2021-01-13
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("t_user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * $column.columnComment
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * openid
     */
    @Excel(name = "openid")
    private String openid;

    /**
     * 昵称
     */
    @Excel(name = "昵称")
    private String nickname;

    /**
     * 性别
     */
    @Excel(name = "性别")
    private Integer sex;

    /**
     * 用户头像
     */
    @Excel(name = "用户头像")
    private String avatar;

    /**
     * 所在城市
     */
    @Excel(name = "所在城市")
    private String city;

    /**
     * 用户状态
     */
    @Excel(name = "用户状态")
    private Integer isDisable;

    /**
     * 最后一次登录时间
     */
    @Excel(name = "最后一次登录时间", width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date lastLoginTime;

    /**
     * 逻辑删除
     */
    @Excel(name = "逻辑删除")
    @TableLogic
    private Integer isDeleted;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    /**
     * 登录密码
     */
    @Excel(name = "登录密码")
    private String password;

    /**
     * 手机号
     */
    @Excel(name = "手机号")
    private String phone;

    @TableField(exist = false)
    private Map<String, Object> params = new HashMap<>();
}