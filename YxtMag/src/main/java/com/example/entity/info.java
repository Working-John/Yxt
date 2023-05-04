package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@TableName("stu_info")
public class info extends Model<info> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 姓名 
      */
    private String stuName;

    /**
      * 学号 
      */
    private String stuCode;

    /**
      * 班级 
      */
    private String stuClass;

    /**
      * 性别 
      */
    private String stuSex;

    /**
      * 手机号 
      */
    private String stuPhone;

    /**
      * 注册审核 
      */
    private String stuStatus;

    /**
      * 身份 
      */
    private String garde;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
         this.id = id;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
         this.stuName = stuName;
    }

    public String getStuCode() {
        return stuCode;
    }

    public void setStuCode(String stuCode) {
         this.stuCode = stuCode;
    }

    public String getStuClass() {
        return stuClass;
    }

    public void setStuClass(String stuClass) {
         this.stuClass = stuClass;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
         this.stuSex = stuSex;
    }

    public String getStuPhone() {
        return stuPhone;
    }

    public void setStuPhone(String stuPhone) {
         this.stuPhone = stuPhone;
    }

    public String getStuStatus() {
        return stuStatus;
    }

    public void setStuStatus(String stuStatus) {
         this.stuStatus = stuStatus;
    }

    public String getGarde() {
        return garde;
    }

    public void setGarde(String garde) {
         this.garde = garde;
    }

}