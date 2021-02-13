package com.ruoyi.takeaway.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.takeaway.domain.OrderItem;
import com.ruoyi.takeaway.mapper.OrderItemMapper;
import com.ruoyi.takeaway.service.OrderItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @Author Huhuitao
 * @Date 2021/1/30 21:52
 */
@Service
@Slf4j
public class OrderItemServiceImpl extends ServiceImpl<OrderItemMapper, OrderItem> implements OrderItemService {
}
