package com.yxt.common.webService;

import com.alibaba.fastjson.JSONObject;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.junit.Test;

public class webServiceTest {
    /**
     * 动态调用方式
     */
    @Test
    public void webServiceTest() throws Exception {
        JSONObject jsonObject = new JSONObject();
        //jsonObject.put("name", "shenning");

        //1.创建动态客户端
        JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
        Client client = dcf.createClient("https://oa.risenoa.com:13202/public/api/nldFindJtList.do");
        // 需要密码的情况需要加上用户名和密码
        // client.getOutInterceptors().add(new ClientLoginInterceptor(USER_NAME,PASS_WORD));

        //ZhongTai_CAL_MARA为方法名字，后面的是可变参数(invoke("方法名",参数1,参数2,参数3....);)
        Object[] objects = client.invoke("ZhongTai_CAL_MARA", jsonObject.toJSONString());

        //输出调用结果
        System.out.println(objects.toString());
    }
}
