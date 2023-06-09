package com.yxt.model.common;

public class ApiDataResult extends ApiResult {
    private static final long serialVersionUID = 1195989840743309021L;
    private Object result;

    public static ApiDataResult succ(Object data) {
        ApiDataResult result = new ApiDataResult();
        result.setCode(0);
        result.setMsg("成功");
        result.setResult(data);
        return result;
    }

    public static ApiDataResult fail(int code,String errmsg) {
        ApiDataResult result = new ApiDataResult();
        result.setCode(code);
        result.setMsg(errmsg);
        result.setResult(null);
        return result;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}