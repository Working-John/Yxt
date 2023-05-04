package com.yxt.config.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class MyWebConfigure implements WebMvcConfigurer {
    /**
     * 保存物理真实目录路径
     */
    @Value("${uploadPath.realFolder}")
    private String imgRealPath;

    /**
     * 反射虚拟路径
     */
    @Value("${uploadPath.reflexFolder}")
    private String uploadReflexPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //addResourceHandler()配置需要映射的文件夹
        //addResourceLocations()配置文件夹在系统中的路径，使用绝对路径，格式为“file:你的路径”
        //registry.addResourceHandler(logoRealFolderPath + "**").addResourceLocations("file:C:\\zy\\upload\\");
        registry.addResourceHandler(uploadReflexPath + "**").addResourceLocations("file:" + imgRealPath);
    }

}
