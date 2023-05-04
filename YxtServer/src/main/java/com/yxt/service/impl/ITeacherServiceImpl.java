package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.TeacherInfo;
import com.yxt.mapper.TeacherMapper;
import com.yxt.service.ITeacherService;
import org.springframework.stereotype.Service;

@Service
public class ITeacherServiceImpl extends ServiceImpl<TeacherMapper, TeacherInfo> implements ITeacherService {
}
