package com.yxt.dao;

import com.alibaba.fastjson.JSON;
import com.yxt.common.utils.JsonUtils;
import com.yxt.exception.AppException;
import com.yxt.model.weixin.AccessToken;
import com.yxt.model.weixin.Auth;
import com.yxt.model.weixin.CheckRes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import java.util.HashMap;
import java.util.Map;

/**
 * 调用微信相关接口dao
 *
 * @author: Shiz
 * @date: 2020/6/30 17:03
 */
@Repository
public class WxDao {
    private static final Logger logger = LoggerFactory.getLogger(WxDao.class);

    private static final String APPID = "wx36a76f600425cbb1";
    private static final String SECRET = "83f5f28daaba43b47a87e3669fc59261";
    private static final String GRANT_TYPE = "authorization_code";
    private static final String WXURL = "https://api.weixin.qq.com/sns/jscode2session";
    private static final String WX_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token";

    @Autowired
    private RestTemplate restTemplate;

    public Auth getAuth(String code) {
        String url = WXURL + "?appid=" + APPID + "&secret=" + SECRET + "&js_code=" + code
                + "&grant_type=" + GRANT_TYPE;

        String res = restTemplate.getForObject(url, String.class);
        Auth auth = JSON.parseObject(res, Auth.class);
        logger.info("wechatLogin 调用微信auth 应答：" + auth);
        if (auth.getErrcode() != 0) {
            throw new AppException(-3, "调用微信小程序接口异常:" + auth.getErrmsg());
        }
        return auth;
    }

    public String getAccessToken() {
        String url = WX_TOKEN_URL + "?grant_type=client_credential&appid=" + APPID + "&secret=" + SECRET;
        String res = restTemplate.getForObject(url, String.class);
        AccessToken accessToken = JSON.parseObject(res, AccessToken.class);
        logger.info("wechatLogin 调用微信getAccessToken 应答：" + accessToken);
        if (accessToken.getErrcode() != 0) {
            throw new AppException(-3, "调用微信小程序接口异常:" + accessToken.getErrmsg());
        }
        return accessToken.getAccess_token();
    }

    public CheckRes checkImg(MultipartFile multipartFile, String accessToken) throws Exception {
        //微信开放接口链接
        String url = "https://api.weixin.qq.com/wxa/img_sec_check?access_token=" + accessToken;

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);
        MultiValueMap<String, Object> param = new LinkedMultiValueMap<>();
        param.add("media", multipartFile.getResource());
        HttpEntity<MultiValueMap<String, Object>> httpEntity = new HttpEntity<>(param, headers);

        ResponseEntity<CheckRes> checkRes = restTemplate.postForEntity(url, httpEntity, CheckRes.class);
        logger.info("checkImg 调用微信checkImg 应答：" + checkRes.toString());
        if (checkRes.getStatusCode().value() != 200) {
            throw new AppException(-3, "调用微信小程序接口checkImg异常:" + checkRes.toString());
        }
        return checkRes.getBody();
    }

    public CheckRes checkMsg(String content, String accessToken) throws Exception {
        //微信开放接口链接
        String url = "https://api.weixin.qq.com/wxa/msg_sec_check?access_token=" + accessToken;
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
        Map<String, Object> param = new HashMap<>();
        param.put("content", content);
        HttpEntity httpEntity = new HttpEntity<>(param, headers);
        ResponseEntity<CheckRes> checkRes = restTemplate.postForEntity(url, httpEntity, CheckRes.class);
        logger.info("checkMsg 调用微信checkMsg 应答：" + checkRes.toString());

        if (checkRes.getStatusCode().value() != 200) {
            throw new AppException(-3, "调用微信小程序接口checkMsg异常:" + checkRes.toString());
        }
        return checkRes.getBody();
    }

    public CheckRes subscribeMessageSend(String accessToken,String openId,String templateId,String data){
        String url = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + accessToken;
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
        Map<String, Object> param = new HashMap<>();
        param.put("access_token", accessToken);
        param.put("touser",openId);
        param.put("template_id",templateId);
        param.put("data", JsonUtils.jsonToMap(data));
        HttpEntity httpEntity = new HttpEntity<>(param, headers);
        ResponseEntity<CheckRes> checkRes = restTemplate.postForEntity(url, httpEntity, CheckRes.class);
        if (checkRes.getStatusCode().value() != 200) {
            throw new AppException(-3, "调用微信小程序接口subscribeMessageSend异常:" + checkRes.toString());
        }
        return checkRes.getBody();
    }
}
