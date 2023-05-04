package com.example.service;

import com.example.entity.daka;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.dakaMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class dakaService extends ServiceImpl<dakaMapper, daka> {

    @Resource
    private dakaMapper dakaMapper;

}