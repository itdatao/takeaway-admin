package com.ruoyi.web.controller.takeaway;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.takeaway.service.IFoodCategoryService;
import com.ruoyi.takeaway.vo.FoodCategoryVO;
import io.swagger.annotations.Api;
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
import com.ruoyi.takeaway.domain.Food;
import com.ruoyi.takeaway.service.IFoodService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 餐品Controller
 *
 * @author hht
 * @date 2021-01-27
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/takeaway/food")
@Api("餐品信息管理")
public class AdminFoodController extends BaseController {
    @Autowired
    private final IFoodService iFoodService;
    @Autowired
    private final IFoodCategoryService categoryService;

    /**
     * 查询餐品列表
     */
    @PreAuthorize("@ss.hasPermi('takeaway:food:list')")
    @GetMapping("/list")
    @ApiOperation("分页显示餐品列表")
    public TableDataInfo list(Food food) {
        startPage();
        List<Food> list = iFoodService.queryList(food);
        return getDataTable(list);
    }

    /**
     * 导出餐品列表
     */
    @PreAuthorize("@ss.hasPermi('takeaway:food:export')")
    @Log(title = "餐品", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    @ApiOperation("导出餐品信息")
    public AjaxResult export(Food food) {
        List<Food> list = iFoodService.queryList(food);
        ExcelUtil<Food> util = new ExcelUtil<Food>(Food.class);
        return util.exportExcel(list, "food");
    }

    /**
     * 获取餐品详细信息
     */
    @PreAuthorize("@ss.hasPermi('takeaway:food:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("根据id获取餐品详情")
    public AjaxResult getInfo(@PathVariable("id") String id) {
        return AjaxResult.success(iFoodService.getById(id));
    }

    /**
     * 新增餐品
     */
    @PreAuthorize("@ss.hasPermi('takeaway:food:add')")
    @Log(title = "餐品", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation(value = "新增餐品")
    public AjaxResult add(@RequestBody Food food) {
        boolean result = iFoodService.saveFood(food);
        return result ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 修改餐品
     */
    @PreAuthorize("@ss.hasPermi('takeaway:food:edit')")
    @Log(title = "餐品", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation(value = "修改餐品")
    public AjaxResult edit(@RequestBody Food food) {
        boolean flag = iFoodService.updateFood(food);
        return flag ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 删除餐品
     */
    @PreAuthorize("@ss.hasPermi('takeaway:food:remove')")
    @Log(title = "餐品", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation(value = "根据id删除餐品")
    public AjaxResult remove(@PathVariable String[] ids) {
        return toAjax(iFoodService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }

    @ApiOperation("获取所有餐品分类")
    @GetMapping("/categories")
    public AjaxResult getAllFoodCategory() {
        List<FoodCategoryVO> list = categoryService.listAll();
        return AjaxResult.success(list);
    }


}
