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
		<style type="text/css">
			table#table_view>thead>tr>th {
				text-align: center;
			}
			table#table_view>tbody>tr>td {
				text-align: center;
			}
		</style>
		 
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
					大客户缴费
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>


		<div class="page-content">
			<div class="col-xs-12">
				<div class="space-6"></div>
				<div class="row">
					<div class="col-sm-12 ">
						<div class="widget-header">
							<h3 class="widget-title grey lighter">
								<i class="icon-money orange"></i>
								大客户缴费
							</h3>
						</div>
						<div class="widget-body">
							<div class="widget-toolbox" id="widget-toolbox-1">
								<div class="btn-toolbar">
									<input type="hidden" id="customerId" value="${billInfo.customer.id}"/>
									<input id="crCustomerNo" type="text" placeholder="客户号" value="${billInfo.crCustomerNo}" style="width:120px"/>
									<input id="crCustomerName" type="text" placeholder="客户名" value="${billInfo.crCustomerName}" style="width:240px"/>
                            		<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
                            			<i class="icon-search blue"></i>
                            			查询
                            		</button>
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
												<li><i class="icon-caret-right blue"></i>地址 : ${billInfo.customer.address}</li>
												<li><i class="icon-caret-right blue"></i>联系人 : ${billInfo.customer.linker}</li>
												<li><i class="icon-caret-right blue"></i>联系电话 : ${billInfo.customer.linkPhone}</li>
												<li><i class="icon-caret-right blue"></i>备注 : ${billInfo.customer.remark}</li>
											</ul>
										</div>
									</div>
									<div class="col-sm-6">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<!-- <th><input type="checkbox" id="checkAll" checked/></th> -->
													<th style="width: 100px;">
														<select id="crCustomerType" style="width:80px">
															<option value="">全部</option>
															<option value="1">办公</option>
															<option value="2">住宅</option>
														</select>
													</th>
													<th style="width: 200px;">客户号</th>
													<th>客户名称</th>
													<th style="width: 100px;">应收（￥）</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
								<div class="space"></div>
								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="row form-group">
													<label class="col-xs-1">支付金额:</label>
													<div class="col-xs-3">
														<div class="input-group">
															<div class="input-group-addon">
																<span>￥</span>
															</div>
															<input type="text" id="amountPay" class="form-control" value="${billInfo.amountDue}" readonly/>	
														</div>
													</div>
													<label class="col-xs-1">支付方法:</label> 
													<div class="col-xs-3">
														<select id="payMethod" class="form-control">
															<!-- <option value="现金">现金</option>
															<option value="内行" selected="selected">内行</option>
															<option value="支票">支票</option> -->
															<option value="大客户支票">大客户支票</option>
															<option value="大客户内行" selected="selected">大客户内行</option>
														</select>
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
												</div>
											</div>
											<div class="panel-footer">
												<button type="button" id="save" class="btn btn-sm btn-primary">缴费</button>
												<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
		
        var table_view;

		$(document).ready(function() {
			$("#crCustomerNo").focus();
			
			var customerId = "${billInfo.customer.id}";
			initCustomerBills(customerId);
		});
		
        var table_view = null;
        var criteria = {};
		function initCustomerBills(customerId) {
			if (customerId == "") return;
			parm = { "obj.customerId": customerId};
			table_view = $('#table_view').DataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
	            	"url": "ocsBill!findGroupBill.do",
    	        	"data": parm,
        	    	"dataSrc": "lst"
            	},
	            "columns": [ 
	            	{
        	    		"data": "customerChoosed",
            			"width": "100px"
    	        	},
	            	{ 
    	        		"data": "customerNo",
        	    		"width": "200px",
            		},
	            	{ 
    	        		"data": "customerName",
        	    		"width": "*",
            		},
	            	{ 
    	        		"data": "amountDue",
        	    		"width": "100px",
            		}
	    		],
				columnDefs: [{
                    targets: 3,
                    render: function (a, b, c, d) {
                    	if (c.customerType == 1) {
                    		return '私费';
                    	} else {
                    		return '公费';
                    	}
                    }
				},{
                    targets: 0,
                    render: function (a, b, c, d) {
                    	if (c.customerChoosed == 1) {
                    		return '<input id="cid' + c.customerId + '" type="checkbox" onclick=onCidClick("' + c.customerId + '") checked/>';
                    	} else {
                    		return '<input id="cid' + c.customerId + '" type="checkbox" onclick=onCidClick("' + c.customerId + '") />';
                    	}
                    }
                }],
				"bLengthChange": false,//
				"iDisplayLength" :10,
				"scrollY": "150px",
				"scrollCollapse": true,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": false,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
						"sProcessing":   "处理中...",
						"sLengthMenu": 	 "每页显示 _MENU_ 条记录",
						"sZeroRecords":  "抱歉， 没有找到记录",
						"sInfo":         "显示第 _START_ 至 _END_ 条数据，共 _TOTAL_ 条",
						"sInfoEmpty":    "",//不显示分页信息
						"sInfoFiltered": "(由 _MAX_ 条数据中过滤)",
						"sInfoPostFix":  "",
						"sSearch":       "搜索:",
						"sUrl":          "",
						"sEmptyTable":     "表中数据为空",
						"sLoadingRecords": "载入中...",
						"sInfoThousands":  ",",
						"oPaginate": {
							"sFirst":    "首页",
							"sPrevious": "上页",
							"sNext":     "下页",
							"sLast":     "末页"
						},
						"oAria": {
							"sSortAscending":  ": 以升序排列此列",
							"sSortDescending": ": 以降序排列此列"
						}
				}
			});
		}
		
		//尾数为奇数 - 办公, 尾数为偶数  - 住宅
		$("#crCustomerType").change(function() {
			if (table_view == null) return;
			var customerType = $("#crCustomerType").val();
        	var tableData = table_view.rows().data();
        	var count = tableData.length;
        	var lastNo; // 尾数
        	for (var i = 0; i < count; i++) {
        		var data = tableData[i];
        		// 获取客户号最后一位数字
       			lastNo = parseInt(data.customerNo.substr(-1));
        		if (customerType === "") { // 子客户-所有
        			data.customerChoosed = 1;
        		} else if (customerType === "1") { // 办公 - 奇数
        			if (lastNo % 2 === 0) { 
        				data.customerChoosed = 0;
        			} else { 
        				data.customerChoosed = 1;
        			}
        		} else if (customerType === "2"){ // 住宅 - 偶数
        			if (lastNo % 2 === 0) { 
        				data.customerChoosed = 1;
        			} else { 
        				data.customerChoosed = 0;
        			}
        		}
        		$("#cid" + data.customerId).get(0).checked = (data.customerChoosed == 1);
        	}
        	$("#amountPay").val(sumAmountDue().toFixed(2));
		});
		
		/* $("#checkAll").click(function() {
			if (table_view == null) return;
			var isCheck = $("#checkAll").get(0).checked;
        	var tableData = table_view.rows().data();
        	var count = tableData.length;
        	for (var i = 0; i < count; i++) {
        		var data = tableData[i];
        		$("#cid" + data.customerId).get(0).checked = isCheck;
        		data.customerChoosed = isCheck ? 1 : 0;
        	}
        	$("#amountPay").val(sumAmountDue().toFixed(2));
		}); */
		
		function sumAmountDue() {
			var total = 0;
        	var tableData = table_view.rows().data();
        	var count = tableData.length;
        	for (var i = 0; i < count; i++) {
        		var data = tableData[i];
        		if (data.customerChoosed == 1) {
        			total += data.amountDue;
        		}
        	}
        	return total;
		};
		
		var ids = "";
		function getGroupCustomer() {
			ids = "";
        	var tableData = table_view.rows().data();
        	var count = tableData.length;
        	for (var i = 0; i < count; i++) {
        		var data = tableData[i];
        		if (data.customerChoosed == 1) {
        			ids += (ids == "" ? "" : ",") + data.customerId;
        		}
        	}
        	return ids;
		}
		
		function onCidClick(customerId) {
        	var tableData = table_view.rows().data();
        	var count = tableData.length;
        	for (var i = 0; i < count; i++) {
        		var data = tableData[i];
        		if (data.customerId == customerId) {
        			data.customerChoosed = $("#cid" + customerId).get(0).checked ? 1 : 0;
        		}
        	}
        	$("#amountPay").val(sumAmountDue().toFixed(2));
		}
		
		$("#btnInquiry").click(function() {
			var res = ajaxCRUD("ocsBill!findPayFlag.do", {}, false);
			if (res.resNum === "0" || res.resNum === "2") {
				bbAlert("账单发布中，禁止缴费!");
				return;
			}
			var parm = "";
			if ($("#crCustomerNo").val().trim() != "") {
				parm += "customerNo=" + $("#crCustomerNo").val().trim();
			}
			if ($("#crCustomerName").val().trim() != "") {
				parm +=  (parm == "" ? "" : "&") + "customerName=" + $("#crCustomerName").val().trim();
			}
			if (parm == "") {
				bbAlert("请输入客户号或客户名称");
				return;
			}
			self.location = "ocsBill!goToCreditorPayPage.do?" + parm;
		});
		
		/*	 回车触发点击事件	*/
		$(document).keydown(function(e){
			if(e.keyCode == 13) {	
				$("#btnInquiry").click();
				e.preventDefault();
			}
		});
		
		$("#save").click(function() {
			if ($("#customerId").val() == "") {
				alert("请查询要缴费的大客户");
				return;
			}
			if ($("#amountPay").val() == 0) {
				alert("没有需支付的账单。");
				return;
			}
			var op = "${sessionScope.userInfo.userName}";
			var CustomerNo = $("#crCustomerNo").val();
			getGroupCustomer();
			var parm = {
				"obj.customerId": $("#customerId").val(),
				"obj.amountDue": $("#amountPay").val(),
				"obj.payMethod": $("#payMethod").val(),
				"obj.payDesc": $("#payDesc").val(),
				"obj.creator": op,
				"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
				"obj.group": ids,
				"obj.customerNo": CustomerNo
			};
			// 保存
			var res = null;
			res = ajaxCRUD("ocsBill!creditorPay.do", parm, false);
       		bbAlert(res.res);
        	if (res.resNum == "0") {
        		if ($("#printFlag").get(0).checked) {
        			if (!res.id) return;
        			var rpt = printInvoice(res.id);
					var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rpt;
					window.open(uri);
        		}
				reset();
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
		
		function reset() {
			self.location = "ocsBill!goToCreditorPayPage.do";
		}
		
		$("#reset").click(function() {
			reset();
		});
		
		</script>

	</body>
</html>
