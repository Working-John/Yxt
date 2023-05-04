package com.yxt.controller;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.yxt.common.utils.DateUtils;
import com.yxt.entity.DakaInfo;
import com.yxt.entity.LoginInfo;
import com.yxt.model.common.ApiDataResult;
import com.yxt.model.common.ApiResult;
import com.yxt.service.IDakaService;
import com.yxt.service.ILoginService;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @author :liuzhengfeng
 * @date : 2022/12/11
 */
@RestController
@Slf4j
@RequestMapping("daka")
public class DakaController {

    @Autowired
    private ILoginService loginService;

    @Autowired
    private IDakaService dakaservice;


    /**
     * 新增学生打卡信息
     * @param request
     * @param dakaInfo
     * @return
     */
    @PostMapping("dwdaka")
    public ApiResult daKa(HttpServletRequest request, @RequestBody DakaInfo dakaInfo) {
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.eq(LoginInfo::getOpenId, openId);
        LoginInfo ulogin = loginService.getOne(lqueryWrapper);
        String consquence = dakaInfo.getConsquence();
        String number = ulogin.getCode();
        String name = ulogin.getUserName();
        dakaInfo.setName(name);
        dakaInfo.setNumber(number);

        if (StringUtils.isNotEmpty(number)
                || StringUtils.isNotEmpty(name)
                || StringUtils.isNotEmpty(consquence)) {
            dakaInfo.setTime(DateUtils.getTime());
            dakaservice.save(dakaInfo);
        }
        return ApiResult.succ();
    }

  /*  *//**
     * 查询所有打卡信息
     * @return
     *//*
    @GetMapping("selectDaka")
    public ApiDataResult selectDaka(
                                    String name,
                                    Integer page, Integer pageSize, HttpRequest request){
        //构造分页构造器
        log.info("page = {},pageSize = {},name = {}",page,pageSize,name);
        Page pageInfo = new Page<>(page,pageSize);
        LambdaQueryWrapper<DakaInfo> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(StringUtils.isNotEmpty(name),DakaInfo::getName,name);
        lambdaQueryWrapper.orderByDesc(DakaInfo::getTime);
        dakaservice.page(pageInfo,lambdaQueryWrapper);
        return ApiDataResult.succ(pageInfo);
    }*/




    /**
     * 根据开始时间和结束时间查询打卡信息
     * 查询本月 本周 其他月的打卡信息
     */
    @PostMapping("timeFind")
    public ApiDataResult timeFind(@RequestBody DakaInfo dakaInfo,HttpServletRequest request){
        //String name = dakaInfo.getName();
        String date1 = dakaInfo.getDate1();
        String date2 = dakaInfo.getDate2();


//        Claims claims = (Claims) request.getAttribute("claims");
//        String openId = (String) claims.get("openId");
//        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
//        lqueryWrapper.eq(LoginInfo::getOpenId, openId);
//        LoginInfo ulogin = loginService.getOne(lqueryWrapper);
//        String tname = ulogin.getUserName();
        LambdaQueryWrapper<DakaInfo> queryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(date1) &&
                StringUtils.isNotEmpty(date2)){
            queryWrapper.ge(DakaInfo::getTime,date1);
            queryWrapper.le(DakaInfo::getTime,date2);
//            queryWrapper.like(StringUtils.isNotEmpty(name),DakaInfo::getName,name);
//            queryWrapper.like(DakaInfo::getName,tname);
        }
        List<DakaInfo> infoList = dakaservice.list(queryWrapper);
        return ApiDataResult.succ(infoList);
    }


    /**
     * 根据当前传入的时间查询当前学生的打卡情况
     * @param dakaInfo
     * @return
     */
    @PostMapping("selectName")
    public ApiDataResult selectDate(@RequestBody DakaInfo dakaInfo){
        String date = dakaInfo.getTime();
        LambdaQueryWrapper<DakaInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.like(DakaInfo::getTime,date);
        List<DakaInfo> infoList = dakaservice.list(lqueryWrapper);
        return ApiDataResult.succ(infoList);
    }




     /**
     * 根据当前传入的时间查询当前学生的打卡情况
     * @param dakaInfo
     * @return
     */
    @PostMapping("selectStudent")
    public ApiDataResult selectStudent(@RequestBody DakaInfo dakaInfo,HttpServletRequest request){
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.eq(LoginInfo::getOpenId, openId);
        LoginInfo ulogin = loginService.getOne(lqueryWrapper);
        String tname = ulogin.getUserName();
        String date = dakaInfo.getTime();
        LambdaQueryWrapper<DakaInfo> dlqueryWrapper = new LambdaQueryWrapper<>();
        dlqueryWrapper.like(DakaInfo::getTime,date);
        dlqueryWrapper.like(DakaInfo::getName,tname);
        List<DakaInfo> infoList = dakaservice.list(dlqueryWrapper);
        log.info(infoList+"学生打卡信息");
        return ApiDataResult.succ(infoList);
    }







}

