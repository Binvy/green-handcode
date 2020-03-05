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
		<link rel="stylesheet" href="assets/css/datepicker/bootstrap-datetimepicker.min.css" />
		
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
		<script src="assets/js/datepicker/bootstrap-datetimepicker.min.js"></script>
		<script src="assets/js/datepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		 
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">${queryInfo.query.queryName}</a>
				</li>
				<li class="active">
					${queryInfo.table.tableAlias}
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
                            			${queryInfo.table.tableAlias}
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar" id="toolbar">
                            				<!-- 填充工具栏 -->
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr id="tableHeader">
													<!-- 填充表头 -->
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

		<!-- 模态框 -->
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
					<div class="modal-body">
						<form class="form-horizontal" id="frm" method="post" enctype="multipart/form-data">
							<!-- 表单 -->
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

		<!-- 模态框 -->
		<div class="modal fade" id="dlgQuery" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:70%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title">
							组合查询
						</h4>
					</div>

					<div class="modal-body">
						<div class="panel panel-default">
						<div class="panel-body">
							<div class="row form-group">
								<div class="col-sm-4">
									<select class="form-control" id="queryField">
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control" id="queryComp">
									</select>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="queryInputValue"/>
									<input id="queryDateValue" type="text" class="form-control date-timepicker" style="display:none"/>
									<select class="form-control" id="querySelectValue" style="display:none">
									</select>
								</div>
								<div class="col-sm-2">
									<div class="btn-group">
										<a class="btn btn-primary" href="#" id="addAnd"><i class="icon-list-ol"></i> 并且</a>
										<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
										<ul class="dropdown-menu">
											<li><a href="#" id="addOr"><i class="icon-list-ul"></i> 或者</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row form-group">
										<table id="table_view_query" class="table table-striped table-bordered table-hover">
											<thead>
												<tr id="tableHeader">
													<th>项目</th>
													<th>比较符</th>
													<th>值</th>
													<th>连接符</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>	
							</div>	
							</div>	
							</div>								
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="queryOk">
							查询
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

        var table_view;
        var queryParm = {};
        var tableName = "${queryInfo.query.refTable}";
        var fields;
        var ref = {};
        //var condSet = [];
        var table_view_query;
		
		$(document).ready(function() {
			$("[data-toggle='tooltip']").tooltip();
			var res = ajaxCRUD("query!findQueryFields.do", {"obj.queryId": ${queryInfo.query.id}}, false);
			fields = res.fields;
			fillRefs();
			fillQuickQuery();
			fillQueryField();
			fillButtons();
			fillTableHeaders();
			quickQuery();
			fillDlg();
			$(".date-timepicker").datetimepicker({
				language: 'zh-CN',
				autoclose: true,
				todayHighlight: true
			});
			table_view_query = $("#table_view_query").DataTable( {
        		"data": [],
            	"aoColumns": [ 
    				{"mDataProp": "fieldAlias"},
    				{"mDataProp": "compAlias"},
    				{"mDataProp": "valueAlias"},
    				{"mDataProp": "logicAlias"},
					{"mDataProp": ""}
    			],
		 	    columnDefs: [{
                    targets: 4,
                    render: function (a, b, c, d) {
                    	var funcs = [];
                    	funcs.push({"fn": "delCond('" + c.id + "')", "color": "red", "icon": "trash", "tooltip": "删除"});
                        return template({ func: funcs });
                    }
                }],
				"bLengthChange": false,//
				"iDisplayLength" :10,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
    		});
    		$('#table_view_query tbody').on( 'click', 'tr', onCondSelected);
		});
		
		// 查询所有字典数据
		function fillRefs() {
			for (var i = 0; i < fields.length; i++) {
				var field = fields[i];
				if (field.refType == "List") {
					var map = {};
					var items = field.refData.split(",");
					for (var j = 0; j < items.length; j++) {
						map[items[j]] = items[j];
					}
					ref[field.fieldName] = map;
				} else if (field.refType == "Map") {
					var map = {};
					var items = field.refData.split(",");
					for (var j = 0; j < items.length; j++) {
						var entry = items[j].split(":");
						map[entry[0]] = entry[1];
					}
					ref[field.fieldName] = map;
				} else if (field.refType == "Table") {
					var res = ajaxCRUD("ref!findAll.do", { "tableName": field.refData }, false);
					var lst = res.lst;
					var map = {};
					$(lst).each(function(index) {
						var item = lst[index];
						map[item.id] = item.name;
					});
					ref[field.fieldName] = map;
				} else if (field.refType == "Query") {
					var res = ajaxCRUD("ref!executeSql.do", { "tableName": field.refData }, false);
					var lst = res.lst;
					var map = {};
					$(lst).each(function(index) {
						var item = lst[index];
						map[item.id] = item.name;
					});
					ref[field.fieldName] = map;
				}
			}
		}
		
		// 填充快捷查询栏
		function fillQuickQuery() {
			var quickQueryable = ${queryInfo.query.quickQueryable};
			if (quickQueryable == 1) {
				var fs = [];
				for (var i = 0; i < fields.length; i++) {
					var field = fields[i];
					if (field.quickQueryable == 1) {
						fs.push(field);
					}
				}
				var html = tQuickQuery({fields: fs});
				$("#toolbar").append(html);
			}
		}
		
		// 填充组合查询字段
		function fillQueryField() {
			var html = "";
			for (var i = 0; i < fields.length; i++) {
				var field = fields[i];
				if (field.queryable == 1) {
					html += "<option value='" + field.fieldName + "'>" + field.fieldAlias + "</option>";
				}
			}
			$("#queryField").append(html);
			queryFieldChanged();
		}
		
		// 填充功能按钮
		function fillButtons() {
			var html = "";
			var exportable = ${queryInfo.query.exportable};
			if (exportable == 1) {
				html += '<button class="btn btn-sm btn-success btn-white btn-round pull-right" id="btnExport" onclick="exportToExcel()"><i class="icon-cloud-download red"></i>导出</button>';
			}
			var queryable = ${queryInfo.query.queryable};
			if (queryable == 1) {
				html += '<button class="btn btn-sm btn-success btn-white btn-round pull-right" id="btnQuery" onclick="inquiry()"><i class="icon-search blue"></i>组合查询</button>';
			}
			var insertable = ${queryInfo.query.insertable};
			if (insertable == 1) {
				html += '<button class="btn btn-sm btn-success btn-white btn-round pull-right" id="btnAdd" onclick="add()"><i class="icon-file green"></i>新建</button>';
			}
			$("#toolbar").append(html);
		}
		
		// 填充表头
		function fillTableHeaders() {
			var html = "";
			for (var i = 0; i < fields.length; i++) {
				var field = fields[i];
				if (field.visible == 1) {
					html += '<th>' + field.fieldAlias + '</th>';
				}
			}
            var updatable = ${queryInfo.query.updatable};
            var deletable = ${queryInfo.query.deletable};
            if (updatable == 1 || deletable == 1) {
				html += '<th>操作</th>';
			}
			$("#tableHeader").append(html);
		}
		
		// 填充快捷查询栏
		function fillDlg() {
			var fs = [];
			for (var i = 0; i < fields.length; i++) {
				var field = fields[i];
				if (field.visible == 1) {
					fs.push(field);
				}
			}
			//var html = tForm({fields: fs});
			var html = tForm(fs);
			$("#frm").append(html);
			for (var i = 0; i < fs.length; i++) {
				var field = fs[i];
				if (field.refType == "List" || field.refType == "Map" || field.refType == "Table" || field.refType == "Query") {
					var html = "";
					var items = ref[field.fieldName];
					for (var id in items) {
						html += "<option value='" + id + "'>" + items[id] + "</option>";
					}
					$("#" + field.fieldName).append(html);
				}
			}
		}
		
		// 查询 
		function quickQuery() {
			if (table_view == null) {
				var columns = [];
				var columnDefs = [];
				var index = 0;
				for (var i = 0; i < fields.length; i++) {
					var field = fields[i];
					if (field.visible == 1) {
						columns.push({"mDataProp": field.fieldName});
						var fn = field.fieldName;
						if (field.refType != null && (field.refType == "Map" || field.refType == "Table" || field.refType == "Query")) {
							var func = new Function("a", "return ref['" + fn + "'][a]");
							columnDefs.push({
                    			targets: index,
                    			render: func
							}); 
						}
						index++;
					}
				}
                var updatable = ${queryInfo.query.updatable};
                var deletable = ${queryInfo.query.deletable};
                if (updatable == 1 || deletable == 1) {
					columns.push({"mDataProp": ""});
					columnDefs.push({
                    	targets: index,
                    	render: function (a, b, c, d) {
                    		var funcs = [];
	                    	if (updatable == 1) {
    	               			funcs.push({"fn": "showUpdateDlg("+ JSON.stringify(c) +")", "color": "green", "icon": "pencil", "tooltip": "编辑"});
        	           		}
            	        	if (deletable == 1) {
                	    		funcs.push({"fn": "del('" + c.ID + "')", "color": "red", "icon": "trash", "tooltip": "删除"});
                    		}
                        	return template({ func: funcs });
	                    }
                	});
                }
				
				table_view = $('#table_view').dataTable({
					"serverSide": true, //服务器模式，分页用
					"ajax": {
            			"type": "post",
		            	"url": "query!execute.do",
        		    	"data": {"obj.tableName": tableName},
            			"dataSrc": "lst"
		            },
		            "aoColumns": columns,
			 		"columnDefs": columnDefs,
					"bLengthChange": false,//
					"iDisplayLength" :10,
					"searching":false,//关闭dataTable自带搜索
					"bPaginate": true,//开启分页功能
					"bSort" : false,//关闭排序
					"language": { //国际化
						"url": "assets/js/Chinese.json"
					}
				});
			} else {
				var subWhere = "";
				$(".cr").each(function() {
					if ($(this).val() != "") {
						var infos = $(this).attr("id").split("-");
						var name = infos[2];
						var value = "";
						if (infos[1] == "Integer" || infos[1] == "Double") {
							value = $(this).val();
						} else {
							value = "'" + $(this).val() + "'";
						}
						subWhere += (subWhere == "" ? "" : " and ") + name + "=" + value
					}
				});
				queryParm = {"obj.tableName": tableName, "obj.subWhere": subWhere};
				table_view.fnSettings().ajax.data = queryParm; 
				table_view.api().ajax.reload();
			} 
		}
				
        function add() { 
        	showNewDlg();
        }
        
        function getParm() {
        	var parm = {};
        	parm["tableName"] = tableName;
			for (var i = 0; i < fields.length; i++) {
				var field = fields[i];
				if ($("#flag").val() == "add" && (field.keyType == "Auto" || field.keyType == "UUID")) continue;
				if (field.visible == 1) {
					var infos = $("#" + field.fieldName).attr("name").split("-");
					if (infos[1] == "Integer" || infos[1] == "Double") {
						parm["obj." + field.fieldName] = $("#" + field.fieldName).val();
					} else {
						parm["obj." + field.fieldName] = "'" + $("#" + field.fieldName).val() + "'";
					}
				}
			}
        	return parm
        }
        
        $("#save").click(function() {
        	var parm = getParm();
        	if (parm == undefined) { return; }
        	
        	var flag = $("#flag").val();
        	
        	var resData;
        	if (flag == "add") {
        		resData = ajaxCRUD("query!insert.do", parm, true);
        	} else {
        		resData = ajaxCRUD("query!update.do", parm, true);
        	}
        	if (resData.resNum == "0") {
				table_view.api().ajax.reload(queryParm, false);
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
	   					var infos = $("#ID").attr("name").split("-");
						var parm = {};
						parm["tableName"] = tableName;
	   					if (infos[1] == "Integer" || infos[1] == "Double") {
							parm["obj.ID"] = id;
	   					} else {
							parm["obj.ID"] = "'" + id + "'" ;
	   					}
					    var resData = ajaxCRUD("query!delete.do", parm, true);
						if(resData.resNum == "0"){
							table_view.api().ajax.reload(queryParm, false);
						}
	            	}
	            }
	    	});
        }
        
        function showNewDlg() {
            $("#dlg_title").text("添加");
            clear();
            $("#ID").removeAttr("readonly");
            $("#flag").val("add");
            $("#save").show();
            $("#dlg").modal("show");
        }
        
        function showUpdateDlg(obj) {
            $("#dlg_title").text("修改");
        	detail(obj);
            $("#ID").attr("readonly", "readonly");
            $("#flag").val("edit");
            $("#save").show();
            $("#dlg").modal("show");
        }
        
        function detail(obj) {
			for (var i = 0; i < fields.length; i++) {
				var field = fields[i];
				if (field.visible == 1) {
					$("#" + field.fieldName).val(obj[field.fieldName]);
					if (field.keyType != null) {
						$("#" + field.fieldName).attr("readonly", "readonly");
					} else {
						$("#" + field.fieldName).removeAttr("readonly");
					}
				}
			}
        }

    	function clear() {
			for (var i = 0; i < fields.length; i++) {
				var field = fields[i];
				if (field.visible == 1) {
					$("#" + field.fieldName).val("");
					if (field.keyType == "Auto" || field.keyType == "UUID") {
						$("#" + field.fieldName).attr("readonly", "readonly");
						//alert($("#" + field.fieldName).attr("readonly"));
					} else {
						$("#" + field.fieldName).removeAttr("readonly");
					}
				}
			}
    	}
    	
    	function inquiry() {
            $("#dlgQuery").modal("show");
    	}
    	
		function getField(fieldName) {
			for (var i = 0; i < fields.length; i++) {
				var field = fields[i];
				if (field.fieldName == fieldName) {
					return field;
				}
			}
			return null;
		}
		
		function queryFieldChanged() {
			$("#queryComp").empty();
			var fieldName = $("#queryField").val();
			var field = getField(fieldName);
			if (field == null) return;
			var htmlComp = "";
			if (field.dataType == "Integer" || field.dataType == "Double") {
				htmlComp += "<option value='='>等于</option>"
						  + "<option value='<>'>不等于</option>"
						  + "<option value='>'>大于</option>"
						  + "<option value='<'>小于</option>"
						  + "<option value='>='>大等于</option>"
						  + "<option value='<='>小等于</option>";
			} else if (field.dataType == "Date") {
				htmlComp += "<option value='='>等于</option>"
						  + "<option value='<>'>不等于</option>"
						  + "<option value='>'>大于</option>"
						  + "<option value='<'>小于</option>"
						  + "<option value='>='>大等于</option>"
						  + "<option value='<='>小等于</option>";
			} else if (field.dataType == "String") {
				htmlComp += "<option value='='>等于</option>"
						  + "<option value='<>'>不等于</option>"
						  + "<option value='like'>包含</option>";
			}
			$("#queryComp").append(htmlComp);
			
			$("#queryInputValue").css("display", "none");
			$("#queryDateValue").css("display", "none");
			$("#querySelectValue").css("display", "none");
			$("#querySelectValue").empty();
			if (field.refType == "List" || field.refType == "Map" || field.refType == "Table" || field.refType == "Query") {
				$("#querySelectValue").css("display", "block");
				var html = "";
				var items = ref[fieldName];
				for (var id in items) {
					html += "<option value='" + id + "'>" + items[id] + "</option>";
				}
				$("#querySelectValue").append(html);
			} else if (field.dataType == "Date" ) {
				$("#queryDateValue").css("display", "block");
			} else {
				$("#queryInputValue").css("display", "block");
			}
		}
		
		$("#queryField").change(function() {
			queryFieldChanged();
		});
		
		function tForm(fs) {
			var html = "";
			for (var i = 0; i < fs.length; i++) {
				var field = fs[i];
				html += 
					'<div class="form-group">' +
						'<label class="col-xs-2 control-label no-padding">' +
							field.fieldAlias + 
						'</label>' +
						'<div class="col-xs-10">';
						
				if (field.dataType == "Date") {
					html += '<input type="text" id="' + field.fieldName + '" name="' + field.fieldName + '-' + field.dataType + '" class="form-control date-timepicker" placeholder="' + field.placeholder + '"/>';
				} else if (field.refType == "List" || field.refType == "Map" || field.refType == "Table" || field.refType == "Query") {
					html += '<select id="' + field.fieldName + '" name="' + field.fieldName + '-' + field.dataType + '" class="form-control"></select>';
				} else {
					html += '<input type="text" id="' + field.fieldName + '" name="' + field.fieldName + '-' + field.dataType + '" class="form-control" placeholder="' + field.placeholder + '"/>';
				}
				
				html +=							
						'</div>' +
					'</div>';
			}
			return html;
		}
		
		$("#addAnd").click(function(){
			addCond("and", "并且");
		});
		
		$("#addOr").click(function(){
			addCond("or", "或者");
		});
		
		function addCond(logic, logicAlias) {
			var fieldName = $("#queryField").val();
			var compName = $("#queryComp").val();
			var value = "";
			var valueAlias = "";
			if ($("#querySelectValue").css("display") == "block") {
				value = $("#querySelectValue").val();
				valueAlias = $("#querySelectValue").find("option:selected").text();
			} else if ($("#queryInputValue").css("display") == "block") {
				value = $("#queryInputValue").val();
				valueAlias = value;
			} else if ($("#queryDateValue").css("display") == "block") {
				value = $("#queryDateValue").val();
				valueAlias = value;
			}
			if (fieldName == "" || compName == "" || value == "") {
				alert("请填写完整的条件");
				return;
			}
			var cond = {
				"fieldName": fieldName,
				"fieldAlias": $("#queryField").find("option:selected").text(),
				"compName": compName,
				"compAlias": $("#queryComp").find("option:selected").text(),
				"value": value,
				"valueAlias": valueAlias,
				"logic": logic,
				"logicAlias": logicAlias
			};
			table_view_query.row.add(cond).draw();
		}
		
		function onCondSelected() {
    		table_view_query.$('tr.selected').removeClass('selected');
        	$(this).addClass('selected');
		}
		
		function delCond() {
			table_view_query.row('.selected').remove().draw( false );
		}
		
		$("#queryOk").click(function(){
			var condSet = table_view_query.rows().data();
			if (condSet.length < 1) {
				alert("请设置查询条件");
				return;
			}
			var subWhere = "";
			for (var i = 0; i < condSet.length; i++) {
				var cond = condSet[i];
				var field = getField(cond.fieldName);
				var value = "";
				if (field.dataType == "Integer" || field.dataType == "Double") {
					value = cond.value;
				} else {
					if (cond.compName == "like") {
						value = "'%" + cond.value + "%'";
					} else {
						value = "'" + cond.value + "'";
					}
				}
				if (i > 0) {
					subWhere += " " + condSet[i-1].logic + " ";
				}
				subWhere += cond.fieldName + " " + cond.compName + " " + value
			}
			queryParm = {"obj.tableName": tableName, "obj.subWhere": subWhere};
			table_view.fnSettings().ajax.data = queryParm; 
			table_view.api().ajax.reload();
            $("#dlgQuery").modal("hide");
		});
		
		function exportToExcel() {
			var parm = {
				"obj.queryId": ${queryInfo.query.id},
				"obj.tableName": tableName,
				"obj.subWhere": queryParm.subWhere
			};
			var res = ajaxCRUD("query!exportToExcel.do", parm, false);
			if (res.resNum == "0") {
	        	window.open("file.download?filename=" + res.res);
			} else {
				alert(res.res);
			}
		}
		
		</script>

		<!-- 按钮组的Handlebars模板 -->
		<jsp:include page="../pub/tpl.jsp" flush="true"/>
		
		<script id="htQuickQuery" type="text/x-handlebars-template">
		{{#each fields}}
			<input type="text" class="cr" id="cr-{{this.dataType}}-{{this.fieldName}}" style="width:{{this.showWidth}}px" placeholder="{{this.placeholder}}"/>
		{{/each}}
        <button class="btn btn-sm btn-success btn-white btn-round" id="btnQuickQuery" onclick="quickQuery()">
        	<i class="icon-search blue"></i>
            查询
        </button>
		</script>
		
		<script id="htForm" type="text/x-handlebars-template">
		{{#each fields}}
			<div class="form-group">
				<label class="col-xs-2 control-label no-padding">
					{{this.fieldAlias}}：
				</label>
				<div class="col-xs-10">
					<input type="text" id="{{this.fieldName}}" name="{{this.fieldName}}-{{this.dataType}}" class="form-control" placeholder="{{this.placeholder}}"/>
				</div>
			</div>
		{{/each}}
		</script>
		
		<script type="text/javascript">
            //预编译模板
            var htQuickQuery = $("#htQuickQuery").html();
            var tQuickQuery = Handlebars.compile(htQuickQuery);
            
            var htForm = $("#htForm").html();
            //var tForm = Handlebars.compile(htForm);

            var tpl = $("#tpl").html();
            var template = Handlebars.compile(tpl);
        </script>
	</body>
</html>
