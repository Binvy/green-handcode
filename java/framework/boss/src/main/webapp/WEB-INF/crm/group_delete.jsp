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
		<link rel="stylesheet" href="assets/css/bootstrap-duallistbox.min.css" />
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
		<script src="assets/js/jquery.bootstrap-duallistbox.min.js"></script>
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<!-- Customize -->
		<script src="js/customer.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					批量拆机
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel panel-default">
						<div class="panel-body">
							<!-- 用户查询面板 -->
							<div class="row">
								<div class="col-xs-12 col-sm-12 widget-container-col">
									<div class="widget-box widget-color-dark">
										<div class="widget-header">
											<h5 class="widget-title bigger lighter">
												<i class="icon-user blue bigger-110"></i>
												客户信息
											</h5>
										</div>
									</div>
									<div class="widget-body">
										<div class="widget-main padding-8">
											<div class="row form-group">
												<label for="customerNo" class="col-sm-1 control-label">客户号</label>
												<div class="col-sm-3">
													<div class="input-group">
														<input id="customerId" type="hidden"/>
														<input class="form-control" id="customerNo" type="text" placeholder="客户号"/>
														<span class="input-group-btn">
															<button class="btn btn-sm btn-default" id="btnPickCustomer">
																<i class="icon-search bigger-110"></i>
																查询
															</button>
														</span>
													</div>
												</div>
					 							<label class="col-sm-1 control-label">客户名称</label>
												<div class="col-sm-3">
													<input class="form-control" id="name" type="text" readonly/>
												</div>
					 							<label for="departmentName" class="col-sm-1 control-label">部门</label>
												<div class="col-sm-3">
													<input class="form-control" id="departmentName" type="text" readonly/>
												</div>
											</div>
											<div class="row form-group">
					 							<label for="linker" class="col-sm-1 control-label">联系人</label>
												<div class="col-sm-3">
													<input class="form-control" id="linker" type="text" readonly/>
												</div>
					 							<label for="linkPhone" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="linkPhone" type="text" readonly/>
												</div>
					 							<label for="address" class="col-sm-1 control-label">地址</label>
												<div class="col-sm-3">
													<input class="form-control" id="address" type="text" readonly/>
												</div>
											</div>
											
											<div class="hr hr-16 hr-dotted"></div>
											
											<div>
												<select multiple="multiple" size="10" name="duallistbox_demo1[]" id="userKeys">
												</select>
											</div>
								
										</div>
									</div>
								</div>
								
							</div>
							<!-- 待拆用户查询 
							<div class="row">
								<div class="col-xs-12 col-sm-12 widget-container-col">
									<div class="widget-box widget-color-dark">
										<div class="widget-header">
											<h5 class="widget-title bigger lighter">
												<i class="icon-suitcase green bigger-110"></i>
												待拆用户
											</h5>
										</div>
									</div>
									<div class="widget-body">
										<div class="widget-toolbox">
											<div class="btn-toolbar">
												<select id="crBusinessType">
													<option role="option" value="">业务类型</option>
													<option role="option" value="p">电话</option>
													<option role="option" value="b">宽带</option>
													<option role="option" value="a">ADSL</option>
													<option role="option" value="l">专线</option>
													<option role="option" value="n">新业务</option>
												</select>
												<input class="" id="crBusinessKey" type="text" placeholder="业务号，如电话、账号" style="width:180px"/>
												<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
													<i class="icon-search purple bigger-110"></i>
													查询
												</button>
											</div>
										</div>
										<div class="widget-main padding-8">
											<table id="table_view" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>业务类型</th>
														<th>业务号</th>
														<th>用户名</th>
														<th>联系电话</th>
														<th>地址</th>
													</tr>
												</thead>
												<tbody></tbody>
											</table>										
										</div>
									</div>
								</div>
							</div>
						</div>
						-->
						<div class="panel-footer">
							<button type="button" id="save" class="btn btn-sm btn-primary">提交</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var businessType = "";
		
		var table_view;
        var criteria = {};
        
        var userKeys = null;
        
        // 初始化页面控件
        $(document).ready(function () {
			userKeys = $("#userKeys").bootstrapDualListbox({
  				nonSelectedListLabel: '<span class="label label-success">可拆除用户：</span>',
  				selectedListLabel: '<span class="label label-info">待拆除用户：</span>',
  				infoText: '显示所有 {0}',
  				infoTextEmpty: '空列表',
  				filterPlaceHolder: '过滤条件',
  				filterTextClear: '显示所有',
  				infoTextFiltered: '<span class="label label-warning">过滤</span> {0} / {1}', 
			});
       	});
       	
       	function loadUsers(customerId) {
			userKeys.empty();
				var res = ajaxCRUD("crmUser!findDeletableUsers.do", {"obj.customerId": customerId }, false);
				var lst = res.lst;
				var html = "";
				$(lst).each(function(index) {
					var item = lst[index];
					var id = item.businessType + item.id;
					var name = item.businessKey + " ";
					if (item.businessType == "p") {
						name += "电话";
					} else if (item.businessType == "a") {
						name += "ADSL";
					} else if (item.businessType == "b") {
						name += "宽带";
					} else if (item.businessType == "l") {
						name += "专线";
					} else {
						name += "新业务";
					}
					name += " " + item.name;
					html += '<option value="' + id + '">' + name + '</option>';
				});
			userKeys.append(html);
			userKeys.bootstrapDualListbox('refresh');
       	}
       	
		// 选择客户
		var fnBtnClickedCustomer;
		$("#btnPickCustomer").click(function() {
			fnBtnClickedCustomer = function(customerId, customerNo, customerName) {
				// 载入客户和账户信息
				loadCustomer(customerId);
				// 载入可拆除用户信息
				loadUsers(customerId);
			};
			$("#btnGenerateCustomerNo").hide();
			$("#crCustomerNo").val($("#customerNo").val());
			$("#crCustomer").val("");
			doSearchCustomer();
			$("#dlgCustomer").modal("show");
		});
		
		$("#save").click(function() {
			var users = userKeys.val();
			if (users == null || users.length == 0) {
				bbAlert("请选择要拆除用户");
				return;
			}
			if (confirm("确实要发送拆除工单吗？") == false) {
				return;
			}
        	var op = "${sessionScope.userInfo.userName}";
        	var success = 0;
			for (var i = 0; i < users.length; i++) {
				var info = users[i];
				var businessType = info.substring(0, 1);
				var userId = info.substring(1);
	        	var parm = {
    	    		"obj.id": userId,
        			"obj.creator": op,
        			"obj.opType": "delete",
        			"obj.customerId": $("#customerId").val(),
	        		"obj.businessType": businessType,
        			"obj.amountDue": 0,
        			"obj.amountProceed": 0,
        			"obj.printFlag": 0,
        			"obj.remark": ""
        		};
        		var res = ajaxCRUD("order!deleteUser.do", parm, false);
        		if (res.resNum == "0") {
        			success++;
        		}
			}
			
			bbAlert("成功提交了" + success + "个拆机工单");
			loadUsers($("#customerId").val());
		});
		
		function reset() {
			if ($("#customerId").val() == "") return;
			loadUsers($("#customerId").val());
		}
		
		$("#reset").click(function() {
			reset();
		});
		
        </script>
        
		<jsp:include page="../pub/customerDlg.jsp" flush="true"/>
        
	</body>
</html>
		