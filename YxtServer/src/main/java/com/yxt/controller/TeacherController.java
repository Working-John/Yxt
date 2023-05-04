package com.yxt.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.yxt.common.utils.DateUtils;
import com.yxt.entity.DayReportInfo;
import com.yxt.entity.LoginInfo;
import com.yxt.entity.TeacherInfo;
import com.yxt.model.common.ApiResult;
import com.yxt.service.ILoginService;
import com.yxt.service.ITeacherService;
import com.yxt.service.ImgService;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Blob;


@Slf4j
@RestController
@RequestMapping("teacher")
public class TeacherController {

    @Autowired
    private ImgService imgService;

    @Autowired
    private ITeacherService iTeacherService;

    @Autowired
    private ILoginService iLoginService;

    @PostMapping("teacherReportUp")
    public ApiResult teacherReportUp(HttpServletRequest request, @RequestBody TeacherInfo teacherInfo ) {
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        //String openId = "oo2rEuJqRdEMTUnSBnzM3NT1TZiM";
        log.info(openId+"这是openId");
        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.eq(LoginInfo::getOpenId,openId);
        LoginInfo ulogin = iLoginService.getOne(lqueryWrapper);

        String number = ulogin.getCode();
        String name = ulogin.getUserName();

        String teachername = teacherInfo.getTeachername();
        String course = teacherInfo.getCourse();
        String remark = teacherInfo.getRemark();

        teacherInfo.setNumber(number);
        teacherInfo.setName(name);

        if (StringUtils.isNotEmpty(number)
                ||StringUtils.isNotEmpty(name)
                ||StringUtils.isNotEmpty(course)
                || StringUtils.isNotEmpty(teachername)) {
            teacherInfo.setTime(DateUtils.getTime());
            iTeacherService.save(teacherInfo);
        }

        return ApiResult.succ();
    }
}
