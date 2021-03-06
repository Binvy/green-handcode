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
		<link rel="stylesheet" href="assets/css/datepicker.css" />
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">资费管理</a>
				</li>
				<li class="active">
					呼叫类型
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>


		<div class="page-content">
			<div id="user-profile-2" class="user-profile">
				<!-- 呼叫类型 -->
				<div class="tabbable">
					<ul class="nav nav-tabs padding-18">
						<li class="active">
							<a data-toggle="tab" href="#ne"> <i
								class="green icon-phone bigger-120"></i> 呼叫类型列表 </a>
						</li>
					</ul>

					<div id="ne" class="tab-pane">
						<div class="col-sm-12">
                            <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                                <div>
                                    <input type="button" class="btn btn-sm btn-primary pull-right" style="" id="btn_add" value="添加" />
                                </div>
                            </div>
							<table id="table_view" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>
											名称
										</th>
										<th>
											备注
										</th>
										<th>
											操作
										</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			
				<!-- 字冠表 -->
				<div class="tabbable">
					<ul class="nav nav-tabs padding-18">
						<li class="active">
							<a data-toggle="tab" href="#ne"> <i
								class="green icon-phone bigger-120"></i> 字冠列表 </a>
						</li>
					</ul>

					<div id="div_sub" class="tab-pane">
						<div class="col-sm-12">
                            <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                                <div>
                                    <input type="button" class="btn btn-sm btn-primary pull-right" style="" id="btn_add_sub" value="添加字冠" />
                                </div>
                            </div>
							<table id="table_view_sub" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>
											主叫字冠
										</th>
										<th>
											被叫字冠
										</th>
										<th>
											被叫地名
										</th>
										<th>
											操作
										</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 呼叫类型模态框（Modal） -->
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
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									<font color="green"><b>名称：</b></font>
								</label>
								<div class="col-xs-4">
									<input type="text" id="name" name="obj.name" class="" style="width:93%;"/>
								</div>
								<label class="col-xs-2 control-label no-padding">
									备注：
								</label>
								<div class="col-xs-4">
									<input type="text" id="remark" name="obj.remark" class="" style="width:93%;"/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="save">
							提交
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

		<!-- 字冠模态框（Modal） -->
		<div class="modal fade" id="dlg_sub" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:70%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title_sub">
						</h4>
					</div>

					<input type="hidden" id="flag" value="">
					<input type="hidden" id="sub_id" name="obj.sub_id" value="">
					<input type="hidden" id="config_id" name="obj.configId" value="">
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									<font color="green"><b>主叫字冠：</b></font>
								</label>
								<div class="col-xs-2">
									<input type="text" id="callerPrefix" name="obj.callerPrefix" class="" style="width:93%;"/>
								</div>
								<label class="col-xs-2 control-label no-padding">
									<font color="green"><b>被叫字冠：</b></font>
								</label>
								<div class="col-xs-2">
									<input type="text" id="calleePrefix" name="obj.calleePrefix" class="" style="width:93%;"/>
								</div>
								<label class="col-xs-2 control-label no-padding">
									被叫地名：
								</label>
								<div class="col-xs-2">
									<input type="text" id="calleeLocation" name="obj.calleeLocation" class="" style="width:93%;"/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="save_sub">
							提交
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
		<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		 
		<script type="text/javascript">
		
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
        var table_view;
        var parm = {};
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "sidVoiceConfig!findAll.do",
            	"data": parm,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
            	{"mDataProp": "name"},
    			{"mDataProp": "remark"},
				{"mDataProp": ""}
    		],
			 columnDefs: [
                {
                    targets: 2,
                    render: function (a, b, c, d) {
                        var context =
                        {
                            func: [
                            	{"fn": "showSubList('" + c.id + "')", "color": "blue", "icon": "bars"},
                                {"fn": "showDetailDlg(" + JSON.stringify(c) + ")", "color": "blue", "icon": "zoom-in"},
                                {"fn": "showUpdateDlg(" + JSON.stringify(c) + ")", "color": "red", "icon": "pencil"},
								{"fn": "del('" + c.id + "')", "color": "red", "icon": "trash"}
                            ]
                        };
                        var html = template(context);
                        return html;
                    }
                }

            ],
			"bLengthChange": false,//
			"iDisplayLength" :10,
			"searching":false,//关闭dataTable自带搜索
			"scrollY": "150px",
			"scrollCollapse": true,
			"bPaginate": false,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
		initSubTable("");
		
		
		/////////////////////////////////////////////////////////////////////////////////
		// 事件处理
		/////////////////////////////////////////////////////////////////////////////////
		$("#table_view tbody").on("click", "tr", function(event) {
			var aData = table_view.fnGetData(event.target.parentNode);
			showSubList(aData.id);
		});
		
        $("#btn_add").click(function() { 
        	showNewDlg();
        });
        
        $("#save").click(function() {
        	if ($("#name").val() == "") {
        		alert("请输入类型名称");
        		return;
        	}
        	var parm = {
    			"obj.id": $("#id").val(),
    			"obj.name": $("#name").val(),
    			"obj.remark": $("#remark").val(),
        	};
        	var flag = $("#flag").val();
        	
        	var resData;
        	if (flag == "add") {
        		resData = ajaxCRUD("sidVoiceConfig!insert.do", parm, true);
        	} else {
        		resData = ajaxCRUD("sidVoiceConfig!update.do", parm, true);
        	}
        	if (resData.resNum == "0") {
				table_view.fnSettings().ajax.data = {}; 
				table_view.api().ajax.reload();
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
					    var resData = ajaxCRUD("sidVoiceConfig!delete.do", parm, true);
						if(resData.resNum == "0"){
							table_view.fnSettings().ajax.data = {}; 
							table_view.api().ajax.reload();
						}
	            	}
	            }
	    	});
        }
        
        $("#btn_add_sub").click(function() { 
        	showNewSubDlg();
        });
        
        $("#save_sub").click(function() {
        	if ($("#callerPrefix").val() == "" || $("#calleePrefix").val() == "") {
        		alert("请输入主被叫字冠");
        		return;
        	}
        	var parm = {
    			"obj.id": $("#sub_id").val(),
    			"obj.configId": $("#config_id").val(),
    			"obj.callerPrefix": $("#callerPrefix").val(),
    			"obj.calleePrefix": $("#calleePrefix").val(),
    			"obj.calleeLocation": $("#calleeLocation").val()
        	};
        	var flag = $("#flag").val();
        	
        	var resData;
        	if (flag == "add") {
        		resData = ajaxCRUD("sidVoiceConfigItem!insert.do", parm, true);
        	} else {
        		resData = ajaxCRUD("sidVoiceConfigItem!update.do", parm, true);
        	}
        	if (resData.resNum == "0") {
				table_view_sub.fnSettings().ajax.data = parmSub; 
				table_view_sub.api().ajax.reload();
				$("#dlg_sub").modal("hide");
        	}
        });
        
        function delSub(id) {
	   		bootbox.confirm({
	   			locale: "zh_CN",
				size: 'small',
				title:"提示",
				message: "确认要删除？", 
				callback: function(result){
	   				if(result){
						var parm = {"id":id };
					    var resData = ajaxCRUD("sidVoiceConfigItem!delete.do", parm, true);
						if(resData.resNum == "0"){
							table_view_sub.fnSettings().ajax.data = parmSub; 
							table_view_sub.api().ajax.reload();
						}
	            	}
	            }
	    	});
        }
        
		/////////////////////////////////////////////////////////////////////////////////
		// 辅助函数
		/////////////////////////////////////////////////////////////////////////////////
        var table_view_sub;
        var parmSub;
        function initSubTable(configId) {
        	parmSub = {"configId": configId};
			table_view_sub = $('#table_view_sub').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
	            	"url": "sidVoiceConfigItem!findByConfigId.do",
    	        	"data": parmSub,
        	    	"dataSrc": "lst"
            	},
	            "aoColumns": [ 
    	        	{"mDataProp": "callerPrefix"},
    				{"mDataProp": "calleePrefix"},
    				{"mDataProp": "calleeLocation"},
					{"mDataProp": ""}
	    		],
				columnDefs: [{
                    targets: 3,
                    render: function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"fn": "showDetailSubDlg(" + JSON.stringify(c) + ")", "color": "blue", "icon": "zoom-in"},
                                {"fn": "showUpdateSubDlg(" + JSON.stringify(c) + ")", "color": "red", "icon": "pencil"},
								{"fn": "delSub('" + c.id + "')", "color": "red", "icon": "trash"}
                            ]
                        };
                        var html = template(context);
                        return html;
                    }
                }],
				"bLengthChange": false,//
				"iDisplayLength" :10,
				"scrollY": "150px",
				"scrollCollapse": true,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": false,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
        }
        
        function showSubList(configId) {
        	parmSub = {"configId": configId};
			table_view_sub.fnSettings().ajax.data = parmSub; 
			table_view_sub.api().ajax.reload();
        }
        
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
        	$("#name").val(obj.name);
        	$("#remark").val(obj.remark);
        }

    	function clear() {
    		$("#id").val("");
        	$("#name").val("");
        	$("#remark").val("");
    	}

        function showNewSubDlg() {
        	if (parmSub.configId == "") {
        		alert("请选择呼叫类型");
        		return;
        	}
            $("#dlg_title_sub").text("添加");
            clearSub();
            $("#flag").val("add");
            $("#save_sub").show();
            $("#dlg_sub").modal("show");
        }
        
        function showUpdateSubDlg(obj) {
            $("#dlg_title_sub").text("修改");
        	detailSub(obj);
            $("#flag").val("edit");
            $("#save_sub").show();
            $("#dlg_sub").modal("show");
        }
        
        function showDetailSubDlg(obj) {
            $("#dlg_title_sub").text("详情");
        	detailSub(obj);
            $("#flag").val("");
            $("#save_sub").hide();
            $("#dlg_sub").modal("show");
        }
        
        function detailSub(obj) {
    		$("#sub_id").val(obj.id);
    		$("#config_id").val(obj.configId);
        	$("#callerPrefix").val(obj.callerPrefix);
        	$("#calleePrefix").val(obj.calleePrefix);
        	$("#calleeLocation").val(obj.calleeLocation);
        }

    	function clearSub() {
    		$("#sub_id").val("");
    		$("#config_id").val(parmSub.configId);
        	$("#callerPrefix").val("*");
        	$("#calleePrefix").val("*");
        	$("#calleeLocation").val("");
    	}

		</script>

		<script id="tpl" type="text/x-handlebars-template">
        <div class="action-buttons">
    	{{#each func}}
    	<a class="{{this.color}}" href="javascript:{{this.fn}}"><i class="icon-{{this.icon}} bigger-130"></i></a>
    	{{/each}}
		</div>
		</script>

		<script type="text/javascript">
            var tpl = $("#tpl").html();
            //预编译模板
            var template = Handlebars.compile(tpl);
			var userName = "${sessionScope.userInfo.userName}";
			// alert(userName);
        </script>
	</body>
</html>
