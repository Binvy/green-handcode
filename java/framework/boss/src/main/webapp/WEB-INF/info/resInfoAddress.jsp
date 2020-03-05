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
		<!-- BootstrapDialog -->
		<link rel="stylesheet" href="assets/css/bootstrap-dialog.min.css" />
		
		<link rel="stylesheet" href="assets/css/main.css" />
		
		<!-- scripts -->
		<script src="assets/js/jquery-1.10.2.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script type="text/javascript" src="assets/js/crud/crud.js"></script>
		<script src="assets/js/jquery.dataTables.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="assets/js/handlebars-v3.0.1.js"></script>

		<script src="js/date.js"></script>
		 
	</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon green"></i>
					<a href="#">信息查询</a>
				</li>
				<li class="active">
					地址查询
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
                            			地址查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            	  <form class="form-search">
                            		<div class="widget-toolbox" id="widget-toolbox-1">                           		  
                            			<div class="btn-toolbar">
                            					<label>
												通信站:
												</label> 
												<select class="input-sm" id="businessArea"></select>
											    <select id="crGroupName2" style="width:120px">
                           						</select>
                           						<select id="crGroupName3" style="width:120px"></select>
                           						<select id="crGroupName4" style="width:120px"></select>
                           						<select id="crGroupName5" style="width:120px"></select>
                           						<select id="crGroupName6" style="width:120px"></select>
                           						<input type="hidden" id="selectedAddress"/>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view_address" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>地址</th>
                           							<th>片区</th>
                           							<th>通讯站</th>
                           							<th>用户区域</th>
                           							<th>用户栋号</th>
                           							<th>用户单元</th>                          							
                           							<th>用户号</th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
                            		</div>
                            	 </form>
                            	</div>
                            </div>
                            </div>
                            <!-- DIV ROW -->
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		
		  var table_view_address;
	      var criteria_address = {};
		
		   $(document).ready(function() {
	        	/*
	        	var res = ajaxCRUD("resAddress!findGroupName2.do", {}, false);
	       		$("#crGroupName2").autocomplete({
	       			source: res.addrs
	       		});
	       		*/
	       		//$('.chosen-select').chosen();
	       		
	       		//查询业务区域
				var res = ajaxCRUD("dept!findAll.do", {}, false);
				var lst = res.lst;
				var html = null;
				$(lst).each(function(index) {
					var item = lst[index];
					html += "<option role='option' value='" + item.deptname + "'>" + item.deptname + " " + item.abbr + "</option>";
				});
				$("#businessArea").empty();
				$("#businessArea").append(html);
	       		
	       		//initGroupName2();
	       		initTableAddress();
	        });
		
		function fillSelect(ctrlId, lst, defaultValue) {
			var html = "";
			html = "<option value='' selected='selected'>" + defaultValue + "</option>";
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option value='" + item + "'>" + item + "</option>";
			});
			$("#" + ctrlId).empty();
			$("#" + ctrlId).append(html);
        }
		
        function initGroupName2() {
			var res = ajaxCRUD("resAddress!findGroupName2.do", { }, false);
			fillSelect("crGroupName2", res.addrs, "--小区、街道--");
        }
        
        function clearGroupName(start) {
        	for (var i = start; i <= 6; i++) {
        		$("#crGroupName" + i).empty();
        	}
        }
        
        function loadSubGroup(start) {
        	clearGroupName(start + 1);
        	if ($("#crGroupName" + start).val() == "") {
        		return;
        	}
        	var parm = {
        		"obj.name": "GROUP_NAME" + (start + 1),
        	};
        	for (var i = 2; i <= start; i++) {
        		parm["obj.groupName" + i] = $("#crGroupName" + i).val();
        	}
        	var res = ajaxCRUD("resAddress!findSubGroup.do", parm, false);
        	if (res.resNum == "0") {
        		fillSelect("crGroupName" + (start + 1), res.addrs, "--请选择--");
        	}
        	doSearchAddress();
        }
        
        // 点击事件处理
        $("#businessArea").change(function() {
        	var bArea = $("#businessArea").val();
        	var bParm = {"obj.areaName":bArea};
        	var res = ajaxCRUD("resAddress!findAreaName.do",bParm, false);
        	fillSelect("crGroupName2", res.addrs, "--小区、街道--");
        });
        
		    $("#crGroupName2").change(function() {
	        	loadSubGroup(2);
	        });
	        
	        $("#crGroupName3").change(function() {
	        	loadSubGroup(3);
	        });
	        
	        $("#crGroupName4").change(function() {
	        	loadSubGroup(4);
	        });
	        
	        $("#crGroupName5").change(function() {
	        	loadSubGroup(5);
	        });
	        
	        $("#crGroupName6").change(function() {
	        	doSearchAddress();
	        });
		
		function initTableAddress() {
			table_view_address = $('#table_view_address').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "resAddress!findByPage.do",
	            	"data": criteria_address,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	                {"mDataProp": "name"},
	              	{"mDataProp": "groupName1"},
	              	{"mDataProp": "businessArea"},
	              	{"mDataProp": "groupName2"},
	               	{"mDataProp": "groupName3"},
	               	{"mDataProp": "groupName4"},
	               	{"mDataProp": "groupName5"}
	             ],      	
				 columnDefs: [
	            ],
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
		
		function doSearchAddress() {
			criteria_address = {};
        	for (var i = 2; i <= 6; i++) {
        		criteria_address["obj.groupName" + i] = $("#crGroupName" + i).val();
        	}
			table_view_address.fnSettings().ajax.data = criteria_address; 
			table_view_address.api().ajax.reload();
		}
		
		$("#table_view_address tbody").on("click", "tr", function(event) {
			$("#table_view_address tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_address.fnGetData(event.target.parentNode);
			$("#selectedAddress").val(aData.name);
		});
		
		</script>
</body>
</html>