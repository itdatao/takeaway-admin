package com.ruoyi.takeaway.service;

import com.ruoyi.takeaway.domain.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.takeaway.vo.OrderVO;

import java.util.List;

/**
 * 订单Service接口
 *
 * @author hht
 * @date 2021-01-30
 */
public interface IOrderService extends IService<Order> {

    /**
     * 查询列表
     */
    List<Order> queryList(Order order);

    /*将订单状态改为已审核*/
    int checkOrderPass(String orderId);

    /*将订单状态改为已发货*/
    int shipOrder(String orderId);

    /*取消订单*/
    int cancelOrder(String orderId);

    int deliveryOrder(String orderId);

    boolean removeOrders(List<String> asList);

    OrderVO queryOrderDetail(String orderId);
}
