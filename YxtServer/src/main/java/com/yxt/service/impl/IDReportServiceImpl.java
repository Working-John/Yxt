package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.DayReportInfo;
import com.yxt.mapper.DReportMapper;
import com.yxt.service.IDReportService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/9
 */
@Service
@Transactional
public class IDReportServiceImpl extends ServiceImpl<DReportMapper, DayReportInfo> implements IDReportService {
}
