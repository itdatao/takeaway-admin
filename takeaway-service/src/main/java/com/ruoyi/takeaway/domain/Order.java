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
 * 订单对象 t_order
 *
 * @author hht
 * @date 2021-01-30
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("t_order")
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * 订单id
     */
    @TableId(value = "order_id", type = IdType.ASSIGN_ID)
    private String orderId;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 订单状态
     */
    @Excel(name = "订单状态")
    private Integer orderStatus;

    /**
     * 用户昵称
     */
    @Excel(name = "用户昵称")
    private String nickname;

    /**
     * 手机号
     */
    @Excel(name = "手机号")
    private String phone;

    /**
     * 收货地址
     */
    @Excel(name = "收货地址")
    private String address;

    /**
     * 备注
     */
    @Excel(name = "备注")
    private String remark;

    /**
     * 餐品总价
     */
    @Excel(name = "餐品总价")
    private BigDecimal foodsPrice;

    /**
     * 配送费
     */
    @Excel(name = "配送费")
    private BigDecimal freightPrice;

    /**
     * 订单总费用
     */
    @Excel(name = "订单总费用")
    private BigDecimal orderPrice;

    /**
     * 支付id
     */
    @Excel(name = "支付方式")
    private String payMethod;

    /**
     * 交易时间
     */
    @Excel(name = "交易时间", width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date payTime;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    /**
     * 逻辑删除
     */
    @Excel(name = "逻辑删除")
    @TableLogic
    private Integer isDeleted;

    /**
     * 支付状态
     */
    @Excel(name = "支付状态")
    private Integer payStatus;

    /**
     * 商家ID
     */
    @Excel(name = "商家ID")
    private String sellId;

    /**
     * 订单编号
     */
    @Excel(name = "订单编号")
    @TableField(fill = FieldFill.INSERT)
    private String orderNo;

    @TableField(exist = false)
    private Map<String, Object> params = new HashMap<>();
}
