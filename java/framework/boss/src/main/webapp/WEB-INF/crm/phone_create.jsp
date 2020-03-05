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
		<!-- icheck -->
		<link rel="stylesheet" href="assets/css/skins/square/orange.css">
		
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
		<script src="assets/js/icheck.min.js"></script>
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<!-- Customize -->
		<script src="js/resDeptDlg.js"></script>
		
		<script src="js/pricePlan.js"></script>
		<script src="js/product.js"></script>
		<script src="js/fee.js"></script>
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
					装机
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
									装机&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
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
								<!-- 验证通过的alert消息框 -->
								<!-- div class="col-xs-2" id="checkresult" hidden="false">
									<div class="alert alert-success alert-small" role="alert" style="margin: 0px;">
										<div style="line-height: 10px;">
											<span class="glyphicon glyphicon-ok" id="checkspan">
												验证通过
											</span>
										</div>	
									</div>
								</div> -->
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
						    <div id="collapseOne2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
							     <div class="panel-body">
								    <div class="progress">
									  <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
									    <span class="sr-only">验证信息中...请稍等......</span>
									  </div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="panel-body">
								<div class="tabbable" id="tabtable1">
									<div id="tab-head" style="margin-bottom: 30px; text-align: center;">
										<div id="tab1" style="width:12%; height:20px; display: inline-block;">
									    	<a href="#panel-1" data-toggle="tab" class="button button-glow button-pill button-raised button-primary" style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							客户信息
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
							        	<div id="tab2" style="width:12%; height:20px; display: inline-block;">
						 					<a data-toggle="tab" class="button disabled button-pill button-primary" style="margin-bottom:-15px; overflow: hidden;">
						 						<i class="red icon-money"></i>
						 						账户信息
						 					</a>
					 					</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab3" style="width:12%; height:20px; display: inline-block;">
							 				<a data-toggle="tab" class="button disabled button-pill button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="green icon-phone"></i>
							 					用户信息
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab4" style="width:12%; height:20px; display: inline-block;">
							 				<a data-toggle="tab" class="button disabled button-pill button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="dark icon-dollar"></i>
							 					套餐
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab5" style="width:12%; height:20px; display: inline-block;">
							 				<a data-toggle="tab" class="button disabled button-pill button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="orange icon-tags"></i>
							 					增值服务
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab6" style="width:15%; height:20px; display: inline-block;">
							 				<a data-toggle="tab" class="button disabled button-pill button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="purple icon-credit-card"></i>
							 					业务受理费
							 				</a>
						 				</div>
					 				</div>
									<div class="tab-content">
										<!-- 客户信息 -->
										<div class="tab-pane active" id="panel-1">
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
													<select class="form-control" id="vip"></select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="creditorName" class="col-sm-1 control-label">大客户</label>
												<div class="col-sm-3">
													<div class="input-group">
														<input id="creditor" type="hidden"/>
														<input class="form-control" id="creditorName" type="text" 
															placeholder="选择大客户" 
															data-toggle="tooltip" data-placement="bottom"   
															title="点击选择按钮选择大客户"/>
														<span class="input-group-btn">
															<button class="btn btn-sm btn-default" id="btnChooseCreditor">
																<i class="ace-icon fa fa-calendar bigger-110"></i> 选择
															</button> 
														</span>
													</div>
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
													<input class="form-control" id="address" type="text" placeholder="请输入地址" style="cursor: pointer;" readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="certId" class="col-sm-1 control-label">
													证件号码<code style="color:red; text-align: right; background-color: transparent;">*</code>
												</label>
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
										<div class="tab-pane" id="panel-3">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-3">
													<input class="form-control" id="customerNo2" type="text" readonly />
												</div>
											</div>
											<div class="hr hr8 hr-double hr-dotted"></div>
											<div id="userPhone">
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="phoneNo" class="col-sm-1 control-label">
						 								电话号码<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<div class="input-group">
															<input id="phoneUserId" type="hidden"/>
															<input class="form-control" id="phoneNo" type="text" placeholder="选择号码"/>
															<span class="input-group-btn">
																<button class="btn btn-sm btn-default" id="btnChooseUserPhoneNumber">
																	<i class="ace-icon fa fa-calendar bigger-110"></i> 选择
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
													<label for="accNo" class="col-sm-1 control-label">
						 								上网账号<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<div class="input-group">
															<input id="accUserId" type="hidden"/>
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
													<label for="accPwd" class="col-sm-1 control-label">
						 								登录口令<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
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
													<label for="bindPhone" class="col-sm-1 control-label">绑定电话</label>
													<div class="col-sm-3">
														<input class="form-control" id="bindPhone" type="text" placeholder="请输入绑定电话"/>
													</div>
												</div>
											</div>
											<div id="userPl" style="display: none;">
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="plNo" class="col-sm-1 control-label">
					 									专线号<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<div class="input-group">
															<input id="plUserId" type="hidden"/>
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
					 							<label for="userType" class="col-sm-1 control-label">
					 								用户类型<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-3">
													<select class="form-control" id="userType"></select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userName" class="col-sm-1 control-label">
						 							用户名称<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 							</label>
												<div class="col-sm-7">
													<input class="form-control" id="userName" type="text" placeholder="请输入用户名称"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="userAddress" class="col-sm-1 control-label">
					 								安装地址<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-7">
													<input class="form-control" id="userAddress" type="text" placeholder="请输入安装地址" style="cursor: pointer;" readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userLinkPhone" class="col-sm-1 control-label">
					 								联系电话<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
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
														<div class="col-md-6 column">
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
																					<th><i class="icon-edit purple bigger-110"></i></th>
																					<th>名称</th>
																					<th>周期</th>
																					<th>套餐费(￥)</th>
																					<th>描述</th>
																				</tr>
																			</thead>
																			<tbody>
																			</tbody>
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
																		已订购套餐
																	</h5>
																	
																</div>
																<div class="widget-body">
																	<div class="widget-main no-padding">
																		<table id="table_view_plan" class="table table-striped table-bordered table-hover">
																			<thead>
																				<tr>
																					<th><i class="icon-edit purple bigger-110"></i></th>
																					<th><i class="icon-flag red bigger-110"></i></th>
																					<th><i class="icon-money orange bigger-110"></i></th>
																					<th>名称</th>
																					<th>周期</th>
																					<th>套餐费(￥)</th>
																					<th>订购数量</th>
																					<th>订购单价(￥)</th>
																					<th>备注</th>
																					<th>操作</th>
																				</tr>
																			</thead>
																			<tbody>
																			</tbody>
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
																					<th><i class="icon-edit purple bigger-110"></i></th>
																					<th>产品名称</th>
																					<th>单位</th>
																					<th>单价(￥)</th>
																					<th>备注</th>
																				</tr>
																			</thead>
																			<tbody>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>	<!-- col-md-6 column -->
														
														<div class="col-md-6 column">
															<div class="widget-box widget-color-blue">
																<div class="widget-header">
																	<h5 class="widget-title bigger lighter">
																		<i class="icon-shopping-cart bigger-110"></i>
																		已订购服务
																	</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																</div>
																<div class="widget-body">
																	<div class="widget-main no-padding">
																		<table id="table_view_product" class="table table-striped table-bordered table-hover">
																			<thead>
																				<tr>
																					<th><i class="icon-edit purple bigger-110"></i></th>
																					<th><i class="icon-flag red bigger-110"></i></th>
																					<th><i class="icon-money orange bigger-110"></i></th>
																					<th>产品名称</th>
																					<th>单位</th>
																					<th>单价(￥)</th>
																					<th>订购数量</th>
																					<th>订购单价(￥)</th>
																					<th>备注</th>
																					<th>操作</th>
																				</tr>
																			</thead>
																			<tbody>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
														
													</div>
												</div> <!-- col-md-12 column -->
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
																					<input class="form-control" id="amountPre" type="text" value="0"/>
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
																					<input class="form-control red" id="amountProceed" type="text" value="0" readonly/>
																				</div>
																			</div>
																		</div>
																		<div class="row form-group">
												 							<label for="createRemark" class="col-sm-3 control-label">备注：</label>
																			<div class="col-sm-9">
																				<input class="form-control" id="createRemark" type="text" placeholder="请输入备注"/>
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
						</div>
						
						<div class="panel-footer" style="text-align: right;">
							<button type="button" id="save" class="btn btn-sm btn-primary" style="display: none;">开户</button>
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
		var opType = "setup";
		var busiType = (businessType + "_" + opType).toLowerCase(); // Used by fee.js
		var deptName = "${sessionScope.userInfo.deptName}";	//Used by customer.js
        // 初始化页面控件
        $(document).ready(function () {
        	$("[data-toggle='tooltip']").tooltip();
        	// 初始化字典表
        	loadRefs();
			// 显示套餐选择清单
			initEditablePlanList(businessType);
       		$('#table_view_plan_list tbody').on('click', 'td.details-control', openPlanListEditor);  
       		// 显示产品和增值服务选择清单
       		initEditableProductList();
       		$('#table_view_product_list tbody').on('click', 'td.details-control', openProductListEditor);
       		// 显示产品和增值服务选择清单
       		initEditableFeeList();
       		$('#table_view_fee tbody').on('click', 'td.details-control', openFeeEditor);  
       		// 设置客户号、客户名称、地址、联系电话值、实收费变化事件
       		initChanged();
       		// 初始化icheck
       		initIcheck();
       		// 自动载入用户地址
       		//var res = ajaxCRUD("resAddress!findByName.do", { }, false);
       		//var depts = res.depts;
            // 初始化客户经理			//已删除
            //loadCustomerManager();
            // 初始化部门树				//已删除
			//initResDeptTree();
       		initEditablePlan("");
   			$('#table_view_plan tbody').on('click', 'td.details-control', openPlanEditor);
   			$('#table_view_plan tbody').on( 'click', 'tr', onPlanRowSelected);
   			initEditableProduct();
   			$('#table_view_product tbody').on('click', 'td.details-control', openProductEditor);
   			$('#table_view_product tbody').on( 'click', 'tr', onProductRowSelected);
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
        		initEditableProductList();
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
     		$("#amountProceed").attr("readonly", businessType === "b" ? true : false);//宽带实收款不能修改
       		initEditablePlanList(businessType);
       		initEditableProductList();
       		initEditableFeeList();
       		reset();
       	});
		
     	//	选择大客户
     	var fnBtnClickedBigCustomer;
		$("#btnChooseCreditor").click(function () {
			if ($("#deptArea").val() === "") {
				bbAlert("请先选择业务区域");
				return;
			}
			$(".khtips").remove();
			resetBigCustomerDlg();
			if ($("#customerType").val() === "1") {
				addTips(1, 2, "自费用户无需选择大客户");
				return;
			}
			fnBtnClickedBigCustomer = function (customerId, customerNo, customerName) {
				$("#creditor").val(customerId);
				$("#creditorName").val(customerNo + " " + customerName);
			};
			$("#crBigCustomer").val($("#creditorName").val().trim().split(" ")[0]);
			doSearchCompanyCustomer();
			$("#dlgBigCustomer").modal("show");
		});
		
		// 选择客户
		var fnBtnClickedCustomer;
		$("#btnPickCustomerNo").click(function () {
			if ($("#deptArea").val() === "") {
				bbAlert("请先选择业务区域");
				return;
			}
			$(".khtips").remove();
			resetCustomerDlg();
			var deptArea = $("#deptArea").find("option:selected").text().split(" ")[1];	//截取业务区域的简称
			fnBtnClickedCustomer = function (customerId, customerNo, customerName) {
				if (!customerId) {
					var parm = {
						"policyKey": "CUSTOMER_NO", 
						"variable": deptArea,
						"custType": $("#customerType").val()
					};
					var res = ajaxCRUD("seq!currVal.do", parm, false);
					$("#customerNo").val(res.seqVal);
					$("#customerNo1").val(res.seqVal);
					$("#customerNo2").val(res.seqVal);
				} 
				else {
					// 载入客户和账户信息
					loadCustomer(customerId);
					loadAccount(customerId);
				}
			};
			//如果用户选择的是公司(公费)用户,必须先选择大客户,而且客户号不能选择需手动输入
			if ($("#customerType").val() === "2") {
				if ($("#creditorName").val() === "") {
					addTips(1, 2, "请先填写或选择大客户");
					return;
				} 
				/*else {
					 $("#customerNo").val(deptArea + "G" + $("#creditorName").val().split(" ")[0].replace(/[^0-9]/ig,""));
					if ($("#customerNo")) {
	        			$("#customerNo1").val($("#customerNo").val());
	        			$("#customerNo2").val($("#customerNo").val());
	        		}
					addTips(1, 2, "请手动输入客户号");
					return; 
					
				}*/
			}
			$("#crCustomer").val($("#customerNo").val().trim());
			doSearchCustomer();
			$("#dlgCustomer").modal("show");
		});

		var fnAddressChoosed;
		$("#address").focus(function () {
			resetAddressDlg();
			//根据业务区域初始化地址选项框
			initGroupName2();
			fnAddressChoosed = function (address) {
				$("#address").val(address);
			};
			$("#dlgAddress").modal("show");
		});

		$("#userAddress").focus(function () {
			resetAddressDlg();
			initGroupName2();
			fnAddressChoosed = function (address) {
				$("#userAddress").val(address);
			};
        	$("#dlgAddress").modal("show");
        });
		
		//客户部门
        //var fnDeptChoosed;
        /* $("#btnChooseCustomerDept").click(function() { 	//已删除
        	fnDeptChoosed = function(id, name) {
        		$("#departmentId").val(id);
        		$("#departmentName").val(name);
        	}; 
        	$("#dlgResDept").modal("show");
        }); */
       
       //用户部门
       /*  $("#btnChooseUserDept").click(function() {		//已删除
        	fnDeptChoosed = function(id, name) {
        		$("#userDepartmentId").val(id);
        		$("#userDepartmentName").val(name);
        	}; 
        	$("#dlgResDept").modal("show");
        }); */
        
        // 选择号码
        var fnPhoneNumberChoosed;
        $("#btnChooseUserPhoneNumber").click(function () {
        	if ($("#deptArea").val() === "") {
        		bbAlert("请选择业务区域");
        		return;
        	}
        	$(".khtips").remove();
        	$("#crPN").val($("#phoneNo").val());
        	$("#crPhoneSta").val($("#deptArea").val());
        	fnPhoneNumberChoosed = function (phoneNumber, phoneArea, phoneSta) {
        		$("#phoneNo").val(phoneNumber);
        		if (phoneNumber.length > 6) {
	        		$("#phonePwd").val(phoneNumber.substr(phoneNumber.length-6, 6));
        		} 
        		else {
        			$("#phonePwd").val(phoneNumber);
        		}
        		//$("#businessArea").val(phoneArea);	//已删除
        	};
        	doSearchPhoneNumber();
        	$("#dlgPhoneNumber").modal("show");
        });
        
        $("#btnChooseUserNo").click(function () {
        	chooseUserNo();
        });
        
        /* 费用转移 */
        $("#btnSetupCreditor").click(function () {
        	fnCreditorChoosed = function (targetCustomerId, targetUserId, templateId) {
        		$("#creditorRel").val(targetCustomerId ? "已设置" : "未设置");	
        		$("#creditorTargetCustomerId").val(targetCustomerId);
        		$("#creditorTargetUserId").val(targetUserId);
        		$("#creditorTemplateId").val(templateId);
        	}; 
        	$("#dlgCreditor").modal("show");
        });
        
        function validate() {
        	$(".khtips").remove();
        	var flag = validateCustomer();
        	if (!flag) {
        		return false;	
        	}
        	flag = validateAccount();
        	if (!flag) {
        		return false;	
        	}
        	flag = validateUser();
        	if (!flag) {
        		return false;	
        	}
        	if (businessType !== "l" && $("#userNo").val().trim() === "") {	
            	bbAlert("请输入或选择用户编号");
            	addTips(3, 14, "请输入或选择用户编号");
            	return false;
            }
        	flag = validateAmount();
        	if (!flag) {
        		return false;	
        	}
        	if ($("#createRemark").val().trim() === "") {
        		bbAlert("请填写装机备注");
        		return false;
        	}
        	return true;
        };
        
        $("#save").click(function () {
        	var v = validate();
        	if (!v) {
        		return;
        	}
        	
        	var remark ="业务类型:" + busiType + ",备注:" + ($("#createRemark").val().trim() !== "" ? $("#createRemark").val().trim() : "") + ";";
        	var op = "${sessionScope.userInfo.userName}";
        	var parm = {
        		"obj.creator": op,
        		"obj.opType": opType,
        		"obj.amountDue": $("#amountDue").val().trim(),
        		"obj.amountProceed": $("#amountProceed").val().trim(),
        		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
        		"obj.remark": remark,
        		
        		"obj.customer.id": $("#customerId").val().trim(),
    			"obj.customer.name": $("#name").val().trim(),
        		"obj.customer.customerNo": $("#customerNo").val().trim(),
        		"obj.customer.customerType": $("#customerType").val(),
        		"obj.customer.address": $("#address").val().trim(),
        		"obj.customer.certType": "1",
        		"obj.customer.certId": $("#certId").val().trim(),
        		"obj.customer.linker": $("#linker").val().trim(),
        		"obj.customer.linkPhone": $("#linkPhone").val().trim(),
        		"obj.customer.email": $("#email").val().trim(),
        		"obj.customer.linkAddress": $("#linkAddress").val().trim(),
        		"obj.customer.vip": $("#vip").val(),
        		"obj.customer.status": 0,
        		"obj.customer.creator": op,
        		"obj.customer.remark": $("#remark").val().trim(),
        		"obj.customer.departmentId": $("#creditor").val(),
        		"obj.customer.businessSta": $("#deptArea").val(),
        		"obj.customer.overdueFlag": $("#overdueFlag").val(),
        		"obj.customer.customerProp": 2,
        		//"obj.customer.loyalty": $("#loyalty").val(),					//已删除
        		//"obj.customer.customerManager": $("#customerManager").val(),	//已删除
        		
        		"obj.account.id": $("#accountId").val(),
        		"obj.account.payMethod": $("#payMethod").val(),
        		"obj.account.amount": $("#amount").val(),
        		"obj.account.score": $("#score").val(),
        		"obj.account.remark": $("#accRemark").val().trim(),
        		//"obj.account.creditor": $("#creditor").val(),					//与大客户无关
        		//"obj.account.bankName": $("#bankName").val(),					//已删除
        		//"obj.account.bankAcc": $("#bankAcc").val(),					//已删除
        		//"obj.account.bankAccOwner": $("#bankAccOwner").val(),			//已删除
        		
        		"user.businessType" : businessType,
        		"user.userType" : $("#userType").val(),
        		"user.name" : $("#userName").val().trim(),
        		"user.payPolicy": $("#payPolicy").val(),
        		"user.address": $("#userAddress").val().trim(),
        		"user.linkPhone": $("#userLinkPhone").val().trim(),
        		"user.callPolicy": $("#callPolicy").val(),
        		"user.creator": op,
        		"user.remark": $("#userRemark").val().trim(),
        		"user.businessSta": $("#deptArea").val(),
        		"user.creditorKey": $("#creditorTargetCustomerId").val() + "," + $("#creditorTargetUserId").val() + "," + $("#creditorTemplateId").val(),
        		"user.userNum": $("#userNo").val().trim()

        		//"user.businessKey" : $("#phoneNo").val(),
        		//"user.phoneLevel": $("#phoneLevel").val(),
        		//"user.adjustPolicy": $("#adjustPolicy").val(),
        		//"user.secretLevel": $("#security").val(),
        		//"user.pwd": $("#userPwd").val(),
        		
        		//"user.phoneAlias" : $("#phoneAlias").val(),					//已删除
        		//"user.departmentId" : $("#departmentId").val(),				//已删除
        		//"user.businessArea": $("#businessArea").val(),				//已删除
        	};
        	
        	switch (businessType) {
	        	case "p":
	        		parm["user.businessKey"] = $("#phoneNo").val().trim();
	        		parm["user.purpose"] = $("#purpose").val();
	        		parm["user.phoneLevel"] = $("#phoneLevel").val();
	        		parm["user.secretLevel"] = $("#security").val();
	        		parm["user.pwd"] = $("#phonePwd").val().trim();
	        		parm["user.adjustPolicy"] = $("#adjustPolicy").val();
	        		break;
	        	case "a":
	        	case "b":
	        		parm["user.businessKey"] = $("#accNo").val().trim();
	        		parm["user.serviceOper"] = $("#operator").val();
	        		parm["user.pwd"] = $("#accPwd").val().trim();
	        		parm["user.speed"] = $("#speed").val();
	        		parm["user.phoneNo"] = $("#bindPhone").val().trim();
	        		//parm["user.iptv"] = $("#iptv").val().trim();
	        		break;
	        	case "l":
	        		parm["user.businessKey"] = $("#plNo").val().trim();
	        		parm["user.plType"] =  $("#plType").val();
	        		parm["user.plModel"] = $("#plModel").val().trim();
	        		parm["user.startEp"] = $("#startEp").val().trim();
	        		parm["user.endEp"] = $("#endEp").val().trim();
	        		break;
        		default:
        			return;
        	}
        	
        	var index = 0;
        	var tableData = table_view_plan.rows().data();
        	var planCount = tableData.length;
        	var i;
        	for (i = 0; i < planCount; i++) {
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
        	
        	//宽带专线业务必须选择套餐
        	if ((businessType == "b" || businessType == "l") && index < 1) {
        		bbAlert("宽带专线业务必须选择套餐");
        		return;
        	}
        	
        	// 套餐非必选
        	/* if (index !== 1) {
        		bbAlert("必须选择资费且只能选择一个套餐");
        		return;
        	} */
        	
        	//index = 0;
        	tableData = table_view_product.rows().data();
        	var productCount = tableData.length;
        	var productIndex = 0;//记录订购月租的数量
        	for (i = 0; i < productCount; i++) {
        		var data = tableData[i];
        		console.log(data);
        		console.log(data.saleType);
        		if (data.productChoosed == "1") {
		        	parm["orderItems[" + index + "].itemId"] = data.id;
    		    	parm["orderItems[" + index + "].itemName"] = data.name;
    		    	parm["orderItems[" + index + "].itemType"] = 2;
    		    	parm["orderItems[" + index + "].saleType"] = data.saleType;
    		    	if (data.saleType == "1") {
    	 		   		parm["orderItems[" + index + "].term"] = "次";
    		    	} else {
    	 		   		parm["orderItems[" + index + "].term"] = data.term;
    	 		   	}
    	   		 	parm["orderItems[" + index + "].itemCount"] = data.productOrderCount;
    	    		parm["orderItems[" + index + "].itemPrice"] = data.productOrderPrice;
    	    		parm["orderItems[" + index + "].ossKey"] = data.ossOpenKey;
    	    		parm["orderItems[" + index + "].remark"] = data.productChoosedRemark;
    	    		parm["orderItems[" + index + "].payFlag"] = data.productPayChoosed;
    	    		index++;
    	    		productIndex ++;
    	    	}
        	}
        	
        	//电话业务必须有月租
        	if (businessType == "p" && productIndex < 1) {
        		bbAlert("电话业务必须选择月租业务");
        		return;
        	}
        	
        	/* if (index !== 1) {
        		bbAlert("必须选择月租且只能选择一个月租");
        		return;
        	} */
        	
        	tableData = table_view_fee.rows().data();
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
        	
        	var res = ajaxCRUD("order!insert.do", parm, true);
        	if (res.resNum === "0") {
        		if ($("#printFlag").get(0).checked && parseFloat($("#amountProceed").val().trim()) > 0) {
        			if (!res.id) return;
        			var rpt = printInvoice(res.id);
					var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rpt;
					window.open(uri);
        		}
        		reset();
        	}
        });
        
   		var index = 1;	//标签页tab-panel的位置
        function reset() {
        	$(".khtips").remove();
        	index = 1;
        	$("#save").hide();
        	$("#lastpage").hide();
        	$("#nextpage").show();
			$('#tab-head a:first').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");   
			$('#tab-head a:not("#tabtable1 a:first")').removeAttr('href').removeClass().addClass("button disabled button-pill button-primary");
			resetCustomer();
        	resetAccount();
        	resetUser();
        	resetAmountDue();
        	table_view_plan.ajax.reload();
        	table_view_product.ajax.reload();
        	table_view_fee.ajax.reload();
        }
        
        $("#reset").click(function () {
        	reset();
        });
        
        /*
         *	失去焦点同步验证
         */
        /* $("#panel-1 input").blur(function(){
        	var flag;
			flag = validateCustomer();
       		if(flag){
       			$('#tab2 a').attr('href','#panel-2');
       			$('#tab2 a').removeClass().addClass("button button-glow button-border button-pill button-primary");
       		};
       		
        }) */
        
        function tabbtn_save(index){
        	if (index === 1) {
        		$("#save").hide();
        	}
        	else if (index === 6) {
        		$("#save").show();
        	} 
        	else {
        		$("#save").hide();
        	}
        }
        
 		$("#tab-head a").on("click",function () {//给tab-panel的超链接定义点击事件，获取tab的index
			var hrefstr = this.href;
        	var tabs = hrefstr.split("#");
        	index = parseInt(tabs[1].split("-")[1]);
			$('#tab-head a[href]').removeClass().addClass("button button-glow button-border button-pill button-primary");
        	$('#tab'+index+' a').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        	tabbtn(index, 6);
        	tabbtn_save(index, 6);
        });
        
		$("#nextpage").click(function () {
			$(".khtips").remove();
			var flag;
			switch (index) {
				case 1:
					flag = validateCustomer();
	        		if (!flag) {
	        			return;	
	        		}
	        		if ($("#customerType").val() === "1") {	//自费用户自动同步名称、地址、联系电话
	        			$("#userName").val($("#name").val().trim());
	        			$("#userAddress").val($("#address").val().trim());
	        			$("#userLinkPhone").val($("#linkPhone").val().trim());
	        		}
	        		index++;
	        		tabcss(index, this.id);
	        		break;
				case 2:
					flag = validateAccount();
					if (!flag) {
						return;	
					}
					index++;
					tabcss(index, this.id);
	        		break;
				case 3:
					flag = validateUser();
	        		if (!flag){
	        			return;	
	        		}
		       	    if (businessType !== "l" && $("#userNo").val().trim() === "") {	
		            	bbAlert("请输入或选择用户编号");
		            	addTips(3, 14, "请输入或选择用户编号");
		            	return;
		            }
		       	 	index++;
		       	 	tabcss(index, this.id);
	        		break;
				case 4:
					if (businessType === "b") {
						index = 6;
						$('#tab6 a').attr('href','#panel-6');
		       			$('#tab-head a[href="#panel-6"]').tab('show');
		       			$('#tab4 a').removeClass().addClass("button button-glow button-border button-pill button-primary");
		       			$('#tab6 a').removeClass().addClass("button button-glow button-pill button-raised button-primary");
					} else {
						index = 5;
						tabcss(index, this.id);
					}
					break;
				default:
					index++;
					tabcss(index, this.id);
					break;
			}
			tabbtn(index, 6);
        	tabbtn_save(index, 6);
		});
		
		$("#lastpage").click(function () {
			if (index === 6 && businessType === "b") {
				index = 4;
				$('#tab-head a[href="#panel-4"]').tab('show'); 
				$('#tab4 a').removeClass().addClass("button button-pill button-raised button-primary");
				$('#tab6 a').removeClass().addClass("button button-glow button-border button-pill button-primary");
				tabbtn(4, 6);
	        	tabbtn_save(4, 6);
			} else {
				index--;
				tabcss(index, this.id);
				tabbtn(index, 6);
	        	tabbtn_save(index, 6);
			}
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
        
		<%-- <jsp:include page="../pub/resDeptDlg.jsp" flush="true"/> --%>		<!-- 已删除 -->
		<jsp:include page="../pub/resPhoneNumberDlg.jsp" flush="true"/>
		<jsp:include page="../pub/bigCustomerDlg.jsp" flush="true"/>
		<jsp:include page="../pub/customerDlg.jsp" flush="true"/>
        <jsp:include page="../pub/creditorDlg.jsp" flush="true"/>
        <jsp:include page="../pub/addressDlg.jsp" flush="true"/>
        
	</body>
</html>
