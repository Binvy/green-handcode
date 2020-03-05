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
		<script src="js/user.js"></script>
		<script src="js/pricePlan.js"></script>
		<script src="js/product.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					修改属性
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="widget-header">
								<h3 class="panel-title">
									<i class="icon-edit green"></i>
										修改属性&nbsp;&nbsp;&nbsp;&nbsp;<code style="color:red;font-size: 10px;background-color: transparent;">( 带 * 的为必填项 )</code>
								</h3>
								<div class="widget-toolbar">
								<span class="badge badge-danger">只能修改部分信息</span>
								</div>
							</div>
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
										<div id="tab1" style="width:12%; height:20px; display: inline-block; margin-left: 5%;">
									    	<a href="#panel-1" data-toggle="tab" class="button button-glow button-border button-pill button-primary"  style="margin-bottom:-15px; overflow: hidden;">
									    		<i class="icon-user-md"></i>
					 							客户信息
									    	</a>
									  	</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
							        	<div id="tab2" style="width:12%; height:20px; display: inline-block; margin-left: 1.5%;">
						 					<a href="#panel-2" data-toggle="tab" class="button button-glow button-border button-pill button-primary"  style="margin-bottom:-15px; overflow: hidden;">
						 						<i class="red icon-money"></i>
						 						账户信息
						 					</a>
					 					</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								       <div id="tab3" style="width:12%; height:20px; display: inline-block; margin-left: 1.5%;">
							 				<a href="#panel-3" data-toggle="tab" class="button button-glow button-pill button-raised button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="green icon-phone"></i>
							 					用户信息
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab4" style="width:12%; height:20px; display: inline-block; margin-left: 1.5%;">
							 				<a href="#panel-4" data-toggle="tab" class="button button-glow button-border button-pill button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="dark icon-dollar"></i>
							 					套餐
							 				</a>
						 				</div>
								        <i class="green icon-long-arrow-right bigger-110"></i>
								        <div id="tab5" style="width:12%; height:20px; display: inline-block; margin-left: 1.5%;">
							 				<a href="#panel-5" data-toggle="tab" class="button button-glow button-border button-pill button-primary"  style="margin-bottom:-15px; overflow: hidden;">
							 					<i class="orange icon-tags"></i>
							 					增值服务
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
													<select class="form-control" id="deptArea" disabled="true"></select>
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
													<input class="form-control" id="creditorName" type="text" readonly/>
												</div>
					 							<label for="customerNo" class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-3">
													<input id="customerId" type="hidden"/>
													<input class="form-control" id="customerNo" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="name" class="col-sm-1 control-label">名称</label>
												<div class="col-sm-7">
													<input class="form-control" id="name" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
					 							<label for="address" class="col-sm-1 control-label">地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="address" type="text" readonly />
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
														<select class="form-control" id="phoneLevel" disabled="true"></select>
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
													<input class="form-control" id="userName" type="text" placeholder="请输入用户名称" readonly/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="userAddress" class="col-sm-1 control-label">安装地址</label>
												<div class="col-sm-7">
													<input class="form-control" id="userAddress" type="text" placeholder="请输入安装地址" readonly/>
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
														<input class="form-control" id="userNo" type="text" placeholder="选择编号" readonly/>
														<span class="input-group-btn">
															<button class="btn btn-sm btn-default" id="btnChooseUserNo" disabled="disabled">
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
														<input class="form-control" id="creditorRel" type="text" placeholder="设置代缴" readonly/>
														<span class="input-group-btn">
															<button class="btn btn-sm btn-default" id="btnSetupCreditor" disabled="disabled">
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
										<div class="tab-pane" id="panel-4">
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
										<div class="tab-pane" id="panel-5">
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
										
									</div>
								</div>					
							<!-- </form> -->
						</div>
						
						<div class="panel-footer" style="text-align: right;">
							<button type="button" id="save" class="btn btn-sm btn-primary">修改</button>
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
		var opType = "edit";
		var busiType = (businessType + "_" + opType).toLowerCase();
		var deptName = "${sessionScope.userInfo.deptName}";
		
        // 初始化页面控件
        $(document).ready(function () {
            // 初始化下拉框
            loadRefs();
         	//设置客户名称、地址、联系电话值变化事件
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
       		reset();
       	});
        
        // 选择号码
        var fnUserChoosed;
        $("#btnChoosePhoneUser").click(function () { 
        	$(".khtips").remove();
        	var phoneNo = $("#phoneNo").val().trim();
        	$("#crUserKey").val(phoneNo);
        	fnUserChoosed = function (userId, businessKey) {
       			$("#phoneUserId").val(userId);
       			$("#phoneNo").val(businessKey);
       			loadUser(userId);
       			var customerId = $("#customerId").val();
       			loadCustomer(customerId);
       			loadAccount(customerId);
       			initPlanList(customerId, businessKey);
       			initProductList(customerId, businessKey);
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        $("#btnChooseAccUser").click(function () {
        	$(".khtips").remove();
        	var accNo = $("#accNo").val().trim();
        	$("#crUserKey").val(accNo);
        	fnUserChoosed = function (userId, businessKey) {
        		$("#accUserId").val(userId);
        		$("#accNo").val(businessKey);
        		loadUser(userId);
        		var customerId = $("#customerId").val();
        		loadCustomer(customerId);
        		loadAccount(customerId);
        		initPlanList(customerId, businessKey);
       			initProductList(customerId, businessKey);
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
        $("#btnChoosePlUser").click(function () {
        	$(".khtips").remove();
        	var plNo = $("#plNo").val().trim();
        	$("#crUserKey").val(plNo);
        	fnUserChoosed = function (userId, businessKey) {
        		$("#plUserId").val(userId);
        		$("#plNo").val(businessKey);
        		loadUser(userId);
        		var customerId = $("#customerId").val();
        		loadCustomer(customerId);
        		loadAccount(customerId);
        		initPlanList(customerId, businessKey);
       			initProductList(customerId, businessKey);
        	};
        	doSearch();
        	$("#dlgUser").modal("show");
        });
        
		$("#customerType").change(function() {
			//根据客户类型修改用户类型
			var id = $("#customerType").val();
			var parm = {"id": id};
			var res = ajaxCRUD("crmUser!findByUserTypeId.do", parm, false);
			var lst = res.utlst;
			var html = null;
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option role='option' value='" + item.id1 + "'>" + item.userType +  "</option>";
			});
			$("#userType").empty();
			$("#userType").append(html); 
		});
        
        function validate() {
        	$(".khtips").remove();
        	var flag = validateUser();
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
        	
        	var op = "${sessionScope.userInfo.userName}";
        	var parm = {
        		"customer.id": $("#customerId").val(),
        	    "customer.customerNo":   $("#customerNo1").val(),
        	    "customer.customerType": $("#customerType").val(),
        		"customer.certId" :  $("#certId").val(),
    		    "customer.linker" :  $("#linker").val(),
        	    "customer.linkAddress":   $("#linkAddress").val(),
        	    "customer.linkPhone":   $("#linkPhone").val(),
        	    "customer.email":   $("#email").val(),
        	    "customer.remark":   $("#remark").val(),
        	    "customer.overdueFlag": $("#overdueFlag").val(),
        	    
        	    "user.id":$("#userId").val(),
        		"user.businessType": businessType,
        		"user.userType" : $("#userType").val(),
        		"user.name" : $("#userName").val(),
        		"user.payPolicy": $("#payPolicy").val(),
        		"user.address": $("#userAddress").val(),
        		"user.linkPhone": $("#userLinkPhone").val(),
        		"user.callPolicy": $("#callPolicy").val(),
        		"user.creator": op,
        		"user.remark": $("#userRemark").val(),
        		"user.businessSta": $("#deptArea").val(),
        		"user.creditorKey": $("#creditorTargetCustomerId").val() + "," + $("#creditorTargetUserId").val() + "," + $("#creditorTemplateId").val()
        	};
        	switch (businessType) {
	        	case "p":
	        		parm["obj.id"] = $("#phoneUserId").val();
	        		parm["user.id"] = $("#phoneUserId").val();
	        		parm["user.businessKey"] = $("#phoneNo").val();
	        		parm["user.purpose"] = $("#purpose").val();
	        		parm["user.phoneLevel"] = $("#phoneLevel").val();
	        		parm["user.secretLevel"] = $("#security").val();
	        		parm["user.pwd"] = $("#phonePwd").val();
	        		parm["user.adjustPolicy"] = $("#adjustPolicy").val();
	        		parm["user.userType"] =  $("#userType").val();
	        		parm["user.payPolicy"] =  $("#payPolicy").val();
	        		break;
	        	case "a":
	        	case "b":
	        		parm["obj.id"] = $("#accUserId").val();
	        		parm["user.id"] = $("#accUserId").val();
	        		parm["user.businessKey"] = $("#accNo").val();
	        		parm["user.serviceOper"] = $("#operator").val();
	        		parm["user.pwd"] = $("#accPwd").val();
	        		parm["user.speed"] = $("#speed").val();
	        		parm["user.phoneNo"] = $("#bindPhone").val();
	        		break;
	        	case "l":
	        		parm["obj.id"] = $("#plUserId").val();
	        		parm["user.id"] = $("#plUserId").val();
	        		parm["user.businessKey"] = $("#plNo").val();
	        		parm["user.plType"] =  $("#plType").val();
	        		parm["user.plModel"] = $("#plModel").val();
	        		parm["user.startEp"] = $("#startEp").val();
	        		parm["user.endEp"] = $("#endEp").val();
	        		break;
        		default:
        			return;
        	}
        	
        	var res = ajaxCRUD("order!editUser.do", parm, true);
        	if (res.resNum === "0") {
        		reset();
        	} 
        });
        
        var index = 3;
        function reset() {
        	$(".khtips").remove();
        	index = 3;
        	$("#crUserKey").val("");
        	$('#tab-head').find('a:eq(2)').tab('show').removeClass().addClass("button button-glow button-pill button-raised button-primary");;
        	$('#tab-head a').not('a:eq(2)').removeClass().addClass("button button-glow button-border button-pill button-primary");
			resetCustomer();
        	resetAccount();
        	resetUser();
        	initPlanList("","");
        	initProductList("","");
        }
        
        $("#reset").click(function () {
        	reset();
        });
        
        $("#tab-head a").on("click", function () {
			var hrefstr = this.href;
        	var tabs = hrefstr.split("#");
        	index = parseInt(tabs[1].split("-")[1]);
			$('#tab-head a[href]').removeClass().addClass("button button-glow button-border button-pill button-primary");
        	$('#tab' + index + ' a').removeClass().addClass("button button-glow button-pill button-raised button-primary");
        	tabbtn(index, 5);
        });
        
		$("#nextpage").click(function () {
			$(".khtips").remove();
			var flag;
			if (index === 3) {
				flag = validateUser();
				if (!flag) {
					return;	
				}
			}
			index++;
			tabcss(index, this.id);
			tabbtn(index, 5);
		});
		
		$("#lastpage").click(function () {
			index--;
			tabcss(index, this.id);
			tabbtn(index, 5);
		});
        
        </script>
		<jsp:include page="../pub/userDlg.jsp" flush="true"/>
        
	</body>
</html>
		