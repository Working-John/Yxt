package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@TableName("daka")
public class daka extends Model<daka> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
      * 姓名 
      */
    private String name;

    /**
      * 打卡 
      */
    private String consquence;

    /**
      * 时间 
      */
    private String time;

    /**
      * 学号 
      */
    private String number;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
         this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
         this.name = name;
    }

    public String getConsquence() {
        return consquence;
    }

    public void setConsquence(String consquence) {
         this.consquence = consquence;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
         this.time = time;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
         this.number = number;
    }

}