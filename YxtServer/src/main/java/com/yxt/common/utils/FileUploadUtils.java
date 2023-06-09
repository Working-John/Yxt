package com.yxt.common.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

//图片上传工具类
public class FileUploadUtils {
    /**
     *
     * @param file 文件
     * @param path   文件存放路径
     * @param fileName 原文件名
     * @return
     */
    public static boolean upload(MultipartFile file, String path, String fileName){

        // 生成文件路径
        //String realPath = path + "/" +fileName;

        File dest = new File(path,fileName);

        //判断文件父目录是否存在
        if(!dest.getParentFile().exists()){
            dest.getParentFile().mkdir();
        }

        try {
            //保存文件
            file.transferTo(dest);
            return true;
        } catch (IllegalStateException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

    }

}
