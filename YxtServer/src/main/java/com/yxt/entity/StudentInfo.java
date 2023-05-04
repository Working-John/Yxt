package com.yxt.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/9
 */
@Data
@TableName("stu_info")
public class StudentInfo {
    @TableId
    private Integer id;
    private String stuName;
    private String stuCode;
    //private String stuDepart;
    private String stuClass;
    private String stuSex;
    private String stuPhone;
    //private String stuStatus;
    private String garde;

}
