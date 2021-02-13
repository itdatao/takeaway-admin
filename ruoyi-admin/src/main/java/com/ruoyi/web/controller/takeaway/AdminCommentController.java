package com.ruoyi.web.controller.takeaway;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.takeaway.form.CommentForm;
import com.ruoyi.takeaway.service.CommentService;
import com.ruoyi.takeaway.vo.CommentVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * @Author Huhuitao
 * @Date 2021/1/29 16:02
 */
@Api("评论管理")
@RestController
@RequestMapping("/takeaway/comment")
public class AdminCommentController extends BaseController {
    @Autowired
    private CommentService commentService;

    //评论审核通过
    @PostMapping("/check/{id}")
    @ApiOperation("评论审核通过")
    public AjaxResult passComment(@PathVariable("id") String id) {
        int result = commentService.reviewSuccess(id);
        return toAjax(result);
    }

    //评论审核不通过

    //评论列表
    @GetMapping("/list")
    @ApiOperation("分页显示评论列表")
    public TableDataInfo listComments(CommentForm comment) {
        startPage();
        List<CommentVO> list = commentService.queryList(comment);
        return getDataTable(list);

    }

    //删除评论
    @DeleteMapping("/{ids}")
    @ApiOperation(value = "根据id删除评论")
    public AjaxResult deleteComment(@PathVariable String[] ids) {

        return toAjax(commentService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }

    //查看好评
    @ApiOperation("查看好评")
    @GetMapping("/good")
    public AjaxResult getGoodComments() {
        List<CommentVO> goodComments = commentService.getGoodComments();
        return AjaxResult.success(goodComments);
    }

    //查看差评
    @ApiOperation("查看差评")
    @GetMapping("/poor")
    public AjaxResult getPoorComments() {
        List<CommentVO> goodComments = commentService.getPoorComments();
        return AjaxResult.success(goodComments);
    }
}
