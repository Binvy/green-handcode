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
		<!-- button css -->
		<link rel="stylesheet" href="assets/css/buttons.css">

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
		<script src="js/customer.js"></script>
		<script src="js/broad.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">宽带业务受理</a>
				</li>
				<li class="active">
					宽带停复
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="icon-adjust blue"></i>
								宽带停复&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
							</h3>
						</div>
						
						<!-- 面板头部：身份证验证 -->
						<div class="panel-heading">
							<div class="row">
						    	<div class="col-xs-3">
						    		<h5 align="left" style="color:#6d3353; font-weight: bold; font-family: serif;">
						    		<span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
						    		身份证信息验证</h5>
						    	</div>
						    	<div class="col-xs-3">
				    				<button type="button" class="btn btn-sm btn-purple" onclick="ReadIDCard()">
    									<span class="glyphicon glyphicon-qrcode" aria-hidden="true"></span>
           							 	自动扫描
           							</button>
						    	</div>
						    	<div class="col-xs-3">
									<button type="button" class="btn btn-sm btn-purple"
											data-toggle="collapse" data-target="#collapseOne1" 
											aria-expanded="false" aria-controls="collapseOne1">
										<span class="glyphicon glyphicon-pencil" ></span>
									 	 手动输入
									</button>
								</div>
								<div class="col-xs-3">
							        <button type="button" class="btn btn-sm btn-purple" onclick="CheckIDCard()">
										<span class="glyphicon glyphicon-refresh" ></span>
									  	信息验证
									</button>
								</div>
							</div>
							<div id="collapseOne1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
						      <div class="panel-body">
						      		<label for="cardId" class="col-sm-2 control-label" style="text-align: right;">用户姓名</label>
									<div class="col-sm-3">
										<input class="form-control" id="cardName" type="text" placeholder="请输入用户姓名"/>
									</div>
									<label for="cardId" class="col-sm-2 control-label" style="text-align: right;">身份证号码</label>
									<div class="col-sm-3">
										<input class="form-control" id="cardId" type="text" placeholder="请输入身份证号码"/>
									</div>
						      </div>
						    </div>
						</div>
					
						<div class="panel-body">
							<!-- <form class="form-horizontal" role="form">  -->
								<div class="tabbable" id="tabtable1">
									<div id="tab-head" style="margin-bottom: 30px; text-align: center;">	
										<div id="tab1" style="width:12%; height:20px; display: inline-block;">
									    	<a href="#panel-1" data-toggle="tab" class="button button-glow button-pill button-raised button-primary" style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							电话停复
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
										<div id="tab2" style="width:12%; height:20px; display: inline-block; ">
									    	<a href="#panel-2" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							客户信息
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
							        	<div id="tab3" style="width:12%; height:20px; display: inline-block; ">
						 					<a href="#panel-3" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
						 						<i class="red icon-money"></i>
						 						账户信息
						 					</a>
					 					</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								       <div id="tab4" style="width:12%; height:20px; display: inline-block; ">
							 				<a href="#panel-4" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="green icon-phone"></i>
							 					用户信息
							 				</a>
						 				</div>
					 				</div>
									<div class="tab-content">
										<!-- 宽带停复 -->
										<div class="tab-pane active" id="panel-1">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="businessKey" class="col-sm-1 control-label">
					 								宽带账号<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="userId" type="hidden"/>
													<input class="form-control" id="businessKey" type="text" placeholder="（输入宽带账号）查询"/>
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnChooseUser">
															<i class="ace-icon fa fa-calendar bigger-110"></i>
															查询
														</button>
													</span>
													</div>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userName1" class="col-sm-1 control-label">用户名称</label>
												<div class="col-sm-7">
													<input class="form-control" id="userName1" type="text" readonly/>
												</div>
											</div>
											<div class="hr hr-18 dotted hr-double"></div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="oldPhoneLevel" class="col-sm-1 control-label">现状态</label>
												<div class="col-sm-3">
													<input id="oldUserStatus" type="hidden" />
					 								<input type="text" class="form-control" id="oldStatus" readonly />
												</div>
					 							<label for="newPhoneLevel" class="col-sm-1 control-label">新状态</label>
												<div class="col-sm-3">
													<select class="form-control" id="newStatus" role="option">
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="resetRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="resetRemark" type="text" placeholder="请输入备注"/>
												</div>
											</div>
										</div>
										
										<!-- 客户信息 -->
										<div class="tab-pane" id="panel-2">
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="deptArea" class="col-sm-1 control-label">业务区域</label>
												<div class="col-sm-3">
													<select class="form-control" id="deptArea">
													</select>
												</div>
												<label for="operator" class="col-sm-1 control-label">运营商</label>
												<div class="col-sm-3">
													<select class="form-control" id="operator">
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="customerType" class="col-sm-1 control-label">客户类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="customerType">
													</select>
												</div>
												<label for="vip" class="col-sm-1 control-label">信誉度</label>
												<div class="col-sm-3">
													<select class="form-control" id="vip">
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="creditor" class="col-sm-1 control-label">大客户</label>
												<div class="col-sm-3">
													<input id="creditor" type="hidden"/>
													<input class="form-control" id="creditorName" type="text" placeholder="输入或生成大客户号" readonly />
												</div>
					 							<label for="customerNo" class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-3">
													<input id="customerId" type="hidden"/>
													<input class="form-control" id="customerNo" type="text" placeholder="输入或生成大客户号" readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="name" class="col-sm-1 control-label">名称</label>
												<div class="col-sm-7">
													<input class="form-control" id="name" type="text" placeholder="请输入个人姓名或公司名称" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="address" class="col-sm-1 control-label">地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="address" type="text" placeholder="请输入地址" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="certId" class="col-sm-1 control-label">证件号码</label>
												<div class="col-sm-3">
													<input class="form-control" id="certId" type="text" placeholder="请输入证件号码" />
												</div>
					 							<label for="linker" class="col-sm-1 control-label">联系人</label>
												<div class="col-sm-3">
													<input class="form-control" id="linker" type="text" placeholder="请输入联系人姓名" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="linkAddress" class="col-sm-1 control-label">联系地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="linkAddress" type="text" placeholder="请输入联系地址" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="linkPhone" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="linkPhone" type="text" placeholder="请输入联系电话" />
												</div>
					 							<label for="email" class="col-sm-1 control-label">电子邮件</label>
												<div class="col-sm-3">
													<input class="form-control" id="email" type="email" placeholder="请输入电子邮箱" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="remark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="remark" type="text" placeholder="请输入备注"/>
												</div>
											</div>
										</div>
										
										<!-- 账户信息 -->
										<div class="tab-pane" id="panel-3">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-7">
													<input id="accountId" type="hidden" />
													<input class="form-control" id="customerNo1" type="text" readonly />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="payMethod" class="col-sm-1 control-label">支付方法</label>
												<div class="col-sm-3">
													<select class="form-control" id="payMethod">
													</select>
												</div>
												<label for="payPolicy" class="col-sm-1 control-label">付费类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="payPolicy">
													</select> 
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="amount" class="col-sm-1 control-label">账户余额</label>
												<div class="col-sm-3">
													<div class="input-group">
														<div class="input-group-addon">
															<span>￥</span>
														</div>
														<input class="form-control" id="amount" type="text" value="0" readonly/>
													</div>
												</div>
					 							<label for="score" class="col-sm-1 control-label">积分</label>
												<div class="col-sm-3">
													<div class="input-group">
														<div class="input-group-addon">
															<span>点</span>
														</div>
														<input class="form-control" id="score" type="text" value="0" readonly/>
													</div>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="accRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="accRemark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 用户信息 -->
										<div class="tab-pane" id="panel-4">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-3">
													<input class="form-control" id="customerNo2" type="text" readonly />
												</div>
					 							<label for="acc" class="col-sm-1 control-label">上网账号</label>
												<div class="col-sm-3">
													<input id="userId" type="hidden"/>
													<input class="form-control" id="acc" type="text" placeholder="请输入宽带登录用户名"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="deviceCode" class="col-sm-1 control-label">宽带类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="deviceCode">
													</select>
												</div>
					 							<label for="userPwd" class="col-sm-1 control-label">登录口令</label>
												<div class="col-sm-3">
													<input class="form-control" id="userPwd" type="text" placeholder="请输入登录口令"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userName" class="col-sm-1 control-label">用户名称</label>
												<div class="col-sm-7">
													<input class="form-control" id="userName" type="text" placeholder="请输入用户名称"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="userAddress" class="col-sm-1 control-label">安装地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="userAddress" type="text" placeholder="点击选择安装地址"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="postAddress" class="col-sm-1 control-label">邮政地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="postAddress" type="text" placeholder="请输入市政标准地址"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userLinkPhone" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="userLinkPhone" type="text" placeholder="请输入联系电话"/>
												</div>
												<label for="creditorKey" class="col-sm-1 control-label">代缴电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="creditorKey" type="text" placeholder="请输入代缴电话" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="notifyPolicy" class="col-sm-1 control-label">提醒策略</label>
												<div class="col-sm-3">
													<select class="form-control" id="notifyPolicy">
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="outerVlan" class="col-sm-1 control-label">VLAN</label>
												<div class="col-sm-3">
													<input class="form-control" id="outerVlan" type="text" placeholder="请输入VLAN账号" />
												</div>
					 							<label class="col-sm-1 control-label">绑定MAC</label>
												<div class="col-sm-3">
													<input class="form-control" id="macAddress" type="text" placeholder="请输入绑定的MAC地址" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="speed" class="col-sm-1 control-label">带宽</label>
												<div class="col-sm-3">
													<select class="form-control" id="speed">
													</select>
												</div>
												<label for="creditorRel" class="col-sm-1 control-label">费用转移</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="creditorTemplateId" type="hidden" />
													<input id="creditorTargetCustomerId" type="hidden" />
													<input id="creditorTargetUserId" type="hidden" />
													<input id="creditKey" type="hidden" />
													<input class="form-control" id="creditorRel" type="text" placeholder="设置代缴" />
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnSetupCreditor">
															设置
														</button>
													</span>
													</div>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="userRemark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
									</div>
								</div>					
							<!-- </form> -->
						</div>
						
						<div class="panel-footer" style="text-align: right;">
							<button type="button" id="save" class="btn btn-sm btn-primary" >提交</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
							<button type="button" id="lastpage" class="btn btn-sm btn-primary">上一页</button>
							<button type="button" id="nextpage" class="btn btn-sm btn-primary">下一页</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var parentProductId = "b";
		var businessType = "b";
		var opType = "reset";
		var busiType = (businessType + "_" + opType).toLowerCase(); // Used by fee.js
		var deptName = "${sessionScope.userInfo.deptName}";
		
        // 初始化页面控件
        $(document).ready(function () {
            // 初始化下拉框
            loadRefs();
        	//初始化业务区域
        	loadDeptArea();
        	// 设置客户号、客户名称、地址、联系电话值、实收费变化事件
       		initChanged();
       	});
       	
        // 选择号码
        var fnUserChoosed;
        $("#btnChooseUser").click(function() { 
        	$(".khtips").remove();
        	$("#beginStatus").val("2");
        	$("#endStatus").val("4");
        	var phoneNo = $("#businessKey").val();
        	$("#crUser").val(phoneNo);
        	fnUserChoosed = function(userId, businessKey) {
       			$("#userId").val(userId);
       			$("#businessKey").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			$("#businessKey").val(businessKey);
       			$("#userName1").val($("#userName").val());
            	var oldStatus = $("#oldUserStatus").val();
            	var html = "";
            	if (oldStatus == 2) {
            		$("#oldStatus").val("正常");
            		html = '<option value="4" selected="selected">停机</option>';
            	} else if (oldStatus == 4) {
            		$("#oldStatus").val("停机");
            		html = '<option value="2" selected="selected">正常</option>';
            	} else {
            		bbAlert("非正常（未正式开通或已拆除）用户不能停复" + oldStatus);
            	}
            	$("#newStatus").empty();
            	$("#newStatus").append(html);
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
		$("#address").focus(function() {
			fnAddressChoosed = function(address) {
				$("#address").val(address);
			};
			$("#dlgAddress").modal("show");
		});
    	
		$("#btnSetupCreditor").click(function() {
        	fnCreditorChoosed = function(targetCustomerId, targetUserId, templateId) {
        		$("#creditorRel").val(targetCustomerId ? "已设置" : "未设置");	
        		$("#creditorTargetCustomerId").val(targetCustomerId);
        		$("#creditorTargetUserId").val(targetUserId);
        		$("#creditorTemplateId").val(templateId);
        	}; 
        	$("#dlgCreditor").modal("show");
        });
        
    	$("#operator").change(function(){
			$("#userPwd").val($("#operator").val());
		});
    	
        function validate() {
        	if ($("#businessKey").val() == "") {
				addTips(1, 0, "请选择要调级的用户");
        		return false;
        	}
        	var status = $("#oldUserStatus").val();
        	if (status != 2 && status != 3 && status != 4) {
        		addTips(1, 2, "非正常用户，无法停复");
        		return false;
        	}
        	return true;
        }
        
        $("#save").click(function() {
        	var v = validate();
        	if (!v) return;
        	
        	var op = "${sessionScope.userInfo.userName}";
        	var opParams = "";
        	var oldStatus = $("#oldUserStatus").val();
        	var newStatus = $("#newStatus").val();
        	if (oldStatus == 2 && newStatus == 3) {
        		opParams = "ossKey:stop_1,ossKeyName:欠费停机,nextStatus:3";
        	} else if (oldStatus == 2 && newStatus == 4) {
        		opParams = "ossKey:stop,ossKeyName:停机,nextStatus:4";
        	} else if (oldStatus == 3) {
        		opParams = "ossKey:res_1,ossKeyName:单停复机,nextStatus:2";
        	} else if (oldStatus == 4) {
        		opParams = "ossKey:res,ossKeyName:复机,nextStatus:2";
        	}
        	/*
        	if ($("#newUserStatus").get(0).checked) {
        		opParams = "status:2,desc:复机";
        	} else {
        		opParams = "status:3,desc:停机";
        	}
        	*/
        	var remark = "宽带停复机备注:" + ( $("#resetRemark").val() == null ? "" : $("#resetRemark").val() );
        	var parm = {
        		"obj.id": $("#userId").val(),
        		"obj.creator": op,
        		"obj.opType": opType,
        		"obj.businessType": businessType,
        		"obj.remark": opParams + "," + remark
        	};
        	
        	var res = ajaxCRUD("order!resetUser.do", parm, true);
        	if (res.resNum == "0") {
        		reset();
        	}
        });
        
        var index = 1;
        function reset() {
        	$(".khtips").remove();
        	index = 1;
       		$("#save").hide();
       		$('#tab-head a:first').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");   
			$('#tab-head a:not("#tabtable1 a:first")').removeAttr('href').removeClass().addClass("button disabled button-pill button-primary");
			$("#businessKey").val("");
			$("#userName1").val("");
			$("#oldUserStatus").val("");
			$("#oldStatus").val("");
			$("#newStatus").empty();
			$("#resetRemark").val("");
			resetCustomer();
        	resetAccount();
        	resetUser();
        }
        
        $("#reset").click(function() {
        	reset();
        });
        
        $("#tab-head a").on("click",function(){//给tab-panel的超链接定义点击事件，获取tab的index
			var hrefstr = this.href;
        	var tabs = hrefstr.split("#");
        	index = tabs[1].split("-")[1];
        	$('#tab-head a[href]').removeClass().addClass("button button-glow button-border button-pill button-primary");
        	$('#tab'+index+' a').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        });
        
		$("#nextpage").click(function(){
			$(".khtips").remove();
			var flag;
			if( index == 1 ){
				flag = validate();
				if (!flag) return;
        		index++;
        		btncss(1);
			}else if( index == 2 ){
        		index++;
        		btncss(2);
			}else if( index == 3 ){
        		index++;
        		btncss(3);
				$("#save").show();
			}else if( index == 4 ){
				bootbox.alert({
					locale : "zh_CN",
					size : 'small',
					title : "提示",
					message : "已经在最后一页了"
				});
			}else{
				return;
			}
		})
		
		$("#lastpage").click(function(){
			if(index > 1){
				index--;
				$('#tab-head a[href="#panel-'+index+'"]').tab('show'); 
				$('#tab'+index+' a').removeClass().addClass("button button-pill button-raised button-primary");
				$('#tab'+(index+1)+' a').removeClass().addClass("button button-glow button-border button-pill button-primary");
			}else{
				bootbox.alert({
					locale : "zh_CN",
					size : 'small',
					title : "提示",
					message : "现在在首页页面"
				});
				return;				
			}
		})
        </script>
        
		<jsp:include page="../pub/userDlg.jsp" flush="true"/>
        <jsp:include page="../pub/addressDlg.jsp" flush="true"/>
        <jsp:include page="../pub/creditorDlg.jsp" flush="true"/>
	</body>
</html>
