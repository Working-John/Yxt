package com.yxt.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/9
 */
@Data
@TableName("week_report")
public class WeekReportInfo {
    private Integer wid;
    private String userName;
    private String phone;
    private String content;
    private String  img;
    private long lastLoginTime;
    private String remarks;
    private String departName;
}
