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
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
		
		<!-- scripts -->
		<script src="assets/js/jquery-1.10.2.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script type="text/javascript" src="assets/js/crud/crud.js"></script>
		<script src="assets/js/jquery.dataTables.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="assets/js/handlebars-v3.0.1.js"></script>
		<script src="assets/js/bootstrap-select.min.js"></script>
		<script src="assets/js/defaults-zh_CN.js"></script>
		 
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">查询</a>
				</li>
				<li class="active">
					查询管理
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
                            <div class="widget-box widget-color-blue2">
                            	<div class="widget-header">
                            		<h4 class="widget-title lighter smaller">
                            			<i class="icon-search blue bigger-110"></i>
                            			查询列表
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<input type="text" id="crQueryKey" style="width:200px" placeholder="查询标识"/>
                            				<input type="text" id="crQueryName" style="width:200px" placeholder="查询名称"/>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
                            					<i class="icon-search blue"></i>
                            					查询
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round pull-right" id="btnAdd">
                            					<i class="icon-file green"></i>
                            					新建
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>查询标识</th>
													<th>查询名称</th>
													<th>可添加</th>
													<th>可修改</th>
													<th>可删除</th>
													<th>快捷查询</th>
													<th>组合查询</th>
													<th>可导出</th>
													<th>操作</th>
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

		<!-- 模态框（emplModal） -->
		<div class="modal fade" id="dlg" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:50%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title">
						</h4>
					</div>

					<input type="hidden" id="flag" value="">
					<input type="hidden" id="id" name="cdrSource.id" value="">
					<div class="modal-body">
						<form class="form-horizontal" id="frm" action="report.upload" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									查询标识：
								</label>
								<div class="col-xs-10">
									<input type="text" id="queryKey"class="form-control" placeholder="请输入查询标识，作为菜单键值"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									查询名称：
								</label>
								<div class="col-xs-10">
									<input type="text" id="queryName" class="form-control" placeholder="请输入查询名称，作为菜单显示名"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									关联表：
								</label>
								<div class="col-xs-10">
									<select id="refTable" class="form-control"></select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									关联字段：
								</label>
								<div class="col-xs-10">
									<select id="refField" class="form-control selectpicker show-tick form-control" 
										multiple data-live-search="false">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									可添加：
								</label>
								<div class="col-xs-4">
									<label>
										<input id="insertable" class="ace ace-switch ace-switch-7" type="checkbox"/>
										<span class="lbl"></span>
									</label>	
								</div>
								<label class="col-xs-2 control-label no-padding">
									可修改：
								</label>
								<div class="col-xs-4">
									<label>
										<input id="updatable" class="ace ace-switch ace-switch-7" type="checkbox"/>
										<span class="lbl"></span>
									</label>	
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									可删除：
								</label>
								<div class="col-xs-4">
									<label>
										<input id="deletable" class="ace ace-switch ace-switch-7" type="checkbox"/>
										<span class="lbl"></span>
									</label>	
								</div>
								<label class="col-xs-2 control-label no-padding">
									可导出：
								</label>
								<div class="col-xs-4">
									<label>
										<input id="exportable" class="ace ace-switch ace-switch-7" type="checkbox"/>
										<span class="lbl"></span>
									</label>	
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									快捷查询：
								</label>
								<div class="col-xs-4">
									<label>
										<input id="quickQueryable" class="ace ace-switch ace-switch-7" type="checkbox"/>
										<span class="lbl"></span>
									</label>	
								</div>
								<label class="col-xs-2 control-label no-padding">
									组合查询：
								</label>
								<div class="col-xs-4">
									<label>
										<input id="queryable" class="ace ace-switch ace-switch-7" type="checkbox"/>
										<span class="lbl"></span>
									</label>	
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									上级菜单：
								</label>
								<div class="col-xs-10">
									<select id="parentMenuId" class="form-control"></select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									应用角色：
								</label>
								<div class="col-xs-10">
									<select id="roleId" class="form-control selectpicker show-tick form-control" 
										multiple data-live-search="false">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									备注：
								</label>
								<div class="col-xs-10">
									<input type="text" id="remark" name="remark" class="form-control" />
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="save">
							保存
						</button>
						<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">
							关闭
						</button>
					</div>


				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

		<script type="text/javascript">
		
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
		var op = "${sessionScope.userInfo.userName}";
		
		$(document).ready(function() {
			$("[data-toggle='tooltip']").tooltip();
			loadMenu();
			loadRole();
			loadRefTable();
		});
		
		function loadRole() {
			var res = ajaxCRUD("role!findAll.do", {}, false);
			lstToSelect(res.lst, "roleId", "id", "roleName");
		}
		
		function loadMenu() {
			var res = ajaxCRUD("menu!findFlatMenus.do", {}, false);
			lstToSelect(res.lst, "parentMenuId", "id", "menuName");
			$("#parentMenuId").val("83");
		}
		
		function loadRefTable() {
			loadSqlRef("select table_name, table_alias from sys_table", "table_name", "table_alias", "refTable", true);
		}
		
        var table_view;
        var parm = { };
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "queryManager!findByPage.do",
            	"data": parm,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
    			{"mDataProp": "queryKey"},
    			{"mDataProp": "queryName"},
    			{"mDataProp": "insertable"},
    			{"mDataProp": "updatable"},
    			{"mDataProp": "deletable"},
    			{"mDataProp": "quickQueryable"},
    			{"mDataProp": "queryable"},
    			{"mDataProp": "exportable"},
				{"mDataProp": ""}
    		],
			 columnDefs: [{
                    targets: 2,
                    render: function (a, b, c, d) {
                    	if (c.insertable == 1) {
                    		return '<i class="icon-ok green bigger-130"></i>';
                    	} else {
                    		return '<i class="icon-remove red bigger-130"></i>';
                    	}
                    }
                },{
                    targets: 3,
                    render: function (a, b, c, d) {
                    	if (c.updatable == 1) {
                    		return '<i class="icon-ok green bigger-130"></i>';
                    	} else {
                    		return '<i class="icon-remove red bigger-130"></i>';
                    	}
                    }
                },{
                    targets: 4,
                    render: function (a, b, c, d) {
                    	if (c.deletable == 1) {
                    		return '<i class="icon-ok green bigger-130"></i>';
                    	} else {
                    		return '<i class="icon-remove red bigger-130"></i>';
                    	}
                    }
                },{
                    targets: 5,
                    render: function (a, b, c, d) {
                    	if (c.quickQueryable == 1) {
                    		return '<i class="icon-ok green bigger-130"></i>';
                    	} else {
                    		return '<i class="icon-remove red bigger-130"></i>';
                    	}
                    }
                },{
                    targets: 6,
                    render: function (a, b, c, d) {
                    	if (c.queryable == 1) {
                    		return '<i class="icon-ok green bigger-130"></i>';
                    	} else {
                    		return '<i class="icon-remove red bigger-130"></i>';
                    	}
                    }
                },{
                    targets: 7,
                    render: function (a, b, c, d) {
                    	if (c.exportable == 1) {
                    		return '<i class="icon-ok green bigger-130"></i>';
                    	} else {
                    		return '<i class="icon-remove red bigger-130"></i>';
                    	}
                    }
                },{
                    targets: 8,
                    render: function (a, b, c, d) {
                    	var funcs = [];
                    	funcs.push({"fn": "showDetailDlg(" + JSON.stringify(c) + ")", "color": "blue", "icon": "zoom-in", "tooltip": "查看"});
                   		funcs.push({"fn": "showUpdateDlg("+ JSON.stringify(c) +")", "color": "green", "icon": "pencil", "tooltip": "编辑"});
                    	funcs.push({"fn": "del('" + c.id + "')", "color": "red", "icon": "trash", "tooltip": "删除"});
                        return template({ func: funcs });
                    }
                }

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
		
		
		/////////////////////////////////////////////////////////////////////////////////
		// 事件处理
		/////////////////////////////////////////////////////////////////////////////////
        $("#btnInquiry").click(function() { 
			parm["obj.queryKey"] = $("#crQueryKey").val() == "" ? "" : $("#crQueryKey").val();
			parm["obj.queryName"] = $("#crQueryName").val() == "" ? "" : $("#crQueryName").val();
			table_view.fnSettings().ajax.data = parm; 
			table_view.api().ajax.reload();
        });

        $("#btnAdd").click(function() { 
        	showNewDlg();
        });
        
        function getParm() {
        	if ($("#queryKey").val() == "") {
        		alert("请输入查询标识");
        		return;
        	}
        	if ($("#queryName").val() == "") {
        		alert("请输入查询名称");
        		return;
        	}
        	if ($("#refTable").val() == "") {
        		alert("请选择关联表");
        		return;
        	}
        	var parm = {
    			"obj.id": $("#id").val(),
    			"obj.queryKey": $("#queryKey").val(),
    			"obj.queryName": $("#queryName").val(),
    			"obj.refTable": $("#refTable").val(),
    			"obj.insertable": ($("#insertable").get(0).checked ? 1 : 0),
    			"obj.updatable": ($("#updatable").get(0).checked ? 1 : 0),
    			"obj.deletable": ($("#deletable").get(0).checked ? 1 : 0),
    			"obj.exportable": ($("#exportable").get(0).checked ? 1 : 0),
    			"obj.quickQueryable": ($("#quickQueryable").get(0).checked ? 1 : 0),
    			"obj.queryable": ($("#queryable").get(0).checked ? 1 : 0),
    			"obj.remark": $("#remark").val(),
    			"parentMenuId": $("#parentMenuId").val(),
    			"roleIds": $("#roleId").val().join(","),
    			"queryFieldId": $("#refField").val().join(",")
        	};
        	return parm
        }
        
        $("#save").click(function() {
        	var parm = getParm();
        	if (parm == undefined) { return; }
        	
        	var flag = $("#flag").val();
        	
        	var resData;
        	if (flag == "add") {
        		resData = ajaxCRUD("queryManager!insert.do", parm, true);
        	} else {
        		resData = ajaxCRUD("queryManager!update.do", parm, true);
        	}
        	if (resData.resNum == "0") {
				table_view.api().ajax.reload(null, false);
				$("#dlg").modal("hide");
        	}
        });
        
        function del(id) {
	   		bootbox.confirm({
	   			locale: "zh_CN",
				size: 'small',
				title:"提示",
				message: "确认要删除？", 
				callback: function(result){
	   				if(result){
						var parm = {"id":id };
					    var resData = ajaxCRUD("queryManager!delete.do", parm, true);
						if(resData.resNum == "0"){
							table_view.api().ajax.reload(null, false);
						}
	            	}
	            }
	    	});
        }
        
		/////////////////////////////////////////////////////////////////////////////////
		// 辅助函数
		/////////////////////////////////////////////////////////////////////////////////
        function showNewDlg() {
            $("#dlg_title").text("添加");
            clear();
            $("#flag").val("add");
            $("#save").show();
            $("#dlg").modal("show");
        }
        
        function showUpdateDlg(obj) {
            $("#dlg_title").text("修改");
        	detail(obj);
            $("#flag").val("edit");
            $("#save").show();
            $("#dlg").modal("show");
        }
        
        function showDetailDlg(obj) {
            $("#dlg_title").text("详情");
        	detail(obj);
            $("#flag").val("");
            $("#save").hide();
            $("#dlg").modal("show");
        }
        
        function detail(obj) {
    		$("#id").val(obj.id);
        	$("#queryKey").val(obj.queryKey);
        	$("#queryName").val(obj.queryName);
        	$("#refTable").val(obj.refTable);
        	$("#insertable").get(0).checked = (obj.insertable == 1);
        	$("#updatable").get(0).checked = (obj.updatable == 1);
        	$("#deletable").get(0).checked = (obj.deletable == 1);
        	$("#exportable").get(0).checked = (obj.exportable == 1);
        	$("#queryable").get(0).checked = (obj.queryable == 1);
        	$("#quickQueryable").get(0).checked = (obj.quickQueryable == 1);
        	$("#remark").val(obj.remark);
        	loadField(obj.refTable);
        	var res = ajaxCRUD("query!findQueryFields.do", {"obj.queryId": obj.id}, false);
        	var arr = [];
        	for (var i = 0; i < res.fields.length; i++) {
        		arr.push(res.fields[i].id);
        	}
        	if (arr.length > 0) {
        		//$("#refTable").selectpicker("val", arr); 
        	}
        }

    	function clear() {
    		$("#id").val("");
        	$("#queryKey").val("");
        	$("#queryName").val("");
        	$("#refTable").val("");
        	$("#insertable").get(0).checked = false;
        	$("#updatable").get(0).checked = false;
        	$("#deletable").get(0).checked = false;
        	$("#exportable").get(0).checked = false;
        	$("#queryable").get(0).checked = false;
        	$("#quickQueryable").get(0).checked = false;
        	$("#remark").val("");
    	}
    	
    	function loadField(tableName) {
    		$("#refField").empty();
    		if (tableName == "") return;
    		var res = ajaxCRUD("query!findFields.do", {"obj.tableName": tableName}, false);
    		lstToSelect(res.fields, "refField", "id", "fieldAlias");
			$('.selectpicker').selectpicker("refresh"); // 必须显性调用refresh，否则下拉框不刷新
    	}
    	
    	$("#refTable").change(function(){
    		loadField($("#refTable").val());
    	});
    	
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
