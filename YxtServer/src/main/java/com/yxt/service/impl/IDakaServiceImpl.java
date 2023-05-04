package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.DakaInfo;
import com.yxt.mapper.DakaMapper;
import com.yxt.service.IDakaService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author :liuzhengfeng
 * @date : 2022/12/11
 */
@Service
@Transactional
public class IDakaServiceImpl extends ServiceImpl<DakaMapper,DakaInfo> implements IDakaService {
}
