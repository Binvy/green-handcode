<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<!-- page specific plugin styles -->
		<!-- fonts -->
		<link rel="stylesheet" href="assets/font/fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker/datetimepicker.css" />
		<link rel="stylesheet" href="assets/css/chosen.css" />
		<!-- zTree -->
		<link rel="stylesheet" href="assets/css/zTreeStyle/metro.css">
		<!-- inline styles related to this page -->
		<link rel="stylesheet" href="css/datatable.css">

		<script src="assets/js/ace-extra.min.js"></script>	
		<!-- inline styles related to this page -->
		
		<!-- basic scripts -->
		<script src="assets/js/handlebars-v3.0.1.js"></script>
		<script type="text/javascript" src="assets/js/crud/crud.js"></script>
		
		<script src='assets/js/jquery-2.0.3.min.js'></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script src="assets/js/chosen.jquery.min.js"></script>
		<script src="assets/js/jquery.dataTables.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="assets/js/crud/crud.js"></script>
		<script src="assets/js/datepicker/bootstrap-datetimepicker.js"></script>
		<script src="assets/js/datepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="assets/js/jquery.tabledit.min.js"></script>
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<!-- Customize -->
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li class="active">
					<i class="icon-home home-icon"></i>
					保障受理
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel panel-default">
						<div class="panel-body">
							<!-- 用户查询面板 -->
							<div class="row">
								<div class="col-xs-12 col-sm-12 widget-container-col">
									<div class="widget-box widget-color-dark">
										<div class="widget-header">
											<h5 class="widget-title bigger lighter">
												<i class="icon-user blue bigger-110"></i>
												用户信息
											</h5>
										</div>
									</div>
									<div class="widget-body">
										<div class="widget-main padding-8">
											<div class="row form-group">
												<label for="phoneNo" class="col-sm-1 control-label">来电号码</label>
												<div class="col-sm-3">
													<input class="form-control" id="callNumber" type="text" value="${jobFaultInfo.phoneNo}" readonly/>
												</div>
					 							<label for="businessType" class="col-sm-1 control-label">业务类型</label>
												<div class="col-sm-3">
													<select id="businessType" class="form-control" >
														<option role="option" value="p">电话</option>
														<option role="option" value="b">宽带</option>
														<option role="option" value="a">ADSL</option>
														<option role="option" value="l">专线</option>
														<option role="option" value="n">新业务</option>
													</select>
												</div>
												<label for="sysUserName" class="col-sm-1 control-label">工号</label>
												<div class="col-sm-3">
													<input class="form-control" id="sysUserName" type="text" value="${jobFaultInfo.userName}" readonly/>
												</div>
											</div>
											<div class="hr hr-18 dotted hr-double"></div>
											<div class="row form-group">
												<label for="userKey" class="col-sm-1 control-label">业务标识</label>
												<div class="col-sm-3">
													<div class="input-group">
														<input id="userKey" type="hidden"/>
														<input id="userId" type="hidden"/>
														<input id="customerId" type="hidden"/>
														<input class="form-control" id="crKey" type="text" placeholder="电话号码、上网账号"/>
														<span class="input-group-btn">
															<button class="btn btn-sm btn-default" id="btnChooseUser">
																<i class="icon-search bigger-110"></i>
																查询
															</button>
														</span>
													</div>
												</div>
					 							<label for="userName" class="col-sm-1 control-label">用户名称</label>
												<div class="col-sm-3">
													<input class="form-control" id="userName" type="text" readonly/>
												</div>
					 							<label for="userAddress" class="col-sm-1 control-label">用户地址</label>
												<div class="col-sm-3">
													<input class="form-control" id="userAddress" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="businessArea" class="col-sm-1 control-label">用户区域</label>
												<div class="col-sm-3">
													<input class="form-control" id="businessArea" type="text" readonly/>
												</div>
					 							<label for="installTime" class="col-sm-1 control-label">装机日期</label>
												<div class="col-sm-3">
													<input class="form-control" id="installTime" type="text" readonly/>
												</div>
					 							<label for="userStatus" class="col-sm-1 control-label">用户状态</label>
												<div class="col-sm-3">
													<select class="form-control" id="userStatus" >
														<option value="2">正常</option>
														<option value="3">欠费停机</option>
														<option value="4">停机</option>
													</select>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="userInfo" class="col-sm-1 control-label">用户信息</label>
												<div class="col-sm-11">
													<input class="form-control" id="userInfo" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="lineInfo" class="col-sm-1 control-label">号线信息</label>
												<div class="col-sm-11">
													<input class="form-control" id="lineInfo" type="text" readonly/>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						
							<div class="row">
								<div class="col-xs-12 col-sm-12 widget-container-col">
									<div class="widget-box widget-color-dark">
										<div class="widget-header">
											<h5 class="widget-title bigger lighter">
												<i class="icon-legal green bigger-110"></i>
												故障受理
											</h5>
										</div>
									</div>
									<div class="widget-body">
										<div class="widget-main padding-8">
											<div class="row form-group">
					 							<label for="faultDesc" class="col-sm-1 control-label">故障现象</label>
												<div class="col-sm-3">
													<input class="form-control" id="faultDesc" type="text"/>
												</div>
					 							<label for="faultReason" class="col-sm-1 control-label">现象选项</label>
												<div class="col-sm-3">
													<select id="faultReason" class="form-control" >
													</select>
												</div>
					 							<label for="contactor" class="col-sm-1 control-label">联系人</label>
												<div class="col-sm-3">
													<input class="form-control" id="contactor" type="text"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="contactPhone" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="contactPhone" type="text"/>
												</div>
					 							<label for="remark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="remark" type="text"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="maintainResult" class="col-sm-1 control-label">维修结果</label>
												<div class="col-sm-3">
													<input class="form-control" id="maintainResult" type="text"/>
												</div>
					 							<label for="faultJudge" class="col-sm-1 control-label">结果选项</label>
												<div class="col-sm-3">
													<select id="faultJudge" class="form-control" >
													</select>
												</div>
					 							<label for="userAd" class="col-sm-1 control-label">客户意见</label>
												<div class="col-sm-3">
													<input class="form-control" id="userAd" type="text"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="sysUserDept" class="col-sm-1 control-label">受理部门</label>
												<div class="col-sm-3">
													<input class="form-control" id="sysUserDept" type="text" readonly/>
												</div>
					 							<label for="finishedFlag" class="col-sm-1 control-label">完工标记</label>
												<div class="col-sm-3">
													<select id="finishedFlag" class="form-control" >
														<option value="1">是</option>
														<option value="0">否</option>
													</select>
												</div>
					 							<label for="nextDept" class="col-sm-1 control-label">流转部门</label>
												<div class="col-sm-3">
													<select id="nextDept" class="form-control" >
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="panel-footer">
							<button type="button" id="save" class="btn btn-sm btn-primary">保存</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var businessType = "${jobFaultInfo.businessType}";
		var sysUserName = "${jobFaultInfo.userName}";
		var callNumber = "${jobFaultInfo.phoneNo}";
		
        // 初始化页面控件
        $(document).ready(function () {
        	$("#businessType").val(businessType);
        	loadRefByKey("ref_fault_reason", "BUSINESS_TYPE", businessType, "faultReason", true);
        	loadRefByKey("ref_fault_judge", "BUSINESS_TYPE", businessType, "faultJudge", true);
        	var res = ajaxCRUD("user!findByUserName.do", {"id": sysUserName }, false);
        	if (res != undefined && res.obj != undefined) { 
        		$("#sysUserDept").val(res.obj.roleName);
        	}
        	loadRole();
        	// 根据电话号码查询历史记录
        	res = ajaxCRUD("jobFault!findLastByPhoneNo.do", { "obj.callNumber": callNumber, "obj.faultType": businessType }, false);
        	if (res.obj != undefined && res.obj != null && res.obj.businessKey != null) {
        		var obj = res.obj;
        		$("#crKey").val(obj.businessKey);
        		loadUserInfo(obj.businessKey);
        	} else {
        		// 按照用户的联系电话查找用户信息
        		res = ajaxCRUD("crmUser!findFullInfoByLinkPhone.do", 
        			{
        				"obj.businessType": businessType,
        				"obj.linkPhone": callNumber
        			},
        			false);
        		var obj = res.userFullInfo;
        		if (obj != undefined && obj != null) {
        			showUserInfo(obj);
        		}
        	}
       	});
		
		function loadRole() {
			/*
			var res = ajaxCRUD("role!findAll.do", {}, false);
			var lst = res.lst;
			var html = "";
			html = "<option role='option' value='' selected='selected'>--请选择--</option>";
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option role='option' value='" + item.id + "'>" + item.roleName + "</option>";
			});
			$("#nextDept").empty();
			$("#nextDept").append(html);
			*/
			var html = "<option role='option' value='' selected='selected'>--请选择--</option>" + 
					   "<option value='有线室'>有线室</option>" +	
					   "<option value='网络室'>网络室</option>";
			$("#nextDept").empty();
			$("#nextDept").append(html);
		}
		
		function showUserInfo(obj) {
			$("#userId").val(obj.id);
			$("#userKey").val(obj.businessKey);
			$("#crKey").val(obj.businessKey);
			$("#customerId").val(obj.customerId);
			$("#userName").val(obj.name);
			$("#userAddress").val(obj.address);
			$("#contactPhone").val(obj.linkPhone);
			$("#contactor").val(obj.name);
			$("#businessArea").val(obj.businessArea);
			$("#installTime").val(obj.createTime);
			$("#userStatus").val(obj.status);
			if (businessType == "p") {
				$("#userInfo").val("电话功能 - " + obj.phoneLevel);
			} else if (businessType == "a") {
				var info = "绑定电话 - " + obj.phoneNo + ", MAC地址 - " + obj.macAddress + ", 上网速率 - " + obj.speed;
				$("#userInfo").val(info);
			} else if (businessType == "b") {
				var info = "MAC地址 - " + obj.macAddress + ", 上网速率 - " + obj.speed;
				$("#userInfo").val(info);
			}
		}
		
		function loadUserInfo(businessKey, businessType) {
			var res = ajaxCRUD("crmUser!findFullInfoByBusinessKey.do", {"id": businessKey }, false);
			var obj = res.userFullInfo;
			if (obj == undefined || obj == null) {
				alert("未找到业务标识为" + businessKey + "的用户");
				return;
			}
			showUserInfo(obj);
		}
		
		function loadLineInfo(userId) {
			var res = ajaxCRUD("resPortRoute!findByUserId.do", {"id": userId}, false);
			if (res.lst == null) return;
			var lst = res.lst;
			var html = "";
			html = "";
			$(lst).each(function(index) {
				var item = lst[index];
				if (html != "") html += " --> ";
				html += item.deviceName + item.deviceCode + ":" + item.portCode;
			});
			$("#lineInfo").val(html);
		}
		
        $("#btnChooseUser").click(function() { 
        	var crKey = $("#crKey").val();
        	if (crKey == "") {
        		alert("请输入业务标识(电话号码、账号或业务号)");
        		return;
        	}
        	loadUserInfo(crKey, $("#businessType").val());
        });
        
        $("#save").click(function() {
        	if ($("#userId").val() == "") {
        		alert("请查询故障用户");
        		return;
        	}
        	if ($("#sysUserName").val() == "" || $("#sysUserDept").val() == "") {
        		alert("工号数据不完整，无法保存");
        		return;
        	}
        	var parm = {
        		"obj.faultType": $("#businessType").val(),
        		"obj.callNumber": $("#callNumber").val(),
        		"obj.customerId": $("#customerId").val(),
        		"obj.userId": $("#userId").val(),
        		"obj.businessKey": $("#userKey").val(),
        		"obj.userName": $("#userName").val(),
        		"obj.userAddress": $("#userAddress").val(),
        		"obj.businessArea": $("#businessArea").val(),
        		"obj.setupTime": $("#installTime").val(),
        		"obj.userStatus": $("#userStatus").val(),
        		"obj.userInfo": $("#userInfo").val(),
        		"obj.lineInfo": $("#lineInfo").val(),
        		"obj.faultDesc": $("#faultDesc").val(),
        		"obj.faultReason": $("#faultReason").val(),
        		"obj.contactor": $("#contactor").val(),
        		"obj.contactPhone": $("#contactPhone").val(),
        		"obj.remark": $("#remark").val(),
        		"obj.userAd": $("#userAd").val(),
        		"obj.maintainResult": $("#maintainResult").val(),
        		"obj.faultJudge": $("#faultJudge").val(),
        		"obj.creator": $("#sysUserName").val(),
        		"obj.creatorDept": $("#sysUserDept").val(),
        		"obj.nextDept": $("#nextDept").val(),
        		"obj.finishedFlag": $("#finishedFlag").val(),
        	};
        	var res = ajaxCRUD("jobFault!insert.do", parm, true);
        	if (res.resNum == "0") {
        		reset();
        	}
        });
        
        $("#reset").click(function() {
        	reset();
        });
        
        function reset() {
        	$("#userId").val("");
        	$("#customerId").val("");
        	$("#userKey").val("");
        	$("#crKey").val("");
        	$("#userName").val("");
        	$("#userAddress").val("");
        	$("#businessArea").val("");
        	$("#installTime").val("");
        	$("#userStatus").val("2");
        	$("#userInfo").val("");
        	$("#lineInfo").val("");
        	$("#faultDesc").val("");
        	$("#faultReason").val("");
        	$("#contactor").val("");
        	$("#contactPhone").val("");
        	$("#remark").val("");
        	$("#maintainResult").val("");
        	$("#faultJudge").val("");
        	$("#userAd").val("");
        	$("#sysUserDept").val("");
        	$("#finishedFlag").val("1");
        	$("#nextDept").val("");
        }
        
        </script>
        
	</body>
</html>
		