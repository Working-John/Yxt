package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@TableName("daily_report")
public class Report extends Model<Report> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 学号 
      */
    private Long number;

    /**
      * 姓名 
      */
    private String name;

    /**
      * 每日状态 
      */
    private String statue;

    /**
      * 打卡时间 
      */
    private String time;

    /**
      * 自我评定 
      */
    private String judge;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
         this.id = id;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
         this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
         this.name = name;
    }

    public String getStatue() {
        return statue;
    }

    public void setStatue(String statue) {
         this.statue = statue;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
         this.time = time;
    }

    public String getJudge() {
        return judge;
    }

    public void setJudge(String judge) {
         this.judge = judge;
    }

}