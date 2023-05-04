package com.yxt.entity;

/**
 * @author :liuzhengfeng
 * @date : 2023/3/29
 */

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 投稿经验
 */
@Data
@TableName("submit")
public class Submit {
    private int id;
    private String name;
    private String contents;
    private String fromname;
    private String type;
}
