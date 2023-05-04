package com.yxt.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import lombok.Data;

import java.util.Date;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/8
 */
@Data
//个人信息表
@TableName("user")
public class LoginInfo {
    @TableId
    private Integer userId;
    private String userName;
    private String openId;
    private String phone;
    private String userSex;
    private String code;
    private String unionId;
    private String lastLoginTime;
    private String garde;

}
