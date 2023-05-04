package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.WeekReportInfo;
import com.yxt.mapper.WReportMapper;
import com.yxt.service.IWReportService;
import org.springframework.stereotype.Service;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/9
 */
@Service
public class IWReportServiceImpl extends ServiceImpl<WReportMapper, WeekReportInfo> implements IWReportService {
}
