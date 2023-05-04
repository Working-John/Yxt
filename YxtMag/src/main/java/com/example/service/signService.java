package com.example.service;

import com.example.entity.sign;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.signMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class signService extends ServiceImpl<signMapper, sign> {

    @Resource
    private signMapper signMapper;

}