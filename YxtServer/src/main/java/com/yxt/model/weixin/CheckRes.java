package com.yxt.model.weixin;

/**
 * @author: Shiz
 * @date: 2020/10/30 16:50
 */
public class CheckRes {
    int errcode;
    String errmsg;

    @Override
    public String toString() {
        return "CheckRes{" +
                "errcode=" + errcode +
                ", errmsg='" + errmsg + '\'' +
                '}';
    }

    public int getErrcode() {
        return errcode;
    }

    public void setErrcode(int errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }
}
