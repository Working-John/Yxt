package com.yxt.model.weixin;

import javax.validation.constraints.NotBlank;

/**
 * @author: Shiz
 * @date: 2021/2/1 9:54
 */
public class SubscribeSend {
    @NotBlank
    private String templateId;
    @NotBlank
    private String data;

    public String getTemplateId() {
        return templateId;
    }

    public void setTemplateId(String templateId) {
        this.templateId = templateId;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
