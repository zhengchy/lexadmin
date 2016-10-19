package com.lex.controller.web;

import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.lex.Service.user.UserService;
import com.lex.controller.LexUserController;
import com.lex.util.AliyunSmsUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * Created by Administrator on 2016/9/27.
 * web页面登录
 */
@Controller
@RequestMapping(value="/web/user")
public class LexUser_webController extends LexUserController {
    @Autowired
    UserService userService;


//用户登录   后续添加  验证码 等功能
    @RequestMapping(value="/weblogin",method = RequestMethod.POST)
    public String  webLogin(HttpServletRequest request, HttpServletResponse response, Model model)throws  Exception{
        Map maps=(Map)this.appLogin(request,response);
        String resultmeg=(String) maps.get("resultMessag");
        String resuCode=(String)maps.get("resultCode");
        PageData data=(PageData)maps.get("user");
        PageData pd=new PageData();
        pd.put("resultCode",resuCode);
        pd.put("resultMessage",resultmeg);
        pd.put("user", data);
        model.addAttribute("pd",pd);
        return "lex/web/LoginSuccess";
    }

//显示界面
    @RequestMapping(value = "/{info}")
    public String showPages(@PathVariable String info){
        return "lex/web/"+info;
    }


//发送验证码
    @RequestMapping(value = "/sendSmsVerifyCode")
    @ResponseBody
    public Object sendSmsVerifyCode() throws Exception {
        logBefore(logger, "发送验证码");
        PageData pd = this.getPageData();
        String PHONE = pd.getString("PHONE");
        String code = pd.getString("CODE");
        String user_ip = getIpAddr();  //获取访问者ip
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        String sessionSecCode =(String)session.getAttribute(Const.SESSION_SECURITY_CODE);
        if(pd.getString("SECCODE") == null || "".equals(pd.getString("SECCODE"))){
            return this.response("sec code null");
        }
        if (!sessionSecCode.equals(pd.getString("SECCODE").toUpperCase())) {
            return this.response("sec code error");
        }
        if (code == null || code.isEmpty() || code.indexOf("SMS") != 0) {
            return this.response("code error");
        }

        if (!Tools.checkMobileNumber(PHONE)) {
            return this.response("not mobile");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar nowTime = Calendar.getInstance();
        nowTime.add(Calendar.MINUTE, -2);
        pd.put("send_time",sdf.format(nowTime.getTime()));


        String randomNum = AliyunSmsUtil.randomNum4();
        int ret = AliyunSmsUtil.sendSms(PHONE, randomNum, code);
        if (ret == 0) {
            session.setAttribute(Const.SESSION_SMS_CODE, randomNum);
            pd.put("send_ip",user_ip);
            pd.put("send_time", Tools.date2Str(new Date()));
            pd.put("send_status","1");
           userService.saveSms(pd);
            return this.responseSuccess();
        } else {
            logger.info("发送验证码失败，短信平台返回值：" + ret);
            pd.put("send_ip",user_ip);
            pd.put("send_time", Tools.date2Str(new Date()));
            pd.put("send_status","0");
            userService.saveSms(pd);
            return this.response("" + ret);
        }

    }


    @RequestMapping(value="register")
    public Object register()throws Exception{
       PageData pd=this.getPageData();
        userService.saveUser(pd);
        return this.responseSuccess();
    }


    @RequestMapping(value="checkSmsVerifyCode")
    public Object checkSmsVerifyCode(){
        String SmsVerifyCode=this.getPageData().getString("SmsVerifyCode");
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        String code=(String)session.getAttribute(Const.SESSION_SMS_CODE);//验证 手机验证码
        if(SmsVerifyCode.equals(code)){
            return true;
        }
         return false;
    }
}
