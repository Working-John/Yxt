package com.yxt.config.jwt;
import com.alibaba.fastjson.JSON;
import com.yxt.model.common.ApiResult;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: Shiz
 * @date: 2020/6/30 15:54
 */
@Slf4j
public class JwtFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        log.info("reuest请求"+request.getRequestURL().toString());

        if (request.getRequestURL().toString().endsWith("/login/wechatLogin")
//                || request.getRequestURL().toString().endsWith("/report/saveDayReport")
//                || request.getRequestURL().toString().endsWith("/report/selectReport")
                //|| request.getRequestURL().toString().endsWith("/daka/timeFind")
//                || request.getRequestURL().toString().endsWith("/daka/selectNumber")
                //|| request.getRequestURL().toString().endsWith("/daka/selectName")
//                || request.getRequestURL().toString().endsWith("/suggest/saveSubmit")
//                || request.getRequestURL().toString().endsWith("/suggest/selectSubmit")
//                || request.getRequestURL().toString().endsWith("/suggest/delSubmit")

                //|| request.getRequestURL().toString().endsWith("/daka/selectId")
                || request.getRequestURL().toString().endsWith("/v3/api-docs")
                || request.getRequestURL().toString().endsWith("/v2/api-docs")
                || request.getRequestURL().toString().endsWith("/webjars/**")





        ) {
            filterChain.doFilter(request, response);
        } else {
            String token = request.getHeader("authorization"); //获取请求传来的token
            Claims claims = JwtHelper.verifyJwt(token); //验证token
            if (claims == null) {
                response.getWriter().write(JSON.toJSONString(ApiResult.fail(-1, "token is invalid")));
            } else {
                request.setAttribute("claims", claims);
                filterChain.doFilter(request, response);
            }
        }

    }

    @Override
    public void destroy() {

    }
}
