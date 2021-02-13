package com.ruoyi.takeaway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.takeaway.domain.StaticFile;
import com.ruoyi.takeaway.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.apache.commons.lang3.StringUtils;
import com.ruoyi.takeaway.mapper.FoodMapper;
import com.ruoyi.takeaway.domain.Food;
import com.ruoyi.takeaway.service.IFoodService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 餐品Service业务层处理
 *
 * @author hht
 * @date 2021-01-27
 */
@Service
public class FoodServiceImpl extends ServiceImpl<FoodMapper, Food> implements IFoodService {
    @Autowired
    private FileService fileService;

    @Override
    public List<Food> queryList(Food food) {
        LambdaQueryWrapper<Food> lqw = Wrappers.lambdaQuery();
        if (StringUtils.isNotBlank(food.getName())) {
            lqw.like(Food::getName, food.getName());
        }
        if (StringUtils.isNotBlank(food.getCategoryId())) {
            lqw.eq(Food::getCategoryId, food.getCategoryId());
        }

        if (food.getScore() != null) {
            lqw.eq(Food::getScore, food.getScore());
        }

        if (food.getStatus() != null) {
            lqw.eq(Food::getStatus, food.getStatus());
        }
        return this.list(lqw);
    }

    /**
     * 保存餐品信息并向静态文件库中添加文件信息
     *
     * @param food
     * @return
     */
    @Override
    @Transactional
    public boolean saveFood(Food food) {
        if (food == null) {
            return false;
        }
        int rowCount = baseMapper.insert(food);
        boolean saveFile = true;
        String cover = food.getCover();
        //如果上传图片，才向文件中加入数据
        if (!StringUtils.isBlank(cover)) {
            saveFile = insertCoverToFiles(cover);
        }

        return rowCount > 0 && saveFile;
    }

    @Override
    public List<Food> getFoodAll() {
        return baseMapper.getFoodAllBySale();
    }

    @Override
    public List<Food> getFoodListByCategory(String categoryId) {
        QueryWrapper<Food> foodQueryWrapper = new QueryWrapper<>();
        foodQueryWrapper.eq("category_id", categoryId);
        return baseMapper.selectList(foodQueryWrapper);
    }

    @Override
    @Transactional
    public boolean updateFood(Food food) {
        if (food == null) {
            return false;
        }
        boolean flag = this.checkFoodNameUnique(food.getName());
        if (!flag) {
            throw new CustomException("餐品名称已存在！");
        }
        int rowCount = baseMapper.updateById(food);
        boolean saveFile = true;
        String cover = food.getCover();
        //如果上传图片，才向文件中加入数据
        if (!StringUtils.isBlank(cover)) {
            saveFile = insertCoverToFiles(cover);
        }

        return rowCount > 0 && saveFile;
    }

    private boolean checkFoodNameUnique(String foodName) {
        QueryWrapper<Food> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", foodName);
        Food food = baseMapper.selectOne(queryWrapper);
        return food == null;

    }

    /**
     * 向文件表中插入数据
     *
     * @param coverage
     * @return
     */
    private boolean insertCoverToFiles(String coverage) {
        StaticFile file = new StaticFile();
        String[] split = coverage.split("/");
        String fileName = split[split.length - 1];
        //插入前需要判断文件名称是否已存在，如果已存在不插入
        boolean flag = fileService.checkFileUnique(fileName);
        if (flag) {
            //如果文件名称不存在，才插入
            file.setName(fileName);
            file.setUrl(coverage);
            return fileService.save(file);
        } else {
            return true;
        }

    }
}
