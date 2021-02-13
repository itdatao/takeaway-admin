package com.ruoyi.takeaway.service;

import com.ruoyi.takeaway.domain.FoodCategory;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.takeaway.vo.FoodCategoryNestVO;
import com.ruoyi.takeaway.vo.FoodCategoryVO;

import java.util.List;

/**
 * 餐品分类Service接口
 *
 * @author hht
 * @date 2021-01-25
 */
public interface IFoodCategoryService extends IService<FoodCategory> {

    /**
     * 查询列表
     */
    List<FoodCategory> queryList(FoodCategory foodCategory);

    /**
     * 查询分类列表
     *
     * @return
     */
    List<FoodCategoryNestVO> nestedList();

    List<FoodCategoryVO> queryFirst();

    boolean saveLevelOne(FoodCategory category);

    boolean saveLevelTwo(FoodCategory category);

    boolean hasChildCategory(String categoryId);

    List<FoodCategoryVO> listAll();
}
