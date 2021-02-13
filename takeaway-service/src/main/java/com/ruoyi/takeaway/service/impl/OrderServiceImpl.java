package com.ruoyi.takeaway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.takeaway.domain.OrderItem;
import com.ruoyi.takeaway.mapper.OrderItemMapper;
import com.ruoyi.takeaway.vo.OrderVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.apache.commons.lang3.StringUtils;
import com.ruoyi.takeaway.mapper.OrderMapper;
import com.ruoyi.takeaway.domain.Order;
import com.ruoyi.takeaway.service.IOrderService;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单Service业务层处理
 *
 * @author hht
 * @date 2021-01-30
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;

    /**
     * 修改订单状态为已发货，配送中
     *
     * @param orderId
     * @return
     */
    @Override
    public int shipOrder(String orderId) {
        return orderMapper.updateOrderStatus(orderId, Constants.ORDER_STATUS_IN_DELIVERY);
    }

    /**
     * 修改订单状态为已审核
     *
     * @param orderId
     * @return
     */
    @Override
    public int checkOrderPass(String orderId) {
        return orderMapper.updateOrderStatus(orderId, Constants.ORDER_STATUS_CHECK_PASS);
    }

    @Override
    @Transactional
    public boolean removeOrders(List<String> orderIds) {
        //先删除订单详情表中对应的订单项
        int orderItemCount = orderItemMapper.deleteByOrderIds(orderIds);
        //再删除订单表中的数据
        int orderCount = orderMapper.deleteBatchIds(orderIds);
        return orderItemCount > 0 && orderCount > 0;
    }

    /*发货*/
    @Override
    public int deliveryOrder(String orderId) {
        return orderMapper.updateOrderStatus(orderId, Constants.ORDER_STATUS_IN_DELIVERY);
    }

    /**
     * 取消订单
     *
     * @param orderId
     * @return
     */
    @Override
    public int cancelOrder(String orderId) {
        // 判断订单是否已支付，如果已支付需要退款
        Order order = orderMapper.selectById(orderId);
        if (order != null && order.getPayStatus() == Constants.PAY_STATUS_PAID) {
            //todo 支付宝退款

        }

        // 修改订单状态
        return orderMapper.updateOrderStatus(orderId, Constants.ORDER_STATUS_CANCELED);
    }

    //查询订单详细信息包括订单详情
    @Override
    public OrderVO queryOrderDetail(String orderId) {
        if (StringUtils.isBlank(orderId)) {
            throw new CustomException("订单id为空");
        }
        OrderVO orderVO = new OrderVO();
        //查询订单信息
        Order order = orderMapper.selectById(orderId);
        //查询订单详情列表
        QueryWrapper<OrderItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("order_id", orderId);
        List<OrderItem> orderItems = orderItemMapper.selectList(queryWrapper);

        //封装数据
        BeanUtils.copyProperties(order, orderVO);
        orderVO.setOrderItems(orderItems);
        return orderVO;
    }


    @Override
    public List<Order> queryList(Order order) {
        LambdaQueryWrapper<Order> lqw = Wrappers.lambdaQuery();

        if (order.getOrderStatus() != null) {
            lqw.eq(Order::getOrderStatus, order.getOrderStatus());
        }
        if (StringUtils.isNotBlank(order.getNickname())) {
            lqw.like(Order::getNickname, order.getNickname());
        }
        if (StringUtils.isNotBlank(order.getPayMethod())) {
            lqw.eq(Order::getPayMethod, order.getPayMethod());
        }
        if (order.getPayStatus() != null) {
            lqw.eq(Order::getPayStatus, order.getPayStatus());
        }
        if (order.getOrderNo() != null) {
            lqw.eq(Order::getOrderNo, order.getOrderNo());
        }
        return this.list(lqw);
    }
}
