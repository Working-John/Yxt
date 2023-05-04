package com.yxt.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;


@Data
@TableName("img")
public class ImgInfo {

    private String httpUrl;

}
