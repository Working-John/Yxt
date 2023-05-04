package com.yxt.dao;


import com.yxt.entity.LoginInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;


/**
 * 公共接口 数据调用
 *
 * @author: Shiz
 * @date: 2020/6/30 13:14
 */
@Mapper
@Component
public interface LoginDao {

    /**
     * 根据openId获取用户信息
     *
     * @param openId
     * @return
     */
    LoginInfo getUserByOpenId(@Param("openId") String openId);

    /**
     * 根据openId获取用户信息
     *
     * @param phone
     * @return
     */
    LoginInfo getUserByPhone(@Param("phone") String phone);

    /**
     * 根据userId获取用户信息
     *
     * @param userId
     * @return
     */
    LoginInfo getUserByUserId(@Param("userId") String userId);

    LoginInfo getUserByDtOpenId(@Param("dtOpenId")String dtOpenId);

    /**
     * 根据openId更新登陆时间
     *
     * @param openId
     */
    void updateLoginTime(@Param("openId") String openId);

    void updateDtLoginTime(@Param("dtOpenId") String dtOpenId);

    /**
     * 注册
     * @param loginInfo
     */
    /*void register(@Param("loginInfo") LoginInfo loginInfo);

    void dTalkRegister(@Param("loginInfo") LoginInfo loginInfo);

    *//**
     * 获取用户列表
     * @return
     *//*
    Page<LoginInfo> listUsers();

    Subscribe getSubscribe(@Param("openId") String openId, @Param("templateId") String templateId);

    void insertSubscribe(@Param("data") Subscribe subscribe);

    void updateSubcribe(@Param("data") Subscribe subscribe);

    List<String> getSubscribeUsers(@Param("templateId") String templateId);

    int deleteUser(@Param("openId") String openId);

    void updataUserImg(@Param("data") LoginInfo loginInfo);

    int updateUserInfoByOpenId(@Param("data") LoginInfo loginInfo);

    int updateUserInfoByUserId(@Param("data") LoginInfo loginInfo);

    List<Map<String,Object>> listStreet();

    List<Map<String,Object>> listSocietyByStreetId(@Param("streetId") int streetId);

    Admin getAdminById(@Param("data") Admin admin);

    void updateAdminPwd(@Param("data") Admin admin);

    int getStreetNum();

    int getSocietyNum();

    int getUserNum();

    int getDepartmentNum();

    void updateUserPwd(@Param("data")LoginInfo loginInfo);



    void bindDtOpenId(@Param("data")LoginInfo loginInfo);*/
    void bindOpenId(@Param("data")LoginInfo loginInfo);
}
