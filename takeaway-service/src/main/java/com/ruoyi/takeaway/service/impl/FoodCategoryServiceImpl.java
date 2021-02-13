package com.ruoyi.takeaway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.takeaway.vo.FoodCategoryNestVO;
import com.ruoyi.takeaway.vo.FoodCategoryVO;
import com.sun.org.apache.bcel.internal.ExceptionConstants;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.apache.commons.lang3.StringUtils;
import com.ruoyi.takeaway.mapper.FoodCategoryMapper;
import com.ruoyi.takeaway.domain.FoodCategory;
import com.ruoyi.takeaway.service.IFoodCategoryService;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 餐品分类Service业务层处理
 *
 * @author hht
 * @date 2021-01-25
 */
@Service
public class FoodCategoryServiceImpl extends ServiceImpl<FoodCategoryMapper, FoodCategory> implements IFoodCategoryService {

    @Autowired
    private FoodCategoryMapper foodCategoryMapper;

    @Override
    public List<FoodCategory> queryList(FoodCategory foodCategory) {
        LambdaQueryWrapper<FoodCategory> lqw = Wrappers.lambdaQuery();
        if (StringUtils.isNotBlank(foodCategory.getTitle())) {
            lqw.like(FoodCategory::getTitle, foodCategory.getTitle());
        }
        return this.list(lqw);
    }

    /**
     * 保存二级分类
     *
     * @param category
     * @return
     */
    @Override
    public boolean saveLevelTwo(FoodCategory category) {
        //确定在本分类下分类名称唯一
        FoodCategory foodCategory = foodCategoryMapper.checkCategoryNameUnique(category.getTitle(), category.getParentId());
        if (foodCategory != null) {
            return false;
        }
        int insert = baseMapper.insert(category);
        return insert > 0;
    }

    /**
     * 查询所有分类封装到FoodCategoryVO
     *
     * @return
     */
    @Override
    public List<FoodCategoryVO> listAll() {
        List<FoodCategory> categories = baseMapper.selectList(null);
        List<FoodCategoryVO> foodCategoryVOS = categories.stream().map(c -> {
            return new FoodCategoryVO(c.getId(), c.getTitle());
        }).collect(Collectors.toList());
        return foodCategoryVOS;
    }

    /**
     * 判断是否有子类
     *
     * @param categoryId
     * @return
     */
    @Override
    public boolean hasChildCategory(String categoryId) {
        System.out.println(categoryId);
        if (StringUtils.isBlank(categoryId)) {
            throw new CustomException(Constants.ARGV_ERROR);
        }
        int result = foodCategoryMapper.hasChildByCategoryId(categoryId);
        return result > 0;
    }

    /**
     * 保存一级分类
     *
     * @param category
     * @return
     */
    @Override
    public boolean saveLevelOne(FoodCategory category) {
        //查重
        boolean isUnique = this.checkTitleUnique(category.getTitle());
        int resultCount = 0;
        category.setParentId("0");
        if (isUnique) {
            resultCount = baseMapper.insert(category);
        }
        //如果分类不重复再添加
        return resultCount > 0;
    }

    /**
     * 根据分类名称查询餐品分类是否唯一
     *
     * @param title
     * @return
     */
    private boolean checkTitleUnique(String title) {
        QueryWrapper<FoodCategory> foodCategoryQueryWrapper = new QueryWrapper<>();
        foodCategoryQueryWrapper.eq("title", title);
        FoodCategory foodCategory = baseMapper.selectOne(foodCategoryQueryWrapper);
        return foodCategory == null;
    }


    @Override
    public List<FoodCategoryVO> queryFirst() {
        QueryWrapper<FoodCategory> foodCategoryQueryWrapper = new QueryWrapper<>();
        foodCategoryQueryWrapper.eq("parent_id", 0);
        List<FoodCategory> foodCategories = baseMapper.selectList(foodCategoryQueryWrapper);

        return foodCategories.stream()
                .map(f -> new FoodCategoryVO(f.getId(), f.getTitle()))
                .collect(Collectors.toList());
    }

    /**
     * 查询分类列表
     *
     * @return
     */
    @Override
    public List<FoodCategoryNestVO> nestedList() {
        //最终要的到的数据列表
        ArrayList<FoodCategoryNestVO> subjectNestedVoArrayList = new ArrayList<>();

        //获取一级分类数据记录
        QueryWrapper<FoodCategory> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("parent_id", 0);
        queryWrapper.orderByAsc("sort", "id");
        List<FoodCategory> subjects = baseMapper.selectList(queryWrapper);

        //获取二级分类数据记录
        QueryWrapper<FoodCategory> queryWrapper2 = new QueryWrapper<>();
        queryWrapper2.ne("parent_id", 0);
        queryWrapper2.orderByAsc("sort", "id");
        List<FoodCategory> subSubjects = baseMapper.selectList(queryWrapper2);

        //填充一级分类vo数据
        int count = subjects.size();
        for (int i = 0; i < count; i++) {
            FoodCategory subject = subjects.get(i);

            //创建一级类别vo对象
            FoodCategoryNestVO subjectNestedVo = new FoodCategoryNestVO();
            BeanUtils.copyProperties(subject, subjectNestedVo);
            subjectNestedVoArrayList.add(subjectNestedVo);

            //填充二级分类vo数据
            ArrayList<FoodCategoryVO> subjectVoArrayList = new ArrayList<>();

            for (FoodCategory subSubject : subSubjects) {

                if (subject.getId().equals(subSubject.getParentId())) {

                    //创建二级类别vo对象
                    FoodCategoryVO subjectVo = new FoodCategoryVO();
                    BeanUtils.copyProperties(subSubject, subjectVo);
                    subjectVoArrayList.add(subjectVo);
                }
            }
            subjectNestedVo.setChildren(subjectVoArrayList);
        }
        return subjectNestedVoArrayList;

    }


}
