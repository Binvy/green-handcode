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
		<script src="assets/js/datepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="assets/js/bootstrap-select.min.js"></script>
		<script src="assets/js/defaults-zh_CN.js"></script>
</head>
<body>
     <div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon green"></i>
				<a href="#">财务管理</a>
			</li>
			<li class="active">
				修改滞纳金标志 
			</li>
		</ul>
		<!-- .breadcrumb -->
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
                           			档案信息
                           		</h4>
                           		<div class="widget-toolbar">
                           			<span class="badge badge-danger"></span>
                           		</div>
                           	</div>
                           	<div class="widget-body">
                           		<div class="widget-toolbox" id="widget-toolbox-1">                           		  
                           			<div class="btn-toolbar">                           					
											<label>
												电话或合同号：
											</label>											
											<input type="text" id="fullText">
											<button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                           					<i class="icon-search green"></i>
                           						查询
                           					</button>                             					
                           			</div>
                           		</div>
                           		<div class="widget-main padding-8">
									<table id="table_view_userInfo" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
											    <th>
											 		
												</th>
												<th>客户号</th>
												<th>电话号码</th>
                          						<th>用户姓名</th>
                          						<th>部门</th>
                          						<th>用户地址</th>
                          						<th>滞纳金标志</th>
											</tr>
										</thead>
										<tbody></tbody>											                   				 	
									</table>
									<button class="btn btn-sm btn-success btn-white btn-round" id="btn_dueflag">
	                   					<i class="icon-search green"></i>
	                   						 修改档案表滞纳金标志
	                   				</button>									
                           		</div>
                           	</div>
                           </div>
                           </div>                   
					</div>
				</div>
			</div>	
		</div>
	</div>
	
	<div class="tabbable">
		<ul class="nav nav-tabs padding-18">
				<li class="active">
					<a data-toggle="tab" href="#ne"><iclass="green icon-phone bigger-120"></i>扣费信息</a>
				</li>
		</ul>
		<div id="div_sub" class="tab-pane">
			<div class="col-sm-12">
                <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                    <div>
                         
                    </div>
                </div>
				<table id="table_chargeInfo" class="table table-striped table-bordered table-hover">
					<thead>
						 <tr>
						    <th>
								
							</th>
							<th>汇总月份</th>
							<th>合同号</th>												 
							<th>电话</th>
							<th>用户姓名</th>
							<th>滞纳金标志</th>											
							<th>费用合计</th>
							<th>应缴费</th>
							<th>滞纳金</th>
							<th>减免费</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
                 <button class="btn btn-sm btn-success btn-white btn-round" id="btn_userDueflag">
                   	<i class="icon-search green"></i>
                   		修改收费信息表滞纳金标志
                </button>
                <button class="btn btn-sm btn-success btn-white btn-round" id="btn_resetDue">
                   	<i class="icon-search green"></i>
                   		重新计算滞纳金
                </button>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	 $(document).ready(function() {
		 //tableUserInfo();
		 //tableChargeInfo();
	 })	
	 
	 var table_view_userInfo;
	 var criteria = {};
	 function tableUserInfo(criteria){
		 table_view_userInfo = $('#table_view_userInfo').DataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "ocsBill!selectPhoneByuserInfo.do",
	            	"data": criteria,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	                {
	                    "data": "aChoosed",
	                    "width": "100px",
	                    "defaultContent": ""
                    },
	              	{"mDataProp": "customerNo"},
	              	{"mDataProp": "businessKey"},
	              	{"mDataProp": "name"},
	              	{"mDataProp": "deptId"},
	              	{"mDataProp": "address"},
	              	{"mDataProp": "overdueFlag"}
	             ],      	
				 columnDefs: [{
	                 	targets: 0,
		              	render: function (a, b, c, d) {//(data,type,row,meta)
		                return '<input type="checkbox" id="aid' + c.id + '" name="check_row" onclick=rowClick("' + c.id + '")></input>';
		                var html = template(context);
		                return html;
		            }
	             },{
	                	targets: 6,
		                render: function (a, b, c, d) {
		                	if(c.overdueFlag == 0) return "收取滞纳金";
		                	if(c.overdueFlag == 1) return "不收取滞纳金";
		                }
	             }],
				"bLengthChange": false,//
				"iDisplayLength": 5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"bInfo": false, //页脚信息
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
	 
	 var table_chargeInfo;
	 function tableChargeInfo(criteria){
		 table_chargeInfo = $('#table_chargeInfo').DataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "ocsBill!selectChargeInfo.do",
	            	"data": criteria,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	                {
	                    "data": "customerChoosed",
	                    "width": "100px",
	                    "defaultContent": ""
                    },
	              	{"mDataProp": "billMonth"},
	              	{"mDataProp": "customerNo"},
	              	{"mDataProp": "userKey"},
	              	{"mDataProp": "name"},
	              	{"mDataProp": "flag"},
	              	{"mDataProp": "total"},
	              	{"mDataProp": "due"},
	              	{"mDataProp": "overDue"},
	              	{"mDataProp": "score"}
	             ],      	
				 columnDefs: [{
	                targets: 0,
		              render: function (a, b, c, d) {
		                return '<input type="checkbox" id="cid' + c.id + '" name="check_rowInfo" onclick=checkClick("' + c.id + '")></input>';
		            }
	             },{
	                	targets: 5,
		                render: function (a, b, c, d) {
		                	if(c.flag == 0) return "收取滞纳金";
		                	if(c.flag == 1) return "不收取滞纳金";
		                }
	             }],
				"bLengthChange": false,//
				"iDisplayLength": 5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"bInfo": false, //页脚信息
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
		var ids = "";
	 	function getSelectCustomerId() {
			ids = "";
     		var tableData = table_view_userInfo.rows().data();
     		var count = tableData.length;
     		for (var i = 0; i < count; i++) {
	     		var data = tableData[i];
	     		if (data.aChoosed == 1) {
	     			ids += (ids == "" ? "" : ",") + data.id;
	     		}
     		}
     		return ids;
	    }
	 	
	 	function rowClick(id){														
			if (table_view_userInfo == null) return;
			var tableData = table_view_userInfo.rows().data();
			var count = tableData.length;
			var i = 0;
			for (i = 0; i < count; i++) {
				var data = tableData[i];
				if (data.id == id) {
					data.aChoosed = $("#aid" + data.id).get(0).checked ? 1 : 0;
				}
			}
		}
	 
		$("#btn_dueflag").click(function(){
			getSelectCustomerId();
			if(ids==""){
				bbAlert("请选择需要修改档案信息的滞纳金标志");
				return;
			}
			parm = {
					"id":ids
					};
			var resData = ajaxCRUD("ocsBill!updateDueFlag.do", parm, false);
			if(resData.resNum="0"){
				 bbAlert("修改滞纳金标志成功！");
				 table_view_userInfo.ajax.reload();
			}else{
				 bbAlert("修改滞纳金标志失败！");
				 table_view_userInfo.ajax.reload();
			} 
		})
		
       
		function getSelectCustomer() {
			ids = "";
        	var tableData = table_chargeInfo.rows().data();
        	var count = tableData.length;
        	for (var i = 0; i < count; i++) {
        		var data = tableData[i];
        		if (data.customerChoosed == 1) {
        			ids += (ids == "" ? "" : ",") + data.id;
        		}
        	}
        	return ids;
		}
		
		function checkClick(id){														
			if (table_chargeInfo == null) return;
			var tableData = table_chargeInfo.rows().data();
			var count = tableData.length;
			var i = 0;
			for (i = 0; i < count; i++) {
				var data = tableData[i];
				if (data.id == id) {
					data.customerChoosed = $("#cid" + data.id).get(0).checked ? 1 : 0;
				}
			}
		}
		
		$("#btn_userDueflag").click(function(){
			getSelectCustomer();
			if(ids==""){
				bbAlert("请选择需要修改收费信息的滞纳金标志");
				return;
			}
			var parm = {
					"obj.ids":ids								
					};
		    var resData = ajaxCRUD("ocsBill!updateOverDueFlag.do", parm, true);
			if(resData.resNum == "0"){				
				table_chargeInfo.ajax.reload();
			}else{				
				table_chargeInfo.ajax.reload();
			}
		})
	
		
		$("#btn_resetDue").click(function(){			
			getSelectCustomer();
	    	resetDue(ids);
		})
		
		function resetDue(ids){
			bootbox.confirm({
	   			locale: "zh_CN",
				size: 'small',
				title:"提示",
				message: "确认要重新计算滞纳金？", 
				callback: function(result){
	   				if(result){
						var parm = {
								"obj.ids":ids								
								};
					    var resData = ajaxCRUD("ocsBill!resetDue.do", parm, true);
						if(resData.resNum == "0"){							
							table_chargeInfo.ajax.reload();
						}else{							
							table_chargeInfo.ajax.reload();
						}
	            	}
	            }
	    	});
		}
		
		 $("#btn_inquiry").click(function() {
			 criteria["obj.fullText"] = $("#fullText").val();
			 tableUserInfo(criteria);
			 table_view_userInfo.ajax.reload();
			 tableChargeInfo(criteria);
			 table_chargeInfo.ajax.reload();
		 })
	 
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
	
</body>
</html>