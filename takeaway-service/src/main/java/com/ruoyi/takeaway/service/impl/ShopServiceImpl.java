package com.ruoyi.takeaway.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.takeaway.domain.Shop;
import com.ruoyi.takeaway.mapper.ShopMapper;
import com.ruoyi.takeaway.service.ShopService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @Author Huhuitao
 * @Date 2021/2/2 22:40
 */
@Service
@Slf4j
public class ShopServiceImpl extends ServiceImpl<ShopMapper, Shop> implements ShopService {

    public Shop getShopInfo(String sellId) {
        return baseMapper.selectById(sellId);
    }

}
