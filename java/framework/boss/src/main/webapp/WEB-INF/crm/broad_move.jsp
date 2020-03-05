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
		<script src="assets/js/jquery.tabledit.min.js"></script>
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<!-- Customize -->
		<script src="js/customer.js"></script>
		<script src="js/broad.js"></script>
		<script src="js/pricePlan.js"></script>
		<script src="js/product.js"></script>
		<script src="js/fee.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">宽带业务受理</a>
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
								宽带移机&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
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
						<div class="panel-heading">
							<p style="color:red;font-size:16px;" id="movename">选择移机业务:</p>
							<!-- 	<img src="images/ddd.gif" alt="上海鲜花港 - 郁金香"/> -->
							<select class="form-control" id="moveName"  onchange="businessOnchange(this.id)">
							
							<option value ="ordinaryMove" selected = "selected" >普通移机业务</option>
							<option value ="crossMove">跨站移机不改号业务</option>
							<option value ="changeNumMove">跨站移机改号业务</option>
							</select> 
						</div>
						<div class="panel-body">
							<!-- <form class="form-horizontal" role="form">  -->
								<div class="tabbable" id="tabtable1">
									<div id="tab-head" style="margin-bottom: 30px; text-align: center;">
										<div id="tab1" style="width:10%; height:20px; display: inline-block;">
									    	<a href="#panel-1" data-toggle="tab" class="button button-glow button-pill button-raised button-primary" style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							移机
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
										<div id="tab2" style="width:12%; height:20px; display: inline-block; ">
									    	<a href="#panel-2" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							客户信息
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
							        	<div id="tab3" style="width:12%; height:20px; display: inline-block; ">
						 					<a href="#panel-3" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
						 						<i class="red icon-money"></i>
						 						账户信息
						 					</a>
					 					</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								       <div id="tab4" style="width:12%; height:20px; display: inline-block; ">
							 				<a href="#panel-4" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="green icon-phone"></i>
							 					用户信息
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab5" style="width:10%; height:20px; display: inline-block; ">
							 				<a href="#panel-5" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="dark icon-dollar"></i>
							 					资费
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab6" style="width:12%; height:20px; display: inline-block; ">
							 				<a href="#panel-6" data-toggle="tab" class="button button-glow button-pill button-border button-primary" style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="orange icon-tags"></i>
							 					增值服务
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
										<!-- 移机 -->
										<div class="tab-pane active" id="panel-1">
											<!-- 普通移机 -->
											<div id="ormove">
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="businessKey" class="col-sm-1 control-label">
						 								上网账号<code style="color:red; text-align: right; background-color: transparent;">*</code>
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
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="userName1" class="col-sm-1 control-label">用户名称</label>
													<div class="col-sm-7">
														<input class="form-control" id="userName1" type="text" readonly/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="oldUserAddress" class="col-sm-1 control-label">原地址</label>
													<div class="col-sm-7">
														<input class="form-control" id="oldUserAddress" type="text" readonly/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="oldPostAddress" class="col-sm-1 control-label">原邮政</label>
													<div class="col-sm-7">
														<input class="form-control" id="oldPostAddress" type="text" placeholder="市政标准地址"/>
													</div>
												</div>
												<div class="hr hr-18 dotted hr-double"></div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="newOutVlan" class="col-sm-1 control-label">
						 								现VLAN&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<input class="form-control" id="newOuterVlan" type="text" placeholder="请输入新的VLAN账号"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="newUserAddress" class="col-sm-1 control-label">
						 								现地址&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-7">
														<input class="form-control" id="newUserAddress" type="text" placeholder="请先选择用户，点击选择新安装地址"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="newPostAddress" class="col-sm-1 control-label">现邮政</label>
													<div class="col-sm-7">
														<input class="form-control" id="newPostAddress" type="text" placeholder="市政标准地址"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="ormoveRemark" class="col-sm-1 control-label">备注</label>
													<div class="col-sm-7">
														<input class="form-control" id="ormoveRemark" type="text" placeholder="请输入备注" />
													</div>
												</div>
											</div>
											<div style="display:none;" id="crmove">
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="businessKey2" class="col-sm-1 control-label">
						 								上网账号<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<div class="input-group">
														<input id="userId2" type="hidden"/>
														<input class="form-control" id="businessKey2" type="text" placeholder="（输入上网账号）查询"/>
														<span class="input-group-btn">
															<button class="btn btn-sm btn-default" id="btnChooseUser2">
																<i class="ace-icon fa fa-calendar bigger-110"></i>
																查询
															</button>
														</span>
														</div>
													</div>
													<label for="oldDeptArea2" class="col-sm-1 control-label">原区域</label>
													<div class="col-sm-3">
														<input class="form-control" id="oldDeptArea2" type="text" readonly/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="userName2" class="col-sm-1 control-label">用户名称</label>
													<div class="col-sm-7">
														<input class="form-control" id="userName2" type="text" readonly/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="oldUserAddress2" class="col-sm-1 control-label">原地址</label>
													<div class="col-sm-7">
														<input class="form-control" id="oldUserAddress2" type="text" readonly/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="oldPostAddress2" class="col-sm-1 control-label">原邮政</label>
													<div class="col-sm-7">
														<input class="form-control" id="oldPostAddress2" type="text" placeholder="市政标准地址"/>
													</div>
												</div>
												<div class="hr hr-18 dotted hr-double"></div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="customerTypes" class="col-sm-1 control-label">客户类型</label>
													<div class="col-sm-3">
														<select class="form-control" id="customerType2">
														</select>
													</div>
													<label for="deptArea2" class="col-sm-1 control-label">
														业务区域<code style="color:red; text-align: right; background-color: transparent;">*</code>
													</label>
													<div class="col-sm-3">
														<select class="form-control" id="deptArea2">
														</select>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="newOutVlan2" class="col-sm-1 control-label">
						 								现VLAN&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<input class="form-control" id="newOuterVlan2" type="text" placeholder="请输入新的VLAN账号"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="newUserAddress2" class="col-sm-1 control-label">
						 								现地址&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-7">
														<input class="form-control" id="newUserAddress2" type="text" placeholder="请输入新安装地址"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="newPostAddress2" class="col-sm-1 control-label">现邮政</label>
													<div class="col-sm-7">
														<input class="form-control" id="newPostAddress2" type="text" placeholder="市政标准地址"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="crmoveRemark" class="col-sm-1 control-label">备注</label>
													<div class="col-sm-7">
														<input class="form-control" id="crmoveRemark" type="text" placeholder="请输入备注" />
													</div>
												</div>
											</div>
											
											<!-- 跨站移机改号 -->
											<div style="display: none;" id="chmove">
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="businessKey" class="col-sm-1 control-label">
						 								上网账号<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<div class="input-group">
														<input id="userId" type="hidden"/>
														<input class="form-control" id="businessKey3" type="text" placeholder="（输入上网账号）查询"/>
														<span class="input-group-btn">
															<button class="btn btn-sm btn-default" id="btnChooseUser3">
																<i class="ace-icon fa fa-calendar bigger-110"></i>
																查询
															</button>
														</span>
														</div>
													</div>
													<label for="oldDeptArea3" class="col-sm-1 control-label">原区域</label>
													<div class="col-sm-3">
														<input class="form-control" id="oldDeptArea3" type="text" readonly/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="userName3" class="col-sm-1 control-label">用户名称</label>
													<div class="col-sm-7">
														<input class="form-control" id="userName3" type="text" readonly/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="oldUserAddress3" class="col-sm-1 control-label">原地址</label>
													<div class="col-sm-7">
														<input class="form-control" id="oldUserAddress3" type="text" readonly/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="oldPostAddress3" class="col-sm-1 control-label">原邮政</label>
													<div class="col-sm-7">
														<input class="form-control" id="oldPostAddress3" type="text" placeholder="市政标准地址"/>
													</div>
												</div>
												<div class="hr hr-18 dotted hr-double"></div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="customerType3" class="col-sm-1 control-label">客户类型</label>
													<div class="col-sm-3">
														<select class="form-control" id="customerType3">
														</select>
													</div>
													<label for="deptArea3" class="col-sm-1 control-label">
														业务区域<code style="color:red; text-align: right; background-color: transparent;">*</code>
													</label>
													<div class="col-sm-3">
														<select class="form-control" id="deptArea3">
														</select>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="newBusinessKey" class="col-sm-1 control-label">
						 								现账号&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<input class="form-control" id="newBusinessKey" type="text" placeholder="请输入新账号"/>
													</div>
													<label for="newOutVlan3" class="col-sm-1 control-label">
						 								现VLAN&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-3">
														<input class="form-control" id="newOuterVlan3" type="text" placeholder="请输入新的VLAN账号"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
													<label for="customerNo4" class="col-sm-1 control-label">
						 								客户号&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
						 							</label>
													<div class="col-sm-3">
														<div class="input-group">
															<input id="customerId4" type="hidden"/>
															<input class="form-control" id="customerNo4" type="text" 
																placeholder="输入或生成客户号" 
																data-toggle="tooltip" data-placement="bottom"   
																title="客户号是必填项"/>
															<span class="input-group-btn">
																<button class="btn btn-sm btn-default" id="btnPickCustomerNo">
																	<i class="ace-icon fa fa-calendar bigger-110"></i> 选择
																</button>
															</span>
														</div>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="newUserAddress3" class="col-sm-1 control-label">
						 								现地址&nbsp;<code style="color:red; text-align: right; background-color: transparent;">*</code>
					 								</label>
													<div class="col-sm-7">
														<input class="form-control" id="newUserAddress3" type="text" placeholder="请输入新安装地址"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="newPostAddress3" class="col-sm-1 control-label">现邮政</label>
													<div class="col-sm-7">
														<input class="form-control" id="newPostAddress3" type="text" placeholder="市政标准地址"/>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-sm-2"></div>
						 							<label for="chmoveRemark" class="col-sm-1 control-label">备注</label>
													<div class="col-sm-7">
														<input class="form-control" id="chmoveRemark" type="text" placeholder="请输入备注" />
													</div>
												</div>
											</div>
										</div>
										
										<!-- 客户信息 -->
										<div class="tab-pane" id="panel-2">
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="deptArea" class="col-sm-1 control-label">业务区域</label>
												<div class="col-sm-3">
													<select class="form-control" id="deptArea">
													</select>
												</div>
												<label for="operator" class="col-sm-1 control-label">运营商</label>
												<div class="col-sm-3">
													<select class="form-control" id="operator">
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
													<input class="form-control" id="remark" type="text" placeholder="请输入备注" />
												</div>
											</div>
										</div>
										
										<!-- 账户信息 -->
										<div class="tab-pane" id="panel-3">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label class="col-sm-1 control-label">客户号</label>
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
										
										<!-- 用户信息 -->
										<div class="tab-pane" id="panel-4">
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-3">
													<input class="form-control" id="customerNo2" type="text" readonly />
												</div>
					 							<label for="acc" class="col-sm-1 control-label">上网账号</label>
												<div class="col-sm-3">
													<input id="userId" type="hidden"/>
													<input class="form-control" id="acc" type="text" placeholder="请输入宽带登录用户名"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="deviceCode" class="col-sm-1 control-label">宽带类型</label>
												<div class="col-sm-3">
													<select class="form-control" id="deviceCode">
													</select>
												</div>
					 							<label for="userPwd" class="col-sm-1 control-label">登录口令</label>
												<div class="col-sm-3">
													<input class="form-control" id="userPwd" type="text" placeholder="请输入登录口令"/>
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
													<input class="form-control" id="userAddress" type="text" placeholder="点击选择安装地址"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="postAddress" class="col-sm-1 control-label">邮政地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="postAddress" type="text" placeholder="请输入市政标准地址"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="userLinkPhone" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="userLinkPhone" type="text" placeholder="请输入联系电话"/>
												</div>
												<label for="creditorKey" class="col-sm-1 control-label">代缴电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="creditorKey" type="text" placeholder="请输入代缴电话" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="notifyPolicy" class="col-sm-1 control-label">提醒策略</label>
												<div class="col-sm-3">
													<select class="form-control" id="notifyPolicy">
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="outerVlan" class="col-sm-1 control-label">VLAN</label>
												<div class="col-sm-3">
													<input class="form-control" id="outerVlan" type="text" placeholder="请输入VLAN账号" />
												</div>
					 							<label class="col-sm-1 control-label">绑定MAC</label>
												<div class="col-sm-3">
													<input class="form-control" id="macAddress" type="text" placeholder="请输入绑定的MAC地址" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="speed" class="col-sm-1 control-label">带宽</label>
												<div class="col-sm-3">
													<select class="form-control" id="speed">
													</select>
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
																			<label class="col-sm-3 control-label">预收费：</label>
																			<div class="col-sm-9">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<span>￥</span>
																					</div>
																					<input class="form-control" id="amountPre" type="text" value="0" readonly />
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
						
						<div class="panel-footer" style="text-align: right;">
							<button type="button" id="save" class="btn btn-sm btn-primary">移机</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
							<button type="button" id="lastpage" class="btn btn-sm btn-primary">上一页</button>
							<button type="button" id="nextpage" class="btn btn-sm btn-primary">下一页</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var parentProductId = "b"; // Used by product.js
		var businessType = "b";
		var opType = "move";
		var busiType = (businessType + "_" + opType).toLowerCase(); // Used by fee.js
		var deptName = "${sessionScope.userInfo.deptName}";	//Used by customer.js
		
        // 初始化页面控件
        $(document).ready(function () {
            // 初始化下拉框
            loadRefs();
        	//初始化业务区域
        	loadDeptAreas();
            loadRef("ref_customer_type", "customerType2");
       		loadRef("ref_customer_type", "customerType3");
       		// 显示产品和增值服务选择清单
       		initEditableFeeList();
       		$('#table_view_fee tbody').on('click', 'td.details-control', openFeeEditor);  
       		// 设置客户号、客户名称、地址、联系电话值、实收费变化事件
       		initChanged();
       	});
       	
       	function businessOnchange(id){
        	 var bus = document.getElementById(id);
        	  var movebus = bus.value;
        	  if (movebus == "crossMove"){
        		  $("#ormove").hide();
        		  $("#crmove").show();
        		  $("#chmove").hide();
        		  $("#movename").html("您现在选择的业务是：跨站移机不改号业务");
        		  resetUserMove();
        	  };
        	  if (movebus == "ordinaryMove"){
        		  $("#ormove").show();
        		  $("#crmove").hide();
        		  $("#chmove").hide();
        		  $("#movename").html("您现在选择的业务是：普通移机业务");
        		  resetUserMove();
        	  };
        	  if (movebus == "changeNumMove"){
        		  $("#chmove").show();
        		  $("#ormove").hide();
        		  $("#crmove").hide();
        		  $("#movename").html("您现在选择的业务是：跨站移机改号业务");
        		  resetUserMove();
        	  };
        };
       	
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
       			$("#userName1").val($("#userName").val());
       			$("#oldUserAddress").val($("#userAddress").val());
       			$("#oldPostAddress").val($("#postAddress").val());
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        $("#btnChooseUser2").click(function() { 
        	$("#userStatus").val("2");
        	var phoneNo = $("#businessKey2").val();
        	$("#crUser").val(phoneNo);
        	fnUserChoosed = function(userId, businessKey) {
       			$("#userId2").val(userId);
       			$("#businessKey2").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			initPlanList(customerId, businessKey);
       			initProductList(customerId, businessKey);
       			$("#oldDeptArea2").val($("#deptArea").val());
       			$("#userName2").val($("#userName").val());
       			$("#oldUserAddress2").val($("#userAddress").val());
       			$("#oldPostAddress2").val($("#postAddress").val());
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        $("#btnChooseUser3").click(function() { 
        	$("#userStatus").val("2");
        	var phoneNo = $("#businessKey3").val();
        	$("#crUser").val(phoneNo);
        	fnUserChoosed = function(userId, businessKey) {
       			$("#userId3").val(userId);
       			$("#businessKey3").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			initPlanList(customerId, businessKey);
       			initProductList(customerId, businessKey);
       			$("#oldDeptArea3").val($("#deptArea").val());
       			$("#userName3").val($("#userName").val());
       			$("#oldUserAddress3").val($("#userAddress").val());
       			$("#oldPostAddress3").val($("#postAddress").val());
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        var fnAddressChoosed;
        /* $("#newUserAddress").focus(function() {
        	fnAddressChoosed = function(address, vlan, accPrefix, businessArea){
        		if ($("#userId").val() == "") return;
        		$("#newUserAddress").val(address);
        		//$("#newBusinessKey").val(accPrefix);
        		$("#newOuterVlan").val(vlan);
        		$("#deptArea").val(businessArea);
        		// 判断是否需要更换账号
        		var oldAcc = $("#acc").val();
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
        				};
        			};
        			if (!match) {
        				var parm = {
        					"obj.acc": accPrefix,
        					"obj.bearable": businessType
        				};
        				var res = ajaxCRUD("resAcc!findTopUsable.do", parm, false);
	    	    		$("#newBusinessKey").val(res.id);
        			};
        		};
        	};
        	$("#dlgAddress").modal("show");
        }); */

        var fnBtnClickedCustomer;
		$("#btnPickCustomerNo").click(function() {
			$(".khtips").remove();
			var deptArea = '';
			if ( $("#deptArea").val() != '通信管理处' ) {
				deptArea = $("#deptArea2").find("option:selected").text().split(" ")[1];
			} else {
				deptArea = "Z";
			};
			fnBtnClickedCustomer = function(customerId, customerNo, customerName) {
				if (customerId == undefined || customerId == "") {
					var parm = {
						"policyKey": "CUSTOMER_NO", 
						"variable": deptArea,
					    "custType": $("#customerType2").val()
					};
					var res = ajaxCRUD("seq!currVal.do", parm, false);
					$("#customerNo4").val(res.seqVal);
				} else {
					// 载入客户和账户信息
					loadCustomer(customerId);
					loadAccount(customerId);
					$("#customerNo4").val(customerNo);
				};
			};
			$("#btnGenerateCustomerNo").show();
			doSearchCustomer();
			$("#dlgCustomer").modal("show");
		});
        
		$("#address").focus(function() {
			fnAddressChoosed = function(address) {
				$("#address").val(address);
			};
			$("#dlgAddress").modal("show");
		});
		
		 $("#newUserAddress").focus(function() {
				fnAddressChoosed = function(newUserAddress) {
					$("#newUserAddress").val(newUserAddress);
					if( "1" == $("#customerType").val() ){
						$("#userAddress").val(newUserAddress);
					};
				};
				$("#dlgAddress").modal("show");
			});
		
        $("#newUserAddress2").focus(function() {
			fnAddressChoosed = function(newUserAddress) {
				$("#newUserAddress2").val(newUserAddress);
				if( "1" == $("#customerType").val() ){
					$("#userAddress").val(newUserAddress);
				};
			};
			$("#dlgAddress").modal("show");
		});
        
        $("#newUserAddress3").focus(function() {
			fnAddressChoosed = function(newUserAddress) {
				$("#newUserAddress3").val(newUserAddress);
				if( "1" == $("#customerType").val() ){
					$("#userAddress").val(newUserAddress);
				};
			};
			$("#dlgAddress").modal("show");
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
     	
        $("#amountProceed").focus(function(){
        	$("#amountProceed").val($("#amountProceed").val() == 0 ? "" : $("#amountProceed").val());
        });
		
        function validateInfo() {
        	$(".khtips").remove();
        	if($("#ormove").is(":visible")){
				if ( $("#businessKey").val() == "" ) {
					addMoveTips("ormove", 0, "请输入或查询上网账号");
			        return false;
				};
				if ( $("#newOuterVlan").val() == "") {
					addMoveTips("ormove", 4, "请输入现VLAN账号");
					return false;
				}
				if ( $("#newUserAddress").val() == "" ) {
					addMoveTips("ormove", 5, "请输入新安装地址");
	        		return false;
	        	};
	        	if ( $("#newUserAddress").val() == $("#oldUserAddress").val() ) {
	        		addMoveTips("ormove", 5, "新地址与原地址不能相同");
	        		return false;
	        	};
			};
			
			if($("#crmove").is(":visible")){
				if ( $("#businessKey2").val() == "") {
					addMoveTips("crmove", 0, "请输入或查询上网账号");
			        return false;
				};
				if ( $("#deptArea2").val() == $("#oldDeptArea2").val()) {
					addMoveTips("crmove", 4, "业务区域与原业务区域不能相同");
					return false;
				};
				if ( $("#newOuterVlan2").val() == "") {
					addMoveTips("crmove", 5, "请输入现VLAN账号");
					return false;
				}
				if ( $("#customerNo4").val() == "") {
					addMoveTips("crmove", 5, "请输入或选择客户号");
					return false;
				};
				if ( $("#newUserAddress2").val() == "" ) {
					addMoveTips("crmove", 6, "请输入新安装地址");
	        		return false;
	        	};
				if ( $("#newUserAddress2").val() == $("#oldUserAddress2").val() ) {
	        		addMoveTips("crmove", 6, "新地址与原地址不能相同");
	        		return false;
	        	};
			};
			
			if($("#chmove").is(":visible")){
				if ( $("#businessKey3").val() == "") {
					addMoveTips("chmove", 0, "请输入或查询电话号码");
			        return false;
				};
				if ( $("#deptArea3").val() == $("#oldDeptArea3").val()) {
					addMoveTips("chmove", 4, "业务区域与原业务区域不能相同");
					return false;
				};
				if ( $("#newBusinessKey").val() == "") {
					addMoveTips("chmove", 5, "请输入新号码");
					return false;
				};
				if ( $("#newBusinessKey").val() == $("#businessKey3").val() ) {
					addMoveTips("chmove", 5, "新号码与原号码不能相同");
					return false;
				};
				if ( $("#newOuterVlan3").val() == "") {
					addMoveTips("chmove", 5, "请输入现VLAN账号");
					return false;
				}
				if ( $("#customerNo5").val() == "") {
					addMoveTips("chmove", 6, "请输入或选择客户号");
					return false;
				};
				if ( $("#newUserAddress3").val() == "" ) {
					addMoveTips("chmove", 7, "请输入新安装地址");
	        		return false;
	        	};
				if ( $("#newUserAddress3").val() == $("#oldUserAddress3").val() ) {
					addMoveTips("chmove", 7, "新地址与原地址不能相同");
	        		return false;
	        	};
			};
        	return true;
        };
        
        function validate() {
        	$(".khtips").remove();
        	var flag = validateInfo();
        	if (!flag) return false;
        	return true;
        };
        
        $("#save").click(function() {
        	var v = validate();
        	if (!v) return;
        	
        	var move = $("#moveName").val();
        	var op = "${sessionScope.userInfo.userName}";
        	var remark = "";
        	var parm = {};
        	
        	/*  普通移机业务*/
        	if( move == "ordinaryMove" ) { 
        		 remark = "电话普通移机备注:" + ($("#ormoveRemark").val() == null ? "" : $("#ormoveRemark").val().concat(","));
	        	 parm = {
	        	    "obj.movetype":move,
	        		"obj.id": $("#userId").val(),
	        		"obj.creator": op,
	        		"obj.opType": opType,
	        		"obj.businessType": businessType,
	        		"obj.remark": remark,
	        		"obj.amountDue": $("#amountDue").val(),
	        		"obj.amountProceed": $("#amountProceed").val(),
	        		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
	        		"obj.user.address": $("#newUserAddress").val(),
	        		"obj.user.postAddress": $("#newPostAddress").val(),
	        		"obj.user.businessArea": $("#deptArea").val(),
	        		"obj.user.businessKey": $("#businessKey").val(),
	        		"obj.user.remark": $("#newOuterVlan").val()
	        	};
        	};
        	/*跨站移机不改号业务  */
        	if ( move == "crossMove" ) { 
        		 remark = "电话跨站移机不改号备注:" + ($("#crmoveRemark").val() == null ? "" : $("#crmoveRemark").val().concat(","));
        		 parm = {
        		 	"obj.movetype":move,
        		 	"obj.id": $("#userId2").val(),
         			"obj.creator": op,
	         		"obj.opType": opType,
	         		"obj.businessType": businessType,
	         		"obj.customer.customerType":$("#customerType2").val(),
	         		"obj.customer.Id":$("#customerId4").val(),
	         		"obj.customer.customerNo":$("#customerNo4").val(),
	         		"obj.remark": remark,
	         		"obj.amountDue": $("#amountDue").val(),
	         		"obj.amountProceed": $("#amountProceed").val(),
	         		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
	         		"obj.user.address": $("#newUserAddress2").val(),
	        		"obj.user.postAddress": $("#newPostAddress2").val(),
	        		"obj.user.businessSta": $("#deptArea2").val(),
	        		//"obj.user.businessKey": $("#businessKey2").val(),
	        		"obj.user.remark": $("#newOuterVlan2").val()
        		};
        	};
        	/*跨站移机改号业务  */
	        if ( move="changeNumMove" ) { 
	        	 remark = "电话跨站移机改号备注:" + ($("#chmoveRemark").val() == null ? "" : $("#chmoveRemark").val().concat(","));
	        	 parm == {
	           		"obj.movetype":move,
	           		"obj.id": $("#userId3").val(),
            		"obj.creator": op,
            		"obj.opType": opType,
            		"obj.businessType": businessType,
            		"obj.remark": remark,
            		"obj.customer.customerNo":$("#customerNo5").val(),
            		"obj.businessKey":$("#newphoneNo").val(),
            		"obj.amountDue": $("#amountDue").val(),
            		"obj.amountProceed": $("#amountProceed").val(),
            		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
            		"obj.user.address": $("#newUserAddress3").val(),
	        		"obj.user.postAddress": $("#newPostAddress3").val(),
	        		"obj.user.businessArea": $("#deptArea3").val(),
	        		"obj.user.businessKey": $("#businessKey3").val(),
	        		"obj.user.remark": $("#newOuterVlan3").val()
           		};
        	};
        	
        	/* var parm = {
        		"obj.id": $("#userId").val(),
        		"obj.creator": op,
        		"obj.opType": opType,
        		"obj.businessType": businessType,
        		"obj.remark": remark,
        		"obj.amountDue": $("#amountDue").val(),
        		"obj.amountProceed": $("#amountProceed").val(),
        		"obj.printFlag": ($("#printFlag").get(0).checked ? 1 : 0),
        		"obj.user.address": $("#newUserAddress").val(),
        		"obj.user.postAddress": $("#newPostAddress").val(),
        		"obj.user.businessArea": $("#newBusinessArea").val(),
        		"obj.user.businessKey": $("#newBusinessKey").val(),
        		"obj.user.remark": $("#newOuterVlan").val()
        	}; */
        	
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
    	    	};
        	};
        	
        	var res = ajaxCRUD("order!moveUser.do", parm, true);
        	if (res.resNum == "0") {
        		if ($("#printFlag").get(0).checked && parseFloat($("#amountProceed").val()) > 0) {
        			var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=receipt_data.cpt&id=" + res.id;
        			window.open(uri);
        		};
        		reset();
        	};
        });
        
        var index = 1;
        function reset() {
        	$(".khtips").remove();
        	index = 1;
        	$('#tab-head a:first').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");   
			$('#tab-head a:not("#tabtable1 a:first")').removeClass().addClass("button button-glow button-pill button-border button-primary");
			$("#businessKey").val("");
			$("#userName1").val("");
			$("#oldUserAddress").val("");
			$("#oldPostAddress").val("");
			$("#newUserAddress").val("");   
			$("#newOuterVlan").val("");
			$("#newBusinessKey").val("");
			$("#newBusinessArea").val("");
			$("#newPostAddress").val("");
			$("#acc").val("");
			resetCustomer();
        	resetAccount();
        	resetUser();
        	resetAmountDue();
        	table_view_plan.ajax.clear();
        	table_view_product.ajax.clear();
        	table_view_fee.ajax.clear();
        };
        
        $("#reset").click(function() {
        	reset();
        });

        $("#tab-head a").on("click",function(){//给tab-panel的超链接定义点击事件，获取tab的index
			var hrefstr = this.href;
        	var tabs = hrefstr.split("#");
        	index = tabs[1].split("-")[1];
			$('#tab-head a[href]').removeClass().addClass("button button-glow button-border button-pill button-primary");
        	$('#tab'+index+' a').removeClass().addClass("button button-glow button-pill button-raised button-primary");
			//$('#tab-head a:gt('+index+')')
        });
        
		$("#nextpage").click(function(){
			$(".khtips").remove();
			var flag;
			if( index == 1 ){
				flag = validateInfo();
				if (!flag) return;
        		index++;
        		btncss(1);
			} else if( index == 2 ) {
        		index++;
        		btncss(2);
			} else if( index == 3 ) {
        		index++;
        		btncss(3);
			} else if( index == 4 ) {
				flag = validateUser();
        		if (!flag) return;
        		index++;
        		btncss(4);
			} else if( index == 5 ) {
        		index++;
        		btncss(5);
			} else if( index == 6 ) {
        		index++;
        		btncss(6);
			} else if( index == 7 ) {
				bootbox.alert({
					locale : "zh_CN",
					size : 'small',
					title : "提示",
					message : "已经在最后一页了"
				});
			} else {
				return;
			};
		});
		
		$("#lastpage").click(function() {
			if( index > 1 ) {
				index--;
				$('#tab-head a[href="#panel-'+index+'"]').tab('show'); 
				$('#tab'+index+' a').removeClass().addClass("button button-pill button-raised button-primary");
				$('#tab'+(index+1)+' a').removeClass().addClass("button button-glow button-border button-pill button-primary");
			} else {
				bootbox.alert({
					locale : "zh_CN",
					size : 'small',
					title : "提示",
					message : "现在在首页页面"
				});
				return;				
			};
		})
        </script>
        
		<jsp:include page="../pub/addressDlg.jsp" flush="true"/>
		<jsp:include page="../pub/userDlg.jsp" flush="true"/>
        <jsp:include page="../pub/creditorDlg.jsp" flush="true"/>
	</body>
</html>
