package com.yxt.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yxt.entity.ImgInfo;
import org.apache.ibatis.annotations.Param;

public interface ImgMapper extends BaseMapper<ImgInfo> {
    int addUrl( @Param("httpUrl") String aaa);
}
