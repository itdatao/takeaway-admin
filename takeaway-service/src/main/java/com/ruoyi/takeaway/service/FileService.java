package com.ruoyi.takeaway.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.takeaway.domain.StaticFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @Author Huhuitao
 * @Date 2021/1/27 15:28
 */
public interface FileService extends IService<StaticFile> {

    //检查文件是否是唯一的
    boolean checkFileUnique(String fileName);

    List<StaticFile> queryList();

    void downloadFile(String fileName, HttpServletResponse res) throws IOException;

    void saveFile(StaticFile staticFile);

    boolean removeByFileName(String fileName);


}
