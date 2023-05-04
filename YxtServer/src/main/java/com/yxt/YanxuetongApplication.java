package com.yxt;

import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.yxt.mapper")
@EnableKnife4j

//@EntityScan(basePackages = "com.yxt.entity")

public class YanxuetongApplication {

    public static void main(String[] args) {
        SpringApplication.run(YanxuetongApplication.class, args);
    }

}
