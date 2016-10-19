<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/27
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title></title>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>我爱轮胎网注册页面</title>
    <link rel="stylesheet" href="static/replace/css/bootstrap.min.css" />
    <link rel="stylesheet" href="static/replace/css/reset.css" />
    <link rel="stylesheet" href="static/replace/css/Resgister.css" />

    <script src="static/website/plugin/jquery-1.12.3/jquery-1.12.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="static/js/jquery.tips.js"></script>
    <script src="static/js/jquery.cookie.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="static/website/plugin/bootstrap-3.3.5-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="static/website/plugin/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <!-- myself -->
    <script type="text/javascript" src="static/website/script/frame.js"></script>
    <script type="text/javascript" src="static/website/script/setting.js"></script>

    <script type="text/javascript">
        if( !('placeholder' in document.createElement('input')) ){

            $('input[placeholder],textarea[placeholder]').each(function(){
                var that = $(this),
                        text= that.attr('placeholder');
                if(that.val()===""){
                    that.val(text).addClass('placeholder');
                }
                that.focus(function(){
                    if(that.val()===text){
                        that.val("").removeClass('placeholder');
                    }
                })
                        .blur(function(){
                            if(that.val()===""){
                                that.val(text).addClass('placeholder');
                            }
                        })
                        .closest('form').submit(function(){
                            if(that.val() === text){
                                that.val('');
                            }
                        });
            });
        }
        $(function () {

            $("#codeImg").click(function () {
                $(this).attr("src", "code?tm=" + new Date().getTime());
            });

            $("#codeImg").click();
        });
    </script>
</head>
<body>
<div class="login1">
    <form action="">
        <p style="width:100%; text-align: center; margin: 0; font-size: 21px; line-height: 21px; color:#b1a4a4; margin-bottom: 26px;;">注册</p>
        <div style="margin-bottom: 26px;">
            <input type="text" name="USERNAME" maxlength="11" style="width:100%; height:60px; padding-left:45px; border:1px solid #b09d9d;" placeholder="请输入手机号"/>
            <img src="static/replace/img/sm_03.png" alt="" class="img-4"/>
            <img src="static/replace/img/sm_10.png" alt="倒三角" class="img-5" />
            <input type="hidden" id="EXIST_USERNAME"/>
        </div>
        <div>
            <input type="password" name="PASSWORD" maxlength="32" style="width:100%; height:60px; padding-left:45px; border:1px solid #b09d9d; margin-bottom: 30px;" placeholder="请输入密码"/>
            <img src="static/replace/img/logo-8_06.png" alt="小锁" class="img-6"/>
            <img src="static/replace/img/sm_10.png" alt="键盘" class="img-7" />
        </div>

        <div>
            <input type="password" name="CONFIRM_PASSWORD" maxlength="32" style="width:100%; height:60px; padding-left:45px; border:1px solid #b09d9d; margin-bottom: 30px;" placeholder="再次输入密码"/>
            <img src="static/replace/img/logo-8_06.png" alt="小锁" class="img-8"/>
            <img src="static/replace/img/sm_10.png" alt="键盘" class="img-9" />
        </div>
        <div>
            <input type="text" id="SecCode"  name="SecCode" maxlength="4" style="width:100%; height:60px; padding-left:45px; border:1px solid #b09d9d; margin-bottom: 30px;" placeholder="验证码"/>
            <img src="static/replace/img/s-img_03.png" alt="小锁" class="img-13"/>
            <img id="codeImg" src="" style="position:absolute; top:375px; right:85px;">
        </div>
        <div>
            <input type="text" name="SmsVerifyCode" maxlength="4" style="width:100%; height:60px; padding-left:45px; border:1px solid #b09d9d; margin-bottom: 30px;" placeholder="短信验证码"/>
            <img src="static/replace/img/s-img_08.png" alt="小锁" class="img-11"/>
            <a id="sendSmsVerifyCode" style="position:absolute; top:465px; right:85px; font-family: '微软雅黑'; font-size: 16px;">发送验证码</a>
            <span id="sended_tip" style="position:absolute; top:465px; right:85px; color: #c3c3c3;"></span>
        </div>
        <input type="button" id="button1" value="立即注册"/>
    </form>
</div>
</body>
</html>

