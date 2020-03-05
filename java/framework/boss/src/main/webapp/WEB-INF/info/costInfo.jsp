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
					<a href="#">信息查询</a>
				</li>
				<li class="active">
					费用查询
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
                            			费用查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<label>
											       电话号码:
											</label>
                            				<input type="text" id="userKey"/>
                            				<label>
											       营收月份:
											</label>
											<input id="startMonth" type="text" readonly/> - <input id="endMonth" type="text" readonly/> 
											<button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_billInfo">
                            					<i class="icon-search green"></i>
                            					打印报表
                            				</button>                           				
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
												  <td>号码</td>
												  <td>用户名称</td>
												  <td>月份</td>
												  <td>月租</td>
												  <td>新业务费</td>
												  <td>通话费</td>
												  <td>国内长途费</td>
												  <td>国际长途费</td>
												  <td>专网长途费</td>
												  <td>专线费</td>												  
												  <td>套餐费</td>
												  <td>优惠费</td>
												  <td>总费用</td>
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
		</div>
		
		<script type="text/javascript">
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
		$(document).ready(function(){
			$("#startMonth").datetimepicker({
		        format: 'yyyymm', 
		        autoclose: true,
		        language: 'zh-CN',		       	 
		        weekStart: 1,  
		        startView: 3,  
		        minView: 3,  
		        forceParse: false     
		     });
			$("#endMonth").datetimepicker({
		        format: 'yyyymm',
		        autoclose: true,
		        language: 'zh-CN',		       	 
		        weekStart: 1,  
		        startView: 3,  
		        minView: 3,  
		        forceParse: false     
		     });
			$("#btn_billInfo").attr("disabled",true);
		})
		var table_view;
        var criteria = {};
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "ocsBill!findByuserPayInfo.do",
            	"data": criteria,
            	"dataSrc": "ulst"
            },
            "aoColumns": [ 
            	{"mDataProp": "userKey"},
    			{"mDataProp": "userName"},
    			{"mDataProp": "billMonth"},
    			{"mDataProp": "zfs1"},
    			{"mDataProp": "zfs2"},
    			{"mDataProp": "thf"},
    			{"mDataProp": "gnctf"},
    			{"mDataProp": "gjctf"},
    			{"mDataProp": "hf19"},
    			{"mDataProp": "zfs3"},
    			{"mDataProp": "zfs4"},
    			{"mDataProp": "zfs5"},
    			{"mDataProp": "amountDue"}
    		],
			 columnDefs: [],
			"bLengthChange": false,//
			"iDisplayLength" :10,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
		
		/////////////////////////////////////////////////////////////////////////////////
		// 事件处理
		/////////////////////////////////////////////////////////////////////////////////
        $("#btn_inquiry").click(function() {  
        	$("#btn_billInfo").removeAttr("disabled");
        	criteria = {
        		"userBill.userKey": $("#userKey").val(),
        		"userBill.startMonth": $("#startMonth").val(),
        		"userBill.endMonth": $("#endMonth").val()
        	};
			table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
        }); 
		
		//// --------事件处理-------------
		////-------------打印报表-------------
		 $("#btn_billInfo").click(function() {
			 var rptFileName = "ARPU.cpt";
			 var userKey = $("#userKey").val();
			 var startMonth = $("#startMonth").val();
			 var endMonth = $("#endMonth").val()
			 if(userKey==""){
				 alert("请输入待查询电话号码");
				 return;
			 }
			 if(startMonth==""){
				 alert("请输入营收开始月份");
				 return;
			 }
			 if(endMonth==""){
				 alert("请输入营收结束月份");
				 return;
			 }
			 var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&userKey=" + userKey + "&startMonth=" + startMonth + "&endMonth=" + endMonth;
		     window.open(uri);
		 })    	
		</script>
</body>
</html>