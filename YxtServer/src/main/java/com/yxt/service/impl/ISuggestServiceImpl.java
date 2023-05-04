package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.SuggestInfo;
import com.yxt.mapper.SuggestMapper;
import com.yxt.service.ISuggestService;
import org.springframework.stereotype.Service;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/21
 */
@Service
public class ISuggestServiceImpl extends ServiceImpl<SuggestMapper, SuggestInfo> implements ISuggestService {
}
