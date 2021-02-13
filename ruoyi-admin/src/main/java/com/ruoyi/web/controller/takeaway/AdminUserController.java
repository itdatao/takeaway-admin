package com.ruoyi.web.controller.takeaway;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.takeaway.domain.User;
import com.ruoyi.takeaway.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户Controller
 *
 * @author hht
 * @date 2021-01-15
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/takeaway/user")
@Api("用户信息管理")
public class AdminUserController extends BaseController {

    private final IUserService iUserService;

    /**
     * 查询用户列表
     */
    @PreAuthorize("@ss.hasPermi('takeaway:user:list')")
    @GetMapping("/list")
    @ApiOperation("查询用户列表")
    public TableDataInfo list(User user) {
        startPage();
        List<User> list = iUserService.queryList(user);
        return getDataTable(list);
    }

    /**
     * 导出用户列表
     */
    @PreAuthorize("@ss.hasPermi('takeaway:user:export')")
    @Log(title = "用户", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    @ApiOperation("导出用户列表")
    public AjaxResult export(User user) {
        List<User> list = iUserService.queryList(user);
        ExcelUtil<User> util = new ExcelUtil<User>(User.class);
        return util.exportExcel(list, "user");
    }

    /**
     * 获取用户详细信息
     */
    @PreAuthorize("@ss.hasPermi('takeaway:user:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取用户详细信息")
    public AjaxResult getInfo(@PathVariable("id") String id) {
        return AjaxResult.success(iUserService.getById(id));
    }

    /**
     * 管理员新增用户
     */
    @PreAuthorize("@ss.hasPermi('takeaway:user:add')")
    @Log(title = "用户", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("管理员新增用户")
    public AjaxResult add(@RequestBody User user) {
        if (UserConstants.NOT_UNIQUE.equals(iUserService.checkUserNameUnique(user.getNickname()))) {
            return AjaxResult.error("新增用户'" + user.getNickname() + "'失败，用户昵称已存在");
        } else if (StringUtils.isNotEmpty(user.getPhone())
                && UserConstants.NOT_UNIQUE.equals(iUserService.checkPhoneUnique(user))) {
            return AjaxResult.error("新增用户'" + user.getNickname() + "'失败，手机号码已存在");
        }
        return toAjax(iUserService.save(user) ? 1 : 0);
    }

    /**
     * 修改用户
     */
    @PreAuthorize("@ss.hasPermi('takeaway:user:edit')")
    @Log(title = "用户", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("管理员修改用户")
    public AjaxResult edit(@RequestBody User user) {

        if (StringUtils.isNotEmpty(user.getPhone())
                && UserConstants.NOT_UNIQUE.equals(iUserService.checkPhoneUnique(user))) {
            return AjaxResult.error("修改用户'" + user.getNickname() + "'失败，手机号码已存在");
        }
        return toAjax(iUserService.updateById(user) ? 1 : 0);
    }

    /**
     * 删除用户
     */
    @PreAuthorize("@ss.hasPermi('takeaway:user:remove')")
    @Log(title = "用户", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation("删除用户")
    public AjaxResult remove(@PathVariable String[] ids) {
        return toAjax(iUserService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }

    /**
     * 重置密码
     */
    @PreAuthorize("@ss.hasPermi('takeaway:user:resetPwd')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    @ApiOperation("重置密码")
    public AjaxResult resetPwd(@RequestBody User user) {
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return toAjax(iUserService.resetPwd(user));
    }


}
