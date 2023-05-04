package com.example.service;

import com.example.entity.info;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.infoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class infoService extends ServiceImpl<infoMapper, info> {

    @Resource
    private infoMapper infoMapper;

}