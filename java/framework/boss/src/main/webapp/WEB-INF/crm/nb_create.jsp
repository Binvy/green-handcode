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
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<!-- Customize -->
		<script src="js/resDeptDlg.js"></script>
		<script src="js/customer.js"></script>
		<script src="js/nb.js"></script>
		<script src="js/pricePlan.js"></script>
		<script src="js/product.js"></script>
		<script src="js/fee.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">新业务受理</a>
				</li>
				<li class="active">
					安装
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
								<i class="icon-plus red"></i>
								新业务安装&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
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
									<ul class="nav nav-tabs">
										<li id="firstPage" class="active">
											<a href="#panel-1" data-toggle="tab">
												<i class="green icon-user-md bigger-110"></i>
						 						客户信息
						 					</a>
										</li>
										<li>
						 					<a href="#panel-2" data-toggle="tab">
						 						<i class="red icon-money bigger-110"></i>
						 						账户信息
						 					</a>
										</li>
										<li>
							 				<a href="#panel-3" data-toggle="tab">
							 					<i class="blue icon-phone bigger-110"></i>
							 					用户信息
							 				</a>
										</li>
										<li>
							 				<a href="#panel-4" data-toggle="tab">
							 					<i class="dark icon-dollar bigger-110"></i>
							 					资费
							 				</a>
										</li>
										<li>
							 				<a href="#panel-5" data-toggle="tab">
							 					<i class="orange icon-tags bigger-110"></i>
							 					增值服务
							 				</a>
										</li>
										<li>
							 				<a href="#panel-6" data-toggle="tab">
							 					<i class="purple icon-credit-card bigger-110"></i>
							 					业务受理费
							 				</a>
										</li>
									</ul>
									<div class="tab-content">
										<!-- 客户信息 -->
										<div class="tab-pane active" id="panel-1">
											<div class="row form-group">
					 							<label for="customerNo" class="col-sm-1 control-label">
					 								客户号&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="customerId" type="hidden"/>
													<input class="form-control" id="customerNo" type="text" 
														placeholder="输入或生成客户号" 
														data-toggle="tooltip" data-placement="bottom"   
														title="点击选择按钮以生成新客户号或选择已有客户"/>
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnPickCustomerNo">
															<i class="ace-icon fa fa-calendar bigger-110"></i> 选择
														</button> </span>
													</div>
												</div>
												<label for="customerManager" class="col-sm-1 control-label">客户经理</label>
												<div class="col-sm-3">
													<select class="form-control" id="customerManager">
													</select>
												</div>
												<label for="certId" class="col-sm-1 control-label">
					 								证件号码<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="certId" type="text" placeholder="请输入证件号码"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="customerType" class="col-sm-1 control-label">客户类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="customerType">
													</select>
												</div>
					 							<label for="name" class="col-sm-1 control-label">
					 								名称&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="name" type="text" placeholder="请输入个人姓名或公司名称"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="departmentName" class="col-sm-1 control-label">部门</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="departmentId" type="hidden"/>
													<input class="form-control" id="departmentName" type="text" placeholder="选择部门"/>
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnChooseCustomerDept">
															<i class="ace-icon fa fa-calendar bigger-110"></i>
															选择
														</button>
													</span>
													</div>
												</div>
					 							<label for="address" class="col-sm-1 control-label">
					 								地址&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="address" type="text" placeholder="请输入地址"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="linker" class="col-sm-1 control-label">联系人</label>
												<div class="col-sm-3">
													<input class="form-control" id="linker" type="text" placeholder="请输入联系人姓名" />
												</div>
												<label for="linkAddress" class="col-sm-1 control-label">联系地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="linkAddress" type="text" placeholder="请输入联系地址" />
												</div>
											</div>
											<div class="row form-group">
					 							<label for="linkPhone" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="linkPhone" type="text" placeholder="请输入联系电话" />
												</div>
					 							<label for="email" class="col-sm-1 control-label">电子邮件</label>
												<div class="col-sm-3">
													<input class="form-control" id="email" type="email" placeholder="请输入电子邮箱" />
												</div>
					 							<label for="vip" class="col-sm-1 control-label">VIP等级</label>
												<div class="col-sm-3">
													<select class="form-control" id="vip">
													</select>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="loyalty" class="col-sm-1 control-label">忠诚度</label>
												<div class="col-sm-3">
													<select class="form-control" id="loyalty">
													</select>
												</div>
					 							<label for="remark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="remark" type="text" placeholder="请输入备注"/>
												</div>
											</div>
										</div>
										
										<!-- 账户信息 -->
										<div class="tab-pane" id="panel-2">
											<div class="row form-group">
					 							<label class="col-sm-1 control-label">
					 								客户号&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input id="accountId" type="hidden" />
													<input class="form-control" id="customerNo1" type="text" readonly />
												</div>
					 							<label for="payMethod" class="col-sm-1 control-label">支付方法</label>
												<div class="col-sm-3">
													<select class="form-control" id="payMethod">
													</select>
												</div>
					 							<label for="creditor" class="col-sm-1 control-label">代缴客户</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input type="hidden" id="creditor" />
													<input class="form-control" id="creditorName" type="text" placeholder="选择代缴客户" />
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnChooseCreditor">
															<i class="ace-icon fa fa-calendar bigger-110"></i>
															选择
														</button>
													</span>
													</div>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="bankName" class="col-sm-1 control-label">银行名称</label>
												<div class="col-sm-3">
													<input class="form-control" id="bankName" type="text" placeholder="请输入银行名称" />
												</div>
					 							<label for="bankAccOwner" class="col-sm-1 control-label">户主姓名</label>
												<div class="col-sm-3">
													<input class="form-control" id="bankAccOwner" type="text" placeholder="请输入户主姓名" />
												</div>
					 							<label for="bankAcc" class="col-sm-1 control-label">银行账户</label>
												<div class="col-sm-3">
													<input class="form-control" id="bankAcc" type="text" placeholder="请输入银行账户" />
												</div>
											</div>
											<div class="row form-group">
					 							<label for="amount" class="col-sm-1 control-label">账户余额</label>
												<div class="col-sm-3">
													<div class="input-group">
														<div class="input-group-addon">
															<span>￥</span>
														</div>
														<input class="form-control" id="amount" type="text" value="0" readonly/>
													</div>
												</div>
					 							<%-- <label for="score" class="col-sm-1 control-label">积分</label>
												<div class="col-sm-3">
													<div class="input-group">
														<div class="input-group-addon">
															<span>点</span>
														</div>
														<input class="form-control" id="score" type="text" value="0" readonly/>
													</div>
												</div> --%>
					 							<label for="accRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="accRemark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 用户信息 -->
										<div class="tab-pane" id="panel-3">
											<div class="row form-group">
					 							<label class="col-sm-1 control-label">
					 								客户号&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="customerNo2" type="text" readonly />
												</div>
					 							<label for="businessKey" class="col-sm-1 control-label">
					 								业务编号<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="userId" type="hidden"/>
													<input class="form-control" id="businessKey" type="text" placeholder="请输入业务编码"/>
													<span class="input-group-addon">
															<i class="icon-key bigger-110"></i>
													</span>
													</div>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="userDepartmentId" class="col-sm-1 control-label">用户部门</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="userDepartmentId" type="hidden" />
													<input class="form-control" id="userDepartmentName" type="text" placeholder="选择用户部门" />
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnChooseUserDept">
															选择
														</button>
													</span>
													</div>
												</div>
												<label for="userName" class="col-sm-1 control-label">
					 								用户名称<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="userName" type="text" placeholder="请输入用户名称"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="payPolicy" class="col-sm-1 control-label">付费类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="payPolicy">
													</select>
												</div>
					 							<label for="userAddress" class="col-sm-1 control-label">
					 								安装地址<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="userAddress" type="text" placeholder="请输入安装地址"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="userLinkPhone" class="col-sm-1 control-label">
					 								联系电话<a style="color:red;text-align: right;">*</a>
					 							</label>
												<div class="col-sm-3">
													<input class="form-control" id="userLinkPhone" type="text" placeholder="请输入联系电话"/>
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
												<!-- 
					 							<label for="creditorKey" class="col-sm-1 control-label">代缴电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="creditorKey" type="text" placeholder="请输入代缴电话" />
												</div>
												-->
											</div>
											<div class="row form-group">
					 							<label for="businessArea" class="col-sm-1 control-label">业务区域</label>
												<div class="col-sm-3">
													<select class="form-control" id="businessArea">
													</select>
												</div>
					 							<label for="userRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="userRemark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 资费 -->
										<div class="tab-pane" id="panel-4">
											<table id="table_view_plan" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th><i class="icon-edit purple bigger-110"></i></th>
														<th><i class="icon-flag red bigger-110"></i></th>
														<th><i class="icon-money orange bigger-110"></i></th>
														<th >名称</th>
														<th >周期</th>
														<th >套餐费</th>
														<th >描述</th>
														<th>订购数</th>
														<th>单价(￥)</th>
														<th>订购备注</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>										
										</div>
										
										<!-- 增值服务 -->
										<div class="tab-pane" id="panel-5">
											<table id="table_view_product" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th><i class="icon-edit purple bigger-110"></i></th>
														<th><i class="icon-flag red bigger-110"></i></th>
														<th><i class="icon-money orange bigger-110"></i></th>
														<th>产品名称</th>
														<th>单价（￥）</th>
														<th>单位</th>
														<th>订购数量</th>
														<th>订购单价（￥）</th>
														<th>备注</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>										
										</div>
										
										<!-- 业务受理费 -->
										<div class="tab-pane" id="panel-6">
											<div class="row clearfix">
												<div class="col-md-12 column">
													<div class="row clearfix">
														<div class="col-md-7 column">
															<table id="table_view_fee" class="table table-striped table-bordered table-hover">
																<thead>
																	<tr>
																		<th><i class="icon-edit purple bigger-110"></i></th>
																		<th><i class="icon-flag red bigger-110"></i></th>
																		<th><i class="icon-money orange bigger-110"></i></th>
																		<th>费用名称</th>
																		<th>预收费用（￥）</th>
																		<th>实收费用（￥）</th>
																		<th>备注</th>
																	</tr>
																</thead>
																<tbody></tbody>
															</table>										
														</div>
														<div class="col-md-5 column">
															<div class="widget-box widget-color-blue">
																<div class="widget-header">
																	<h5 class="widget-title bigger lighter">
																		<i class="icon-shopping-cart orange bigger-110"></i>
																		费用合计
																	</h5>
																</div>
																<div class="widget-body">
																	<div class="widget-main padding-24">
																		<div class="row form-group">
																			<label class="col-sm-3 control-label">应收费：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control" id="amountDue" type="text" value="0" readonly />
																				</div>
																			</div>
																		</div>
																		<div class="row form-group">
																			<label class="col-sm-3 control-label">实收费：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control" id="amountProceed" type="text" value="0" />
																				</div>
																			</div>
																		</div>
																		<div class="row form-group">
																			<label class="col-sm-3 control-label">票据打印：</label>
																			<div class="col-sm-9">
																				<label>
																					<input id="printFlag" class="ace ace-switch ace-switch-7" type="checkbox" />
																					<span class="lbl"></span>
																				</label>
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
										
									</div>
								</div>					
							<!-- </form> -->
						</div>
						
						<div class="panel-footer">
							<button type="button" id="save" class="btn btn-sm btn-primary" style="display: none;">开户</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
							<button type="button" id="lastpage" class="btn btn-sm btn-primary">上一页</button>
							<button type="button" id="nextpage" class="btn btn-sm btn-primary">下一页</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var parentProductId = "n"; // Used by product.js
		var businessType = "n";
		var opType = "setup";
		var busiType = (businessType + "_" + opType).toLowerCase(); // Used by fee.js
		
        // 初始化页面控件
        $(document).ready(function () {
        	$("[data-toggle='tooltip']").tooltip();
        	// 初始化字典表
        	loadRefs();
            // 初始化客户经理
            loadCustomerManager();
            // 初始化部门树
			initResDeptTree();
			// 显示套餐选择清单
			initEditablePlanList(businessType);
       		$('#table_view_plan tbody').on('click', 'td.details-control', openPlanEditor);  
       		// 显示产品和增值服务选择清单
       		initEditableProductList();
       		$('#table_view_product tbody').on('click', 'td.details-control', openProductEditor);  
       		// 显示产品和增值服务选择清单
       		initEditableFeeList();
       		$('#table_view_fee tbody').on('click', 'td.details-control', openFeeEditor);  
       		// 设置客户名称、地址、联系电话值变化事件
       		initChanged();
       	});
       	
		// 选择客户
		var fnBtnClickedCustomer;
		$("#btnPickCustomerNo").click(function() {
			fnBtnClickedCustomer = function(customerId, customerNo, customerName) {
				if (customerId == undefined || customerId == "") {
					var parm = {
							"policyKey": "CUSTOMER_NO", 
							"variable": "${sessionScope.userInfo.deptAbbr}"
					};
					var res = ajaxCRUD("seq!currVal.do", parm, false);
					$("#customerNo").val(res.seqVal);
					$("#customerNo1").val(res.seqVal);
					$("#customerNo2").val(res.seqVal);
				} else {
					// 载入客户和账户信息
					loadCustomer(customerId);
					loadAccount(customerId);
				}
			};
			$("#btnGenerateCustomerNo").show();
			$("#crCustomer").val($("#customerNo").val());
			doSearchCustomer();
			$("#dlgCustomer").modal("show");
		});
		
		// 地址输入
		$("#address").focus(function() {
			fnAddressChoosed = function(address) {
				$("#address").val(address);
			};
			$("#dlgAddress").modal("show");
		});
		
		// 选择代缴客户
		$("#btnChooseCreditor").click(function() {
			fnBtnClickedCustomer = function(customerId, customerNo, customerName) {
				$("#creditor").val(customerId);
				$("#creditorName").val(customerNo + " " + customerName);
			};
			$("#btnGenerateCustomerNo").hide();
			$("#dlgCustomer").modal("show");
		});
		
		$("#customerNo").change(function() {
			$("#customerNo1").val($("#customerNo").val());
			$("#customerNo2").val($("#customerNo").val());
		});
		
		
        var fnDeptChoosed;
        $("#btnChooseCustomerDept").click(function() { 
        	fnDeptChoosed = function(id, name) {
        		$("#departmentId").val(id);
        		$("#departmentName").val(name);
        	}; 
        	$("#dlgResDept").modal("show");
        });
       
        $("#btnChooseUserDept").click(function() {
        	fnDeptChoosed = function(id, name) {
        		$("#userDepartmentId").val(id);
        		$("#userDepartmentName").val(name);
        	}; 
        	$("#dlgResDept").modal("show");
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
        
        function validate() {
        	var flag = validateCustomer();
        	if (!flag) return false;
        	flag = validateAccount();
        	if (!flag) return false;
        	flag = validateUser();
        	if (!flag) return false;
        	flag = validateAmount();
        	if (!flag) return false;
        	return true;
        }
        
        $("#save").click(function() {
        	var v = validate();
        	if (!v) return;
        	
        	var op = "${sessionScope.userInfo.userName}";
        	var parm = {
        		"obj.creator": op,
        		"obj.opType": opType,
        		"obj.amountDue": $("#amountDue").val(),
        		"obj.amountProceed": $("#amountProceed").val(),
        		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
        		
        		"obj.customer.id": $("#customerId").val(),
    			"obj.customer.name": $("#name").val(),
        		"obj.customer.customerNo": $("#customerNo").val(),
        		"obj.customer.customerType": $("#customerType").val(),
        		"obj.customer.departmentId": $("#departmentId").val(),
        		"obj.customer.address": $("#address").val(),
        		"obj.customer.certType": "1",
        		"obj.customer.certId": $("#certId").val(),
        		"obj.customer.linker": $("#linker").val(),
        		"obj.customer.linkPhone": $("#linkPhone").val(),
        		"obj.customer.email": $("#email").val(),
        		"obj.customer.linkAddress": $("#linkAddress").val(),
        		"obj.customer.vip": $("#vip").val(),
        		"obj.customer.loyalty": $("#loyalty").val(),
        		"obj.customer.customerManager": $("#customerManager").val(),
        		"obj.customer.status": 0,
        		"obj.customer.creator": op,
        		"obj.customer.remark": $("#remark").val(),
        		
        		"obj.account.id": $("#accountId").val(),
        		"obj.account.payMethod": $("#payMethod").val(),
        		"obj.account.creditor": $("#creditor").val(),
        		"obj.account.bankName": $("#bankName").val(),
        		"obj.account.bankAcc": $("#bankAcc").val(),
        		"obj.account.bankAccOwner": $("#bankAccOwner").val(),
        		"obj.account.amount": $("#amount").val(),
        		"obj.account.score": 0,
        		"obj.account.remark": $("#accRemark").val(),
        		
        		"user.businessType" : businessType,
        		"user.businessKey" : $("#businessKey").val(),
        		"user.name" : $("#userName").val(),
        		"user.departmentId" : $("#userDepartmentId").val(),
        		"user.payPolicy": $("#payPolicy").val(),
        		"user.address": $("#userAddress").val(),
        		"user.linkPhone": $("#userLinkPhone").val(),
        		"user.creator": op,
        		"user.remark": $("#userRemark").val(),
        		"user.businessArea": $("#businessArea").val(),
        		//"user.creditorKey": $("#creditorKey").val(),
        		"user.creditorKey": $("#creditorTargetCustomerId").val() + "," + $("#creditorTargetUserId").val() + "," + $("#creditorTemplateId").val(),
        	};
        	
        	var index = 0;
        	
        	var tableData = table_view_plan.rows().data();
        	var planCount = tableData.length;
        	for (var i = 0; i < planCount; i++) {
        		var data = tableData[i];
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
    	    	}
        	}
        	
        	tableData = table_view_product.rows().data();
        	var productCount = tableData.length;
        	for (var i = 0; i < productCount; i++) {
        		var data = tableData[i];
        		if (data.productChoosed == "1") {
		        	parm["orderItems[" + index + "].itemId"] = data.id;
    		    	parm["orderItems[" + index + "].itemName"] = data.name;
    		    	parm["orderItems[" + index + "].itemType"] = 2;
    		    	parm["orderItems[" + index + "].saleType"] = data.saleType;
    		    	if (data.saleType == 1) {
    	 		   		parm["orderItems[" + index + "].term"] = "次";
    		    	} else {
    	 		   		parm["orderItems[" + index + "].term"] = data.term;
    	 		   	}
    	   		 	parm["orderItems[" + index + "].itemCount"] = data.productOrderCount;
    	    		parm["orderItems[" + index + "].itemPrice"] = data.productOrderPrice;
    	    		parm["orderItems[" + index + "].remark"] = data.productChoosedRemark;
    	    		parm["orderItems[" + index + "].payFlag"] = data.productPayChoosed;
    	    		index++;
    	    	}
        	}
        	
        	tableData = table_view_fee.rows().data();
        	var feeCount = tableData.length;
        	for (var i = 0; i < feeCount; i++) {
        		var data = tableData[i];
        		if (data.feeChoosed == "1") {
		        	parm["orderItems[" + index + "].itemId"] = data.id;
    		    	parm["orderItems[" + index + "].itemName"] = data.name;
    		    	parm["orderItems[" + index + "].itemType"] = 3;
    		    	parm["orderItems[" + index + "].saleType"] = 1;
   	 		   		parm["orderItems[" + index + "].term"] = "次";
    	   		 	parm["orderItems[" + index + "].itemCount"] = 1;
    	    		parm["orderItems[" + index + "].itemPrice"] = data.feeOrderPrice;
    	    		parm["orderItems[" + index + "].remark"] = data.feeChoosedRemark;
    	    		parm["orderItems[" + index + "].payFlag"] = data.feePayChoosed;
    	    		index++;
    	    	}
        	}
        	
        	var res = ajaxCRUD("order!insert.do", parm, true);
        	if (res.resNum == "0") {
        		if ($("#printFlag").get(0).checked && parseFloat($("#amountProceed").val()) > 0) {
        			var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=receipt_phone.cpt&id=" + res.id;
        			window.open(uri);
        		}
        		reset();
        	}
        });
        
        var index = 1;
        function reset() {
			index = 1;
			$("#save").hide();
        	$('#tabtable1 a:first').tab('show');        	
			resetCustomer();
        	resetAccount();
        	resetUser();
        	resetAmountDue();
        	table_view_plan.ajax.reload();
        	table_view_product.ajax.reload();
        	table_view_fee.ajax.reload();
        }
        
        $("#reset").click(function() {
        	reset();
        });
        
        $("#tabtable1 a").on("click",function(){//给tab-panel的超链接定义点击事件，获取tab的index
			var hrefstr = this.href;
        	var tabs = hrefstr.split("#");
        	index = tabs[1].split("-")[1];
        	if(index==6){
        		$("#save").show();
        	}else{
        		$("#save").hide();
        	}
        })
        
		$("#nextpage").click(function(){
			var flag;
			if( index == 1 ){
				flag = validateCustomer();
        		if (!flag) return;
        		index++;
				$('#tabtable1 a[href="#panel-2"]').tab('show');
			}else if( index == 2 ){
        		index++;
				$('#tabtable1 a[href="#panel-3"]').tab('show');
			}else if( index == 3 ){
				flag = validateUser();
        		if (!flag) return;
        		index++;
				$('#tabtable1 a[href="#panel-4"]').tab('show');
			}else if( index == 4 ){
        		index++;
				$('#tabtable1 a[href="#panel-5"]').tab('show');
			}else if( index == 5 ){
        		index++;
				$('#tabtable1 a[href="#panel-6"]').tab('show');
				$("#save").show();
			}else if( index == 6 ){
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
			$("#save").hide();
			if(index > 1){
				index--;
				$('#tabtable1 a[href="#panel-'+index+'"]').tab('show'); 
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
        
		<jsp:include page="../pub/resDeptDlg.jsp" flush="true"/>
		<jsp:include page="../pub/customerDlg.jsp" flush="true"/>
		<jsp:include page="../pub/creditorDlg.jsp" flush="true"/>
		<jsp:include page="../pub/addressDlg.jsp" flush="true"/>
        
	</body>
</html>
		