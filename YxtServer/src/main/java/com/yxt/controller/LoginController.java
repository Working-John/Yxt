package com.yxt.controller;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yxt.common.utils.DateUtils;
import com.yxt.config.jwt.JwtHelper;
import com.yxt.dao.WxDao;
import com.yxt.entity.DakaInfo;
import com.yxt.entity.LoginInfo;
import com.yxt.entity.StudentInfo;
import com.yxt.entity.TeaStu;
import com.yxt.model.common.ApiDataResult;
import com.yxt.model.common.ApiResult;
import com.yxt.model.weixin.Auth;
import com.yxt.service.IDakaService;
import com.yxt.service.ILoginService;
import com.yxt.service.IStudentService;
import com.yxt.service.ITeaService;
import io.jsonwebtoken.Claims;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


/**
 * @author :liuzhengfeng
 * @date : 2022/10/8
 */
@Slf4j
@RestController
@RequestMapping("login")
@Api(tags = "登录模块")
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private ILoginService loginService;

    @Autowired
    private IStudentService studentService;

    @Autowired
    private IDakaService dakaService;

    @Autowired
    private WxDao wxDao;

    @Autowired
    private ITeaService teaService;

    /**
     * 微信登录方法生成token
     * @param code
     * @return
     */

    @ApiOperation(value = "微信登录")
    @PostMapping("wechatLogin")
    public ApiDataResult wechatLogin(@RequestBody Map<String, Object> code) {
        //获取小程序给的code,调用微信auth.code2Session,获得open_id
        Auth auth = wxDao.getAuth((String) code.get("code"));

        //LoginInfo login = loginService.getUser(auth.getOpenid());
        //if (login != null)
        //return ApiDataResult.succ(JwtHelper.generateToken(auth.getOpenid(), auth.getUnionid(), auth.getSession_key(), login.getUserId()));
        //else
        return ApiDataResult.succ(JwtHelper.generateToken(auth.getOpenid(), auth.getUnionid(), auth.getSession_key()));
        //return ApiDataResult.succ(JwtHelper.generateToken("", "","",code.get("userId").toString()));

    }




    /**
     * 学生登录
     * @param studentInfo
     * @param request
     * @return
     * @throws ParseException
     */
    @ApiOperation(value = "学生登录")
    @PostMapping("denglu")
    public ApiResult dengluUser(@RequestBody StudentInfo studentInfo, HttpServletRequest request) throws ParseException {
        //获取前端的authCode，换用户信息
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        log.info("openId");
        //String openId = "123";
        //接收前端传来的手机号 进行匹配
        String phone = studentInfo.getStuPhone();
        log.info("phone");
        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.eq(LoginInfo::getPhone,phone);
        LoginInfo ulogin = loginService.getOne(lqueryWrapper);
        if (ulogin == null){
            LambdaQueryWrapper<StudentInfo> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(StudentInfo::getStuPhone,phone);
            StudentInfo login = studentService.getOne(queryWrapper);
            LoginInfo info = new LoginInfo();
            if(login!=null) {
                //把信息添加到user
                info.setOpenId(openId);
                info.setCode(login.getStuCode());
                info.setUserName(login.getStuName());
                info.setUserSex(login.getStuSex());
                info.setPhone(login.getStuPhone());
                info.setGarde(login.getGarde());
                info.setLastLoginTime(DateUtils.getTime());
                loginService.save(info);
                return ApiResult.succ();
            }
            else
                return ApiResult.fail(-2, "没有该手机号对应用户信息请注册");
        }
        else return ApiResult.succ();
    }

    /**
     * 查询用户是否第一次登录
     * @param request
     * @return
     */
    @GetMapping("selectUser")
    public LoginInfo selectUser(HttpServletRequest request){
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        //String openId = "oo2rEuJqRdEMTUnSBnzM3NT1TZi8M";
        LambdaQueryWrapper<LoginInfo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(LoginInfo::getOpenId,openId);
        LoginInfo loginInfo = loginService.getOne(queryWrapper);
        log.info("loginInfo");
        return loginInfo;
    }



    /**
     * 学生注册
     * @param studentInfo
     * @return
     */
    /*@ApiOperation(value = "学生注册")
    @PostMapping("register")
    public ApiResult registerUser(@RequestBody StudentInfo studentInfo){
        //判断是否有这个手机号 没有就注册
        String phone = studentInfo.getStuPhone();
//        String name = studentInfo.getStuName();
        String code = studentInfo.getStuCode();

        LambdaQueryWrapper<StudentInfo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StudentInfo::getStuPhone,phone);

        StudentInfo login = studentService.getOne(queryWrapper);
        if (login == null){
            LambdaQueryWrapper<StudentInfo> queryWrapper1 = new LambdaQueryWrapper<>();

            queryWrapper1.eq(StudentInfo::getStuCode,code);
            log.info("queryWrapper");
            studentInfo.setStuCode(code);
            studentInfo.setStuPhone(phone);
            studentInfo.setStuId(studentInfo.getStuId());
            studentInfo.setStuName(studentInfo.getStuName());
            studentInfo.setStuSex(studentInfo.getStuSex());
            studentInfo.setStuDepart(studentInfo.getStuDepart());
            studentInfo.setStuClass(studentInfo.getStuClass());

            studentService.update(queryWrapper1);


            return ApiResult.succ();
        }
        else
            return ApiResult.fail(-3,"该手机号已经存在，请勿重复注册");
    }
*/

    /**
     * 判断是老师
     * @param request
     * @return
     */
    @GetMapping("selectTeacher")
    public LoginInfo selectTeacher(HttpServletRequest request){
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        //String openId = "oo2rEuJqRdEMTUnSBnzM3NT1TZi8M";
        LambdaQueryWrapper<LoginInfo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(LoginInfo::getOpenId,openId);
        LoginInfo loginInfo = loginService.getOne(queryWrapper);
        log.info("loginInfo");
        return loginInfo;
    }


    /**
     * 根据当前登录的人员获取其学生列表
     * @param request
     * @return
     */
    @GetMapping("findStudent")
    public ApiDataResult findStudent(HttpServletRequest request){
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.eq(LoginInfo::getOpenId, openId);
        LoginInfo ulogin = loginService.getOne(lqueryWrapper);
        String tname = ulogin.getUserName();
        LambdaQueryWrapper<TeaStu> teaStuLambdaQueryWrapper = new LambdaQueryWrapper<>();
        teaStuLambdaQueryWrapper.like(TeaStu::getTname,tname);
        List<TeaStu> list = teaService.list(teaStuLambdaQueryWrapper);
        List<String> courseIds= list.stream().map(TeaStu::getSname).collect(Collectors.toList());

        return ApiDataResult.succ(courseIds);
    }



    @GetMapping("findUser")
    public ApiDataResult findUser(HttpServletRequest request){
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        LambdaQueryWrapper<LoginInfo> lqueryWrapper = new LambdaQueryWrapper<>();
        lqueryWrapper.eq(LoginInfo::getOpenId, openId);
        LoginInfo ulogin = loginService.getOne(lqueryWrapper);
        String tname = ulogin.getUserName();
        LambdaQueryWrapper<TeaStu> teaStuLambdaQueryWrapper = new LambdaQueryWrapper<>();
        teaStuLambdaQueryWrapper.like(TeaStu::getTname,tname);
        List<TeaStu> list = teaService.list(teaStuLambdaQueryWrapper);
        List<String> courseIds= list.stream().map(TeaStu::getSname).collect(Collectors.toList());
        String name = null;
        //List list1 = null;

        for ( int i=0;i<courseIds.toString().length();i++){

        }

        LambdaQueryWrapper<DakaInfo> dakaQueryWrapper = new LambdaQueryWrapper<>();
        dakaQueryWrapper.like(DakaInfo::getName,courseIds);
        List<DakaInfo> dakaInfoList = dakaService.list(dakaQueryWrapper);
        //dakaInfoList.toString().length()
        return ApiDataResult.succ(dakaInfoList);
    }

    /**
     * 退出接口
     * @param request
     * @return
     */
    @GetMapping("deleteUser")
    public ApiResult deleteUser(HttpServletRequest request){
        Claims claims = (Claims) request.getAttribute("claims");
        String openId = (String) claims.get("openId");
        LambdaQueryWrapper<LoginInfo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(LoginInfo::getOpenId,openId);
        loginService.remove(queryWrapper);
        return ApiResult.succ();
    }

}


