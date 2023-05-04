package com.yxt.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yxt.common.utils.DateUtils;
import com.yxt.entity.ImgInfo;
import com.yxt.entity.LoginInfo;
import com.yxt.service.ILoginService;
import com.yxt.service.ImgService;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;



@Slf4j
@RestController
@RequestMapping
public class ImgController {

    @Autowired
    private ILoginService loginService;

    //    Servlet请求域对象
    @Autowired
    private HttpServletRequest request;

    //    注入数据层添加URL业务接口
    @Autowired
    private ImgService imgService;

    //    保存物理真实目录路径
    @Value("${uploadPath.realFolder}")
    private String imgRealPath;

    //    反射虚拟路径
    @Value("${uploadPath.reflexFolder}")
    private String uploadReflexPath;

    @PostMapping("/upload")
    public String upload(@RequestParam(value = "filePath") MultipartFile filePath) throws IOException {

        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        //String openId = "oo2rEuJqRdEMTUnSBnzM3NT1TZiM";
        log.info(openId+"这是openId");
        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.eq(LoginInfo::getOpenId,openId);
        LoginInfo ulogin = loginService.getOne(lqueryWrapper);

        String number = ulogin.getCode();
        String name = ulogin.getUserName();


        if (filePath != null && !filePath.isEmpty()) {
//            获取文件名
            String filename = filePath.getOriginalFilename();    //图片名
            String[] split = new String[0];
            if (filename != null) {
                split = filename.split("\\.");
            }
//             只接受jpg. png. jpeg格式图片（其他可多添加判断
            if ("jpg".equalsIgnoreCase(split[1]) || "png".equalsIgnoreCase(split[1]) || "jpeg".equalsIgnoreCase(split[1])) {
                //图片重命名加后缀
                //                String photoName = UUID.randomUUID().toString().replace("-", "") + "." + split[1];


//                文件命名规则：用户名+上传时间（数字）+.格式
                String photoName = name+DateUtils.getTime().toString().replace("-", "").replace(":", "").replace(" ", "") + "." + split[1];

                File destFile = new File(imgRealPath + File.separator + photoName);
                //判断是否存在, 不存在就创建
                if (!destFile.getParentFile().exists()) {
                    destFile.getParentFile().mkdirs();

                }
//               压缩图片保存
                Thumbnails.of(filePath.getInputStream()).scale(0.8).toFile(destFile);
                //获取协议、服务器IP、端口号、工程路径
                String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
                String httpUrl = basePath + uploadReflexPath + photoName;
                System.out.println("完成URL地址 = " + httpUrl);
                //获取到URL后，可以将URL保存到数据库中，以便后续使用，这里就不做演示了，使用Mybatis即可


                if (imgService.addUrl(httpUrl) == 0) {
                    return "保存URL到数据库失败";
                } else {
                    return "保存URL到数据库成功，文件地址为：" + httpUrl;
                }


            }

        }
        return "请上传文件后重试";
    }
}