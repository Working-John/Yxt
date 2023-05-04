package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@TableName("tea_stu")
public class teastu extends Model<teastu> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 学生名 
      */
    private String sname;

    /**
      * 导师名 
      */
    private String tname;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
         this.id = id;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
         this.sname = sname;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
         this.tname = tname;
    }

}