package com.ruoyi.web.controller.takeaway;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.takeaway.vo.OrderVO;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.takeaway.domain.Order;
import com.ruoyi.takeaway.service.IOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单Controller
 *
 * @author hht
 * @date 2021-01-30
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/takeaway/order")
public class AdminOrderController extends BaseController {

    private final IOrderService iOrderService;

    /**
     * 查询订单列表
     */
    @PreAuthorize("@ss.hasPermi('takeaway:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(Order order) {
        startPage();
        List<Order> list = iOrderService.queryList(order);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @PreAuthorize("@ss.hasPermi('takeaway:order:export')")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Order order) {
        List<Order> list = iOrderService.queryList(order);
        ExcelUtil<Order> util = new ExcelUtil<Order>(Order.class);
        return util.exportExcel(list, "order");
    }


    /**
     * 修改订单
     */
    @PreAuthorize("@ss.hasPermi('takeaway:order:edit')")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Order order) {
        return toAjax(iOrderService.updateById(order) ? 1 : 0);
    }

    /**
     * 删除订单
     */
    @PreAuthorize("@ss.hasPermi('takeaway:order:remove')")
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{orderIds}")
    @ApiOperation("删除订单")
    public AjaxResult remove(@PathVariable String[] orderIds) {
        return toAjax(iOrderService.removeOrders(Arrays.asList(orderIds)) ? 1 : 0);
    }

    //审核订单通过，将订单状态改为已审核
    @ApiOperation("审核订单通过")
    @PostMapping("/check/{orderId}")
    public AjaxResult checkPass(@PathVariable String orderId) {
        int result = iOrderService.checkOrderPass(orderId);
        return toAjax(result);
    }

    //创建订单

    //取消订单
    @ApiOperation("取消订单")
    @PostMapping("/cancel/{orderId}")
    public AjaxResult cancelOrder(@PathVariable String orderId) {
        return toAjax(iOrderService.cancelOrder(orderId));
    }

    //发货
    @ApiOperation("发货")
    @PostMapping("/delivery/{orderId}")
    public AjaxResult delivery(@PathVariable String orderId) {
        int result = iOrderService.deliveryOrder(orderId);
        return toAjax(result);
    }

    //获取订单详情
    @ApiOperation("获取订单详情")
    @GetMapping("/{orderId}")
    public AjaxResult getOrderDetail(@PathVariable String orderId) {
        OrderVO orderVO = iOrderService.queryOrderDetail(orderId);
        return AjaxResult.success(orderVO);
    }
}
