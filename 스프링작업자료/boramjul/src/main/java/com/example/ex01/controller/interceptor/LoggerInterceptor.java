package com.example.ex01.controller.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@SuppressWarnings("deprecation")
public class LoggerInterceptor extends HandlerInterceptorAdapter{
	
	protected final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	// 컨트롤러 실행 전 호출하는 메서드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
 
        Enumeration paramNames = request.getParameterNames();
        
        while (paramNames.hasMoreElements()) {
            String key = (String) paramNames.nextElement();
            String value = request.getParameter(key);
            logger.info(" RequestParameter Data ==>  " + key + " : " + value + "");
        }

        return super.preHandle(request, response, handler);
        //return true;
    }

    // 컨트롤러 실행 후 DispatcherServlet이 뷰로 보내기 전에 호출
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	
        super.postHandle(request, response, handler, modelAndView);
    }

    // 뷰까지 수행하고 나서 호출
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    	
        super.afterCompletion(request, response, handler, ex);
    }

}
