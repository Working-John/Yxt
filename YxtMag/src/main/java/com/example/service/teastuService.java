package com.example.service;

import com.example.entity.teastu;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.teastuMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class teastuService extends ServiceImpl<teastuMapper, teastu> {

    @Resource
    private teastuMapper teastuMapper;

}