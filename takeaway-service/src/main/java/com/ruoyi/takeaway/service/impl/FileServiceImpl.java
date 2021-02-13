package com.ruoyi.takeaway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.exception.BaseException;
import com.ruoyi.common.exception.file.FileException;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.takeaway.domain.StaticFile;
import com.ruoyi.takeaway.mapper.FileMapper;
import com.ruoyi.takeaway.service.FileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

/**
 * @Author Huhuitao
 * @Date 2021/1/27 15:29
 */
@Service
@Slf4j
public class FileServiceImpl extends ServiceImpl<FileMapper, StaticFile> implements FileService {

    @Autowired
    private FileMapper fileMapper;

    @Override
    public boolean removeByFileName(String fileName) {
        //先查File对象
        QueryWrapper<StaticFile> fileQueryWrapper = new QueryWrapper<>();
        fileQueryWrapper.eq("name", fileName);
        StaticFile staticFile = fileMapper.selectOne(fileQueryWrapper);

        boolean isDelete = false;
        if (staticFile != null) {
            String[] split = staticFile.getUrl().split("/upload/");
            fileName = split[1];
            String filePath = RuoYiConfig.getUploadPath() + "/" + fileName;
            isDelete = FileUtils.deleteFile(filePath);
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("name", staticFile.getName());
        return baseMapper.deleteByMap(map) > 0 && isDelete;
    }

    @Override
    public void saveFile(StaticFile staticFile) {
        if (staticFile == null) {
            throw new BaseException("文件对象错误");
        }
        boolean isUnique = this.checkFileUnique(staticFile.getName());
        //如果文件名存在
        if (!isUnique) {
            throw new BaseException("该文件已存在");
        }
        baseMapper.insert(staticFile);

    }

    /**
     * 下载文件
     *
     * @param fileName
     * @param res
     */
    @Override
    public void downloadFile(String fileName, HttpServletResponse res) {
        if (fileName == null) {
            throw new FileException("文件名不能为空", null);
        }
        //检查该文件格式是否合法
        boolean isAllowDownload = FileUtils.checkAllowDownload(fileName);
        if (!isAllowDownload) {
            throw new BaseException("文件格式不支持");
        }
        //检查该文件是否存在
        QueryWrapper<StaticFile> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", fileName);
        StaticFile file = fileMapper.selectOne(queryWrapper);
        if (file == null) {
            throw new BaseException("文件不存在！");
        }
        try {
            String[] split = file.getUrl().split("/upload/");
            fileName = split[1];
            String filePath = RuoYiConfig.getUploadPath() + "/" + fileName;
            File downloadFile = new File(filePath);
            //创建输入对象
            FileInputStream fileInputStream = new FileInputStream(downloadFile);
            //设置返回报头格式
            res.setContentType("application/octet-stream");
            res.addHeader("Content-disposition", "attachment;fileName=" + URLEncoder.encode(file.getName(), "UTF-8"));
            // 创建输出对象
            OutputStream os = res.getOutputStream();
            // 常规操作
            byte[] buf = new byte[1024];
            int len = 0;
            while ((len = fileInputStream.read(buf)) != -1) {
                os.write(buf, 0, len);
            }
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("文件下载失败，{}", e.getMessage());
        }

       /* String[] split = file.getUrl().split("/upload/");
        fileName = split[1];
        //下载文件
        try{
            //设置响应头
            res.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            String filePath = RuoYiConfig.getUploadPath() +"/"+ fileName;
            FileUtils.setAttachmentResponseHeader(res, fileName);
            FileUtils.writeBytes(filePath, res.getOutputStream());
        }catch (Exception e){
            e.printStackTrace();
            log.error("文件下载失败，{}", e.getMessage());
        }*/

    }

    @Override
    public List<StaticFile> queryList() {
        QueryWrapper<StaticFile> fileQueryWrapper = new QueryWrapper<>();
        fileQueryWrapper.orderByDesc("create_time");
        return baseMapper.selectList(fileQueryWrapper);
    }

    /**
     * 检查文件是否唯一
     *
     * @param fileName
     * @return
     */
    @Override
    public boolean checkFileUnique(String fileName) {
        return fileMapper.checkFileUnique(fileName) == 0;
    }
}