<script>

    /* ======================== 注册 BEGIN ================ */
    $("#button1").click(function () {
        var USERNAME, PASSWORD, CONFIRM_PASSWORD;

        // check input
        USERNAME = $("input[name='USERNAME']");
        if ($.trim(USERNAME.val()) === "") {
            USERNAME.tips({
                side: 2,
                msg: '请输入用户名',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }
        if ($("#EXIST_USERNAME").val() != "") {
            USERNAME.tips({
                side: 2,
                msg: '账号已存在',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        var mobile_reg = /^1\d{10}$/;
        if (!mobile_reg.test(USERNAME.val())) {
            USERNAME.tips({
                side: 2,
                msg: ' 用户名必须是手机号',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        PASSWORD = $("input[name='PASSWORD']");
        if ($.trim(PASSWORD.val()) === "") {
            PASSWORD.tips({
                side: 2,
                msg: '请输入设置密码',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }
        if ($.trim(PASSWORD.val()).length < 6) {
            PASSWORD.tips({
                side: 2,
                msg: '设置密码至少6位',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        CONFIRM_PASSWORD = $("input[name='CONFIRM_PASSWORD']");
        if ($.trim(CONFIRM_PASSWORD.val()) === "") {
            CONFIRM_PASSWORD.tips({
                side: 2,
                msg: '请输入确认密码',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        if ($.trim(PASSWORD.val()) !== $.trim(CONFIRM_PASSWORD.val())) {
            CONFIRM_PASSWORD.tips({
                side: 2,
                msg: '确认密码与设置密码不一致',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        var SmsVerifyCode = $("input[name='SmsVerifyCode']");
        if ($.trim(SmsVerifyCode.val()) === "") {
            SmsVerifyCode.tips({
                side: 2,
                msg: '请输入短信验证码',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        var SecCode = $("input[name='SecCode']");
        if ($.trim(SecCode.val()) === "") {
            SecCode.tips({
                side: 2,
                msg: '请输入验证码',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        var postData = {
            USERNAME: $.trim(USERNAME.val()),
            PASSWORD: $.trim(PASSWORD.val()),
            SmsVerifyCode: $.trim(SmsVerifyCode.val()),
            SecCode: $.trim(SecCode.val())
        };

        // post data
        $.ajax({
            type: "POST",
            url: 'webuser/registerUser.do',
            data: postData,
            dataType: 'json',
            cache: false,
            success: function (data) {
                if ("success" == data.msg) {
                    alert("用户注册成功");
                    $("#codeImg").click();
                    $(".login1").find("input").val(""); // reset data
                } else if ("usererror" == data.msg) {
                    USERNAME.tips({
                        side: 2,
                        msg: "用户名已存在",
                        bg: '#FF5080',
                        time: 3
                    }).focus();
                } else if ("sms code error" == data.msg) {
                    SmsVerifyCode.tips({
                        side: 2,
                        msg: "短信验证码不匹配",
                        bg: '#FF5080',
                        time: 3
                    }).focus();
                } else if ("sec code error" == data.msg) {
                    SecCode.tips({
                        side: 2,
                        msg: "验证码不匹配",
                        bg: '#FF5080',
                        time: 3
                    }).focus();
                }
            }
        });
    });

    //判断用户名是否存在
    $("input[name='USERNAME']").change(function () {
        var USERNAME = $(this);
        $("#EXIST_USERNAME").val("");
        $("#sendSmsVerifyCode").attr("disabled", true);
        $.ajax({
            type: "POST",
            url: '<%=basePath%>/web/user/hasU',
            data: {USERNAME: $.trim(USERNAME.val())},
            dataType: 'json',
            cache: false,
            success: function (data) {
                if ("success" !== data.result) {
                    $("#EXIST_USERNAME").val("1");
                    USERNAME.tips({
                        side: 2,
                        msg: "用户名已存在",
                        bg: '#FF5080',
                        time: 3
                    }).focus();
                } else {
                    $("#sendSmsVerifyCode").removeAttr("disabled");
                }
            }
        });
    });

    /**
     * 短信验证
     **/
    $("#sendSmsVerifyCode").click(function () {
        var USERNAME;
        // check input
        USERNAME = $("input[name='USERNAME']");
        if ($.trim(USERNAME.val()) === "") {
            USERNAME.tips({
                side: 2,
                msg: '请输入用户名',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        if ($("#EXIST_USERNAME").val() != "") {
            USERNAME.tips({
                side: 2,
                msg: ' 用户名已存在',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        var mobile_reg = /^1\d{10}$/;
        if (!mobile_reg.test(USERNAME.val())) {
            USERNAME.tips({
                side: 2,
                msg: '用户名必须是手机号',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }

        var SecCode = $("#SecCode");
        if ($.trim(SecCode.val()) === "") {
            SecCode.tips({
                side: 2,
                msg: '请输入验证码',
                bg: '#AE81FF',
                time: 3
            }).focus();
            return false;
        }


        $.ajax({
            type: "POST",
            url: 'webuser/sendSmsVerifyCode.do',
            data: {PHONE: $.trim(USERNAME.val()), CODE: "SMS_6355037", SECCODE: $.trim(SecCode.val())},
            dataType: 'json',
            cache: false,
            success: function (data) {
                if ("success" == data.msg) {
                    alert("验证码发送成功");
//                    $("#codeImg").click();
                    $("#sendSmsVerifyCode").attr("disabled", true).hide();
                    countDown($("#sended_tip"), 120, "后重新发送", function () {
                        $("#sendSmsVerifyCode").removeAttr("disabled").show();
                    });
                } else if ("not mobile" == data.msg) {
                    input_tip(USERNAME, "手机号错误");
//                    $("#codeImg").click();
                } else if ("sec code error" == data.msg) {
                    input_tip(SecCode, "验证码错误");
                } else if ("not minute" == data.msg){
                    alert("还未超过2分钟，不可以发送验证码");
                    $("#codeImg").click();
                } else if ("sec code null" == data.msg){
                    alert("请输入验证码");
                } else {
                    alert("短信平台异常，请联系客服。");
                }
            }
        });
    });



</script>
