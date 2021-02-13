package com.ruoyi.takeaway.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.takeaway.domain.StaticFile;
import org.apache.ibatis.annotations.Param;

/**
 * @Author Huhuitao
 * @Date 2021/1/27 15:31
 */

public interface FileMapper extends BaseMapper<StaticFile> {

    int checkFileUnique(@Param("fileName") String fileName);
}
