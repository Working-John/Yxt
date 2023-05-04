package com.yxt.common.utils;

import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class InterfaceCallUtils {

  public static JSONObject InterfaceCall(String url, JSONObject jsonParam) throws Exception {
    CloseableHttpClient httpClient = HttpClients.createDefault();

    if (!jsonParam.isEmpty()) {
      String param = "";
      for (String key : jsonParam.keySet()) {
        param += key + "=" + jsonParam.getString(key) + "&";
      }
      url += "?" + param;
      url = url.substring(0, url.length() - 1);
    }
    HttpPost httpPost = new HttpPost(url);
    // httpPost.addHeader("authorization", "");
    JSONObject jsonObject = null;
    CloseableHttpResponse response = httpClient.execute(httpPost);
    try {
      if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
        jsonObject = JSONObject.parseObject(EntityUtils.toString(response.getEntity()));
      }
      HttpEntity entity = response.getEntity();
      EntityUtils.consume(entity);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      response.close();
    }
    return jsonObject;
  }
}
