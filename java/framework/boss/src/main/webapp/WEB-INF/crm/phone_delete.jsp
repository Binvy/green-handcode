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
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
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
		<script src="assets/js/crud/crud.js"></script>
		
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
		<script src="assets/js/bootstrap-select.min.js"></script>
		<script src="assets/js/defaults-zh_CN.js"></script>
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
					拆机
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
								<i class="icon-fire red"></i>
								拆机&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
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
						
						<!-- tab-panel标签页部分 -->
						<div class="panel-body">
							<!-- <form class="form-horizontal" role="form">  -->
								<div class="tabbable" id="tabtable1">
									<div id="tab-head" style="margin-bottom: 30px; text-align: center;">
										<div id="tab1" style="width:10%; height:20px; display: inline-block; ">
									    	<a href="#panel-1" data-toggle="tab" class="button button-glow button-pill button-raised button-primary"  style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							拆机
									    	</a>
									  	</div>
								  	 	<i class="green icon-long-arrow-right bigger-110"></i>
										<div id="tab2" style="width:12%; height:20px; display: inline-block;">
									    	<a href="#panel-2" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							客户信息
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
							        	<div id="tab3" style="width:12%; height:20px; display: inline-block;">
						 					<a href="#panel-3" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
						 						<i class="red icon-money"></i>
						 						账户信息
						 					</a>
					 					</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								       <div id="tab4" style="width:12%; height:20px; display: inline-block;">
							 				<a href="#panel-4" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="green icon-phone"></i>
							 					用户信息
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab5" style="width:10%; height:20px; display: inline-block;">
							 				<a href="#panel-5" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="dark icon-dollar"></i>
							 					套餐
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab6" style="width:12%; height:20px; display: inline-block;">
							 				<a href="#panel-6" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="orange icon-tags"></i>
							 					增值服务
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab7" style="width:15%; height:20px; display: inline-block;">
							 				<a href="#panel-7" data-toggle="tab" class="button button-glow button-pill button-border button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="purple icon-credit-card"></i>
							 					业务受理费
							 				</a>
						 				</div>
					 				</div>
					 				
									<div class="tab-content">
										<!-- 拆机 -->
										<div class="tab-pane active" id="panel-1">
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="businessType" class="col-sm-1 control-label red">业务类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="businessType"></select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="businessKey" class="col-sm-1 control-label">
					 								号码/账号<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="userId" type="hidden"/>
													<input class="form-control" id="businessKey" type="text" placeholder="选择号码"/>
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnChooseUser">
															<i class="ace-icon fa fa-calendar bigger-110"></i>
															选择
														</button>
													</span>
													</div>
												</div>
											</div>
											<div class="row form-group" id="amountInfo" style="display: none;"></div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="relInfo" class="col-sm-1 control-label">
													关联业务
												</label>
												<div class="col-sm-7">
													<input class="form-control" id="relInfo" type="text" style="font-size:13px; " readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="deleteRel" class="col-sm-1 control-label">
													关联操作
												</label>
												<div class="col-sm-3">
													<select class="form-control" id="deleteRel">
														<option name="deleteRel" value="1" >关联业务保留</option>
														<option name="deleteRel" value="2" >关联业务拆机</option>
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="reason" class="col-sm-1 control-label">
													拆机原因<code style="color:red; text-align: right; background-color: transparent;">*</code>
												</label>
												<div class="col-sm-5">
													<select id="reason" class="selectpicker show-tick form-control" 
														multiple data-live-search="false">
													</select>
												</div>	
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="otherReason" class="col-sm-1 control-label">其他原因</label>	
				 								<div class="col-sm-5">	
													<textarea class="form-control" id="otherReason" rows="3" cols="80" placeholder="(请输入4~20个汉字或其他字符)"></textarea>
				 								</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="linkPhone1" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="linkPhone1" type="text" placeholder="请输入联系电话"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="deleteRemark" class="col-sm-1 control-label">备注</label>
												<div class="col-sm-7">
													<input class="form-control" id="deleteRemark" type="text" placeholder="请输入备注" />
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
													<input class="form-control" id="vip" type="text" readonly />
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
													<input class="form-control" id="customerNo" type="text" placeholder="输入或生成客户号" readonly/>
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
													<input class="form-control" id="address" type="text" placeholder="点击选择地址" />
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
													<input class="form-control" id="remark" type="text" placeholder="请输入备注" />
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
															<input class="form-control" id="phoneNo" type="text" placeholder="选择号码"/>
															<span class="input-group-addon">
																<i class="icon-phone bigger-110"></i>
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
															<input class="form-control" id="accNo" type="text" placeholder="请输入宽带登录用户名"/>
															<span class="input-group-addon">
																<i class="icon-globe bigger-110"></i>
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
															<input class="form-control" id="plNo" type="text" placeholder="请输入专线编号"/>
															<span class="input-group-addon">
																<i class="icon-key bigger-110"></i>
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
													<input class="form-control" id="userNo" type="text" placeholder="选择编号"/>
												</div>
												<label for="creditorRel" class="col-sm-1 control-label">费用转移</label>
												<div class="col-sm-3">
													<input class="form-control" id="creditorRel" type="text" placeholder="设置代缴" />
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
																			<label for="payMethod" class="col-sm-3 control-label">支付方式：</label>
																			<div class="col-sm-9">
																				<select class="form-control" id="payMethod"></select>
																			</div>
																		</div>
																		<div class="row form-group">
																			<label class="col-sm-3 control-label">账户余额：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control" id="accountAmount" type="text" value="0" readonly />
																				</div>
																			</div>
																		</div>
																		<div class="row form-group">
																			<label class="col-sm-3 control-label">积分金额：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control" id="accountAmountScore" type="text" value="0" readonly />
																				</div>
																			</div>
																		</div>
																		<div class="row form-group">
																			<label class="col-sm-3 control-label">待缴金额：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control" id="billAmountDue" type="text" value="0" readonly />
																				</div>
																			</div>
																		</div>
																		<div class="row form-group">
																			<label class="col-sm-3 control-label">本次应收：</label>
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
																					<input class="form-control" id="amountPre" type="text" value="0"/>
																				</div>
																			</div>
																		</div>
																		<div class="row form-group">
																			<label class="col-sm-3 control-label red">本次实收：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control red" id="amountProceed" type="text" value="0" readonly/>
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
										
									<!-- panel end -->
									</div>
								</div>					
							<!-- </form> -->
						</div>
						
						<div class="panel-footer" style="text-align: right;" >
							<button type="button" id="save" class="btn btn-sm btn-primary">拆机</button>
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
		var opType = "delete";
		var busiType = (businessType + "_" + opType).toLowerCase();
		var deptName = "${sessionScope.userInfo.deptName}";
		
        // 初始化页面控件
        $(document).ready(function () {
            // 初始化下拉框
            loadRefs();
        	// 初始化拆机原因多选框
        	loadRef("ref_del_phone_reason", "reason");
        	$("#reason").selectpicker("val", "");
       		// 显示产品和增值服务选择清单
       		initEditableFeeList();
       		$('#table_view_fee tbody').on('click', 'td.details-control', openFeeEditor);  
       		// 设置客户号、客户名称、地址、联系电话值、实收费变化事件
       		initChanged();
       	});
       	
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
       		initEditableFeeList();
       		reset();
       	});
        
        // 选择用户
        var fnUserChoosed;
        $("#btnChooseUser").click(function () { 
        	$(".khtips").remove();
        	$("#amountInfo").empty();
        	$("#beginStatus").val("2");
        	$("#endStatus").val("4");
        	var phoneNo = $("#businessKey").val().trim();
        	$("#crUserKey").val(phoneNo);
        	fnUserChoosed = function (userId, businessKey) {
       			$("#userId").val(userId);
	        	$("#businessKey").val(businessKey);
       			loadUser(userId);
       			$("#linkPhone1").val($("#userLinkPhone").val());
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			initPlanList(customerId, businessKey);
       			initProductList(customerId, businessKey);
       			//散户和非托付用户,查询其余额和欠费金额
       			if ($("#customerType").val() === "1" && !$("#creditorRel").val()) {
       				var res = ajaxCRUD(
       							  "ocsBill!findBillInfo.do",
       							  {"obj.customerId": customerId, "obj.userId" : userId},
       							  false
     						  );
       				if (res && res.obj) {
	       				var obj = res.obj;
       					$("#accountAmount").val(obj.amount);
       					$("#accountAmountScore").val(obj.amountScore);
       					$("#billAmountDue").val(obj.amountOwe);
       					//$("#amountDue").val(obj.amountDue); //本次应收默认为0，只有选择拆机费/其他时发生变化
       					calcAmountProceed();
       				}
       			}
       			//显示欠费金额和账户余额
       			var html = ''  
       				+ '<div class="col-sm-3"></div>'
       				+ '<div class="col-sm-2">'
	     				+ '<code style="color:red; text-align: right; background-color: transparent;">'
	     				+ '账户余额（￥）:&nbsp;' + parseFloat($("#accountAmount").val()).toFixed(2)
	     				+ '</code>'
       				+ '</div>'
       				/* + '<div class="col-sm-2">'
	     				+ '<code style="color:red; text-align: right; background-color: transparent;">'
	     				+ '未缴费用（￥）:&nbsp;' + parseFloat($("#amountDue").val()).toFixed(2)
	     				+ '</code>'
       				+ '</div>' */
       				+ '<div class="col-sm-2">'
	       				+ '<code style="color:red; text-align: right; background-color: transparent;">'
	       				+ '欠费金额（￥）:&nbsp;' + parseFloat($("#billAmountDue").val()).toFixed(2)
	       				+ '</code>'
       				+ '</div>';
       			$("#amountInfo").empty();
       			$("#amountInfo").append(html);
       			$("#amountInfo").show();
       			loadRelInfo(businessKey);
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        var relUsers;
        function loadRelInfo(businessKey) {
        	var res = ajaxCRUD(
        			      "crmUser!findRelUser.do", 
        			      {
        			    	  "obj.businessKey": businessKey, 
        			    	  "obj.businessType" : businessType
        			      },
       			    	  false
      			      );
        	var relInfo = '';
        	relUsers = res.lst;
        	if (relUsers && relUsers.length > 0) {
        		var i;
        		for (i = 0; i < relUsers.length; i++) {
					var pricePlan = ajaxCRUD(
										"order!selectPlanInOrder.do", 
										{
											"obj.customerId": relUsers[i].customerId, 
											"obj.businessKey": businessKey
										},
										false
									);
        			relInfo += ""
       						+ "业务类型: " + relUsers[i].businessTypeDesc
       						+ "      "
       						+ "套餐类型: " + pricePlan.maps[0].name
       						+ "      "
       						+ "到期日期: " + ((relUsers[i].pauseTime) ? relUsers[i].pauseTime : "无")
       						+ "      "
       						+ "状态: " + relUsers[i].statusDesc 
       						+ ";";
        		}
        		$("#deleteRel").attr("disabled",false);
			} 
       		else {
				$("#deleteRel").attr("disabled",true);
			}
			$("#relInfo").val(relInfo);
        }
        
        var reason = "";		
        function validateInfo() {
        	reason = $("#reason").val() ? $("#reason").val() : "";
        	if ($("#businessKey").val().trim() === "") {
				addTips(1, 1, "请先选择拆机号码或账号");
				return false;
			}
        	if (reason === "") {
        		addTips(1, 5, "请选择拆机原因");
        		return false;
        	} 
        	else if (reason.indexOf("9") >= 0 && $("#otherReason").val().trim() === "") {
				addTips(1, 6, "请填写其他原因");
        		return false;
        	}
        	if ($("#otherReason").val().trim() && ($("#otherReason").val().trim().length < 4  || $("#otherReason").val().trim().length > 20 )) {
        		addTips(1, 6, "字数必须在4~20个之间");
        		return false;
        	}
        	if ($("#deleteRemark").val().trim() === "") {
        		addTips(1, 8, "请填写拆机备注");
        		return false;
        	}
        	return true;
        }
        
        function validate() {
        	var flag = validateInfo();
        	if (!flag) {
        		return false;
        	}
        	return true;
        };
        
        
        $("#save").click(function () {
        	$(".khtips").remove();
        	var v = validate();
        	if (!v) return;
        	
			var parm = { "id": $("#userId").val() };
			var res = ajaxCRUD("crmUser!findDebitUserKeyss.do", parm, false);
			if (!res.id) {
				/* var b = confirm(res.id + "在本用户中进行代缴，是否继续拆机?");
				if (!b) {
					return;
				} */
				bootbox.confirm({
        			locale: "zh_CN",
    				size: 'small',
    				title:"提示",
   					message: res.id + "在本用户中进行代缴，是否继续拆机?", 
    				callback: function(result){
        				if (result) {
        					save();		
						}
    				}
				});
			}
        });
        
        function save() {
        	reason ="业务类型:" + busiType + ",拆机原因:" + ($("#reason").val() ? $("#reason").val() + ";" : "");
        	var remark = "备注:" + ($("#deleteRemark").val() ? $("#deleteRemark").val() + ";" : "");
        	var op = "${sessionScope.userInfo.userName}";
	        var	parm = {
	        		"obj.id": $("#userId").val(),
	        		"obj.creator": op,
	        		"obj.opType": opType,
	        		"obj.customerId": $("#customerId").val(),
	        		"obj.businessType": businessType,
	        		"obj.businessKey": $("#businessKey").val(),
	        		"obj.amountDue": $("#amountDue").val(),
	        		"obj.amountProceed": $("#amountProceed").val(),
	        		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
	        		"obj.remark": reason + remark
        	};
        	var index = 0;
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
        	/* 电话+宽带(关联业务)连带拆机 */
        	var ress = new Array();
			ress[0] = ajaxCRUD("order!deleteUser.do", parm, true);
        	if ($("#deleteRel").val() === "2") {	 
				if (relUsers && relUsers.length > 0) {
					for (i = 0; i < relUsers.length; i++) {
						parm["obj.id"] = relUsers[i].id;
			        	parm["obj.customerId"] = relUsers[i].customerId,
			        	parm["obj.businessType"] = relUsers[i].businessType,
			        	parm["obj.businessKey"] = relUsers[i].businessKey,
						ress[parseInt(i) + 1] = ajaxCRUD("order!deleteUser.do", parm, true);
					}
				}
			}
			
			var flag = false;
			for (i = 0; i < ress.length; i++) {
				if(ress[i].resNum === "0"){
					if ($("#printFlag").get(0).checked && parseFloat($("#amountProceed").val()) !== 0) {
	        			if (ress[i].id) {
	        				var rpt = printInvoice(ress[i].id);
	    					var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rpt;
	    					window.open(uri);
	        			}
	        		}
	        		flag = true;
				}
			}
			if (flag) {
				reset();
			}
        }
        
        var index = 1;//用于标记标签页tab-panel的位置
        function reset() {
        	$(".khtips").remove();
        	index = 1;
        	$("#lastpage").hide();
        	reason = "";
        	$('#tab-head').find('a:eq(0)').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        	$('#tab-head a').not('a:eq(0)').removeClass().addClass("button button-glow button-border button-pill button-primary");   	
        	$("#businessKey").val("");
        	$("#relInfo").val("");
        	$("#amountInfo").empty().hide();
        	$("#deleteRel").val("1");
        	$("#reason").selectpicker("val", "");
        	$("#otherReason").val("");
        	$("#linkPhone1").val("");
        	$("#deleteRemark").val("");
			resetCustomer();
        	resetAccount();
        	resetUser();
        	resetAmountDue();
        	initPlanList("","");
        	initProductList("","");
        	initEditableFeeList();
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
        	tabbtn(index, 7);
        });
        
        /*上下页翻页*/
        $("#nextpage").click(function () {
			$('.khtips').remove();
			var flag;
			if (index === 1) {
				flag = validateInfo();
				if (!flag) {
					return;	
				}
			}
			index++;
			tabcss(index, this.id);
			tabbtn(index, 7);
		});
		
		$("#lastpage").click(function () {
			index--;
			tabcss(index, this.id);
			tabbtn(index, 7);
		});
        
        </script>
        
		<jsp:include page="../pub/userDlg.jsp" flush="true"/>
	</body>
</html>
		