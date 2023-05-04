package com.yxt.config;

import com.yxt.model.common.ApiResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author: Shiz
 * @date: 2020/6/30 15:22
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ApiResult exceptionHandler(Exception e) {
        e.printStackTrace();
        return ApiResult.fail(-2, e.getMessage());
    }
}
