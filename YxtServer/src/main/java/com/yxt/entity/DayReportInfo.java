package com.yxt.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/9
 */

@Data
@TableName("daily_report")
//@ApiModel(description = "每日一报实体类")
public class DayReportInfo {
    //@ApiModelProperty(value = "id")
    private Integer id;
    //@ApiModelProperty(value = "学生姓名")
    private String name;
    //@ApiModelProperty(value = "学号")
    private String number;
    private String statue;
    private String time;
    private String judge;
    private String passage;
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



