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
		<!-- fonts -->
		<link rel="stylesheet" href="assets/font/fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
			
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker.css" />
		
		<link rel="stylesheet" href="css/datatable.css">
		 
		<!-- scripts -->
		<script src="assets/js/jquery-1.10.2.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script type="text/javascript" src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="assets/js/crud/crud.js"></script>
		<script src="assets/js/jquery.dataTables.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="assets/js/handlebars-v3.0.1.js"></script>
		<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		 
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">账务管理</a>
				</li>
				<li class="active">
					反销账
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>


		<div class="page-content">
			<div class="col-xs-12">
				<div class="space-6"></div>
				<div class="row">
					<div class="col-sm-12 ">
						<div class="widget-header ">
                            <h4 class="widget-title lighter smaller">
								<i class="icon-fire red"></i>
								反销账
							</h4>
						</div>
						<div class="widget-body">
							<div class="widget-toolbox" id="widget-toolbox-1">
								<div class="btn-toolbar">
									&nbsp;&nbsp;
									<lable for="businessType">类型:</lable>
									<select calss="input-sm" id="businessType" style="width:5%;"></select>&nbsp;&nbsp;
									<lable for="crCustomerNo">客户号:</lable>
									<input id="crCustomerNo" type="text" placeholder="请输入客户号" style="width:10%"/>&nbsp;&nbsp;
									<label for="crBusinessKey">号码:</label>
									<input id="crBusinessKey" type="text" placeholder="请输入号码、账号" value="${accountLog.crBusinessKey}" style="width:10%"/>&nbsp;&nbsp;
									<lable for="crUserName">用户名:</lable>
									<input id="crUserName" type="text" placeholder="请输入用户名" value="${accountLog.crUserName}" style="width:10%"/>&nbsp;&nbsp;
									<label for="crUserAddress">地址:</label>
									<input id="crUserAddress" type="text" placeholder="请输入用户地址" value="${accountLog.crUserAddress}" style="width:20%"/>&nbsp;&nbsp;
                            		<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
                            			<i class="icon-search blue"></i>
                            			查询
                            		</button>
								</div>
							</div>
							<div class="widget-toolbox" id="widget-toolbox-1">
								<span class="red">${accountLog.tip}</span>
							</div>
							<div class="widget-main padding-24">
								<div class="row">
									<div class="col-sm-6">
										<div class="row">
											<div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
												<b>客户信息</b>
											</div>
										</div>
										<div>
											<ul class="list-unstyled spaced">
												<li><i class="icon-caret-right blue"></i>客户编号 : ${accountLog.customer.customerNo}</li>
												<li><i class="icon-caret-right blue"></i>客户名称 : ${accountLog.customer.name}</li>
												<li><i class="icon-caret-right blue"></i>账户余额 : ￥${accountLog.account.amount}</li>
												<li><i class="icon-caret-right blue"></i>优惠余额 : ￥${accountLog.account.donation}</li>
											</ul>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="row">
											<div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
												<b>用户信息</b>
											</div>
										</div>
										<div>
											<ul class="list-unstyled spaced">
												<li><i class="icon-caret-right green"></i>号码 : ${accountLog.user.businessKey}(${accountLog.user.businessTypeDesc}) </li>
												<li><i class="icon-caret-right green"></i>用户名 : ${accountLog.user.name} </li>
												<li><i class="icon-caret-right green"></i>联系电话 : ${accountLog.user.linkPhone} </li>
												<li><i class="icon-caret-right green"></i>地址 : ${accountLog.user.address} </li>
											</ul>
										</div>
									</div>
								</div>
								<div class="space-6"></div>
								<div class="row">
									<div class="col-xs-3 col-sm-3 pricing-span-header">
											<%-- <div class="widget-header">
												<h5 class="widget-title bigger lighter">选择缴费充值记录:</h5>
											</div>
											<div class="widget-body">
												<div class="widget-main no-padding">
													<ul class="list-unstyled list-striped pricing-table-header">
														<li>操&nbsp;&nbsp;作&nbsp;&nbsp;员:<span id="oper" class="red"></span></li>
														<li>缴费时间:<span id="opTime" class="red"></span></li>
														<li>支付金额:<span id="amount" class="red"></span></li>
														<li>赠送金额:<span id="donation" class="red"></span></li>
														<li>
															<input type="hidden" id="accountLogId"/>
						                            		<button class="btn btn-sm btn-success btn-white btn-round" id="save">
                        						    			<i class="icon-fire red"></i>
						                            			反销账
                            								</button>
														</li>
													</ul>
												</div>
											</div> --%>
											<div class="col-xs-9 col-sm-9 pricing-span-body" id="logs" style="cursor:pointer;">
												<!-- Put all accountLog here -->								
											</div>
									</div>
								</div>
								<div class="hr hr8 hr-double hr-dotted"></div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 模态框 -->

		<script type="text/javascript">
		
		$(document).ready(function() {
			var customerId = "${accountLog.customer.id}";
			if (customerId != "") {
				showAllLogs(customerId);
			}
			loadRef("ref_business_type", "businessType", "--请选择--");
		});
		
		$("#btnInquiry").click(function() {
			var parm = "";
			if ($("#crCustomerNo").val().trim() === "") {				
				if ($("#crBusinessKey").val().trim() != "") {
					parm += "businessKey=" + $("#crBusinessKey").val().trim();
				}
				if ($("#crUserName").val().trim() != "") {
					parm +=  (parm == "" ? "" : "&") + "userName=" + $("#crUserName").val().trim();
				}
				if ($("#crUserAddress").val().trim() != "") {
					parm +=  (parm == "" ? "" : "&") + "userAddress=" + $("#crUserAddress").val().trim();
				}
				if ($("#businessType").val().trim() != "") {
					parm +=  (parm == "" ? "" : "&") + "businessType=" + $("#businessType").val().trim();
				}
				if (parm == "") {
					bbAlert("请输入查询条件");
					return;
				} 
				self.location = "ocsBill!goToUnpayPage.do?" + parm;
			} else {
				var res = ajaxCRUD("customer!findByCustomerNo.do", { "obj.customerNo": $("#crCustomerNo").val() }, false);
				if (res.obj != null && res.obj.id != undefined) {
					self.location = "ocsBill!goToUnpayPage.do?customerId=" + res.obj.id;
				} else {
					bbAlert("无法找到客户，客户号：" + $("#crCustomerNo").val());
				}
			}
		});
		
		function showAllLogs(customerId) {
			var parm = {
				"obj.customerId": customerId
			};
			var res = ajaxCRUD("ocsAccountLog!findLastChargeLogs.do", parm, false);
			var lst = res.lst;
			var bs = [];
			for (var i = 0; i < lst.length; i++) {
				var obj = lst[i];
				var log = { 
					"id": obj.id,
					"logNo": obj.logNo,
					"oper": obj.oper,
					"opTime": obj.opTime,
					"amount": obj.amount,
					"donation": obj.donation
				};
				bs.push(log);
			}
			if (bs.length > 0) {
				var html = template({logs: bs});
				$("#logs").empty();
				$("#logs").append(html);
			} else {
				bbAlert("用户没有可返销的账单");
			}
		}
		
		function logChoosed(id, oper, opTime, amount, donation) {
			$("#oper").text(oper);
			$("#opTime").text(opTime);
			$("#amount").text("￥" + amount);
			$("#donation").text("￥" + donation);
			$("#accountLogId").val(id);
		}
		
		/* $("#save").click(function() {
			var op = "${sessionScope.userInfo.userName}";	
			var logId = $("#accountLogId").val();
			if ($("#customerId").val() == "") {
				bbAlert("请先查询缴费充值记录");
				return;
			}			
			if (logId == "") {
				bbAlert("请选择要进行反销账的缴费充值记录");
				return;
			}								
			var parm = {
				"obj.id": logId,
				"obj.oper": op
			};
			res = ajaxCRUD("ocsBill!unpay.do", parm, false);
        	if (res.resNum == "0") {
				alert("已成功反销账");
				self.location = "ocsBill!goToUnpayPage.do";
        	} else {
        		alert(res.res);
        	}
		}); */
		
		function save(id,oper) {
			var op = "${sessionScope.userInfo.userName}";	
			//var logId = $("#accountLogId").val(id);			
			if (op !== oper) {
				bbAlert("只有营业员"+oper+"才能对这比充值销账");
				return;
			}
			if ($("#customerId").val() === "") {
				bbAlert("请先查询缴费充值记录");
				return;
			}			
			if (id === "") {
				bbAlert("请选择要进行反销账的缴费充值记录");
				return;
			}
			var parm = {
					"obj.id": id,
					"obj.oper": op
			};
			
			bootbox.confirm({
	   			locale: "zh_CN",
				size: 'small',
				title:"提示",
				message: "确认要销账吗?", 
				callback: function(result){
	   				if(result){
	   					res = ajaxCRUD("ocsBill!unpay.do", parm, false);
			        	if (res.resNum == "0") {
							alert("已成功反销账");
							self.location = "ocsBill!goToUnpayPage.do";
			        	} else {
			        		bbAlert(res.res);
			        	}
	            	}
	            }
	    	});
		}
		
		</script>

		<script id="tpl" type="text/x-handlebars-template">
		{{#each logs}}
		<div class="pricing-span" style="width:200px;" onclick="save('{{this.id}}','{{this.oper}}');">
			<div class="widget-box pricing-box-small widget-color-red3">
				<div class="widget-header" style="color: green; font-weight: bold;">
					<h6 class="widget-title bigger lighter">{{this.logNo}}</h6>
				</div>
				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<li> {{this.oper}} </li>
							<li> {{this.opTime}} </li>
						</ul>
						<div class="price">
							<span class="label label-lg label-inverse arrowed-in arrowed-in-right">
								￥<span>{{this.amount}}</span>
							</span>
						</div>
						<div class="price">
							<span class="label label-lg label-inverse arrowed-in arrowed-in-right">
								￥<span>{{this.donation}}</span>
							</span>
						</div>
					</div>
					<div>
						<div class="btn btn-block btn-sm btn-danger">
							<span>反销账</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		{{/each}}
		</script>

		<script type="text/javascript">
            var tpl = $("#tpl").html();
            //预编译模板
            var template = Handlebars.compile(tpl);
			var userName = "${sessionScope.userInfo.userName}";
			// alert(userName);
        </script>
        
		<jsp:include page="../pub/customerDlg.jsp" flush="true"/>
	</body>
</html>
