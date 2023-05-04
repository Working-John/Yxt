package com.yxt.service.impl;

import com.yxt.mapper.ImgMapper;
import com.yxt.service.ImgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ImgServiceImpl implements ImgService {
    @Resource
    private ImgMapper imgMapper;

    @Override
    public int addUrl(String url){
        return imgMapper.addUrl(url);
    }

}
