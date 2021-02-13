package com.ruoyi.takeaway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.user.UserException;
import com.ruoyi.common.exception.user.UserPasswordNotMatchException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.takeaway.domain.User;
import com.ruoyi.takeaway.mapper.TUserMapper;
import com.ruoyi.takeaway.service.IUserService;
import com.ruoyi.takeaway.utils.JwtUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.framework.web.service.TokenService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.util.ObjectUtils;


import java.util.List;
import java.util.Map;

/**
 * 用户Service业务层处理
 *
 * @author ruoyi
 * @date 2021-01-13
 */
@Service
public class UserServiceImpl extends ServiceImpl<TUserMapper, User> implements IUserService {

    @Autowired
    private TUserMapper userMapper;


    @Override
    public List<User> queryList(User tUser) {
        LambdaQueryWrapper<User> lqw = Wrappers.lambdaQuery();
        if (StringUtils.isNotBlank(tUser.getOpenid())) {
            lqw.eq(User::getOpenid, tUser.getOpenid());
        }
        if (StringUtils.isNotBlank(tUser.getNickname())) {
            lqw.like(User::getNickname, tUser.getNickname());
        }
        if (tUser.getSex() != null) {
            lqw.eq(User::getSex, tUser.getSex());
        }

        if (StringUtils.isNotBlank(tUser.getCity())) {
            lqw.eq(User::getCity, tUser.getCity());
        }
        if (tUser.getIsDisable() != null) {
            lqw.eq(User::getIsDisable, tUser.getIsDisable());
        }

        if (StringUtils.isNotBlank(tUser.getPhone())) {
            lqw.eq(User::getPhone, tUser.getPhone());
        }
        return this.list(lqw);
    }

    /**
     * 校验用户名是否唯一
     *
     * @param nickname
     * @return
     */
    @Override
    public String checkUserNameUnique(String nickname) {
        int count = userMapper.checkUserNameUnique(nickname);
        if (count > 0) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;

    }


    /**
     * 修改密码
     *
     * @param userName
     * @param password
     * @return
     */
    @Override
    public int resetUserPwd(String userName, String password) {
        password = SecurityUtils.encryptPassword(password);
        return userMapper.resetUserPwd(userName, password);
    }


    /**
     * 修改密码
     *
     * @param user
     * @return
     */
    @Override
    public int resetPwd(User user) {
        return userMapper.updateById(user);
    }

    /**
     * 校验手机号是否唯一
     *
     * @param user
     * @return
     */
    @Override
    public String checkPhoneUnique(User user) {
        String userId = StringUtils.isNull(user.getId()) ? "" : user.getId();
        User info = userMapper.checkPhoneUnique(user.getPhone());
        if (StringUtils.isNotNull(info) && !info.getId().equals(userId)) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}