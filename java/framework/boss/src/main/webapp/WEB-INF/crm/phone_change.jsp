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
		<!-- icheck -->
		<link rel="stylesheet" href="assets/css/skins/square/orange.css">
		<link rel="stylesheet" href="assets/css/datepicker/datetimepicker.css" />
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
		<script src="assets/js/icheck.min.js"></script>
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<script src="assets/js/datepicker/bootstrap-datetimepicker.js"></script>
		<!-- Customize -->
		<script src="js/customer.js"></script>
		<script src="js/user.js"></script>
		<script src="js/fee.js"></script>
		<script src="js/pricePlanCart.js"></script>
		<script src="js/productCart.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					业务变更
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
								<i class="icon-retweet blue"></i>
								业务变更 - 调整资费和增值服务&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
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
									    	<a href="#panel-1" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							客户信息
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
							        	<div id="tab2" style="width:12%; height:20px; display: inline-block;">
						 					<a href="#panel-2" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
						 						<i class="red icon-money"></i>
						 						账户信息
						 					</a>
					 					</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								       <div id="tab3" style="width:12%; height:20px; display: inline-block;">
							 				<a href="#panel-3" data-toggle="tab" class="button button-glow button-pill button-raised button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="green icon-phone"></i>
							 					用户信息
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab4" style="width:12%; height:20px; display: inline-block;">
							 				<a href="#panel-4" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="dark icon-dollar"></i>
							 					套餐
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab5" style="width:12%; height:20px; display: inline-block;">
							 				<a href="#panel-5" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="orange icon-tags"></i>
							 					增值服务
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab6" style="width:15%; height:20px; display: inline-block;">
							 				<a href="#panel-6" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="purple icon-credit-card"></i>
							 					业务受理费
							 				</a>
						 				</div>
					 				</div>
									<div class="tab-content">
										<!-- 客户信息 -->
										<div class="tab-pane" id="panel-1">
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="businessType" class="col-sm-1 control-label red">业务类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="businessType"></select>
												</div>
												<label for="deptArea" class="col-sm-1 control-label">业务区域</label>
												<div class="col-sm-3">
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
										<div class="tab-pane" id="panel-2">
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
										<div class="tab-pane active" id="panel-3">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label class="col-sm-1 control-label">
					 								客户号
					 							</label>
												<div class="col-sm-3">
													<input class="form-control" id="customerNo2" type="text" readonly />
												</div>
											</div>
											<div class="hr hr8 hr-double hr-dotted"></div>
											<div id="userPhone">
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="phoneNo" class="col-sm-1 control-label">电话号码</label>
													<div class="col-sm-3">
														<div class="input-group">
															<input id="phoneUserId" type="hidden"/>
															<input class="form-control" id="phoneNo" type="text" placeholder="选择号码"/>
															<span class="input-group-btn">
																<button class="btn btn-sm btn-default" id="btnChoosePhoneUser">
																	<i class="ace-icon fa fa-calendar bigger-110"></i>
																	选择
																</button>
															</span>
														</div>
													</div>
													<label for="purpose" class="col-sm-1 control-label">电话用途</label>
													<div class="col-sm-3">
														<select class="form-control" id="purpose"></select>
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
													<label for="phonePwd" class="col-sm-1 control-label">查询密码</label>
													<div class="col-sm-3">
														<input class="form-control" id="phonePwd" type="text" placeholder="请输入查询密码"/>
													</div>
													<label for="adjustPolicy" class="col-sm-1 control-label">调级策略</label>
													<div class="col-sm-3">
														<select class="form-control" id="adjustPolicy"></select>
													</div>
												</div>
											</div>
											<div id="userBroad" style="display: none;">
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="accNo" class="col-sm-1 control-label">上网账号</label>
													<div class="col-sm-3">
														<div class="input-group">
															<input id="accUserId" type="hidden"/>
															<input id="userBusinessType" type="hidden" value="B"/>
															<input class="form-control" id="accNo" type="text" placeholder="（输入上网账号）查询"/>
															<span class="input-group-btn">
																<button class="btn btn-sm btn-default" id="btnChooseAccUser">
																	<i class="ace-icon fa fa-calendar bigger-110"></i>
																	查询
																</button>
															</span>
														</div>
													</div>
													<label for="iptv" class="col-sm-1 control-label">IPTV账号</label>
													<div class="col-sm-3">
														<input class="form-control" id="iptv" type="text" placeholder="请输入IPTV账号"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="operator" class="col-sm-1 control-label">运营商</label>
													<div class="col-sm-3">
														<select class="form-control" id="operator"></select>
													</div>
													<label for="accPwd" class="col-sm-1 control-label">登录口令</label>
													<div class="col-sm-3">
														<input class="form-control" id="accPwd" type="text" placeholder="请输入登录口令"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="speed" class="col-sm-1 control-label">带宽</label>
													<div class="col-sm-3">
														<select class="form-control" id="speed"></select>
													</div>
													<label for="bindPhone" class="col-sm-1 control-label">
						 								绑定电话
					 								</label>
													<div class="col-sm-3">
														<input class="form-control" id="bindPhone" type="text" placeholder="请输入绑定电话"/>
													</div>
												</div>
											</div>
											<div id="userPl" style="display: none;">
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="plNo" class="col-sm-1 control-label">专线号</label>
													<div class="col-sm-3">
														<div class="input-group">
															<input id="plUserId" type="hidden"/>
															<input id="userBusinessType" type="hidden" value="L"/>
															<input class="form-control" id="plNo" type="text" placeholder="请输入专线编号"/>
															<span class="input-group-btn">
																<button class="btn btn-sm btn-default" id="btnChoosePlUser">
																	<i class="ace-icon fa fa-calendar bigger-110"></i>
																	查询
																</button>
															</span>
														</div>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="plType" class="col-sm-1 control-label">专线类型</label>
													<div class="col-sm-3">
														<select class="form-control" id="plType"></select>
													</div>
													<label for="plModel" class="col-sm-1 control-label">专线规格</label>
													<div class="col-sm-3">
														<input class="form-control" id="plModel" type="text" placeholder="请输入专线规格" />
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="startEp" class="col-sm-1 control-label">起始端点</label>
													<div class="col-sm-3">
														<input class="form-control" id="startEp" type="text" placeholder="请输入起始端点" />
													</div>
						 							<label for="endEp" class="col-sm-1 control-label">终止端点</label>
													<div class="col-sm-3">
														<input class="form-control" id="endEp" type="text" placeholder="请输入终止端点" />
													</div>
												</div>
											</div>
											<div class="hr hr8 hr-double hr-dotted"></div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userType" class="col-sm-1 control-label">用户类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="userType"></select>
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
													<input class="form-control" id="userAddress" type="text" placeholder="请输入安装地址"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userLinkPhone" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="userLinkPhone" type="text" placeholder="请输入联系电话"/>
												</div>
												<label for="callPolicy" class="col-sm-1 control-label">催缴策略</label>
												<div class="col-sm-3">
													<select class="form-control" id="callPolicy"></select>
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
										
										<!-- 套餐 -->
										<div class="tab-pane" id="panel-4">
											<div class="row clearfix">
												<div class="col-md-12 column">
													<div class="row clearfix">
														<div class="col-md-4 column">
															<div class="widget-box widget-color-blue">
																<div class="widget-header">
																	<h5 class="widget-title bigger lighter">
																		<i class="icon-list bigger-110"></i>
																		可订购套餐
																	</h5>
																</div>
																<div class="widget-body">
																	<div class="widget-main no-padding">
																		<table id="table_view_plan_list" class="table table-striped table-bordered table-hover">
																			<thead>
																				<tr>
																					<th>#</th>
																					<th>套餐名称</th>
																					<th>周期</th>
																					<th>套餐费（￥）</th>
																				</tr>
																			</thead>
																			<tbody></tbody>
																		</table>										
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-8 column">
															<div class="widget-box widget-color-blue">
																<div class="widget-header">
																	<h5 class="widget-title bigger lighter">
																		<i class="icon-shopping-cart green bigger-110"></i>
																		已订购套餐
																	</h5>
																</div>
																<div class="widget-body">
																	<div class="widget-main no-padding">
																		<table id="table_view_plan_cart" class="table table-striped table-bordered table-hover">
																			<thead>
																				<tr>
																					<th>#</th>
																					<th><i class="icon-money orange bigger-110"></i></th>
																					<th>套餐名称</th>
																					<th>生效时间</th>
																					<th>到期时间</th>
																					<th>订购数量</th>
																					<th>周期</th>
																					<th>单价</th>
																					<th>操作</th>
																				</tr>
																			</thead>
																			<tbody></tbody>
																		</table>										
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<!-- 增值服务 -->
										<div class="tab-pane" id="panel-5">
											<div class="row clearfix">
												<div class="col-md-12 column">
													<div class="row clearfix">
														<div class="col-md-6 column">
															<div class="widget-box widget-color-blue">
																<div class="widget-header">
																	<h5 class="widget-title bigger lighter">
																		<i class="icon-list bigger-110"></i>
																		可订购服务
																	</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	<label style="font-weight:bold; color:#009688;">
																		<input type="radio" name="iCheck" value="月租" checked> 月租 
																	</label>&nbsp;&nbsp;
																	<label style="font-weight:bold; color:#009688;">
																		<input type="radio" name="iCheck" value="增值服务"> 增值服务 
																	</label>
																</div>
																<div class="widget-body">
																	<div class="widget-main no-padding">
																		<table id="table_view_product_list" class="table table-striped table-bordered table-hover">
																			<thead>
																				<tr>
																					<th>#</th>
																					<th>产品名称</th>
																					<th>周期</th>
																					<th>单价（￥）</th>
																					<th>服务类型</th>
																				</tr>
																			</thead>
																			<tbody></tbody>
																		</table>										
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-6 column">
															<div class="widget-box widget-color-blue">
																<div class="widget-header">
																	<h5 class="widget-title bigger lighter">
																		<i class="icon-shopping-cart green bigger-110"></i>
																		已订购服务
																	</h5>
																</div>
																<div class="widget-body">
																	<div class="widget-main no-padding">
																		<table id="table_view_product_cart" class="table table-striped table-bordered table-hover">
																			<thead>
																				<tr>
																					<th>#</th>
																					<th><i class="icon-money orange bigger-110"></i></th>
																					<th>产品名称</th>
																					<th>订购数量</th>
																					<th>订购单价（￥）</th>
																					<th>备注</th>
																				</tr>
																			</thead>
																			<tbody></tbody>
																		</table>										
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
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
																			<label for="payMethod" class="col-sm-3 control-label">支付方式：</label>
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
												 							<label for="changeRemark" class="col-sm-3 control-label">备注：</label>
																			<div class="col-sm-9">
																				<input class="form-control" id="changeRemark" type="text" placeholder="请输入备注"/>
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
										<!-- panel end -->
									</div>
								</div>					
							<!-- </form> -->
						</div>
						
						<div class="panel-footer" style="text-align: right;" >
							<button type="button" id="save" class="btn btn-sm btn-primary">保存</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
							<button type="button" id="lastpage" class="btn btn-sm btn-primary">上一页</button>
							<button type="button" id="nextpage" class="btn btn-sm btn-primary">下一页</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var parentProductId = "p";
		var businessType = "p";
		var opType = "change";
		var busiType = (businessType + "_" + opType).toLowerCase();
		var deptName = "${sessionScope.userInfo.deptName}";
		
        // 初始化页面控件
        $(document).ready(function () {
        	$(".date-timepicker").datetimepicker();//日历控件加载
            // 初始化下拉框
            loadRefs();
       		// 显示产品和增值服务选择清单
       		initPlanList(businessType);
       		$('#table_view_plan_list tbody').on('click', 'td.details-control', openPlanEditor);
       		initProductList();  
       		$('#table_view_product_list tbody').on('click', 'td.details-control', openProductEditor);
       		initEditableFeeList();
       		$('#table_view_fee tbody').on('click', 'td.details-control', openFeeEditor);
       		// 设置客户号、客户名称、地址、联系电话值、实收费变化事件
       		initChanged();
       		// 初始化icheck
       		initIcheck();
       	});
        
        var productDesc = "月租"; // 
        function initIcheck() {
        	$('input[name="iCheck"]').iCheck({
        	    checkboxClass: 'icheckbox_square-orange',
        	    radioClass: 'iradio_square-orange',
        	    increaseArea: '20%' // optional
        	  });
        	
        	$('input[name="iCheck"]').on("ifChecked", function () {
        		productDesc = this.value;
        		initProductList();
        	});
        }
       	
        $("#businessType").change(function () {
       		parentProductId = $("#businessType").val();
       		businessType = $("#businessType").val();
       		busiType = $("#businessType").val() + "_" + opType;
       		switch (businessType) {
	       		case "p":
	       			$("#userPhone").show();
	       			$("#userBroad").hide();
	       			$("#userPl").hide();
	       			break;
	       		case "a":
	       		case "b":
	       			$("#userPhone").hide();
	       			$("#userBroad").show();
	       			$("#userPl").hide();
	       			break;
	       		case "l":
	       			$("#userPhone").hide();
	       			$("#userBroad").hide();
	       			$("#userPl").show();
	       			break;
	   			default:
	   				return;
	   		}
       		initPlanList(businessType);
       		initProductList();  
       		initEditableFeeList();
       		reset();
       	});
        
        // 选择号码
        var fnUserChoosed;
        $("#btnChoosePhoneUser").click(function () {
        	$(".khtips").remove();
        	//$("#userStatus").val("2");
        	var phoneNo = $("#phoneNo").val().trim();
        	$("#crUserKey").val(phoneNo);
        	fnUserChoosed = function (userId, businessKey) {
       			$("#phoneUserId").val(userId);
       			$("#phoneNo").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			initPlanCart(userId);
       			$('#table_view_plan_cart tbody').on('click', 'td.details-control', openPlanCartEditor);
       			$('#table_view_plan_cart tbody').on( 'click', 'tr', onPlanRowSelected);
       			initProductCart(userId);
       			$('#table_view_product_cart tbody').on('click', 'td.details-control', openProductCartEditor);
       			$('#table_view_product_cart tbody').on( 'click', 'tr', onProductRowSelected);
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        $("#btnChooseAccUser").click(function () { 
        	$(".khtips").remove();
        	//$("#userStatus").val("2");
        	var accNo = $("#accNo").val().trim();
        	$("#crUserKey").val(accNo);
        	fnUserChoosed = function (userId, businessKey) {
       			$("#accUserId").val(userId);
       			$("#accNo").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			initPlanCart(userId);
       			$('#table_view_plan_cart tbody').on('click', 'td.details-control', openPlanCartEditor);
       			$('#table_view_plan_cart tbody').on( 'click', 'tr', onPlanRowSelected);
       			initProductCart(userId);
       			$('#table_view_product_cart tbody').on('click', 'td.details-control', openProductCartEditor);
       			$('#table_view_product_cart tbody').on( 'click', 'tr', onProductRowSelected);
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        $("#btnChoosePlUser").click(function () { 
        	$(".khtips").remove();
        	//$("#userStatus").val("2");
        	var plNo = $("#plNo").val().trim();
        	$("#crUserKey").val(plNo);
        	fnUserChoosed = function (userId, businessKey) {
       			$("#plUserId").val(userId);
       			$("#plNo").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			initPlanCart(userId);
       			$('#table_view_plan_cart tbody').on('click', 'td.details-control', openPlanCartEditor);
       			$('#table_view_plan_cart tbody').on( 'click', 'tr', onPlanRowSelected);
       			initProductCart(userId);
       			$('#table_view_product_cart tbody').on('click', 'td.details-control', openProductCartEditor);
       			$('#table_view_product_cart tbody').on( 'click', 'tr', onProductRowSelected);
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        $("#btnSetupCreditor").click(function () {
        	fnCreditorChoosed = function(targetCustomerId, targetUserId, templateId) {
        		$("#creditorRel").val(targetCustomerId ? "已设置" : "未设置");	
        		$("#creditorTargetCustomerId").val(targetCustomerId);
        		$("#creditorTargetUserId").val(targetUserId);
        		$("#creditorTemplateId").val(templateId);
        	}; 
        	$("#dlgCreditor").modal("show");
        });
        
        function validate() {
        	var flag = validateAmount();
        	if (!flag) {
        		return false;	
        	}
        	if ($("#changeRemark").val().trim() === "") {
        		bbAlert("请填写业务变更备注");
        		return false;
        	}
        	return true;
        };
        
        $("#save").click(function () {
        	var v = validate();
        	if (!v) {
        		return false;	
        	}
        	
        	var remark = "业务类型:" + busiType + ",备注:" + ($("#changeRemark").val() ? $("#changeRemark").val() : "") + ";";
        	var op = "${sessionScope.userInfo.userName}";
        	var parm = {
        		"obj.amountDue": $("#amountDue").val(),
        		"obj.amountProceed": $("#amountProceed").val(),
        		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
        		"obj.customerId": $("#customerId").val(),
       			"obj.creator": op,
        		"obj.opType": opType,
        		"obj.businessType": businessType,
        		"obj.remark": remark
        	};
        	
        	switch (businessType) {
	        	case "p":
	        		parm["obj.id"] = $("#phoneUserId").val();
	        		break;
	        	case "a":
	        	case "b":
	        		parm["obj.id"] = $("#accUserId").val();
	        		break;
	        	case "l":
	        		parm["obj.id"] = $("#plUserId").val();
	        		break;
        		default:
        			console.error("没有选择任何业务类型");
        			return;
        	}
        	
        	var index = 0;
        	// 提交业务受理费
        	var tableData = table_view_fee.rows().data();
        	var feeCount = tableData.length;
        	var i;
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
        	// 提交套餐变更
        	tableData = table_view_plan_cart.rows().data();
        	var planCount = tableData.length;
        	for (i = 0; i < planCount; i++) {
        		var data = tableData[i];
        		if (data.tempStatus) {
        			parm["orderItems[" + index + "].id"] = data.orderItemId;
        			parm["orderItems[" + index + "].orderId"] = $("#userId").val();
		        	parm["orderItems[" + index + "].itemId"] = data.id;
    		    	parm["orderItems[" + index + "].itemName"] = data.name;
    		    	parm["orderItems[" + index + "].itemType"] = 1;
    		    	parm["orderItems[" + index + "].saleType"] = data.saleType;
   	 		   		parm["orderItems[" + index + "].term"] = data.term;
    	   		 	parm["orderItems[" + index + "].itemCount"] = data.planOrderCount;
    	    		parm["orderItems[" + index + "].itemPrice"] = data.planFee;
    	    		parm["orderItems[" + index + "].remark"] = data.planOrderRemark;
    	    		switch (data.tempStatus) {
	    	    		case 1:
	    	    			parm["orderItems[" + index + "].status"] = 0;
	    	    			break;
	    	    		case 2:
	    	    			parm["orderItems[" + index + "].status"] = 4;
	    	    			break;
	    	    		case 4:
	    	    		case 5:
	    	    			parm["orderItems[" + index + "].status"] = data.tempStatus;
	    	    			break;
    	    			default:
    	    				return;
    	    		}
    	    		parm["orderItems[" + index + "].payFlag"] = data.planPayChoosed;
    	    		parm["orderItems[" + index + "].effectiveTime"] = data.effectiveTime;
    	    		index++;
    	    	}
        	}
        	// 提交服务变更
        	tableData = table_view_product_cart.rows().data();
        	var productCount = tableData.length;
        	for (i = 0; i < productCount; i++) {
        		var data = tableData[i];
        		if (data.tempStatus) {
        			parm["orderItems[" + index + "].id"] = data.orderItemId;
        			parm["orderItems[" + index + "].orderId"] = $("#userId").val();
		        	parm["orderItems[" + index + "].itemId"] = data.id;
    		    	parm["orderItems[" + index + "].itemName"] = data.name;
    		    	parm["orderItems[" + index + "].itemType"] = 2;
    		    	parm["orderItems[" + index + "].saleType"] = data.saleType;
   	 		   		parm["orderItems[" + index + "].term"] = data.unit;
    	   		 	parm["orderItems[" + index + "].itemCount"] = data.productOrderCount;
    	    		parm["orderItems[" + index + "].itemPrice"] = data.productOrderPrice;
    	    		parm["orderItems[" + index + "].remark"] = data.productOrderRemark;
    	    		switch (data.tempStatus) {
	    	    		case 1:
	    	    			parm["orderItems[" + index + "].status"] = 0;
	    	    			break;
	    	    		case 2:
	    	    			parm["orderItems[" + index + "].status"] = 4;
	    	    			break;
	    	    		case 4:
	    	    		case 5:
	    	    			parm["orderItems[" + index + "].status"] = data.tempStatus;
	    	    			break;
		    			default:
		    				return;
		    		}
    	    		parm["orderItems[" + index + "].ossKey"] = data.ossKey;
    	    		parm["orderItems[" + index + "].payFlag"] = data.productPayChoosed;
    	    		index++;
    	    	}
        	}
        	var res = ajaxCRUD("order!changeUser.do", parm, true);
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
        
        var index = 3;
        function reset() {
        	$(".khtips").remove();
        	index = 3;
        	$('#tab-head').find('a:eq(2)').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        	$('#tab-head a').not('a:eq(2)').removeClass().addClass("button button-glow button-border button-pill button-primary");   	
			resetCustomer();
        	resetAccount();
        	resetUser();
        	resetAmountDue();
        	initPlanCart("");
        	initProductCart("");
        	table_view_fee.ajax.reload();
        };
        
        $("#reset").click(function () {
        	reset();
        });
        
        $("#tab-head a").on("click",function () {//给tab-panel的超链接定义点击事件，获取tab的index
			var hrefstr = this.href;
        	var tabs = hrefstr.split("#");
        	index = parseInt(tabs[1].split("-")[1]);
			$('#tab-head a[href]').removeClass().addClass("button button-glow button-border button-pill button-primary");
        	$('#tab'+index+' a').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        	tabbtn(index, 6);
        });
        
		$("#nextpage").click(function () {
			$(".khtips").remove();
			var flag;
			if (index === 3) {
				flag = validateUser();
        		if (!flag) return;
			}
			index++;
			tabcss(index, this.id);
			tabbtn(index, 6);
		});
		
		$("#lastpage").click(function () {
			index--;
			tabcss(index, this.id);
			tabbtn(index, 6);
		});
        
        </script>
        
		<!-- 按钮组的Handlebars模板 -->
		<jsp:include page="../pub/tpl.jsp" flush="true"/>

		<script type="text/javascript">
            var tpl = $("#tpl").html();
            //预编译模板
            var template = Handlebars.compile(tpl);
			var userName = "${sessionScope.userInfo.userName}";
			// alert(userName);
        </script>
        
		<jsp:include page="../pub/userDlg.jsp" flush="true"/>
		<jsp:include page="../pub/addressDlg.jsp" flush="true"/>
		<jsp:include page="../pub/creditorDlg.jsp" flush="true"/>
        
	</body>
</html>
		