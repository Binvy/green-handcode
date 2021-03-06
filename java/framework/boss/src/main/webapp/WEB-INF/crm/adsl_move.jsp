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
		<script src="js/customer.js"></script>
		<script src="js/adsl.js"></script>
		<script src="js/pricePlan.js"></script>
		<script src="js/product.js"></script>
		<script src="js/fee.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">ADSL业务受理</a>
				</li>
				<li class="active">
					移机
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
								<i class="icon-resize-horizontal red"></i>
								ADSL移机&nbsp;&nbsp;&nbsp;&nbsp;<code style="color:red;font-size: 10px;background-color: transparent;">( 带 * 的为必填项 )</code>
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
							        	 <!--如果需要进度条添加以下部分:type="button" data-toggle="collapse" data-target="#collapseOne2" 
											aria-expanded="false" aria-controls="collapseOne2"-->
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
										<li class="active">
							 				<a href="#panel-1" data-toggle="tab">
							 					<i class="red icon-resize-horizontal bigger-110"></i>
							 					移机
							 				</a>
										</li>
										<li>
											<a href="#panel-2" data-toggle="tab">
												<i class="green icon-user-md bigger-110"></i>
						 						客户信息
						 					</a>
										</li>
										<li>
						 					<a href="#panel-3" data-toggle="tab">
						 						<i class="red icon-money bigger-110"></i>
						 						账户信息
						 					</a>
										</li>
										<li>
							 				<a href="#panel-4" data-toggle="tab">
							 					<i class="blue icon-phone bigger-110"></i>
							 					用户信息
							 				</a>
										</li>
										<li>
							 				<a href="#panel-5" data-toggle="tab">
							 					<i class="dark icon-dollar bigger-110"></i>
							 					资费
							 				</a>
										</li>
										<li>
							 				<a href="#panel-6" data-toggle="tab">
							 					<i class="orange icon-tags bigger-110"></i>
							 					增值服务
							 				</a>
										</li>
										<li>
							 				<a href="#panel-7" data-toggle="tab">
							 					<i class="purple icon-credit-card bigger-110"></i>
							 					业务受理费
							 				</a>
										</li>
									</ul>
									<div class="tab-content">
										<!-- 业务受理费 -->
										<div class="tab-pane active" id="panel-1">
											<div class="row form-group">
					 							<label for="businessKey" class="col-sm-1 control-label">
					 								上网账号<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="userId" type="hidden"/>
													<input class="form-control" id="businessKey" type="text" placeholder="（输入上网账号）查询"/>
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnChooseUser">
															<i class="ace-icon fa fa-calendar bigger-110"></i>
															查询
														</button>
													</span>
													</div>
												</div>
					 							<label for="userName" class="col-sm-1 control-label">用户名称</label>
												<div class="col-sm-7">
													<input class="form-control" id="userName" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="phoneNo1" class="col-sm-1 control-label">关联电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="phoneNo1" type="text" readonly/>
												</div>
					 							<label for="oldUserAddress" class="col-sm-1 control-label">原地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="oldUserAddress" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="oldPostAddress" class="col-sm-1 control-label">原邮政</label>
												<div class="col-sm-7">
													<input class="form-control" id="oldPostAddress" type="text" placeholder="市政标准地址"/>
												</div>
											</div>
											<div class="hr hr-18 dotted hr-double"></div>
											<div class="row form-group">
					 							<label for="newBusinessKey" class="col-sm-1 control-label">
					 								现账号&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="newBusinessKey" type="text" placeholder="请输入新账号"/>
												</div>
					 							<label for="newOutVlan" class="col-sm-1 control-label">
					 								现VLAN&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="newOuterVlan" type="text" placeholder="请输入新的VLAN账号"/>
												</div>
					 							<label for="newBusinessArea" class="col-sm-1 control-label">
					 								现区域&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<select class="form-control" id="newBusinessArea">
													</select>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="newUserAddress" class="col-sm-1 control-label">
					 								现地址&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="newUserAddress" type="text" placeholder="请先选择用户，点击选择新安装地址" readonly/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="newPostAddress" class="col-sm-1 control-label">现邮政</label>
												<div class="col-sm-7">
													<input class="form-control" id="newPostAddress" type="text" placeholder="市政标准地址"/>
												</div>
											</div>
										</div>
										
										<!-- 客户信息 -->
										<div class="tab-pane" id="panel-2">
											<div class="row form-group">
					 							<label for="customerNo" class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-3">
													<input id="customerId" type="hidden"/>
													<input class="form-control" id="customerNo" type="text" placeholder="输入或生成合同号" />
												</div>
												<label for="customerManager" class="col-sm-1 control-label">客户经理</label>
												<div class="col-sm-3">
													<select class="form-control" id="customerManager">
													</select>
												</div>
												<label for="certId" class="col-sm-1 control-label">证件号码</label>
												<div class="col-sm-3">
													<input class="form-control" id="certId" type="text" placeholder="请输入证件号码" />
												</div>
											</div>
											<div class="row form-group">
					 							<label for="customerType" class="col-sm-1 control-label">客户类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="customerType">
													</select>
												</div>
					 							<label for="name" class="col-sm-1 control-label">名称</label>
												<div class="col-sm-7">
													<input class="form-control" id="name" type="text" placeholder="请输入个人姓名或公司名称"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="departmentName" class="col-sm-1 control-label">部门</label>
												<div class="col-sm-3">
													<input id="departmentId" type="hidden"/>
													<input class="form-control" id="departmentName" type="text" placeholder="请输入部门" />
												</div>
					 							<label for="address" class="col-sm-1 control-label">地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="address" type="text" placeholder="请输入地址" />
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
													<input class="form-control" id="remark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 账户信息 -->
										<div class="tab-pane" id="panel-3">
											<div class="row form-group">
					 							<label class="col-sm-1 control-label">客户号</label>
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
													<input type="hidden" id="creditor" />
													<input class="form-control" id="creditorName" type="text" placeholder="请输入代缴客户" />
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
					 							<label for="accRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="accRemark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 用户信息 -->
										<div class="tab-pane" id="panel-4">
											<div class="row form-group">
					 							<label class="col-sm-1 control-label">
					 								客户号&nbsp;<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="customerNo2" type="text" readonly />
												</div>
												<label for="phoneNo" class="col-sm-1 control-label">
					 								绑定电话<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="phoneNo" type="text" placeholder="请输入或生成绑定电话" />
												</div>
					 							<label for="businessKey1" class="col-sm-1 control-label">
					 								上网账号<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="businessKey1" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="userPwd" class="col-sm-1 control-label">
					 								登录口令<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="userPwd" type="password" placeholder="请输入登录口令"/>
												</div>
					 							<label for="userName" class="col-sm-1 control-label">
					 								用户名称<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="userName" type="text" placeholder="请输入用户名称"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="userDepartmentId" class="col-sm-1 control-label">用户部门</label>
												<div class="col-sm-3">
													<input id="userDepartmentId" type="hidden" />
													<input class="form-control" id="userDepartmentName" type="text" placeholder="请输入用户部门" />
												</div>
												<label for="userAddress" class="col-sm-1 control-label">
					 								安装地址<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="userAddress" type="text" placeholder="请输入安装地址"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="payPolicy" class="col-sm-1 control-label">付费类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="payPolicy">
													</select>
												</div>
					 							<label for="postAddress" class="col-sm-1 control-label">邮政地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="postAddress" type="text" placeholder="请输入市政标准地址"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="userLinkPhone" class="col-sm-1 control-label">
					 								联系电话<a style="color:red;text-align: right;">*</a>
				 								</label>
												<div class="col-sm-3">
													<input class="form-control" id="userLinkPhone" type="text" placeholder="请输入联系电话"/>
												</div>
												<label for="creditorKey" class="col-sm-1 control-label">代缴电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="creditorKey" type="text" placeholder="请输入代缴电话" />
												</div>
												<label for="notifyPolicy" class="col-sm-1 control-label">提醒策略</label>
												<div class="col-sm-3">
													<select class="form-control" id="notifyPolicy">
													</select>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="speed" class="col-sm-1 control-label">带宽</label>
												<div class="col-sm-3">
													<select class="form-control" id="speed">
													</select>
												</div>
												<label for="outerVlan" class="col-sm-1 control-label">VLAN</label>
												<div class="col-sm-3">
													<input class="form-control" id="outerVlan" type="text" placeholder="请输入VLAN账号" />
												</div>
					 							<label class="col-sm-1 control-label">绑定MAC</label>
												<div class="col-sm-3">
													<input class="form-control" id="macAddress" type="text" placeholder="请输入绑定的MAC地址"/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="userArea" class="col-sm-1 control-label">用户区域</label>
												<div class="col-sm-3">
													<select class="form-control" id="userArea">
													</select>
												</div>
					 							<label for="businessArea" class="col-sm-1 control-label">业务区域</label>
												<div class="col-sm-3">
													<select class="form-control" id="businessArea">
													</select>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="userRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="userRemark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 资费 -->
										<div class="tab-pane" id="panel-5">
											<table id="table_view_plan" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th><i class="icon-flag red bigger-110"></i></th>
														<th >名称</th>
														<th >周期</th>
														<th >套餐费</th>
														<th >描述</th>
														<th>订购备注</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>										
										</div>
										
										<!-- 增值服务 -->
										<div class="tab-pane" id="panel-6">
											<table id="table_view_product" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th><i class="icon-flag red bigger-110"></i></th>
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
										<div class="tab-pane" id="panel-7">
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
																			<label class="col-sm-12 control-label red" id="createTimeTip"></label>
																		</div>
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
							<button type="button" id="save" class="btn btn-sm btn-primary" style="display: none;" >移机</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
							<button type="button" id="lastpage" class="btn btn-sm btn-primary">上一页</button>
							<button type="button" id="nextpage" class="btn btn-sm btn-primary">下一页</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var parentProductId = "a"; // Used by product.js
		var businessType = "a";
		var opType = "move";
		var busiType = (businessType + "_" + opType).toLowerCase(); // Used by fee.js
		
        // 初始化页面控件
        $(document).ready(function () {
            // 初始化客户经理
            loadCustomerManager();
            // 初始化下拉框
            loadRefs();
            loadRef("ref_business_area", "newBusinessArea", "--业务区域--");
       		// 显示产品和增值服务选择清单
       		initEditableFeeList();
       		$('#table_view_fee tbody').on('click', 'td.details-control', openFeeEditor);  
       	});
       	
        // 选择号码
        var fnUserChoosed;
        $("#btnChooseUser").click(function() { 
        	$("#userStatus").val("2");
        	var phoneNo = $("#businessKey").val();
        	$("#crUser").val(phoneNo);
        	fnUserChoosed = function(userId, businessKey) {
       			$("#userId").val(userId);
       			$("#businessKey").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			initPlanList(customerId, businessKey);
       			initProductList(customerId, businessKey);
       			$("#businessKey1").val(businessKey);
       			$("#userName1").val($("#userName").val());
       			$("#oldUserAddress").val($("#userAddress").val());
       			$("#oldPostAddress").val($("#postAddress").val());
       			$("#phoneNo1").val($("#phoneNo").val());
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        var fnAddressChoosed;
        $("#newUserAddress").focus(function() {
        	fnAddressChoosed = function(address, vlan, accPrefix, businessArea){
        		if ($("#userId").val() == "") return;
        		$("#newUserAddress").val(address);
        		//$("#newBusinessKey").val(accPrefix);
        		$("#newOuterVlan").val(vlan);
        		$("#newBusinessArea").val(businessArea);
        		// 判断是否需要更换账号
        		var oldAcc = $("#businessKey1").val();
        		if (accPrefix != null) {
        			var prefixes = accPrefix.split(",");
        			var match = false;
        			for (var i = 0; i < prefixes.length; i++) {
        				var prefix = prefixes[i];
        				var pattern = "^" + prefix.replace("%", "/d*") + "$";
        				var reg = new RegExp(pattern);
        				if (reg.test(oldAcc)) {
        					$("#newBusinessKey").val(oldAcc);
        					match = true;
        				}
        			}
        			if (!match) {
        				var parm = {
        					"obj.acc": accPrefix,
        					"obj.bearable": businessType
        				};
        				var res = ajaxCRUD("resAcc!findTopUsable.do", parm, false);
	    	    		$("#newBusinessKey").val(res.id);
        			}
        		}
        	};
        	$("#dlgAddress").modal("show");
        });
        
        $("#address").focus(function() {
			fnAddressChoosed = function(address) {
				$("#address").val(address);
			};
			$("#dlgAddress").modal("show");
		});
        
        function validate() {
        	var flag = validateUser();
        	if (!flag) return false;
        	if ($("#newUserAddress").val() == "" || $("#newUserAddress").val() == $("#oldUserAddress").val()) {
        		bbAlert("请输入新安装地址，且新安装地址和原安装地址必须不同");
        		return false;
        	}
        	flag = validateAmount();
        	if (!flag) return false;
        	return true;
        }
        
        $("#save").click(function() {
        	var v = validate();
        	if (!v) return;
        	
        	var op = "${sessionScope.userInfo.userName}";
        	var parm = {
        		"obj.id": $("#userId").val(),
        		"obj.creator": op,
        		"obj.opType": opType,
        		"obj.businessType": businessType,
        		//"obj.remark": $("#newUserAddress").val(),
        		"obj.amountDue": $("#amountDue").val(),
        		"obj.amountProceed": $("#amountProceed").val(),
        		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
        		"obj.user.address": $("#newUserAddress").val(),
        		"obj.user.postAddress": $("#newPostAddress").val(),
        		"obj.user.businessArea": $("#newBusinessArea").val(),
        		"obj.user.businessKey": $("#newBusinessKey").val(),
        		"obj.user.remark": $("#newOuterVlan").val()
        	};
        	
        	var index = 0;
        	
        	var tableData = table_view_fee.rows().data();
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
        	
        	var res = ajaxCRUD("order!moveUser.do", parm, true);
        	if (res.resNum == "0") {
        		if ($("#printFlag").get(0).checked && parseFloat($("#amountProceed").val()) > 0) {
        			var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=receipt_data.cpt&id=" + res.id;
        			window.open(uri);
        		}
        		reset();
        	}
        });
        
        var index = 1;//翻页需要
        function reset() {
        	index = 1;
        	$("#save").hide();
			$("#tabtable1 li:eq(0) a").tab("show");
			$("#businessKey1").val("");
			$("#userName1").val("");
			$("#oldUserAddress").val("");
			$("#newUserAddress").val("");  
			$("#oldPostAddress").val("");
			$("#newPostAddress").val(""); 
			$("#phoneNo1").val("");  	
			$("#newOuterVlan").val("");
			$("#newBusinessKey").val("");
			$("#newBusinessArea").val("");
			resetCustomer();
        	resetAccount();
        	resetUser();
        	resetAmountDue();
        	table_view_plan.ajax.clear();
        	table_view_product.ajax.clear();
        	table_view_fee.ajax.clear();
        }
        
        $("#reset").click(function() {
        	reset();
        });
        
        /*翻页功能*/
        $("#tabtable1 a").on("click",function(){//给tab-panel的超链接定义点击事件，获取tab的index
			var hrefstr = this.href;
        	var tabs = hrefstr.split("#");
        	index = tabs[1].split("-")[1];
        	 if(index==7){
         		$("#save").show();
         	}else{
         		$("#save").hide();
         	}
        })
        
        $("#nextpage").click(function(){
			var flag;
			if( index == 1 ){
				if ($('#businessKey').val() == ""){
					bbAlert("请先输入或查询上网账号");
					return false;
				}
				if ($('#newBusinessKey').val() == ""){
					bbAlert("请输入现账号");
					return false;
				}
				if ($('#newOuterVlan').val() == ""){
					bbAlert("请输入现VLAN账号");
					return false;
				}
				if ($('#newBusinessArea').val() == ""){
					bbAlert("请选择业务区域");
					return false;
				}
				/* if ($("#newUserAddress").val() == "" || $("#newUserAddress").val() == $("#oldUserAddress").val()) {
	        		bbAlert("请输入新安装地址，且新安装地址和原安装地址必须不同");
	        		return false;
	        	} */
        		index++;
				$('#tabtable1 a[href="#panel-2"]').tab('show');
			}else if( index == 2 ){
        		index++;
				$('#tabtable1 a[href="#panel-3"]').tab('show');
			}else if( index == 3 ){
        		index++;
				$('#tabtable1 a[href="#panel-4"]').tab('show');
			}else if( index == 4 ){
				flag = validateUser();
        		if (!flag) return;
        		index++;
				$('#tabtable1 a[href="#panel-5"]').tab('show');
			}else if( index == 5 ){
        		index++;
				$('#tabtable1 a[href="#panel-6"]').tab('show');
			}else if( index == 6 ){
        		index++;
				$('#tabtable1 a[href="#panel-7"]').tab('show');
				$("#save").show();
			}else if( index == 7 ){
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
        
		<jsp:include page="../pub/addressDlg.jsp" flush="true"/>
		<jsp:include page="../pub/userDlg.jsp" flush="true"/>
		<jsp:include page="../pub/addressDlg.jsp" flush="true"/>
        
	</body>
</html>
