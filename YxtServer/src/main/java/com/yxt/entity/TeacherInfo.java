package com.yxt.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Blob;

@Data
@TableName("teacher_report")
public class TeacherInfo {
    private Integer id;
    private String teachername;
    private String course;
    private String remark;
    private String time;
    private String name;
    private String number;


}
