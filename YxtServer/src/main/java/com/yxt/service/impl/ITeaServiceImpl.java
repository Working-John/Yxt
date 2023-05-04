package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.TeaStu;
import com.yxt.mapper.TeaMapper;
import com.yxt.service.ITeaService;
import org.springframework.stereotype.Service;

/**
 * @author :liuzhengfeng
 * @date : 2023/3/24
 */
@Service
public class ITeaServiceImpl extends ServiceImpl<TeaMapper, TeaStu> implements ITeaService {
}
