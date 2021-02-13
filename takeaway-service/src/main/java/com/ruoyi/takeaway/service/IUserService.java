package com.ruoyi.takeaway.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.takeaway.domain.User;

import java.util.List;

/**
 * 用户Service接口
 *
 * @author ruoyi
 * @date 2021-01-13
 */
public interface IUserService extends IService<User> {

    /**
     * 查询列表
     */
    List<User> queryList(User tUser);

    String checkUserNameUnique(String nickname);

    String checkPhoneUnique(User user);

    int resetPwd(User user);

    int resetUserPwd(String userName, String password);

}