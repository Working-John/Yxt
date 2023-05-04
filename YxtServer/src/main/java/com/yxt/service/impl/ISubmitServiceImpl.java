package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.DakaInfo;
import com.yxt.entity.Submit;
import com.yxt.mapper.DakaMapper;
import com.yxt.mapper.SubmitMapper;
import com.yxt.service.IDakaService;
import com.yxt.service.ISubmitService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author :liuzhengfeng
 * @date : 2022/12/11
 */
@Service
@Transactional
public class ISubmitServiceImpl extends ServiceImpl<SubmitMapper, Submit> implements ISubmitService {
}
