package com.edify.web.servlet;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author jarias
 * @since 6/2/12 7:10 PM
 */
public class EnvironmentInterceptor extends HandlerInterceptorAdapter {
  public static final String DEFAULT_PARAM_NAME = "env";
  public static final String ASSETS_SUFFIX_PARAM_NAME = "assetsSuffix";
  public static final String ASSETS_CACHE_BUSTER_PARAM_NAME = "cacheBuster";
  @Value("${git.sha}")
  private String gitSha;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    WebApplicationContext webApplicationContext = (WebApplicationContext) RequestContextUtils.getWebApplicationContext(request);
    String[] activeProfiles = webApplicationContext.getEnvironment().getActiveProfiles();
    if(ArrayUtils.contains(activeProfiles, "production")) {
      request.getSession().setAttribute(DEFAULT_PARAM_NAME, "production");
      request.getSession().setAttribute(ASSETS_SUFFIX_PARAM_NAME, "-min");
      request.getSession().setAttribute(ASSETS_SUFFIX_PARAM_NAME, "-min");
      request.getSession().setAttribute(ASSETS_CACHE_BUSTER_PARAM_NAME, "?v=" + gitSha);
    } else {
      request.getSession().setAttribute(ASSETS_SUFFIX_PARAM_NAME, "");
      request.getSession().setAttribute(ASSETS_CACHE_BUSTER_PARAM_NAME, "");
    }
    return true;
  }
}
