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
		<link rel="stylesheet" href="css/layui.css">
		
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
		<script src="assets/js/crud/crud.js"></script>
		<%-- <script src="assets/js/layui.all.js"></script> --%>
		
		
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">账务管理</a>
				</li>
				<li class="active">
					充值缴费
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>


		<div class="page-content">
			<div class="col-xs-12">
				<div class="space-6"></div>
				<div class="row">
					<div class="col-sm-12 ">
						<div class="widget-header widget-header-large">
							<h3 class="widget-title grey lighter">
								<i class="icon-money orange"></i>
								用户账单
							</h3>
						</div>
						<div class="widget-body">
							<div class="widget-toolbox" id="widget-toolbox-1">
								<div class="btn-toolbar">
									&nbsp;&nbsp;
									<lable for="businessType">类型:</lable>
									<select id="crBusinessType" style="width:5%;"></select>&nbsp;&nbsp;
									<lable for="crCustomerNo">客户号:</lable>
									<input id="crCustomerNo" type="text" placeholder="请输入客户号" value="${billInfo.crCustomerNo}" style="width:10%;"/>&nbsp;&nbsp;
									<label for="crBusinessKey">号码:</label>
									<input id="crBusinessKey" type="text" placeholder="请输入号码" value="${billInfo.crBusinessKey}" style="width:10%;"/>&nbsp;&nbsp;
									<lable for="crUserName">用户名:</lable>
									<input id="crUserName" type="text" placeholder="请输入用户名" value="${billInfo.crUserName}" style="width:10%;"/>&nbsp;&nbsp;
									<label for="crUserAddress">地址:</label>
									<input id="crUserAddress" type="text" placeholder="请输入用户地址" value="${billInfo.crUserAddress}" style="width:20%;"/>&nbsp;&nbsp;
                            		<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
                            			<i class="icon-search blue"></i>
                            			查询
                            		</button>
                            		<button class="btn btn-sm btn-success btn-white btn-round" id="btnReset">
                            			<i class="icon-refresh orange"></i>
                            			重置
                            		</button>
                            		<button class="btn btn-sm btn-success btn-white btn-round" id="btnChoose">
                            			<i class="icon-search green"></i>
                            			选择
                            		</button>
                            		<button class="btn btn-sm btn-success btn-white btn-round" id="btnShowUser">
                            			<i class="icon-user-md purple"></i>
                            			用户信息
                            		</button>
                            		<input id="userId" type="hidden" value="${billInfo.user.id}"/>
									<input id="customerId" type="hidden" value="${billInfo.customer.id}"/>
									<input id="billCount" type="hidden" value="${billInfo.billCount}"/>
									<input id="balance" type="hidden" value="${billInfo.balance}"/>
									<input id="broadFlag" type="hidden"/>
                            		<span class="red">${billInfo.information}</span>
								</div>
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
												<li><i class="icon-caret-right blue"></i>客户号 : ${billInfo.customer.customerNo}</li>
												<li><i class="icon-caret-right blue"></i>客户名称 : ${billInfo.customer.name}</li>
												<li><i class="icon-caret-right blue"></i>证件号码 : ${billInfo.customer.certId}</li>
												<li><i class="icon-caret-right blue"></i>账户余额 : ￥${billInfo.balance}</li>
												<li><i class="icon-caret-right blue"></i>用户数 : ${billInfo.userCount}</li>
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
												<li><i class="icon-caret-right green"></i>用户名称 : ${billInfo.user.name} </li>
												<li><i class="icon-caret-right green"></i>业务号 : ${billInfo.user.businessTypeDesc} ${billInfo.user.businessKey} ${billInfo.user.statusDesc}</li>
												<li><i class="icon-caret-right green"></i>联系方式 : ${billInfo.user.linkPhone} ${billInfo.user.address} </li>
												<li><i class="icon-caret-right green"></i>套餐 : ${billInfo.pricePlanName} </li>
												<li><i class="icon-caret-right green"></i>到期日 : ${billInfo.pricePlanExpiryDate} </li>
											</ul>
										</div>
									</div>
								</div>
								<div class="space"></div>
								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="row form-group">
													<label class="col-xs-1">上次缴费:</label> 
													<div class="col-xs-7">
														<input type="text" id="lastChangeInfo" class="form-control" value="${billInfo.lastChargeInfo}" style="color:#FF0000;" readonly/>
													</div>	
													<label class="col-xs-1">滞纳天数: </label>
													<div class="col-xs-3">
														<input type="text" id="dayOverdue" class="form-control" value="${billInfo.dayOverdue}" readonly/>
													</div>	
												</div>
												<div class="row form-group">
													<label class="col-xs-1">滞纳金:</label>
													<div class="col-xs-3">
														<div class="input-group">
															<div class="input-group-addon">
																<span>￥</span>
															</div>
															<input type="text" id="amountOverdue" class="form-control" value="${billInfo.amountOverdue}"/>	
														</div>
													</div>
													<label class="col-xs-1">账单金额:</label> 
													<div class="col-xs-3">
														<div class="input-group">
															<div class="input-group-addon">
																<span>￥</span>
															</div>
															<input type="text" id="amountDue" class="form-control" value="${billInfo.amountDue}" readonly/>	
														</div>
													</div>	
													<label class="col-xs-1">应付金额: </label>
													<div class="col-xs-3">
														<div class="input-group">
															<div class="input-group-addon">
																<span>￥</span>
															</div>
															<input type="text" id="amountProceed" class="form-control" value="${billInfo.amountProceed}" readonly/>	
														</div>
													</div>	
												</div>
												<div class="row form-group" id="divPricePlan" style="display:${billInfo.showPricePlan}">
													<label class="col-xs-1">套餐:</label> 
													<div class="col-xs-7">
														<select id="pricePlan" class="form-control">
														</select>
													</div>	
													<label class="col-xs-1">到期日: </label>
													<div class="col-xs-3">
														<input type="text" id="expiryDate" class="form-control" readonly/>
													</div>	
												</div>
												<div class="row form-group">
													<label class="col-xs-1">支付金额:</label>
													<div class="col-xs-3">
														<div class="input-group">
															<div class="input-group-addon">
																<span>￥</span>
															</div>
															<input type="text" id="amountPay" class="form-control" value="${billInfo.amountPay}"/>	
														</div>
													</div>
													<label class="col-xs-1">支付方法:</label> 
													<div class="col-xs-3">
														<select id="payMethod" class="form-control"></select>
													</div>	
													<label class="col-xs-1">支付说明: </label>
													<div class="col-xs-3">
														<input type="text" id="payDesc" class="form-control"/>
													</div>	
												</div>
												<div class="row form-group">
													<label class="col-xs-1">是否打印:</label> 
													<div class="col-xs-3">
														<label>
															<input id="printFlag" class="ace ace-switch ace-switch-7" type="checkbox" checked/>
															<span class="lbl"></span>
														</label>	
													</div>	
													<label class="col-xs-1">打印方式: </label>
													<div class="col-xs-3">
														<select id="printMode" class="form-control">
															<option value="1">合月打印</option>
															<option value="2">分月打印</option>
														</select>
													</div>	
												</div>
												
											</div>
											<div class="panel-footer">
												<button type="button" id="save" class="btn btn-sm btn-primary">缴费</button>
												<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
											</div>
											
										</div>
									</div>
								</div>

								<div class="space-6"></div>
								<div class="row">
									<div class="col-xs-2 col-sm-2 pricing-span-header">
										<div class="widget-box transparent">
											<div class="widget-header">
												<h5 class="widget-title bigger lighter">还有未支付账单:</h5>
											</div>
											<div class="widget-body">
												<div class="widget-main no-padding">
													<ul class="list-unstyled list-striped pricing-table-header">
														<li>合计金额(￥)：<span id="amountAll" class="red"></span></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-10 col-sm-10 pricing-span-body" id="bills">
										<!-- Put other bills here -->
									</div>
								</div>

								<div class="space"></div>
								<div>
									<table id="table_view" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>项目</th>
												<th>项目金额（￥）</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
								<div class="hr hr8 hr-double hr-dotted"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
		
        var table_view;
		$(document).ready(function() {
			//加载字典表
			loadRefs();
			//号码焦点
			$("#crBusinessKey").focus();
			
			var customerId = "${billInfo.customer.id}";
			if (customerId != "") {
				showAllBills(customerId);
			}
			
			initPricePlan();
			
			var billCount = "${billInfo.billCount}";
			if (billCount === "" || billCount === "0") {
				$("#amountOverdue").attr("readonly", "readonly");
			} else {
				$("#amountOverdue").removeAttr("readonly");
			}
		});
		
		//加载字典表
		function loadRefs() {
			loadRef("ref_business_type", "crBusinessType", "--业务--");
			loadCustRef("ref_pay_method", "name", "name", "payMethod");
			$("#payMethod").val("现金");
		}
		
		function initPricePlan() {
			var userCount = "${billInfo.userCount}";
			var businessType = "${billInfo.user.businessType}";
			//if (userCount == 1 && (businessType === "a" || businessType === "b")) {
			if(businessType === "a" || businessType === "b"){	
				$("#divPricePlan").css("display", "block");
				var sql = "select id, concat(name, ' ￥', format(plan_fee,2)) as name from sid_price_plan where instr(bearable, '" 
						+ businessType 
						+ "') > 0 and status=1 and plan_type=1 and (business_sta is null or business_sta = '' or instr(business_sta, '${billInfo.user.businessSta}') > 0)";
				loadSqlRef(sql, "id", "name", "pricePlan");
				$("#pricePlan").val("${billInfo.pricePlanId}");
				onPricePlanChange();
				$("#broadFlag").val("1");
			} else {
				$("#divPricePlan").css("display", "none");
				$("#broadFlag").val("0");
			}
			//$("#amountPay").attr("readonly", businessType === "b" ? true : false);//宽带用户不能修改
		}
		
		function onPricePlanChange() {
			var newId = $("#pricePlan").val();
			var payPolicy = "${billInfo.user.payPolicy}";
			if (newId != "" && payPolicy != "") {
				var res = ajaxCRUD("sidPricePlan!findById.do", {"id": newId}, false);
				if (res.resNum == "0") {
					var obj = res.obj;
					$("#amountPay").val(obj.planFee.toFixed(2));
					var currExpiryDate = "${billInfo.pricePlanExpiryDate}";
					var next = ajaxCRUD("date!addDate.do", {"date": currExpiryDate, "term": obj.term, "termCount": obj.termCount }, false);
					$("#expiryDate").val(next.result);
				}
			}
		}
		
		$("#payMethod").change(function () {
		 // alert($("#payMethod").val());
		  var payname= $("#payMethod").val();
		  if(payname === "微信支付"){
			  //buy('001');
			  var productId = '11473623';
			  ajaxCRUD("ocsBill!create.do", {"productId": productId}, false);
			  //window.location.href= "ocsBill!create.do";
		  }
		  
		});
		
		function buy(productId){
		    //打开付费二维码 -- 微信二维码
		    layer.open({
		        area: ['300px', '300px'],
		        type: 2,
		        closeBtn: false,
		        title: false,
		        shift: 2,
		        shadeClose: true,
		        content:'qrcode!Create.do?productId=' + productId
		    });
		     
		    //重复执行某个方法 
		  //  var t1 = window.setInterval("getPayState('" + productId + "')",1500); 
		}
		 
		function getPayState(productId){
		    var url = '../hadPay.do?productId=' + productId;
		    //轮询是否已经付费
		    $.ajax({
		        type:'post',
		         url:url,
		         data:{productId:productId},
		         cache:false,
		         async:true,
		         success:function(json){
		             if(json.result == 0){
		                 location.href = '/result.jsp';
		             }
		         },
		         error:function(){
		             layer.msg("执行错误！", 8);
		         }
		     });
		}
		
		$("#pricePlan").change(function () {
			onPricePlanChange();
		});
		
		$("#amountPay").focus(function (){
			$("#amountPay").val($("#amountPay").val().trim() === "0.00" ? "" : $("#amountPay").val().trim());
		});
		
		$("#amountPay").change(function (){	//现金向上取整
			var amountPay = parseFloat($("#amountPay").val());
			// $("#amountPay").val(Math.ceil(amountPay).toFixed(2));	//取整
			$("#amountPay").val(parseFloat(amountPay).toFixed(2));
		});
		
		function initTableView(billId) {
			var parm = {"id": billId};
			if (table_view == undefined) {
				table_view = $('#table_view').dataTable({
					"serverSide": true, //服务器模式，分页用
					"ajax": {
            			"type": "post",
            			//"url": "ocsBill!findItemsByBillId.do",
            			"url": "ocsBill!countItemsByBillId.do",
            			"data": parm,
	            		"dataSrc": "lst"
    	        	},
        	    	"aoColumns": [ 
            			{"mDataProp": ""},
            			{"mDataProp": "name"},
    					{"mDataProp": "value"},
	    			],
					columnDefs: [{
        	            targets: 0,
            	        render: function (a, b, c, d) {
                	    	return '<i class="icon-ok-sign red bigger-110"></i>';
                    	}
	                }],
					"bLengthChange": false,//
					"iDisplayLength" :10,
					"searching":false,//关闭dataTable自带搜索
					"bPaginate": false,//开启分页功能
					"bInfo": false,
					"bSort" : false,//关闭排序
					"language": { //国际化
						"url": "assets/js/Chinese.json"
					}
				});
			} else {
				table_view.fnSettings().ajax.data = parm; 
				table_view.api().ajax.reload();
			}
		}
		
		$("#btnInquiry").click(function() {
			var res = ajaxCRUD("ocsBill!findPayFlag.do", {}, false);
			if (res.resNum === "0" || res.resNum === "2") {
				bbAlert("账单发布中，禁止缴费!");
				return;
			}
			var parm = "";
			var businessType = "";
			if ($("#crCustomerNo").val().trim() == "") {
				if ($("#crBusinessKey").val().trim() != "") {
					parm += "businessKey=" + $("#crBusinessKey").val().trim();
				}
				if ($("#crBusinessType").val() != "") {
					businessType = $("#crBusinessType").val();
					parm += (parm == "" ? "" : "&") + "businessType=" + $("#crBusinessType").val();
				}
				if ($("#crUserName").val().trim() != "") {
					parm +=  (parm == "" ? "" : "&") + "userName=" + $("#crUserName").val().trim();
				}
				if ($("#crUserAddress").val().trim() != "") {
					parm +=  (parm == "" ? "" : "&") + "userAddress=" + $("#crUserAddress").val().trim();
				}
				if (parm == "") {
					bbAlert("请输入查询条件");
					return;
				} 
				self.location = "ocsBill!goToPayPage.do?" + parm;
				$("#crBusinessType").val(businessType);
			} else {
				self.location = "ocsBill!goToPayPage.do?customerNo=" + $("#crCustomerNo").val().trim();
			}
		});
		
		/*	 回车触发点击事件	*/
		$(document).keydown(function (e) {
			if(e.keyCode == 13) {	
				$("#btnInquiry").click();
			}
		});
		
		$("#btnReset").click(function () {
			self.location = "ocsBill!goToPayPage.do";
		});
		
		//模糊查询及模态框点击选择用户
		var fnUserChoosed;
		var businessType = "";
		$("#btnChoose").click(function () {
			$("#beginStatus").val("2");
        	$("#endStatus").val("4");
        	var crUserName = $("#crUserName").val().trim();
        	var crUserAddress = $("#crUserAddress").val().trim();
        	var phoneNo = $("#crBusinessKey").val().trim();
        	businessType = $("#crBusinessType").val();
        	$("#crUserKey").val(phoneNo); //将页面的查询电话赋值到模态框电话输入框中
        	$("#crUser").val(crUserName || crUserAddress || ""); //将页面的查询用户名/地址赋值到模态框模糊查询输入框中
			fnUserChoosed = function (userId, businessKey, businessType) {
				var parm = "";
				parm += "businessType=" + businessType;
				parm += (parm == "" ? "" : "&") + "businessKey=" + businessKey;
				parm += (parm == "" ? "" : "&") + "businessType=" + businessType;
				self.location = "ocsBill!goToPayPage.do?" + parm;
			};
			doSearch();
			$("#dlgUser").modal("show");	
		});
		
		//点击查看用户详细信息
		$("#btnShowUser").click(function () {
			var obj = {
				userId : "${billInfo.user.id}",
				customerId : "${billInfo.customer.id}",
				userKey : "${billInfo.user.businessKey}"
			}
			loadCustomerInfo(obj.customerId);
			loadAccountInfo(obj.customerId);
			loadUserInfo(obj.userId);
			loadOrderInfo(obj);
			loadJfxxInfo(obj.customerId);
			loadFormInfo(obj.userId);
			$("#dlgUserInfo").modal("show");
		});
		
		function showAllBills(customerId) {
			var parm = {
				"obj.customerId": customerId
			};
			var res = ajaxCRUD("ocsBill!findUnpaidBills.do", parm, false);
			var lst = res.lst;
			var bs = [];
			var amountAll = 0;
			for (var i = 0; i < lst.length; i++) {
				var obj = lst[i];
				var bill = { 
					"id": obj.id,
					"billNo": obj.billNo,
					"businessTypeDesc": obj.businessTypeDesc,
					"endDate": obj.endDate,
					"amountDue": obj.amountDue
				};
				bs.push(bill);
				amountAll += obj.amountDue;
			}
			$("#amountAll").text(amountAll.toFixed(2));
			if (bs.length > 0) {
				var html = template({bills: bs});
				$("#bills").empty();
				$("#bills").append(html);
			}
		}

		function calcAmountProceed() {
			var amountDue = parseFloat($("#amountDue").val());
			var amountOverdue = parseFloat($("#amountOverdue").val());
			var amountDueTotal = amountDue + amountOverdue;
			if (isNaN(amountOverdue) || amountOverdue < 0) {
				bbAlert("滞纳金必须是大等于零的数字");
				amountDueTotal = amountDue;
			}
			var balance = parseFloat($("#balance").val());
			var amountProceed = amountDueTotal - balance;
			$("#amountProceed").val(amountProceed.toFixed(2));
			$("#amountPay").val(amountProceed.toFixed(2));
		}
		
		$("#amountOverdue").change(function() {
			calcAmountProceed();
		});
		
		/*
		function calcNextDueTime() {
			var broadFlat = $("#broadFlag").val();
			if ($("#customerId").val() === "" || broadFlat !== "1" ) { 
				$("#expiryDate").val("");
				return;
			}
			var amountProceed = parseFloat($("#amountPay").val());
			var amountDonation = parseFloat($("#amountDonation").val());
			if (isNaN(amountProceed) || isNaN(amountDonation)) { 
				$("#expiryDate").val("");
				return;
			}
			var parm = {
				"obj.customerId": $("#customerId").val(),
				"obj.amountProceed": amountProceed,
				"obj.amountDonation": amountDonation
			};
			var res = ajaxCRUD("ocsBill!calcNextDueTime.do", parm, false);
			if (res.res != undefined && res.res != null) {
				var infos = res.res.split(",");
				$("#plan").val(infos[0]);
				$("#expiryDate").val(infos[1]);
			}
		}
		*/
		
		$("#save").click(function() {
			if ($("#customerId").val() == "") {
				bbAlert("请选择要缴费的客户");
				return;
			}
			var amountOverdue = parseFloat($("#amountOverdue").val());
			if (isNaN(amountOverdue) || amountOverdue < 0) {
				bbAlert("滞纳金必须大等于零");
				return;
			}
			
			var amountProceed = parseFloat($("#amountProceed").val());
			if (isNaN(amountProceed)) {
				bbAlert("未知错误： 应付金额为非数字");
				return;
			}
			var amountPay = parseFloat($("#amountPay").val());
			if (isNaN(amountPay)) {
				bbAlert("支付金额必须为数字");
				return;
			}
			if (amountProceed >= 0 && amountPay < amountProceed) {
				bbAlert("费用必须一次缴清： 支付金额应大于应付金额");
				return;
			}
			if (amountProceed < 0 && amountPay < amountProceed) {
				bbAlert("退费金额不能大于应付金额");
				return;
			}
			
			var op = "${sessionScope.userInfo.userName}";
			var parm = {
				"obj.customerId": $("#customerId").val(),
				"obj.amountProceed": amountPay,
				"obj.payMethod": $("#payMethod").val(),
				"obj.payDesc": $("#payDesc").val(),
				"obj.amountOverdue": amountOverdue,
				"obj.creator": op,
				"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
				"obj.printMode": $("#printMode").val(),
				"obj.expiryDate": $("#expiryDate").val(),	//失效日期:2018-1-22 17:37:27添加 -- > 保存到invoice里==>票据读取
				"obj.userId": $("#userId").val(),
				"obj.businessType": $("#crBusinessType").val()
			};
			if ($("#broadFlag").val() == "1") {
				parm["obj.pricePlan"] = $("#pricePlan").val();	//套餐id
			}
			console.log(parm);
			console.log($("#userId").val());
			// 保存
			var res = null;
			if ($("#billCount").val() == "" || $("#billCount").val() == "0") {
				// 无账单，充值（退费）
				res = ajaxCRUD("ocsBill!charge.do", parm, false);
			} else {
				// 有账单，缴费
				res = ajaxCRUD("ocsBill!pay.do", parm, false);
			}
        	if (res.resNum === "0") {
        		bootbox.alert({
        			locale : "zh_CN",
        			size : 'small',
        			title : "提示",
        			message : "缴费成功！"
        		});
        		if ($("#printFlag").get(0).checked) {
					// 打印票据
					if (!res.id) return;
       				var rpt = printInvoice(res.id);
					var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rpt;
					window.open(uri);
        			/*
        			var ids = res.id.split(','); 
        			for (var i = 0; i < ids.length; i++) {
        				var rptFileName = "";
						var userCount = "${billInfo.userCount}";
						var businessType = "${billInfo.user.businessType}";
						if (userCount == 1 && (businessType == "a" || businessType == "b")) {
        					rptFileName = 'receipt_broad.cpt';
        				} else {
        					rptFileName = 'receipt_phone.cpt';
        				} 
        				window.open(uri);
        			} */
        		}
				setTimeout(function () {
					self.location = "ocsBill!goToPayPage.do"
				}, 3000);
        	} else {
        		bbAlert(res.res);
        	}
		});
		
		//打印票据:参数-后台返回的票据id
		function printInvoice(ids) {
			//如果是多票据同时打印
			var id = "";
			console.log(ids);
			var rpt = "";
			if (ids.indexOf("&") > 0) {
				id = ids.split("&").join("','");
				console.log(ids.split("&"));
				console.log(ids.split("&").join("','"));
				id = "'" + id + "'"; //组合成SQL中的in条件字符串
				console.log(id);
				console.log("多个票据打印ID：" + id);
				rpt += "receipt_phone.cpt&id=" + id;
			}
			//如果是单个票据打印
			else {
				var res = ajaxCRUD("ocsInvoice!selectById.do", {"id": ids} , false);
				var obj = res.invoice;
				if (!obj) return;
				id = "'" + ids + "'";
				console.log("单个票据打印ID：" + id);
				if (obj.userType === "b") {
					rpt += "receipt_broad.cpt&id=" + id;
				} else {
					rpt += "receipt_phone.cpt&id=" + id;
				}
			}
			return rpt;
		}
		
		/**
		 * 计算本次应付金额 
		**/
		function calcAmountThisTime() {
			if ($("#customerId").val() == "") return;
			var total = 0;
			var ids = "";
			$(".chk").each(function() {
				if ($(this).get(0).checked) {
					var id = $(this).attr("id").substring(1);
					ids += (ids == "" ? "" : ",") + id;
					var amount = parseFloat($("#a" + id).text());
					total += amount;
				}
			});
			$("#amountThisTime").text(total.toFixed(2));
			$("#billId").val(ids);
			$("#amountDue").val(total.toFixed(2));
			var overdue = parseFloat($("#amountOverdue").val());
			$("#amountDueTotal").val((total + overdue).toFixed(2));
			var balance = parseFloat($("#balance").val());
			var donation = parseFloat($("#donation").val());
			var amountProceed = total + overdue - balance - donation;
			if (amountProceed < 0) {
				amountProceed = 0;
			}
			$("#amountProceed").val(amountProceed.toFixed(2));
		};
		
		</script>

		<script id="tpl" type="text/x-handlebars-template">
		{{#each bills}}
		<div class="pricing-span">
			<div class="widget-box pricing-box-small widget-color-red3">
				<div class="widget-header">
					<h6 class="widget-title bigger lighter">{{this.billNo}}</h6>
				</div>
				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<li> {{this.endDate}} </li>
						</ul>
						<div class="price">
							<span class="label label-lg label-inverse arrowed-in arrowed-in-right">
								￥<span id="a{{this.id}}">{{this.amountDue}}</span>
							</span>
						</div>
					</div>
					<div>
						<div class="btn btn-block btn-sm btn-danger">
							<span onclick="initTableView({{this.id}});">查看明细</span>
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
        
        <jsp:include page="../pub/userInfo.jsp" flush="true"/>
        <jsp:include page="../pub/userDlg.jsp" flush="true"/>
	</body>
</html>
