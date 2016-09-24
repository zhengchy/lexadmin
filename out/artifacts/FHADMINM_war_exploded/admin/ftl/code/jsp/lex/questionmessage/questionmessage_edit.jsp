<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="questionmessage/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="QUESTIONMESSAGE_ID" id="QUESTIONMESSAGE_ID" value="${pd.QUESTIONMESSAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发起人:</td>
								<td><input type="text" name="LAUNCH_USER_ID" id="LAUNCH_USER_ID" value="${pd.LAUNCH_USER_ID}" maxlength="100" placeholder="这里输入发起人" title="发起人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">接收人:</td>
								<td><input type="text" name="RECEIVE_USER_ID" id="RECEIVE_USER_ID" value="${pd.RECEIVE_USER_ID}" maxlength="100" placeholder="这里输入接收人" title="接收人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">问答ID:</td>
								<td><input type="text" name="QUESTION_ID" id="QUESTION_ID" value="${pd.QUESTION_ID}" maxlength="100" placeholder="这里输入问答ID" title="问答ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消息类型:</td>
								<td><input type="text" name="MESSAGE_TYPE" id="MESSAGE_TYPE" value="${pd.MESSAGE_TYPE}" maxlength="2" placeholder="这里输入消息类型" title="消息类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消息文本:</td>
								<td><input type="text" name="MESSAGE_NOTE" id="MESSAGE_NOTE" value="${pd.MESSAGE_NOTE}" maxlength="100" placeholder="这里输入消息文本" title="消息文本" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消息状态:</td>
								<td><input type="text" name="MESSAGE_STATE" id="MESSAGE_STATE" value="${pd.MESSAGE_STATE}" maxlength="2" placeholder="这里输入消息状态" title="消息状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" maxlength="32" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td><input type="text" name="UPDATE_TIME" id="UPDATE_TIME" value="${pd.UPDATE_TIME}" maxlength="32" placeholder="这里输入修改时间" title="修改时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">推送状态:</td>
								<td><input type="number" name="PUSH_STATE" id="PUSH_STATE" value="${pd.PUSH_STATE}" maxlength="32" placeholder="这里输入推送状态" title="推送状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#LAUNCH_USER_ID").val()==""){
				$("#LAUNCH_USER_ID").tips({
					side:3,
		            msg:'请输入发起人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LAUNCH_USER_ID").focus();
			return false;
			}
			if($("#RECEIVE_USER_ID").val()==""){
				$("#RECEIVE_USER_ID").tips({
					side:3,
		            msg:'请输入接收人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RECEIVE_USER_ID").focus();
			return false;
			}
			if($("#QUESTION_ID").val()==""){
				$("#QUESTION_ID").tips({
					side:3,
		            msg:'请输入问答ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QUESTION_ID").focus();
			return false;
			}
			if($("#MESSAGE_TYPE").val()==""){
				$("#MESSAGE_TYPE").tips({
					side:3,
		            msg:'请输入消息类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MESSAGE_TYPE").focus();
			return false;
			}
			if($("#MESSAGE_NOTE").val()==""){
				$("#MESSAGE_NOTE").tips({
					side:3,
		            msg:'请输入消息文本',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MESSAGE_NOTE").focus();
			return false;
			}
			if($("#MESSAGE_STATE").val()==""){
				$("#MESSAGE_STATE").tips({
					side:3,
		            msg:'请输入消息状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MESSAGE_STATE").focus();
			return false;
			}
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
			if($("#UPDATE_TIME").val()==""){
				$("#UPDATE_TIME").tips({
					side:3,
		            msg:'请输入修改时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_TIME").focus();
			return false;
			}
			if($("#PUSH_STATE").val()==""){
				$("#PUSH_STATE").tips({
					side:3,
		            msg:'请输入推送状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PUSH_STATE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>