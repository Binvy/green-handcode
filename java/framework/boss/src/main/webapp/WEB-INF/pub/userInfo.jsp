<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="js/pricePlan.js"></script>
		<script src="js/product.js"></script>
		<script src="js/fee.js"></script>
	</head>

	<body >
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="dlgUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog"  style="width: 80%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						用户信息
					</h4>
				</div>
				<div class="modal-body">
					<div class="row clearfix">
					<div class="col-md-12 column">
					<div class="panel panel-default">
					<div class="panel-body">
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
							 		<i class="gold icon-credit-card bigger-110"></i>
							 		业务受理费
							 	</a>
							</li>
							<!-- <li>
							 	<a href="#panel-7" data-toggle="tab">
							 		<i class="purple icon-road bigger-110"></i>
							 		端口路由
							 	</a>
							</li> -->
							<li>
						 		<a href="#panel-7" data-toggle="tab">
						 			<i class="purple icon-user-md bigger-110"></i>
						 			缴费信息
						 		</a>
							</li>
							<li>
						 		<a href="#panel-8" data-toggle="tab">
						 			<i class="green icon-user-md bigger-110"></i>
						 			业务变更内容
						 		</a>
							</li>
						</ul>
						<div class="tab-content">
							<!-- 客户信息 -->
							<div class="tab-pane active" id="panel-1">
								<table id="table_view_customer" class="table table-striped table-bordered table-hover">
									<tbody>
										<tr>
											<td width="15%"><b>客户号</b></td><td class="cinfo" name="customerNo" width="35%"></td>
											<td width="15%"><b>客户类型</b></td><td class="cinfo" name="customerTypeDesc" width="35%"></td>
										</tr>
										<tr>
											<td><b>名称</b></td><td class="cinfo" name="name"></td>
											<td><b>部门</b></td><td class="cinfo" name="departmentName"></td>
										</tr>
										<tr>
											<td><b>地址</b></td><td class="cinfo" name="address"></td>
											<td><b>证件号码</b></td><td class="cinfo" name="certId"></td>
										</tr>
										<tr>
											<td><b>联系人</b></td><td class="cinfo" name="linker"></td>
											<td><b>联系电话</b></td><td class="cinfo" name="linkPhone"></td>
										</tr>
										<tr>
											<td><b>电子邮件</b></td><td class="cinfo" name="email"></td>
											<td><b>联系地址</b></td><td class="cinfo" name="linkAddress"></td>
										</tr>
										<tr>
											<td><b>VIP等级</b></td><td class="cinfo" name="vipDesc"></td>
											<td><b>忠诚度</b></td><td class="cinfo" name="loyaltyDesc"></td>
										</tr>
										<tr>
											<td><b>客户经理</b></td><td class="cinfo" name="customerManager"></td>
											<td><b>备注</b></td><td class="cinfo" name="remark"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 账户信息 -->
							<div class="tab-pane" id="panel-2">
								<table id="table_view_account" class="table table-striped table-bordered table-hover">
									<tbody>
										<tr>
											<td width="15%">客户号</td><td width="35%" class="ainfo" name="customerNo"></td>
											<td width="15%">支付方式</td><td width="35%" class="ainfo" name="payMethodDesc"></td>
										</tr>
										<tr>
											<td>代缴客户</td><td class="ainfo" name="creditorName"></td>
											<td>银行名称</td><td class="ainfo" name="bankName"></td>
										</tr>
										<tr>
											<td>户主姓名</td><td class="ainfo" name="bankAccOwner"></td>
											<td>银行账户</td><td class="ainfo" name="bankAcc"></td>
										</tr>
										<tr>
											<td>账户余额</td><td class="ainfo" name="amount"></td>
											<td>备注</td><td class="ainfo" name="remark"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 用户信息 -->
							<div class="tab-pane" id="panel-3">
								<table id="table_view_user_info" class="table table-striped table-bordered table-hover">
								</table>
							</div>
							<!-- 资费 -->
							<div class="tab-pane" id="panel-4">
								<table id="table_view_plan" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th><i class="icon-flag red bigger-110"></i></th>
											<th>名称</th>
											<th>周期</th>
											<th>套餐费</th>
											<th>描述</th>
											<th>订购备注</th>
										</tr>
									</thead>
									<tbody></tbody>
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
									<tbody></tbody>
								</table>										
							</div>
							<!-- 业务受理费 -->
							<div class="tab-pane" id="panel-6">
								<table id="table_view_fee" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th><i class="icon-edit purple bigger-110"></i></th>
											<th>费用名称</th>
											<th>预收费用（￥）</th>
											<th>实收费用（￥）</th>
											<th>备注</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>										
							</div>
							<!-- 端口路由 -->
							<!-- <div class="tab-pane" id="panel-7">
								<table id="table_view_route" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>序号</th>
											<th>设备编号</th>
											<th>设备名称</th>
											<th>指令集</th>
											<th>端口编号</th>
											<th>配置人</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>										
							</div> -->
							<!-- 缴费信息 -->
							<div class="tab-pane" id="panel-7">
								<table id="table_view_jfxx" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>业务区域</th>
											<th>实收金额</th>
											<th>电话账单</th>
											<th>合同号</th>
											<th>是否已销账</th>
											<th>收费时间</th>
											<th>结清时间</th>
											<th>发票号</th>
											<th>收款方式</th>
											<th>收费类型</th>
											<th>收款员</th>
											<th>收费月份</th>
											<th>用户名称</th>
											<th>用户性质</th>
											<th>应缴费</th>
										</tr>
									</thead>									
								</table>
							</div>
							<!-- 业务变更内容 -->
							<div class="tab-pane" id="panel-8">
								<table id="table_view_form" class="table table-striped table-bordered table-hover">	
									<thead>
										<tr>
										  <td>业务类型</td>
										  <td>电话号码</td>
										  <td>用户名</td>										  
										  <td>派工日期</td>
										  <td>完工日期</td>
										  <td>备注</td>										  
										</tr>
									</thead>							
								</table>
							</div>	
						</div>
					</div>
					</div>
					</div>
					</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
	<script type="text/javascript">
		$(function() {
		});
		
		function loadCustomerInfo(id) {
			loadInfo("customer!findById.do", { "id": id }, "td.cinfo");
		}
		
		function loadAccountInfo(id) {
			loadInfo("account!findByCustomerId.do", { "id": id }, "td.ainfo");
		}
		
		function loadOrderInfo(obj) {
			/* if (obj.customerId == undefined || obj.customerId == null || obj.customerId == "" ||
				obj.userKey == undefined || obj.userKey == null || obj.userKey == "") return; */
			if (!obj.customerId || !obj.userKey) return; 
			initPlanList(obj.customerId, obj.userKey);
			initProductList(obj.customerId, obj.userKey);
			initFeeList(obj.customerId, obj.userKey);
			//initRoute(obj.userId);
		}
		
		function loadOrderInfoById(customerId, userId, userKey) {
			initPlanList(customerId, userKey);
			initProductList(customerId, userKey);
			initFeeList(customerId, userKey);
			//initRoute(userId);
		}
		
		/* var table_view_route;
		function initRoute(userId) {
			if (table_view_route) { return; }
			table_view_route = $('#table_view_route').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
            		"url": "resPortRoute!findByUserId.do",
            		"data": {"id": userId},
            		"dataSrc": "lst"
            	},
            	"aoColumns": [ 
					{"mDataProp": "portIndex"},
            		{"mDataProp": "deviceCode"},
    				{"mDataProp": "deviceName"},
    				{"mDataProp": "ctrlSetName"},
    				{"mDataProp": "portCode"},
    				{"mDataProp": "creator"}
    			],
				"bLengthChange": false,//
				"iDisplayLength" :10,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": false,//开启分页功能
				"bSort" : false,//关闭排序
				"bInfo" : false,
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
		} */
		
	      ////加载缴费信息
		  var table_view_jfxx;
			function loadJfxxInfo(customerId) {
				var parm = {"id": customerId};
				if (table_view_jfxx) {
					table_view_jfxx.fnSettings().ajax.data = parm; 
					table_view_jfxx.api().ajax.reload();
					return;
				}
				table_view_jfxx = $('#table_view_jfxx').dataTable({
					"serverSide": true, //服务器模式，分页用
					"ajax": {
	            		"type": "post",
	            		"url": "ocsInvoice!JfUserInfo.do",
	            		"data": parm,
	            		"dataSrc": "list"
	            	},
	            	"aoColumns": [ 
						{"mDataProp": "businessSta"},
	            		{"mDataProp": "amount"},
	    				{"mDataProp": "userKey"},
	    				{"mDataProp": "customerNo"},
	    				{"mDataProp": "status"},
	    				{"mDataProp": "createTime"},
	    				{"mDataProp": "checkTime"},
	            		{"mDataProp": "invoiceNo"},
	    				{"mDataProp": "payMethod"},
	    				{"mDataProp": "invoiceType"},
	    				{"mDataProp": "creator"},
	    				{"mDataProp": "billMonth"},
	    				{"mDataProp": "name"},
	    				{"mDataProp": "uType"},
	    				{"mDataProp": "amountPreCharge"}
	    			],
	    			columnDefs: [{
		     	            targets: 4,
		        	        render: function (a, b, c, d) {
		            	    	if(c.status==0){
		            	    		return "未核销";
		            	    	}if(c.status==1){
		            	    		return "已核销";
		            	    	}if(c.status==9){
		            	    		return "取消";
		            	    	}
		                	}
						 },{	     	           				 
						 	 	targets: 13,
		     	        	 	render: function (a, b, c, d) {
			         	    	if(c.uType==1){
			         	    		return "住宅";
			         	    	}if(c.uType==2){
			         	    		return "办公";
			         	    	}else{
			         	    		return "商用";
			         	    	}
		             	      }
					}],
					"bLengthChange": false,//
					"iDisplayLength" :5,
					"searching":false,//关闭dataTable自带搜索
					"bPaginate": false,//开启分页功能
					"bSort" : false,//关闭排序
					"bInfo" : false,
					"language": { //国际化
						"url": "assets/js/Chinese.json"
					}
				});
			} 
			
		 //业务变更查询
		var table_view_form;
		function loadFormInfo(id){
			var parm = {"id": id};
			if (table_view_form) {
				table_view_form.fnSettings().ajax.data = parm; 
				table_view_form.api().ajax.reload();
				return;
			}
			table_view_form = $('#table_view_form').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	        		"type": "post",
	        		"url": "jobOpInstance!YwUserInfo.do",
	        		"data": parm,
	        		"dataSrc": "lst"
	        	},
	        	"aoColumns": [ 
					{"mDataProp": "businessChName"},
		       		{"mDataProp": "userKey"},
					{"mDataProp": "customerName"},
					{"mDataProp": "originateTime"},
					{"mDataProp": "finishTime"},
					{"mDataProp": "remark"}
				],
				columnDefs: [],
				"bLengthChange": false,//
				"iDisplayLength" :5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": false,//开启分页功能
				"bSort" : false,//关闭排序
				"bInfo" : false,
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
		} 
				
		function loadUserInfo(id) {
			var parm = { "id": id };
			var res = ajaxCRUD("crmUser!findFullInfoById.do", parm, false);
			var obj = res.userFullInfo;
			var relTable = obj.relTable;
			var html = "";
			if (relTable == "crm_user_phone") {
				html = 
					"<tbody>" +
						"<tr>" +
							"<td width='15%'>电话号码</td><td width='35%'>" + obj.businessKey + "</td>" +
							"<td width='15%'>用户名称</td><td>" + obj.name + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>用户部门</td><td>" + (obj.departmentName == null ? "" : obj.departmentName) + "</td>" +
							"<td>付费类型</td><td>" + obj.payPolicyDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>安装地址</td><td>" + (obj.address == null ? "" : obj.address) + "</td>" +
							"<td>联系电话</td><td>" + (obj.linkPhone == null ? "" : obj.linkPhone)  + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>电话级别</td><td>" + (obj.phoneLevelDesc == null ? "" : obj.phoneLevelDesc) + "</td>" +
							"<td>催缴策略</td><td>" + obj.callPolicyDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>调级策略</td><td>" + obj.adjustPolicyDesc + "</td>" +
							"<td>保密级别</td><td>" + obj.secretLevelDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>业务区域</td><td>" + (obj.businessSta == null ? "" : obj.businessSta)  + "</td>" +
							"<td>备注</td><td>" + (obj.remark == null ? "" : obj.remark) + "</td>" +
						"</tr>" +
					"</tbody>";	
			} else if (relTable == "crm_user_pl") {
				html = 
					"<tbody>" +
						"<tr>" +
							"<td width='15%'>专线编号</td><td width='35%'>" + obj.plNo + "</td>" +
							"<td width='15%'>专线类型</td><td width='35%'>" + obj.plTypeDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>专线规格</td><td>" + obj.plModel + "</td>" +
							"<td>用户名称</td><td>" + obj.name + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>起始端点</td><td>" + obj.startEp + "</td>" +
							"<td>终点端点</td><td>" + obj.endEp + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>用户部门</td><td>" + (obj.departmentName == null ? "" : obj.departmentName) + "</td>" +
							"<td>付费类型</td><td>" + obj.payPolicyDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>安装地址</td><td>" + (obj.address == null ? "" : obj.address) + "</td>" +
							"<td>联系电话</td><td>" + (obj.linkPhone == null ? "" : obj.linkPhone) + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>业务区域</td><td>" + (obj.businessSta == null ? "" : obj.businessSta) + "</td>" +
							"<td>备注</td><td>" + (obj.remark == null ? "" : obj.remark) + "</td>" +
						"</tr>" +
					"</tbody>";	
			} else if (relTable == "crm_user_adsl") {
				html = 
					"<tbody>" +
						"<tr>" +
							"<td width='15%'>上网账号</td><td width='35%'>" + obj.businessKey + "</td>" +
							"<td width='15%'>绑定电话</td><td width='35%'>" + obj.phoneNo + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>用户名称/td><td>" + obj.name + "</td>" +
							"<td>带宽</td><td>" + obj.speedDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>用户部门</td><td>" + (obj.departmentName == null ? "" : obj.departmentName) + "</td>" +
							"<td>付费类型</td><td>" + obj.payPolicyDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>安装地址</td><td>" + (obj.address == null ? "" : obj.address) + "</td>" +
							"<td>联系电话</td><td>" + (obj.linkPhone == null ? "" : obj.linkPhone) + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>绑定IP</td><td>" + (obj.ipAddress == null ? "" : obj.ipAddress) + "</td>" +
							"<td>绑定MAC</td><td>" + (obj.macAddress == null ? "" : obj.macAddress) + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>VLAN</td><td>" + obj.outerVlan + "</td>" +
							"<td>提醒策略</td><td>" + obj.notifyPolicyDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>服务提供商</td><td>" + (obj.serviceOperDesc == null ? "" : obj.serviceOperDesc) + "</td>" +
							"<td>业务区域</td><td>" + (obj.businessSta == null ? "" : obj.businessSta) + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>备注</td><td colspan='3'>" + (obj.remark == null ? "" : obj.remark) + "</td>" +
						"</tr>" +
					"</tbody>";	
			} else if (relTable == "crm_user_broad") {
				html = 
					"<tbody>" +
						"<tr>" +
							"<td width='15%'>上网账号</td><td width='35%'>" + obj.businessKey + "</td>" +
							"<td width='15%'>宽带类型</td><td width='35%'>以太网</td>" +
						"</tr>" +
						"<tr>" +
							"<td>密码<td>" + obj.pwd + "</td>" +
							"<td>状态</td><td>" + obj.statusDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>用户名称<td>" + obj.name + "</td>" +
							"<td>带宽</td><td>" + obj.speedDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>用户部门</td><td>" + (obj.departmentName == null ? "" : obj.departmentName) + "</td>" +
							"<td>付费类型</td><td>" + obj.payPolicyDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>安装地址</td><td>" + (obj.address == null ? "" : obj.address) + "</td>" +
							"<td>联系电话</td><td>" + (obj.linkPhone == null ? "" : obj.linkPhone) + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>绑定IP</td><td>" + (obj.ipAddress == null ? "" : obj.ipAddress) + "</td>" +
							"<td>绑定MAC</td><td>" + (obj.macAddress == null ? "" : obj.macAddress) + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>VLAN</td><td>" + obj.outerVlan + "</td>" +
							"<td>提醒策略</td><td>" + obj.notifyPolicyDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>服务提供商</td><td>" + (obj.serviceOperDesc == null ? "" : obj.serviceOperDesc) + "</td>" +
							"<td>业务区域</td><td>" + (obj.businessArea == null ? "" : obj.businessArea) + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>备注</td><td colspan='3'>" + (obj.remark == null ? "" : obj.remark) + "</td>" +
						"</tr>" +
					"</tbody>";	
			} else {
				html = 
					"<tbody>" +
						"<tr>" +
							"<td width='15%'>业务编号</td><td width='35%'>" + obj.businessKey + "</td>" +
							"<td width='15%'>用户名称</td><td width='35%'>" + obj.name + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>用户部门</td><td>" + (obj.departmentName == null ? "" : obj.departmentName) + "</td>" +
							"<td>付费类型</td><td>" + obj.payPolicyDesc + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>安装地址</td><td>" + (obj.address == null ? "" : obj.address) + "</td>" +
							"<td>联系电话</td><td>" + (obj.linkPhone == null ? "" : obj.linkPhone) + "</td>" +
						"</tr>" +
						"<tr>" +
							"<td>业务区域</td><td>" + (obj.businessArea == null ? "" : obj.businessArea) + "</td>" +
							"<td>备注</td><td>" + (obj.remark == null ? "" : obj.remark) + "</td>" +
						"</tr>" +
					"</tbody>";	
			}
			$("#table_view_user_info").empty();
			$("#table_view_user_info").append(html);
		}
		
		
	</script>
	</body>
</html>
				