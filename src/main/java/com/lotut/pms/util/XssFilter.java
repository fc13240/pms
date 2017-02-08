package com.lotut.pms.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * <code>{@link CharLimitFilter}</code>
 *
 * 拦截防止sql注入
 *
 * @author Administrator
 */
public class XssFilter implements Filter {

    public XssFilter() {}

    public void destroy() {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;
        resp.setHeader("SET-COOKIE", "JSESSIONID=" + req.getSession().getId()+ "; HttpOnly");
        
        chain.doFilter(new XssRequestWrapper(req), resp);
    }

    public void init(FilterConfig fConfig) throws ServletException {}
}

