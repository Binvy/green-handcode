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
					<a href="#">话单分拣</a>
				</li>
				<li class="active">
					话单数查询
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
                            			话单数查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            			    <label>
												交换机:
											</label>
											<select calss="input-sm" id="name">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="中心软交换">中心软交换</option>
												<option role="option" value="世景园交换机">世景园交换机</option>
										    </select>
										    <label>
												按(天)文件:
											</label>
										    <select calss="input-sm" id="dayFile">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="1">天</option>
												<option role="option" value="2">文件名</option>
										    </select>                             			                           			    
											<label>
												时间:
											</label> 
											<input id="crStartTime" type="text" class="date-timepicker" placeholder="开始时间"/> - 
                            				<input id="crEndTime" type="text" class="date-timepicker" placeholder="截止时间"/>                            																										
										    <button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>                     				
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8" style="display: inline-block;width:1690px;" id="tableLogsInfo">
										<table id="table_logsInfo" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
												 <th>日期</th>
												 <th>话单数</th>	
												 <th>费用</th>											 
												</tr>
											</thead>
											<tbody></tbody>
										</table>										
                            		</div>
                            		
                            		<div class="widget-main padding-8" style="display: none;width:1690px;" id="tableFileInfo">
										<table id="table_FilelogsInfo" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
												 <th>文件名</th>
												 <th>话单数</th>	
												 <th>费用</th>											 
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
		$(document).ready(function() {
			//加载数据
			initTableLogsInfo();
			initTableFileLogsInfo();
			$(".date-timepicker").datetimepicker();
		});
		
		var table_logsInfo;
	    var criteria = {};
				
	    function initTableLogsInfo(){
	    	table_logsInfo = $('#table_logsInfo').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "cdrLog!findLogInfo.do",
	            	"data": criteria,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	                {"mDataProp": "createTime"},
	              	{"mDataProp": "recordCount"},
	              	{"mDataProp": "checkSum"},
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
	    }
	    
	    var table_FilelogsInfo;
	    function initTableFileLogsInfo(){
	    	table_FilelogsInfo = $('#table_FilelogsInfo').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "cdrLog!findLogInfo.do",
	            	"data": criteria,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	              	{"mDataProp": "filename"},
	              	{"mDataProp": "recordCount"},
	              	{"mDataProp": "checkSum"},
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
	    }
	    
	     //事件处理
		 $("#btn_inquiry").click(function() {
			 criteria = {
		        "obj.name": $("#name").val(),
		        "obj.startTime": $("#crStartTime").val(),
		        "obj.endTime": $("#crEndTime").val()
		       };
			 if($("#dayFile").val()=="1"){
				 table_logsInfo.fnSettings().ajax.data = criteria; 
				 table_logsInfo.api().ajax.reload(); 
			 }else{
				 table_FilelogsInfo.fnSettings().ajax.data = criteria; 
				 table_FilelogsInfo.api().ajax.reload();
			 }
		 })	
		 
		 $("#dayFile").change(function() {
			if($("#dayFile").val()=="1"){
				$("#tableFileInfo").css("display", "none");
				$("#tableLogsInfo").css("display", "inline-block");	 
				criteria = null;
				table_logsInfo.fnSettings().ajax.data = criteria; 
				table_logsInfo.api().ajax.reload();
			}else{
				$("#tableFileInfo").css("display", "inline-block");
				$("#tableLogsInfo").css("display", "none");
				criteria = null;
				table_FilelogsInfo.fnSettings().ajax.data = criteria; 
	        	table_FilelogsInfo.api().ajax.reload();
			}			
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