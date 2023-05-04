package com.yxt.model.dingtalk;

public class DingTalkAuth {
    private String accountId;//账号id
    private String lastName;//姓名
    private String clientId;//应用名
    private String realmId;//租户id
    private String openid;//应用+用户唯一标识
    private String realmName;//租户名称
    private String namespace;//账号类型
    private String nickNameCn;//昵称
    private String tenantUserId;//租户+用户唯一标识
    private String account;//账号名
    private String employeeCode;//租户下人员编码

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public void setRealmId(String realmId) {
        this.realmId = realmId;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getRealmId() {
        return realmId;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getRealmName() {
        return realmName;
    }

    public void setRealmName(String realmName) {
        this.realmName = realmName;
    }

    public String getNamespace() {
        return namespace;
    }

    public void setNamespace(String namespace) {
        this.namespace = namespace;
    }

    public String getNickNameCn() {
        return nickNameCn;
    }

    public void setNickNameCn(String nickNameCn) {
        this.nickNameCn = nickNameCn;
    }

    public String getTenantUserId() {
        return tenantUserId;
    }

    public void setTenantUserId(String tenantUserId) {
        this.tenantUserId = tenantUserId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }
}
