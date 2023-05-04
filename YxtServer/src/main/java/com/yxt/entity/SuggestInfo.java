package com.yxt.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/21
 */
@Data
@TableName("suggest")
public class SuggestInfo {
    private Integer id;
    private String content;
    private String time;

}
