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
		<!-- fonts -->
		<link rel="stylesheet" href="assets/font/fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/zTreeStyle/zTreeStyle.css"
			type="text/css">
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker/datetimepicker.css" />
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
		
		<!-- scripts -->
		<script src="assets/js/jquery-1.10.2.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script type="text/javascript" src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="assets/js/crud/crud.js"></script>
		<script src="assets/js/jquery.dataTables.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="assets/js/handlebars-v3.0.1.js"></script>
		<script src="assets/js/datepicker/bootstrap-datetimepicker.js"></script>
		<script src="assets/js/datepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
		<script src="assets/js/bootstrap-select.min.js"></script>
		<script src="assets/js/defaults-zh_CN.js"></script>
</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon green"></i>
				<a href="#">信息查询</a>
			</li>
			<li class="active">
				大客户缴费查询 
			</li>
		</ul>
	</div>
	
	<div class="page-content">
		<div id="user-profile-2" class="user-profile">
			<div class="tabbable">

				<div id="ne" class="tab-pane">
					<div class="col-sm-12">
                           <div class="row">
                           <!-- treeview -->
                           <div class="widget-box widget-color-blue2">
                           	<div class="widget-header">
                           		<h4 class="widget-title lighter smaller">
                           			<i class="icon-book green bigger-110"></i>
                           			大客户缴费查询 
                           		</h4>
                           		<div class="widget-toolbar">
                           			<span class="badge badge-danger"></span>
                           		</div>
                           	</div>
                           	<div class="widget-body">
                           		<div class="widget-toolbox" id="widget-toolbox-1">                           		  
                           			<div class="btn-toolbar">
                           					<label>
												账期查询：
											</label> 
											<input type="text" id="billMonth">
											<label>
												时间查询：
											</label>
											<input id="startTime" type="text" class="date-timepicker" placeholder="开始时间"/> 至  
                            				<input id="endTime" type="text" class="date-timepicker" placeholder="截止时间"/>
											<label>
												客户号：
											</label>
											<input type="text" id="customerNo">
											<button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                           					<i class="icon-search green"></i>
                           						查询
                           					</button>                          
                           			</div>
                           		</div>
                           		<div class="widget-main padding-8">
									<table id="table_view_bigCustomer" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>流水号</th>
                          						<th>缴费时间</th>
                          						<th>缴费月份</th>
                          						<th>客户号</th>
                          						<th>客户名称</th>
                          						<th>实收金额</th>
                          						<th>本期话费</th>
                          						<th>欠费</th>
                          						<th>滞纳金</th>
                          						<th>前期余额</th>
                          						<th>付费方式</th>
                          						<th>收款人员</th>
                          						<th>区域</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
                           		</div>
                           	</div>
                           </div>
                           </div>
                           <!-- DIV ROW -->
					</div>
				</div>
			</div>	
		</div>
	</div>
	
	<!-- 大客户所属账号 -->
	<div class="tabbable">
		<ul class="nav nav-tabs padding-18">
				<li class="active">
					<a data-toggle="tab" href="#ne"><iclass="green icon-phone bigger-120"></i> 缴费明细 </a>
				</li>
		</ul>

		<div id="div_sub" class="tab-pane">
			<div class="col-sm-12">
                <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                    <div>
                        
                    </div>
                </div>
				<table id="table_customerInfo" class="table table-striped table-bordered table-hover">
					<thead>
						 <tr>
							<th>客户号</th>
							<th>客户名称</th>												 
							<th>缴费月份</th>
							<th>应缴费</th>
							<th>实收金额</th>
							<th>滞纳金</th>												
							<th>收款人员</th>
							<th>付费方式</th>
							<th>区域</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
    <script type="text/javascript">
    $(document).ready(function() {
       bigCustomerInfo();
       $('.date-timepicker').datetimepicker({  
		  language:  'zh-CN',  //显示中文
		  autoclose: 1
       }); 
    })
    
        var table_view_bigCustomer;
        var criteria = {};
	    function bigCustomerInfo(){
	    	table_view_bigCustomer = $('#table_view_bigCustomer').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "ocsInvoice!findByCustomer.do",
	            	"data": criteria,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	              	{"mDataProp": "invoiceNo"},
	              	{"mDataProp": "createTime"},
	              	{"mDataProp": "billMonth"},
	              	{"mDataProp": "customerNo"},
	              	{"mDataProp": "customerName"},
	              	{"mDataProp": "amount"},
	              	{"mDataProp": "amountHfhj"},
	              	{"mDataProp": "qfhj"},
	              	{"mDataProp": "amountOverDue"},
	              	{"mDataProp": "amountLast"},
	              	{"mDataProp": "payMethod"},
	              	{"mDataProp": "creator"},
	              	{"mDataProp": "businessSta"}
	             ],      	
				 columnDefs: [],
				"bLengthChange": false,//
				"iDisplayLength": 5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
	    	
		//事件处理
		  $("#btn_inquiry").click(function() {
			 criteria = {
			    "obj.billMonth": $("#billMonth").val(),		 
		        "obj.startTime": $("#startTime").val(),
		        "obj.endTime": $("#endTime").val(),
		        "obj.customerNo": $("#customerNo").val()
		       };
			 table_view_bigCustomer.fnSettings().ajax.data = criteria; 
			 table_view_bigCustomer.api().ajax.reload(); 
		 }) 
		
		 ////事件处理
		 $("#table_view_bigCustomer tbody").on("click", "tr", function(event) {
			$("#table_view_bigCustomer tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_bigCustomer.fnGetData(event.target.parentNode);
			showTableCustomerInfo(aData.invoiceNo);			
		})
		
		var parm = {};
		var table_customerInfo;
		initTableCustomerInfo("");
		function showTableCustomerInfo(invoiceNo){
			  parm = {"info.remark":invoiceNo};
			  table_customerInfo.fnSettings().ajax.data = parm; 
			  table_customerInfo.api().ajax.reload();
		}
		
		 function initTableCustomerInfo(invoiceNo){
		    	parm = {"info.remark":invoiceNo};
		    	table_customerInfo = $('#table_customerInfo').dataTable({
					"serverSide": true, //服务器模式，分页用
					"ajax": {
		            	"type": "post",
		            	"url": "ocsInvoice!customerInfo.do",
		            	"data": parm,
		            	"dataSrc": "biglst"
		            },
		            "aoColumns": [ 
		                {"mDataProp": "customerNo"},
		              	{"mDataProp": "name"},
		              	{"mDataProp": "billMonth"},
		              	{"mDataProp": "amountDue"},
		               	{"mDataProp": "amountProceed"},
		               	{"mDataProp": "amountOverdue"},
		               	{"mDataProp": "creator"},
		               	{"mDataProp": "payMethod"},
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
    
    </script>
</body>
</html>