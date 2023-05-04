package com.yxt.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.yxt.common.utils.DateUtils;
import com.yxt.entity.DakaInfo;
import com.yxt.entity.DayReportInfo;
import com.yxt.entity.LoginInfo;
import com.yxt.entity.WeekReportInfo;
import com.yxt.model.common.ApiDataResult;
import com.yxt.model.common.ApiResult;
import com.yxt.service.IDReportService;
import com.yxt.service.ILoginService;
import com.yxt.service.IWReportService;
import io.jsonwebtoken.Claims;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/9
 */
@Api(tags = "学生每日一报接口")
@Slf4j
@RestController
@RequestMapping("report")
public class ReportController {
    @Autowired
    private IDReportService idReportService;
    @Autowired
    private IWReportService iwReportService;
    @Autowired
    private ILoginService loginService;

    /**
     * 每日一报
     * @param reportInfo
     * @return
     */
    @ApiOperation(value = "每日一报")
    @PostMapping("saveDayReport")
    public ApiResult saveDayReport(HttpServletRequest request,@RequestBody DayReportInfo reportInfo ){
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        //String openId = "oQX7j5f7qQsxN4OJ2zFPsPNjnyXs";
        log.info(openId+"这是openId");
        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.eq(LoginInfo::getOpenId,openId);
        LoginInfo ulogin = loginService.getOne(lqueryWrapper);

        String number = ulogin.getCode();
        String name = ulogin.getUserName();
        String statue = reportInfo.getStatue();
        String judge = reportInfo.getJudge();
        String passage = reportInfo.getPassage();
        reportInfo.setNumber(number);
        reportInfo.setName(name);

        if (StringUtils.isNotEmpty(number)
                ||StringUtils.isNotEmpty(name)
               ||StringUtils.isNotEmpty(passage)
                ||StringUtils.isNotEmpty(statue)
                || StringUtils.isNotEmpty(judge)) {
            reportInfo.setTime(DateUtils.getTime());
            idReportService.save(reportInfo);
        }

        return ApiResult.succ();
    }

    /**
     * 每周一报
     * @param weekReportInfo
     * @return
     */
    @PostMapping("saveWeekReport")
    public ApiResult saveWeekReport(@RequestBody WeekReportInfo weekReportInfo){
        iwReportService.save(weekReportInfo);
        return ApiResult.succ();
    }




    @GetMapping("selectDaka")
    public ApiDataResult selectDayReportInfo(){
        return ApiDataResult.succ(idReportService.list()) ;
    }

//    @PostMapping("selectName")
//    public ApiDataResult selectDate(@RequestBody DayReportInfo dayReportInfo){
//        String name = dayReportInfo.getName();
//        LambdaQueryWrapper<DayReportInfo> lqueryWrapper = new LambdaQueryWrapper<>();
//        lqueryWrapper.eq(DayReportInfo::getName,name);
//        List<DayReportInfo> infoList = idReportService.list(lqueryWrapper);
//        return ApiDataResult.succ(infoList);
//    }



    /**
     * 根据当前传入的时间查询当前学生的每日一报情况
     * @param dayReportInfo
     * @return
     */
    @PostMapping("selectName")
    public ApiDataResult selectDate(@RequestBody DayReportInfo dayReportInfo){
        String date = dayReportInfo.getTime();
        LambdaQueryWrapper<DayReportInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.like(DayReportInfo::getTime,date);
        List<DayReportInfo> infoList = idReportService.list(lqueryWrapper);
        return ApiDataResult.succ(infoList);
    }



    /**
     * 根据开始时间和结束时间查询每日一报信息
     * 查询本月 本周 其他月的打卡信息
     */
    @PostMapping("timeFind")
    public ApiDataResult timeFind(@RequestBody DayReportInfo dayReportInfo){
        String date1 = dayReportInfo.getDate1();
        String date2 = dayReportInfo.getDate2();
        LambdaQueryWrapper<DayReportInfo> queryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(date1) &&
                StringUtils.isNotEmpty(date2)){
            queryWrapper.ge(DayReportInfo::getTime,date1);
            queryWrapper.le(DayReportInfo::getTime,date2);
        }
        List<DayReportInfo> infoList = idReportService.list(queryWrapper);
        return ApiDataResult.succ(infoList);
    }





}
