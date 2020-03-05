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
		<script src="js/user.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					电话调级
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
								<i class="icon-resize-vertical blue"></i>
								电话调级&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red; font-size: 10px; background-color: transparent;">( 带 * 的为必填项  )</code>
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
					 							电话调级
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
										<!-- 调级 -->
										<div class="tab-pane active" id="panel-1">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="businessKey" class="col-sm-1 control-label">
					 								电话号码<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="userId" type="hidden"/>
													<input class="form-control" id="businessKey" type="text" placeholder="（输入号码）查询"/>
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
					 							<label for="oldPhoneLevel" class="col-sm-1 control-label">现级别</label>
												<div class="col-sm-3">
													<select class="form-control" id="oldPhoneLevel" role="option" disabled="disabled"></select>
												</div>
					 							<label for="newPhoneLevel" class="col-sm-1 control-label">新级别</label>
												<div class="col-sm-3">
													<select class="form-control" id="newPhoneLevel" role="option"></select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="adjustRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="adjustRemark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 客户信息 -->
										<div class="tab-pane" id="panel-2">
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="deptArea" class="col-sm-1 control-label">业务区域</label>
												<div class="col-sm-7">
													<select class="form-control" id="deptArea"></select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="customerType" class="col-sm-1 control-label">客户类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="customerType"></select>
												</div>
												<label for="vip" class="col-sm-1 control-label">信誉度</label>
												<div class="col-sm-3">
													<input class="form-control" id="vip" type="text" />
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
												<div class="col-sm-3">
													<input id="accountId" type="hidden" />
													<input class="form-control" id="customerNo1" type="text" readonly />
												</div>
												<label for="payPolicy" class="col-sm-1 control-label">付费类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="payPolicy"></select> 
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
												<label for="overdueFlag" class="col-sm-1 control-label">滞纳金</label>
												<div class="col-sm-3">
													<select class="form-control" id="overdueFlag">
														<option value="0">不收取</option>
														<option value="1">收取</option>
													</select>
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
					 							<label for="phoneNo" class="col-sm-1 control-label">电话号码</label>
												<div class="col-sm-3">
													<input class="form-control" id="phoneNo" type="text" placeholder="请输入电话号码"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="deviceCode" class="col-sm-1 control-label">电话类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="deviceCode"></select>
												</div>
												<div class="col-sm-4"></div>
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
													<input class="form-control" id="userAddress" type="text" placeholder="请输入安装地址"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userLinkPhone" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="userLinkPhone" type="text" placeholder="请输入联系电话"/>
												</div>
												<label for="userPwd" class="col-sm-1 control-label">查询密码</label>
												<div class="col-sm-3">
													<input class="form-control" id="userPwd" type="password" placeholder="请输入查询密码"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="phoneLevel" class="col-sm-1 control-label">电话级别</label>
												<div class="col-sm-3">
													<select class="form-control" id="phoneLevel"></select>
												</div>
												<label for="security" class="col-sm-1 control-label">保密级别</label>
												<div class="col-sm-3">
													<select class="form-control" id="security"></select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="callPolicy" class="col-sm-1 control-label">催缴策略</label>
												<div class="col-sm-3">
													<select class="form-control" id="callPolicy"></select>
												</div>
					 							<label for="adjustPolicy" class="col-sm-1 control-label">调级策略</label>
												<div class="col-sm-3">
													<select class="form-control" id="adjustPolicy"></select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="userNo" class="col-sm-1 control-label">用户编号</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input class="form-control" id="userNo" type="text" placeholder="选择编号"/>
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnChooseUserNo">
															<i class="ace-icon fa fa-calendar bigger-110"></i>
															选择
														</button>
													</span>
													</div>
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
													<input class="form-control" id="userRemark" type="text" placeholder="请输入备注"/>
												</div>
											</div>
										</div>
									</div>
								</div>					
							<!-- </form> -->
						</div>
						
						<div class="panel-footer" style="text-align: right; ">
							<button type="button" id="save" class="btn btn-sm btn-primary">提交</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
							<button type="button" id="lastpage" class="btn btn-sm btn-primary" style="display: none;">上一页</button>
							<button type="button" id="nextpage" class="btn btn-sm btn-primary">下一页</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var parentProductId = "p";
		var businessType = "p";
		var opType = "adjust";
		var busiType = (businessType + "_" + opType).toLowerCase(); // Used by fee.js
		var deptName = "${sessionScope.userInfo.deptName}";
		
        // 初始化页面控件
        $(document).ready(function () {
            // 初始化下拉框
            loadRefs();
            // 初始化新老电话级别下拉框
            loadRef("ref_phone_level", "oldPhoneLevel");
            loadRef("ref_phone_level", "newPhoneLevel");
         	// 设置客户号、客户名称、地址、联系电话值、实收费变化事件
       		initChanged();
       	});
       	
        // 选择号码
        var fnUserChoosed;
        $("#btnChooseUser").click(function () { 
        	$(".khtips").remove();
        	//$("#userStatus").val("2");
        	var phoneNo = $("#businessKey").val().trim();
        	$("#crUserKey").val(phoneNo);
        	fnUserChoosed = function (userId, businessKey) {
       			$("#userId").val(userId);
       			$("#businessKey").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			$("#userName1").val($("#userName").val());
       			$("#oldPhoneLevel").val($("#phoneLevel").val());
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        function validate() {
        	$(".khtips").remove();
        	if ($("#businessKey").val().trim() === "") {
        		addTips(1, 0, "请选择要调级的电话");
        		return false;
        	}
        	if ($("#oldPhoneLevel").val() === $("#newPhoneLevel").val()) {
        		addTips(1, 2, "新级别与原级别一致，无效的操作");
        		return false;
        	}
        	return true;
        }
        
        $("#save").click(function () {
        	var v = validate();
        	if (!v) {
        		return;	
        	}
        	
        	var op = "${sessionScope.userInfo.userName}";
        	var remark = "电话调级备注:" + ($("#adjustRemark").val() ? $("#adjustRemark").val() : "") + ";";
        	var opParams = "oldPhoneLevel:" + $("#oldPhoneLevel").val() 
        					+ ",newPhoneLevel:" + $("#newPhoneLevel").val()
        					+ ",ossKey:" + $("#newPhoneLevel").val()
        					+ ",ossKeyName:调级";
        	var parm = {
        		"obj.id": $("#userId").val(),
        		"obj.creator": op,
        		"obj.opType": opType,
        		"obj.businessType": businessType,
        		"obj.remark": opParams + "," + remark
        	};
        	
        	var res = ajaxCRUD("order!adjustUser.do", parm, true);
        	if (res.resNum === "0") {
        		reset();
        	}
        });
        
        var index = 1;
        function reset() {
        	$(".khtips").remove();
        	index = 1;
        	$("#lastpage").hide();
        	$('#tab-head').find('a:eq(0)').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        	$('#tab-head a').not('a:eq(0)').removeClass().addClass("button button-glow button-border button-pill button-primary");   	
			$("#businessKey").val("");
			$("#userName1").val("");
			$("#oldPhoneLevel").val("J1");
			$("#newPhoneLevel").val("J1");
			$("#adjustRemark").val("");
			resetCustomer();
        	resetAccount();
        	resetUser();
        }
        
        $("#reset").click(function () {
        	reset();
        });
        
        $("#tab-head a").on("click", function () {
			var hrefstr = this.href;
        	var tabs = hrefstr.split("#");
        	index = parseInt(tabs[1].split("-")[1]);
			$('#tab-head a[href]').removeClass().addClass("button button-glow button-border button-pill button-primary");
        	$('#tab'+index+' a').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        	tabbtn(index, 4);
        });
        
        /*上下页翻页*/
        $("#nextpage").click(function () {
        	$(".khtips").remove();
			var flag;
			if (index === 1) {
				flag = validate();
	        	if (!flag) {
	        		return;	
	        	}
			}
			index++;
			tabcss(index, this.id);
			tabbtn(index, 4);
		});
		
		$("#lastpage").click(function () {
			index--;
			tabcss(index, this.id);
			tabbtn(index, 4);
		});
		
        </script>
        
		<jsp:include page="../pub/userDlg.jsp" flush="true"/>
		<jsp:include page="../pub/addressDlg.jsp" flush="true"/>
	</body>
</html>
