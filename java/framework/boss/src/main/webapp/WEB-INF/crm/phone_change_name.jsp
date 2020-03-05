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
		<script src="assets/js/jquery.tabledit.min.js"></script>
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<!-- Customize -->
		<script src="js/customer.js"></script>
		<script src="js/user.js"></script>
		<script src="js/pricePlan.js"></script>
		<script src="js/product.js"></script>
		<script src="js/fee.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					更名
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
								<i class="icon-wrench red"></i>
									电话更名&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
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
									<div id="tab-head" style="margin-bottom: 30px;text-align:center;">
										<div id="tab1" style="width:10%; height:20px; display: inline-block;">
									    	<a href="#panel-1" data-toggle="tab" class="button button-glow button-pill button-raised button-primary" style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							更名
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab7" style="width:13%; height:20px; display: inline-block; ">
							 				<a href="#panel-7" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="purple icon-credit-card"></i>
							 					业务受理费
							 				</a>
						 				</div>
					 				</div>
									<div class="tab-content">
										<!-- 更名 -->
										<div class="tab-pane active" id="panel-1">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="businessKey" class="col-sm-2 control-label">
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
					 							<label for="oldUserName" class="col-sm-2 control-label">原用户名称</label>
												<div class="col-sm-6">
													<input class="form-control" id="oldUserName" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="oldCustomerName" class="col-sm-2 control-label">原客户名称</label>
												<div class="col-sm-6">
													<input class="form-control" id="oldCustomerName" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="newUserName" class="col-sm-2 control-label">
					 								新用户名称<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-6">
													<input class="form-control" id="newUserName" type="text" placeholder="请输入新用户名称" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="newCustomerName" class="col-sm-2 control-label">
					 								新客户名称<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-6">
													<input class="form-control" id="newCustomerName" type="text" placeholder="请输入新客户名称"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="changeNameRemark" class="col-sm-2 control-label">备注</label>
												<div class="col-sm-6">
													<input class="form-control" id="changeNameRemark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 客户信息 -->
										<div class="tab-pane" id="panel-2" style="display: none;">
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
													<select class="form-control" id="vip"></select>
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
										<div class="tab-pane" id="panel-3" style="display: none;">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-7">
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
										<div class="tab-pane" id="panel-4" style="display: none;">
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
													<input class="form-control" id="userPwd" type="text" placeholder="请输入查询密码"/>
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
										
										<!-- 资费 -->
										<div class="tab-pane" id="panel-5" style="display: none;">
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
										<div class="tab-pane" id="panel-6" style="display: none;">
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
																			<label for="payMethod" class="col-sm-3 control-label">支付方法</label>
																			<div class="col-sm-9">
																				<select class="form-control" id="payMethod"></select>
																			</div>
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
																			<label class="col-sm-3 control-label">预收费：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control" id="amountPre" type="text" value="0" />
																				</div>
																			</div>
																		</div>
																		<div class="row form-group">
																			<label class="col-sm-3 control-label red">实收费：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control red" id="amountProceed" type="text" value="0" readonly />
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
										<!-- 业务受理费 END -->
									</div>
								</div>					
							<!-- </form> -->
						</div>
						
						<div class="panel-footer" style="text-align: right; ">
							<button type="button" id="save" class="btn btn-sm btn-primary">更名</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
							<button type="button" id="lastpage" class="btn btn-sm btn-primary" style="display: none;">上一页</button>
							<button type="button" id="nextpage" class="btn btn-sm btn-primary">下一页</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var parentProductId = "p"; // Used by product.js
		var businessType = "p";
		var opType = "changeName";
		var busiType = (businessType + "_" + opType).toLowerCase(); // Used by fee.js
		var deptName = "${sessionScope.userInfo.deptName}";
		
        // 初始化页面控件
        $(document).ready(function () {
            // 初始化下拉框
            loadRefs();
       		// 显示产品和增值服务选择清单
       		initEditableFeeList();
       		$('#table_view_fee tbody').on('click', 'td.details-control', openFeeEditor);  
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
       			initPlanList(customerId, businessKey);
       			initProductList(customerId, businessKey);
       			$("#oldUserName").val($("#userName").val());
       			$("#oldCustomerName").val($("#name").val());
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        function validateInfo () {
        	$(".khtips").remove();
        	if ($("#businessKey").val().trim() === "") {
				addTips(1, 0, "请输入或查询电话号码");
		        return false;
			}
			if ($("#newUserName").val().trim() === "") {
				addTips(1, 3, "请输入新的用户名称");
				return false;
			}
        	if ($("#newUserName").val().trim() === $("#oldUserName").val().trim()) {
        		addTips(1, 3, "新用户名称和原用户名称不能相同");
        		return false;
        	}
			if ($("#newCustomerName").val().trim() === "") {
				addTips(1, 4, "请输入新客户名称");
        		return false;
        	}
        	if ($("#newCustomerName").val().trim() === $("#oldCustomerName").val().trim()) {
        		addTips(1, 4, "新客户名称和原客户名称不能相同");
        		return false;
        	}
        	return true;
        }
        
        function validate() {
        	var flag = validateInfo();
        	if (!flag) {
        		return false;	
        	}
        	var flag = validateAmount();
        	if (!flag) {
        		return false;	
        	}
        	return true;
        }
        
        $("#save").click(function () {
        	var v = validate();
        	if (!v) {
        		return;	
        	}
        	
        	var remark = "业务类型:" + busiType + ",备注:" + ($("#changeNameRemark").val() ? $("#changeNameRemark").val() : "") + ";";
        	var op = "${sessionScope.userInfo.userName}";
        	var parm = {
        		"obj.id": $("#userId").val(),
        		"obj.creator": op,
        		"obj.opType": opType,
        		"obj.businessType": businessType,
        		"obj.remark": remark,
        		"obj.amountDue": $("#amountDue").val(),
        		"obj.amountProceed": $("#amountProceed").val(),
        		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
        		"obj.user.name": $("#newUserName").val(),
        		"obj.customer.name": $("#newCustomerName").val(),
        	};
        	
        	var index = 0;
        	var i;
        	var tableData = table_view_fee.rows().data();
        	var feeCount = tableData.length;
        	for (i = 0; i < feeCount; i++) {
        		var data = tableData[i];
        		if (data.feeChoosed === "1") {
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
        	
        	var res = ajaxCRUD("order!changeName.do", parm, true);
        	
        	if (res.resNum === "0") {
        		if ($("#printFlag").get(0).checked && parseFloat($("#amountProceed").val()) > 0) {
        			if (!res.id) return;
        			var rpt = printInvoice(res.id);
					var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rpt;
					window.open(uri);
        		}
        		reset();
        	}
        });
        
        var index = 1;
        function reset() {
        	$(".khtips").remove();
        	index = 1;
        	$("#lastpage").hide();
        	$("#nextpage").show();
        	$('#tab-head').find('a:eq(0)').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        	$('#tab-head a').not('a:eq(0)').removeClass().addClass("button button-glow button-border button-pill button-primary");   	
			$("#businessKey").val("");
			$("#oldUserName").val("");
			$("#oldCustomerName").val("");
			$("#newUserName").val("");
			$("#newCustomerName").val("");
			$("#changeNameRemark").val("");
			resetCustomer();
        	resetAccount();
        	resetUser();
        	resetAmountDue();
        	table_view_plan.ajax.clear();
        	table_view_product.ajax.clear();
        	table_view_fee.ajax.clear();
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
        	if (index === 1) {
        		$("#lastpage").hide();
        		$("#nextpage").show();
        	}
        	else if (index === 7) {
        		$("#lastpage").show();
        		$("#nextpage").hide();
        	}
        });
        
        /*上下页翻页*/
        $("#nextpage").click(function () {
        	$(".khtips").remove();	
        	var flag;
			if (index === 1) {
				flag = validateInfo();
				if (!flag) {
					return;	
				}
				index = 7;
				$("#lastpage").show();
				$("#nextpage").hide();
				$('#tab-head a[href="#panel-7"]').tab('show');
				$('#tab1 a').removeClass().addClass("button button-glow button-border button-pill button-primary");
				$('#tab7 a').removeClass().addClass("button button-glow button-pill button-raised button-primary");
			}
		});
		
		$("#lastpage").click(function () {
			if (index == 7) {
				$("#lastpage").hide();
				$("#nextpage").show();
				$('#tab-head a[href="#panel-1"]').tab('show'); 
				$('#tab1 a').removeClass().addClass("button button-pill button-raised button-primary");
				$('#tab7 a').removeClass().addClass("button button-glow button-border button-pill button-primary");
				index = 1;
			}
		});
		
        </script>
        
		<jsp:include page="../pub/userDlg.jsp" flush="true"/>
	</body>
</html>
