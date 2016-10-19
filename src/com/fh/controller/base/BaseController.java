package com.fh.controller.base;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fh.util.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fh.entity.Page;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

/**
 * @author FH Q313596790
 * 修改时间：2015、12、11
 */
public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;
	
	/** new PageData对象
	 * @return
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**得到ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**得到request对象
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	/**得到request对象
	 * @return
	 */
	public HttpServletResponse getResponse() {
		HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
		return response;
	}

	/**得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	/**得到分页列表的信息
	 * @return
	 */
	public Page getPage(){
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}

	/**
	 * 设置结果信息
	 * @param code
	 * @param message
     */
	public Map setResultMessage(Map map,String code, String message){
		if(map !=null ){
				map.put(Const.APP_RESULT_CODE,code);
				map.put(Const.APP_RESULT_MESSAGE,message);
			return map;
		}else{
			Map newMap = new HashMap();
			newMap.put(Const.APP_RESULT_CODE,code);
			newMap.put(Const.APP_RESULT_MESSAGE,message);
			return newMap;
		}
		//header 方式
//		HttpServletResponse response = this.getResponse();
//		response.addHeader(Const.APP_RESULT_CODE,code);
//		try {
//			response.addHeader(Const.APP_RESULT_MESSAGE,new String(message.getBytes("gb2312"), "ISO8859-1" ));
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
	}

	/**
	 * 获取User信息
	 * @return
     */
	public PageData getUserInfo(){
		HttpServletRequest request = this.getRequest();
		String token  = request.getHeader(Const.APP_TOKEN_STR);
		return (PageData) Const.APP_SESSION_TOKEN.get(token);
	}
	//获取ip
	public  String getIpAddr() {
		String ip = getRequest().getHeader("x-forwarded-for");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = getRequest().getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = getRequest().getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = getRequest().getRemoteAddr();
			if(ip.equals("127.0.0.1")){
				//根据网卡取本机配置的IP
				InetAddress inet=null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (Exception e) {
					e.printStackTrace();
				}
				ip= inet.getHostAddress();
			}
		}
		// 对于通过多个
		// 代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if(ip != null && ip.length() > 15){
			if(ip.indexOf(",")>0){
				ip = ip.substring(0,ip.indexOf(","));
			}
		}
		return ip;
	}



	/**
	 * 返回成功标记
	 * @return
	 */
	protected Object responseSuccess() {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}

	/**
	 * 返回标记
	 * @return
	 */
	protected Object response(String msg) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", msg);
		return map;
	}


	
}
