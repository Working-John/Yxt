package com.yxt.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author :liuzhengfeng
 * @date : 2022/12/11
 */
@Data
@TableName("daka")
public class DakaInfo {
    private Integer id;
    private String name;
    private String consquence;
    private String time;
    private String number;
    //开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false)
    private String date1;
    //结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false)
    private String date2;

    @TableField(exist = false)
    private String stuName;


}
