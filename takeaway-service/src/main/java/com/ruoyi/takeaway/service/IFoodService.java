package com.ruoyi.takeaway.service;

import com.ruoyi.takeaway.domain.Food;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 餐品Service接口
 *
 * @author hht
 * @date 2021-01-27
 */
public interface IFoodService extends IService<Food> {

    /**
     * 查询列表
     */
    List<Food> queryList(Food food);

    boolean saveFood(Food food);

    boolean updateFood(Food food);

    List<Food> getFoodListByCategory(String categoryId);

    List<Food> getFoodAll();
}
