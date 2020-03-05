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
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker/datetimepicker.css" />
		<link rel="stylesheet" href="assets/css/chosen.css" />
			
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker.css" />
		
		<link rel="stylesheet" href="css/datatable.css">
		 <style type="text/css">
			table#table_view>thead>tr>th {
				text-align: center;
			}
			table#table_view>tbody>tr>td {
				text-align: center;
			}
		</style>
		<!-- scripts -->
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
		<script src="js/customer.js"></script>
		
		<!-- zTree -->
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		 
	</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">业务</a>
				</li>
				<li class="active">
					批量修改信誉度
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
                            			<i class="icon-film blue bigger-110"></i>
                            			批量修改信誉度
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                  						<input type="text" id="crCustomerNo" placeholder="客户号"/>
										<input type="text" id="crCustomerName" placeholder="客户名"/>
										<select type="text" id="crVip" /></select>      
										<select type="text" id="businessSta" /></select>                                                  		
	                       				<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
	                       					<i class="icon-search green"></i>
	                       					查询
	                       				</button>
	                            		<button class="btn btn-sm btn-success btn-white btn-round" id="btnupdateVip">
	                       					<i class="icon-search green"></i>
	                       					批量修改
	                       				</button>		
                            		</div>
                            	 </div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkAll"/></th>
													<th>客户号</th>
													<th>客户名称</th>
													<th>信誉度</th>
													<th>类型</th>
													<th>联系人</th>
													<th>联系电话</th>
													<th>业务区域</th>
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
			
		<div class="modal fade" id="dlg_vip" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:30%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="">
						   	修改信誉度
						</h4>
					</div>				
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									信誉度：
								</label>
								<div class="col-xs-4">
									<input type="text" id="vip" name="" class=""/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="save_vip">
							提交
						</button>
						<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">
							关闭
						</button>
					</div>
				</div>				
			</div>			
		</div>	
			
		<script type="text/javascript">
		 	var table_view;
	        var criteria = {};

			$(function() {
				$("[data-toggle='tooltip']").tooltip();
				loadRef("ref_vip", "crVip", "--信誉度--");
				loadArea();
			});
			
			function loadArea() {
				var res = ajaxCRUD("dept!findAll.do", {}, false);
				var lst = res.lst;
				var html = "";
				$(lst).each(function (index) {
					var item = lst[index];
					if (item.deptname !== "通信管理处") {
						html += "<option role='option' value='" + item.deptname + "'>" + item.deptname +"</option>";
					}
				});
				$("#businessSta").empty();
				$("#businessSta").append(html);
				//$("#deptArea option[value='通信管理处']").remove();//去掉"通信管理处"选项
				$("#businessSta").prepend("<option value=''>--通信站--</option>");
				if (deptName === "通信管理处") {
					$("#businessSta").find("option[value='']").attr("selected",true);
				} else {
					$("#businessSta").find("option[value='" + deptName + "']").attr("selected",true);
				}
			}
			
			function initCustomerTable(criteria) {
				table_view = $('#table_view').DataTable({
					"serverSide": true, //服务器模式，分页用
					"ajax": {
	            		"type": "post",
		            	"url": "customer!findByPage.do",
	    	        	"data": criteria,
	        	    	"dataSrc": "lst"
	            	},
		            "columns": [ 
	                    {
		                    "data": "customerChoosed",
		                    "width": "100px",
		                    "defaultContent": ""
	                    },
		            	{
	        	    		"data": "customerNo",
	            			"width": "150px"
	    	        	},
		            	{ 
	    	        		"data": "name",
	        	    		"width": "150px",
	            		},

		            	{ 
	    	        		"data": "vip",
	        	    		"width": "150px",
	            		},
		            	{ 
	    	        		"data": "customerType",
	        	    		"width": "150px",
	            		},
	            		{ 
	    	        		"data": "linker",
	        	    		"width": "150px",
	            		},
	            		{ 
	    	        		"data": "address",
	        	    		"width": "150px",
	            		},
	            		{ 
	    	        		"data": "businessSta",
	        	    		"width": "150px",
	            		}
		    		],
					columnDefs: [{
                    		targets: 0,
                    		render: function (a, b, c, d) {                    			
                    			return '<input id="cid' + c.id + '" type="checkbox" onclick=onCidClick("' + c.id + '") />';
                    		}
                    	},{
	                    targets: 4,
	                    render: function (a, b, c, d) {
	                    	if (c.customerType == 1) {
	                    		return "散户";
	                    	} else {
	                    		return "大户";
	                    	}
	                    }
				 	}],
					"bLengthChange": false,//
					"iDisplayLength" :10,
					"scrollY": "500px",
					"scrollCollapse": true,
					"searching":false,//关闭dataTable自带搜索
					"bPaginate": true,//开启分页功能
					"bInfo": true, //页脚信息
					"bSort" : false,//关闭排序
					"bDestroy": true,
					"language": { //国际化
						"url": "assets/js/Chinese.json"
					}
				});
			}
			
			//全选事件
			$("#checkAll").click(function () {
				if (table_view == null) return;
				var isCheck = $("#checkAll").get(0).checked;
	        	var tableData = table_view.rows().data();
	        	var count = tableData.length;
	        	var i = 0;
	        	for (i = 0; i < count; i++) {
	        		var data = tableData[i];	        	
		        		$("#cid" + data.id).get(0).checked = isCheck;
		        		data.customerChoosed = isCheck ? 1 : 0;
	        	}
			});
			
			//单选事件
			function onCidClick(id) {
				if (table_view == null) return;
				var tableData = table_view.rows().data();
				var count = tableData.length;
				var i = 0;
				for (i = 0; i < count; i++) {
					var data = tableData[i];
					if (data.id == id) {
						data.customerChoosed = $("#cid" + data.id).get(0).checked ? 1 : 0;
					}
				}
			}
			
	       	var ids = "";
			function getSelectCustomer() {
				ids = "";
	        	var tableData = table_view.rows().data();
	        	var count = tableData.length;
	        	for (var i = 0; i < count; i++) {
	        		var data = tableData[i];
	        		if (data.customerChoosed == 1) {
	        			ids += (ids == "" ? "" : ",") + data.id;
	        		}
	        	}
	        	return ids;
			}
			
		  	$("#btnupdateVip").click(function() {
				if (table_view == null) {
					alert("请选择需要修改的数据");
					return;	
				} else {
					$("#dlg_vip").modal("show");
				}
			})
			
			$("#save_vip").click(function() {
				var vip = $("#vip").val();
				if(isNaN(vip) || vip < 0){
					alert("请输入数字且必须大于零");
					return;
				}
				getSelectCustomer();
				var parm = {
						"obj.vip": vip,
						"obj.id": ids
				};
				var res = null;
				res = ajaxCRUD("customer!updateVip.do", parm, true);
				if (res.resNum == "0") { 
					$("#dlg_vip").modal("hide");
					table_view.ajax.reload();
	        	}
			})
			
			$("#btnInquiry").click(function() {
				criteria = {};	
					criteria["obj.customerProp"] = "2";
				if ($("#crCustomerNo").val() != "") {
					criteria["obj.customerNo"] = $("#crCustomerNo").val();
				}
			    if ($("#crCustomerName").val() != "") {
					criteria["obj.name"] = $("#crCustomerName").val();
				}
				if ($("#crVip").val() != "") {
					criteria["obj.vip"] = $("#crVip").find("option:selected").text();
				}				
			    if ($("#businessSta").val() != "") {
					criteria["obj.businessSta"] = $("#businessSta").find("option:selected").text();
				}			    
				initCustomerTable(criteria);
				table_view.ajax.reload();
			});
			
		</script>	
</body>
</html>