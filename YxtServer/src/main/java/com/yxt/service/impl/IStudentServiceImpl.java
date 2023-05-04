package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.StudentInfo;
import com.yxt.mapper.StudentMapper;
import com.yxt.service.IStudentService;
import org.springframework.stereotype.Service;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/9
 */
@Service
public class IStudentServiceImpl extends ServiceImpl<StudentMapper, StudentInfo> implements IStudentService {
}
