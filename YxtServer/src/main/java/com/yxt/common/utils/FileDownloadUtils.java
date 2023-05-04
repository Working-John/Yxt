package com.yxt.common.utils;

import org.apache.commons.io.IOUtils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;

public class FileDownloadUtils {
    public static void download(String path,String fileName,HttpServletResponse response) throws IOException{

        //1. 接受文件名，读取磁盘对应的文件，创建输入流对象
        FileInputStream inputStream = new FileInputStream(path+fileName);

        //2.获取响应对象的输出流
        ServletOutputStream outputStream = response.getOutputStream();

        //3.文件下载文件名的编码使用ISO-08859-1编码
        // 我们需要将我们UTF-8的 filename转换ISO-8859-1编码
        //3.1先将字符串以UTF-8转换成字节数组
        byte[] bytes = fileName.getBytes("UTF-8");

        //3.2再将字节数组以 ISO-8859-1转换字符串
        fileName = new String(bytes, "ISO-8859-1");

        //4.响应的内容应该是以附件的形式响应给浏览器(设置响应头)
        response.setHeader("Content-Disposition", "attachment;filename="+fileName);
        //5.响应文件给浏览器
        IOUtils.copy(inputStream, outputStream);

    }

    public static void download(String fileName,HttpServletResponse response) throws IOException{

        FileInputStream inputStream = new FileInputStream(fileName);
        ServletOutputStream outputStream = response.getOutputStream();
        byte[] bytes = fileName.getBytes("UTF-8");
        fileName = new String(bytes, "ISO-8859-1");
        response.setHeader("Content-Disposition", "attachment;filename="+fileName);
        IOUtils.copy(inputStream, outputStream);
    }
}
