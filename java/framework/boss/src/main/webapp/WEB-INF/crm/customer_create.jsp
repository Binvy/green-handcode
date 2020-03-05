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
		<script src="assets/js/chosen.jquery.min.js"></script>
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<!-- Customize -->
		<script src="js/resDeptDlg.js"></script>
		<script src="js/customer.js"></script>
		<script src="js/customerPricePlan.js"></script>
		<script src="js/pricePlan.js"></script>
		
		<!-- for JQuery UI.autocomplete -->
		<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
		<script src='assets/js/jquery-ui-1.10.3.full.min.js'></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					客户开户
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
								<i class="icon-plus green"></i>
								客户开户(变更)&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
							</h3>
						</div>
					
						<div class="panel-body">
								<div class="tabbable" id="tabtable1">
									<div id="tab-head" style="margin-bottom: 30px; text-align: center; ">
										<div id="tab1" style="width:12%; height:20px; display: inline-block; ">
									    	<a href="#panel-1" data-toggle="tab" class="button button-glow button-pill button-raised button-primary"  style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							客户信息
									    	</a>
									  	</div>
							        	<div id="tab2" style="width:12%; height:20px; display: inline-block; ">
						 					<a href="#panel-2" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
						 						<i class="red icon-money"></i>
						 						账户信息
						 					</a>
					 					</div>
								        <div id="tab3" style="width:10%; height:20px; display: inline-block; ">
							 				<a href="#panel-3" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="dark icon-dollar"></i>
							 					资费
							 				</a>
						 				</div>
					 				</div>
									<div class="tab-content">
										<!-- 客户信息 -->
										<div class="tab-pane active" id="panel-1">
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="deptArea" class="col-sm-1 control-label">业务区域</label>
												<div class="col-sm-7">
													<select class="form-control" id="deptArea">
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
												<label for="customerProp" class="col-sm-1 control-label">
					 								客户属性
					 							</label>
												<div class="col-sm-3">
													<select class="form-control" id="customerProp">
														<option name="customerProp" value="1">普通客户</option>
														<option name="customerProp" value="2">大客户</option>
													</select>
												</div>
					 							<label for="customerNo" class="col-sm-1 control-label">
					 								客户号&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 							</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="customerId" type="hidden"/>
													<input class="form-control" id="customerNo" type="text" 
														placeholder="输入或生成客户号" 
														data-toggle="tooltip" data-placement="bottom"   
														title="客户号是必填项"/>
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnPickCustomerNo">
															<i class="ace-icon fa fa-calendar bigger-110"></i> 选择
														</button> </span>
													</div>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="name" class="col-sm-1 control-label">
					 								名称&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="name" type="text" placeholder="请输入个人姓名或公司名称" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="address" class="col-sm-1 control-label">
					 								地址&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
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
					 							<label for="linkPhone" class="col-sm-1 control-label">
					 								联系电话<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
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
					 							<%-- <label for="loyalty" class="col-sm-1 control-label">忠诚度</label>
												<div class="col-sm-3">
													<select class="form-control" id="loyalty">
													</select>
												</div> --%>
					 							<label for="remark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="remark" type="text" placeholder="请输入备注"/>
												</div>
											</div>
										</div>
										
										<!-- 账户信息 -->
										<div class="tab-pane" id="panel-2">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label class="col-sm-1 control-label">
					 							客户号
					 							</label>
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
										
										<!-- 资费 -->
										<div class="tab-pane" id="panel-3">
											<table id="table_view_plan" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th><i class="icon-edit purple bigger-110"></i></th>
														<th><i class="icon-flag red bigger-110"></i></th>
														<th><i class="icon-money orange bigger-110"></i></th>
														<th>名称</th>
														<th>周期</th>
														<th>套餐费</th>
														<th>描述</th>
														<th>订购数</th>
														<th>单价(￥)</th>
														<th>订购备注</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>										
										</div>
									
									<!-- panel end -->	
									</div>
								</div>					
						</div>
						
						<div class="panel-footer" style="text-align: right;">
							<button type="button" id="save" class="btn btn-sm btn-primary">保存</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		var busi = "p";
		var deptName = "${sessionScope.userInfo.deptName}";
        // 初始化页面控件
        $(document).ready(function () {
        	$("[data-toggle='tooltip']").tooltip();
        	// 初始化字典表
        	loadRefs();
			// 显示套餐选择清单
			initEditablePlanList(busi);
       		$('#table_view_plan tbody').on('click', 'td.details-control', openPlanEditor);
			/*var res = ajaxCRUD("resAddress!findGroupName2.do", {}, false);
       		$("#remark").autocomplete({
       			source: res.addrs
       		});
       		
       		$("#address").autocomplete({
       			source: function(request, response) {
       				var res = ajaxCRUD("resAddress!findByName.do", { "obj.name": request.term }, false);
       				if (res.resNum == "0") {
       					response(res.addrs);
       				} else {
       					response([]);
       				}
       			}
       		});
 			*/       		
       	});
       	
		// 选择客户
		var fnBtnClickedCustomer;
		$("#btnPickCustomerNo").click(function() {
			$(".khtips").remove();
			var deptArea = '';
			if ( $("#deptArea").val() != '通信管理处' ) {
				deptArea = $("#deptArea").find("option:selected").text().split(" ")[1];
			} else {
				deptArea = "Z";
			};
			fnBtnClickedCustomer = function(customerId, customerNo, customerName) {
				if (customerId == undefined || customerId == "") {
					var parm = {
							"policyKey": "CUSTOMER_NO", 
							"variable": deptArea,
							"custType": $("#customerType").val()
					};
					var res = ajaxCRUD("seq!currVal.do", parm, false);
					$("#customerNo").val(res.seqVal);
					$("#customerNo1").val(res.seqVal);
				} else {
					// 载入客户和账户信息
					loadCustomer(customerId);
					loadAccount(customerId);
					//initEditablePlanList(customerId);	//TODO: parm: businessType
				}
			};
			$("#btnGenerateCustomerNo").show();
			$("#crCustomer").val($("#customerNo").val());
			doSearchCustomer();
			$("#dlgCustomer").modal("show");
		});
		
		// 选择代缴客户
		/* $("#btnChooseCreditor").click(function() {
			fnBtnClickedCustomer = function(customerId, customerNo, customerName) {
				$("#creditor").val(customerId);
				$("#creditorName").val(customerNo + " " + customerName);
			};
			$("#btnGenerateCustomerNo").hide();
			$("#dlgCustomer").modal("show");
		}); */
		
		// 地址输入
		var fnAddressChoosed;
		$("#address").focus(function() {
			fnAddressChoosed = function(address) {
				$("#address").val(address);
			};
			$("#dlgAddress").modal("show");
		});
		
		$("#customerNo").change(function() {
			$("#customerNo1").val($("#customerNo").val());
		});
		
       /*  var fnDeptChoosed;
        $("#btnChooseCustomerDept").click(function() { 
        	fnDeptChoosed = function(id, name) {
        		$("#departmentId").val(id);
        		$("#departmentName").val(name);
        	}; 
        	$("#dlgResDept").modal("show");
        }); */
       
        function validate() {
        	$(".khtips").remove();
        	var flag = validateCustomer();
        	if (!flag) return false;
        	flag = validateAccount();
        	if (!flag) return false;
        	return true;
        }
        
        $("#save").click(function() {
        	var v = validate();
        	if (!v) return;
        	
        	var op = "${sessionScope.userInfo.userName}";
        	var parm = {
        		"customer.id": $("#customerId").val(),
    			"customer.name": $("#name").val(),
        		"customer.customerNo": $("#customerNo").val(),
        		"customer.customerType": $("#customerType").val(),
        		"customer.customerProp": $("#customerProp").val(),
        		"customer.address": $("#address").val(),
        		"customer.certType": "1",
        		"customer.certId": $("#certId").val(),
        		"customer.linker": $("#linker").val(),
        		"customer.linkPhone": $("#linkPhone").val(),
        		"customer.email": $("#email").val(),
        		"customer.linkAddress": $("#linkAddress").val(),
        		"customer.vip": $("#vip").val(),
        		"customer.status": 0,
        		"customer.creator": op,
        		"customer.remark": $("#remark").val(),
        		//"customer.departmentId": $("#departmentId").val(),
        		//"customer.loyalty": $("#loyalty").val(),
        		//"customer.customerManager": $("#customerManager").val(),
        		
        		"account.id": $("#accountId").val(),
        		"account.payMethod": $("#payMethod").val(),
        		"account.creditor": $("#creditor").val(),
        		"account.amount": $("#amount").val(),
        		"account.score": $("#score").val(),
        		"account.remark": $("#accRemark").val(),
        		//"account.bankName": $("#bankName").val(),
        		//"account.bankAcc": $("#bankAcc").val(),
        		//"account.bankAccOwner": $("#bankAccOwner").val(),
        		
        	};
        	
        	var index = 0;
        	
        	var tableData = table_view_plan.rows().data();
        	var planCount = tableData.length;
        	for (var i = 0; i < planCount; i++) {
        		var data = tableData[i];
        		/* if (data.itemPrice != null) {
        			// 新增或修改
		        	parm["lst[" + index + "].id"] = data.orderId;
		        	parm["lst[" + index + "].itemId"] = data.planId;
    		    	parm["lst[" + index + "].itemName"] = data.planName;
    		    	parm["lst[" + index + "].itemType"] = 1;
    		    	parm["lst[" + index + "].saleType"] = 2;
    	 		   	parm["lst[" + index + "].term"] = data.term;
    	   		 	parm["lst[" + index + "].itemCount"] = 0;
    	    		parm["lst[" + index + "].itemPrice"] = data.itemPrice;
    	    		parm["lst[" + index + "].remark"] = data.remark;
    	    		index++;
    	    	} else if (data.itemPrice == null && data.orderId != null) {
    	    		// 删除
    	    		parm["lst[" + index + "].id"] = data.orderId;
    	    		index++;
    	    	} */
        		if (data.planChoosed == "1") {
		        	parm["orderItems[" + index + "].itemId"] = data.id;
    		    	parm["orderItems[" + index + "].itemName"] = data.name;
    		    	parm["orderItems[" + index + "].itemType"] = 1;
    		    	parm["orderItems[" + index + "].saleType"] = 2;
    	 		   	parm["orderItems[" + index + "].term"] = data.term;
    	   		 	parm["orderItems[" + index + "].itemCount"] = data.planOrderCount;
    	    		parm["orderItems[" + index + "].itemPrice"] = data.planOrderPrice;
    	    		parm["orderItems[" + index + "].remark"] = data.planChoosedRemark;
    	    		parm["orderItems[" + index + "].payFlag"] = data.planPayChoosed;
    	    		index++;
    	    	};
        	}
        	
        	var res = ajaxCRUD("customerOrder!editCustomer.do", parm, true);
        	if (res.resNum == "0") {
        		reset();
        	}
        });
        
        var index = 1;
        function reset() {
        	$(".khtips").remove();
        	index = 1;
        	$('#tab-head a:first').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");   
			$('#tab-head a:not("#tabtable1 a:first")').removeAttr('href').removeClass().addClass("button disabled button-pill button-primary");        	
			$("#customerProp").val("1");
			resetCustomer();
        	resetAccount();
        	table_view_plan.ajax.reload();
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
        
        </script>
        
		<jsp:include page="../pub/resDeptDlg.jsp" flush="true"/>
		<jsp:include page="../pub/customerDlg.jsp" flush="true"/>
		<jsp:include page="../pub/addressDlg.jsp" flush="true"/>
        
	</body>
</html>
