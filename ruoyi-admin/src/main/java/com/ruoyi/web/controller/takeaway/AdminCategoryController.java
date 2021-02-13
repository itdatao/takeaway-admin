package com.ruoyi.web.controller.takeaway;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.takeaway.vo.FoodCategoryNestVO;
import com.ruoyi.takeaway.vo.FoodCategoryVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
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
import com.ruoyi.takeaway.domain.FoodCategory;
import com.ruoyi.takeaway.service.IFoodCategoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 餐品分类Controller
 *
 * @author hht
 * @date 2021-01-25
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/takeaway/category")
@Api("餐品分类信息管理")
public class AdminCategoryController extends BaseController {
    @Autowired
    private final IFoodCategoryService iFoodCategoryService;

    /**
     * 查询餐品分类列表
     */
    @PreAuthorize("@ss.hasPermi('takeaway:category:list')")
    @GetMapping("/list")
    public TableDataInfo listPage(FoodCategory foodCategory) {
        startPage();
        List<FoodCategory> list = iFoodCategoryService.queryList(foodCategory);
        return getDataTable(list);
    }


    @ApiOperation("分类显示")
    @GetMapping("/tree")
    public AjaxResult treeSet() {
        List<FoodCategoryNestVO> foodCategories = iFoodCategoryService.nestedList();
        return AjaxResult.success(foodCategories);
    }

    @ApiOperation("一级分类")
    @GetMapping("/first")
    public AjaxResult FirstCategory() {
        List<FoodCategoryVO> foodCategoryVOS = iFoodCategoryService.queryFirst();
        return AjaxResult.success(foodCategoryVOS);
    }

    @ApiOperation(value = "新增一级分类")
    @PostMapping("saveLevelOne")
    public AjaxResult saveLevelOne(
            @ApiParam(name = "category", value = "餐品分类对象", required = true)
            @RequestBody FoodCategory category) {

        boolean result = iFoodCategoryService.saveLevelOne(category);
        if (result) {
            return AjaxResult.success();
        } else {
            return AjaxResult.error();
        }
    }

    @ApiOperation(value = "新增二级分类")
    @PostMapping("saveLevelTwo")
    public AjaxResult saveLevelTwo(
            @ApiParam(name = "category", value = "餐品分类对象", required = true)
            @RequestBody FoodCategory category) {

        boolean result = iFoodCategoryService.saveLevelTwo(category);
        if (result) {
            return AjaxResult.success();
        } else {
            return AjaxResult.error("餐品分类名称不合法！");
        }
    }

    @ApiOperation(value = "检查是否有子分类")
    @GetMapping(value = "/hasChild/{id}")
    public AjaxResult hasChild(@PathVariable("id") String id) {
        boolean hasChildCategory = iFoodCategoryService.hasChildCategory(id);
        return AjaxResult.success(hasChildCategory);
    }

    /**
     * 获取餐品分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('takeaway:category:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id) {
        return AjaxResult.success(iFoodCategoryService.getById(id));
    }

    /**
     * 新增餐品分类
     */
    @PreAuthorize("@ss.hasPermi('takeaway:category:add')")
    @Log(title = "餐品分类", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增餐品分类")
    public AjaxResult add(@RequestBody FoodCategory foodCategory) {
        return toAjax(iFoodCategoryService.save(foodCategory) ? 1 : 0);
    }

    /**
     * 修改餐品分类
     */
    @PreAuthorize("@ss.hasPermi('takeaway:category:edit')")
    @Log(title = "餐品分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FoodCategory foodCategory) {
        return toAjax(iFoodCategoryService.updateById(foodCategory) ? 1 : 0);
    }

    /**
     * 删除餐品分类
     */
    @PreAuthorize("@ss.hasPermi('takeaway:category:remove')")
    @Log(title = "餐品分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation("删除分类")
    public AjaxResult remove(@PathVariable String[] ids) {
        return toAjax(iFoodCategoryService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
