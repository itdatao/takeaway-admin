package com.ruoyi.web.controller.takeaway;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.takeaway.domain.Shop;
import com.ruoyi.takeaway.service.ShopService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author Huhuitao
 * @Date 2021/2/2 22:38
 */
@RestController
@RequestMapping("/takeaway/shop")
public class AdminShopController extends BaseController {

    @Autowired
    private ShopService shopService;

    @ApiOperation("根据id查询商家信息")
    @GetMapping("/info/{id}")
    public AjaxResult getShopInfo(@PathVariable String id) {
        Shop shopInfo = shopService.getShopInfo(id);
        return AjaxResult.success(shopInfo);
    }

}
