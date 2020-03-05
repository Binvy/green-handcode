<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
		<title></title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	 <!-- 模态框（Modal） -->
	<div class="modal fade" id="dlgUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog"  style="width: 80%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						用户详细资料信息
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
						 			合同号信息
						 		</a>
							</li>
							<li>
						 		<a href="#panel-2" data-toggle="tab">
						 			<i class="green icon-user-md bigger-110"></i>
						 			缴费信息
						 		</a>
							</li>
							<li>
						 		<a href="#panel-3" data-toggle="tab">
						 			<i class="green icon-user-md bigger-110"></i>
						 			业务变更内容
						 		</a>
							</li>
							<li>
						 		<a href="#panel-4" data-toggle="tab" id="price_href">
						 			<i class="green icon-user-md bigger-110"></i>
						 			
						 		</a>
							</li>
							<!-- <li>
						 		<a href="#panel-5" data-toggle="tab">
						 			<i class="green icon-user-md bigger-110"></i>
						 			电话固定费
						 		</a>
							</li> -->
							<li>
						 		<a href="#panel-6" data-toggle="tab">
						 			<i class="green icon-user-md bigger-110"></i>
						 			代缴信息
						 		</a>
							</li>
							<li>
						 		<a href="#panel-7" data-toggle="tab">
						 			<i class="green icon-user-md bigger-110"></i>
						 			电话账单
						 		</a>
							</li>
							<li>
						 		<a href="#panel-8" data-toggle="tab">
						 			<i class="green icon-user-md bigger-110"></i>
						 			合同账单
						 		</a>
							</li>
							<li>
						 		<a href="#panel-9" data-toggle="tab">
						 			<i class="green icon-user-md bigger-110"></i>
						 			业务控制查询
						 		</a>
							</li>
						</ul>
						<div class="tab-content">
							<!-- 合同号信息 -->
							<div class="tab-pane active" id="panel-1">
								<table id="table_view_customer" class="table table-striped table-bordered table-hover">								 
								</table>
							</div>
							<!-- 缴费信息 -->
							<div class="tab-pane" id="panel-2">
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
							<div class="tab-pane" id="panel-3">
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
						    <!-- 电话套餐 -->
							<div class="tab-pane" id="panel-4">
								<table id="table_view_order" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
										<th>
											业务号
										</th>
										<th>
											项目名称
										</th>
										<th>
											项目类型
										</th>
										<th>
											费用类型
										</th>
										<th>
										          价格
										</th>
										<th>
											周期
										</th>
										<th>
											生效日期
										</th>
										<th>
											失效日期
										</th>
										<th>
											到期日
										</th>
									</tr>
									</thead>								
								</table>
							</div>	 
							<!-- <!-- 电话固定费 
							<div class="tab-pane" id="panel-5">
								<table id="" class="table table-striped table-bordered table-hover">									
								</table>
							</div> -->
							<!-- 代缴信息 -->
							<div class="tab-pane" id="panel-6">
								<table id="table_view_djxx" class="table table-striped table-bordered table-hover">		
									<thead>
										<tr>
										  <td>电话号码</td>
										  <td>合同号</td>	
										  <td>代缴合同号</td>								
										  <td>代缴项目</td>
										  <td>代缴金额</td>										  										  									  
										</tr>
									</thead>						
								</table>
							</div>
							<!-- 电话账单 -->
							<div class="tab-pane" id="panel-7">
								<table id="" class="table table-striped table-bordered table-hover">									
								</table>
							</div>
							<!-- 合同账单 -->
							<div class="tab-pane" id="panel-8">
								<table id="table_view_customerId" class="table table-striped table-bordered table-hover">		
									<thead>
										<tr>										  
										  <td>合同号</td>	
										  <td>客户名称</td>
										  <td>本次实收</td>								
										  <td>单位</td>
										  <td>月份</td>	
										  <td>业务区域</td>									  										  									  
										</tr>
									</thead>						
								</table>
							</div>
							<!--业务控制查询  -->
							<div class="tab-pane" id="panel-9">
								<table id="table_view_action" class="table table-striped table-bordered table-hover">		
									<thead>
										<tr>										  
										  <td>号码</td>	
										  <td>业务类型</td>
										  <td>业务发放指令</td>								
										  <td>指令参数</td>
										  <td>状态</td>	
										  <td>重试次数</td>	
										  <td>指令生成时间</td>									  										  									  
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
					<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	  //加载合同号信息
	  function loadCustomerInfo(id) {
		   var parm = { "id": id };
		   var res = ajaxCRUD("crmUser!findCustomerInfoById.do", parm, false);
		   var obj = res.userFullInfo;
		   var html = "";
		   html = 
				"<tbody>" +
					"<tr>" +
						"<td width='15%'>合同号</td><td width='35%'>" + obj.customerDesc + "</td>" +
						"<td width='15%'>账单电话</td><td>" + obj.businessKey + "</td>" +
					"</tr>" +
					"<tr>" +
						"<td>客户类型</td><td>" + (obj.departmentName == null ? "" : obj.departmentName) + "</td>" +
						"<td>付费类型</td><td>" + obj.payPolicyDesc + "</td>" +
					"</tr>" +
					"<tr>" +
						"<td>用户地址</td><td>" + (obj.address == null ? "" : obj.address) + "</td>" +
						"<td>账户名</td><td>" + (obj.bankAccDesc == null ? "" : obj.bankAccDesc)  + "</td>" +
					"</tr>" +
				"</tbody>";	
				
		$("#table_view_customer").empty();
		$("#table_view_customer").append(html);					
	  }
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
	
	//电话套餐查询
	var table_view_order;
	function loadOrderInfo(id){
		var parm = {"item.orderId":id};
		if (table_view_order) {
			table_view_order.fnSettings().ajax.data = parm; 
			table_view_order.api().ajax.reload();
			return;
		}
		table_view_order = $('#table_view_order').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "crmUser!findByUserId.do",
	            	"data": parm,
	            	"dataSrc": "ulst"
	            },
	            "aoColumns": [ 
	                    {"mDataProp": "keyName"},
		              	{"mDataProp": "itemName"},
		              	{"mDataProp": "itemType"},
		              	{"mDataProp": "saleType"},
		              	{"mDataProp": "itemPrice"},
		               	{"mDataProp": "term"},
		               	{"mDataProp": "effectiveTime"},
		               	{"mDataProp": "expiryTime"},
		               	{"mDataProp": "dueTime"}
	             ],      	
				 columnDefs: [{
	     	            targets: 2,
	        	        render: function (a, b, c, d) {
	            	    	if(c.itemType==1){
	            	    		return "套餐";
	            	    	}if(c.itemType==2){
	            	    		return "增值服务";
	            	    	}if(c.itemType==3){
	            	    		return "业务受理费";
	            	    	}
	                	}
					 },{	     	           				 
					 	 	targets: 3,
	     	        	 	render: function (a, b, c, d) {
		         	    	if(c.saleType==1){
		         	    		return "一次性费用";
		         	    	}if(c.saleType==2){
		         	    		return "周期性费用";
		         	    	}
	             	      }
				}],
				"bLengthChange": false,//
				"iDisplayLength" :5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
		
	//代缴信息查询
	var table_view_djxx;
	function loadDJxxInfo(id){
		var parm = {"objmap.userId":id};
		if (table_view_djxx) {
			table_view_djxx.fnSettings().ajax.data = parm; 
			table_view_djxx.api().ajax.reload();
			return;
		}
		table_view_djxx = $('#table_view_djxx').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "sidCreditorTemplate!findByUserId.do",
	            	"data": parm,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	                    {"mDataProp": "businessKey"},
		              	{"mDataProp": "customerNo"},
		              	{"mDataProp": "customerId"},
		              	{"mDataProp": "name"},
		              	{"mDataProp": "amount"}
	             ],      	
				 columnDefs: [],
				"bLengthChange": false,//
				"iDisplayLength" :5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
	
	//合同号账单
	var table_view_customerId;
	function loadCustomerIdInfo(customerId){
		var parm = {"obj.id":customerId};
		if (table_view_customerId) {
			table_view_customerId.fnSettings().ajax.data = parm; 
			table_view_customerId.api().ajax.reload();
			return;
		}
		table_view_customerId = $('#table_view_customerId').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "customer!findByCustomerId.do",
	            	"data": parm,
	            	"dataSrc": "ocsList"
	            },
	            "aoColumns": [ 
	                    {"mDataProp": "customerNo"},
		              	{"mDataProp": "customerName"},
		              	{"mDataProp": "amount"},
		              	{"mDataProp": "departmentId"},
		              	{"mDataProp": "billMonth"},
		              	{"mDataProp": "businessSta"}
	             ],      	
				 columnDefs: [],
				"bLengthChange": false,//
				"iDisplayLength" :5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
	
	//业务控制查询
	var table_view_action;
	function loadActionInfo(id){
		var parm = {"obj.id":id};
		if (table_view_action) {
			table_view_action.fnSettings().ajax.data = parm; 
			table_view_action.api().ajax.reload();
			return;
		}
		table_view_action = $('#table_view_action').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "ac!findByUserId.do",
	            	"data": parm,
	            	"dataSrc": "aclst"
	            },
	            "aoColumns": [ 
	                    {"mDataProp": "businessKey"},
		              	{"mDataProp": "businessType"},
		              	{"mDataProp": "ossKeyName"},
		              	{"mDataProp": "parms"},
		              	{"mDataProp": "statusDesc"},
		              	{"mDataProp": "retry"},
		            	{"mDataProp": "createTime"}
	             ],      	
				 columnDefs: [],
				"bLengthChange": false,//
				"iDisplayLength" :5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
	
	</script>
	
</body>
</html>