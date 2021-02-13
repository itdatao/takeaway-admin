package com.ruoyi.web.controller.takeaway;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.exception.file.FileException;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.framework.config.ServerConfig;
import com.ruoyi.takeaway.domain.Food;
import com.ruoyi.takeaway.domain.StaticFile;
import com.ruoyi.takeaway.service.FileService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @Author Huhuitao
 * @Date 2021/1/27 15:21
 */
@Api(value = "文件管理")
@RequestMapping("/takeaway/file")
@RestController
@CrossOrigin
public class AdminFileController extends BaseController {
    @Autowired
    private FileService fileService;
    @Autowired
    private ServerConfig serverConfig;

    //查询文件列表
    @ApiOperation("查询文件列表")
    @GetMapping("/list")
    public TableDataInfo list() {
        startPage();
        List<StaticFile> list = fileService.queryList();
        return getDataTable(list);
    }
    //上传文件

    @PostMapping("/upload")
    public AjaxResult fileUpload(MultipartFile file) {
        try {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            // 向数据库中添加上传文件信息,重新设置文件名和文件保存路径
            filePath = ServerConfig.getUrl() + fileName;
            String[] fileNames = fileName.split("/");
            fileName = fileNames[fileNames.length - 1];

            StaticFile staticFile = new StaticFile();
            staticFile.setUrl(filePath);
            staticFile.setName(fileName);
            fileService.saveFile(staticFile);

            String url = serverConfig.getUrl() + fileName;
            AjaxResult ajax = AjaxResult.success();
            ajax.put("fileName", fileName);
            ajax.put("url", url);
            return ajax;
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }

    }

    //下载文件
    @ApiOperation("下载文件")
    @GetMapping(value = "/download")
    public void downloadFile(@RequestParam("fileName") String fileName, HttpServletResponse res) {
        try {
            fileService.downloadFile(fileName, res);
            System.out.println("下载成功");
        } catch (Exception e) {
            e.getMessage();
        }
    }

    @ApiOperation("删除文件")
    @DeleteMapping("/{fileName}")
    public AjaxResult delete(@PathVariable("fileName") String fileName) {

        boolean isDelete = fileService.removeByFileName(fileName);
        return isDelete ? AjaxResult.success() : AjaxResult.error();
    }


}
