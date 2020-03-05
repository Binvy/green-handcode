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
					<i class="icon-home home-icon"></i>
					<a href="#">资源管理</a>
				</li>
				<li class="active">
					设备
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
                            			<i class="icon-magnet green bigger-110"></i>
                            			设备列表
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<input type="text" id="crDeviceCode" placeholder="设备编码"/>
                            				<input type="text" id="crName" placeholder="设备名称"/>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_add">
                            					<i class="icon-plus-sign-alt red"></i>
                            					添加
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btnImport">
                            					<i class="icon-cloud-upload blue"></i>
                            					导入
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>设备编码</th>
													<th>设备名称</th>
													<th>厂商</th>
													<th>型号</th>
													<th>安装地址</th>
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


		<!-- 模态框 -->
		<div class="modal fade" id="dlg" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:70%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title">
						</h4>
					</div>

					<input type="hidden" id="flag" value=""/>
					<input type="hidden" id="id" name="cdrSource.id" value=""/>
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									设备编码：
								</label>
								<div class="col-xs-4">
									<input type="text" id="deviceCode" class="form-control" placeholder="请输入设备编码"/>
								</div>
								<label class="col-xs-2 control-label no-padding">设备名称：</label>
								<div class="col-xs-4">
									<input type="text" id="name" class="form-control" placeholder="请输入设备名称"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">设备类型：</label>
								<div class="col-xs-4">
									<select id="deviceTypeId" class="form-control">
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">厂商：</label>
								<div class="col-xs-4">
									<input type="text" id="manufacturer" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">设备型号：</label>
								<div class="col-xs-4">
									<input type="text" id="deviceModel" class="form-control"/>
								</div>
								<label class="col-xs-2 control-label no-padding">安装日期：</label>
								<div class="col-xs-4">
									<div class="input-group">
										<input type='text' class="form-control" id='installDate' />
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">安装地址：</label>
								<div class="col-xs-10">
									<input type="text" id="address" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">端口起始编码：</label>
								<div class="col-xs-4">
									<input type="text" id="startPortCode" class="form-control"/>
								</div>
								<label class="col-xs-2 control-label no-padding">端口截止编码：</label>
								<div class="col-xs-4">
									<input type="text" id="endPortCode" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">端口编码描述：</label>
								<div class="col-xs-4">
									<input type="text" id="portDesc" class="form-control"/>
								</div>
								<label class="col-xs-2 control-label no-padding">负责部门：</label>
								<div class="col-xs-4">
									<select id="resDept" class="form-control">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">控制地址：</label>
								<div class="col-xs-4">
									<input type="text" id="ctrlIp" class="form-control"/>
								</div>
								<label class="col-xs-2 control-label no-padding">协议：</label>
								<div class="col-xs-4" class="form-control">
									<select id="ctrlProtocol" class="form-control">
										<option role="option" value="TCP">TCP/IP</option>
										<option role="option" value="TELNET">TELNET</option>
										<option role="option" value="SOAP">SOAP</option>
										<option role="option" value="DB">DB</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">登录名：</label>
								<div class="col-xs-4">
									<input type="text" id="ctrlUserName" class="form-control"/>
								</div>
								<label class="col-xs-2 control-label no-padding">口令：</label>
								<div class="col-xs-4">
									<input type="password" id="ctrlPwd" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">超级登录名：</label>
								<div class="col-xs-4">
									<input type="text" id="ctrlAdvUserName" class="form-control"/>
								</div>
								<label class="col-xs-2 control-label no-padding">超级口令：</label>
								<div class="col-xs-4">
									<input type="password" id="ctrlAdvPwd" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">备注：</label>
								<div class="col-xs-10">
									<input type="text" id="remark" class="form-control"/>
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

		<!-- 模态框: 导入 -->
		<div class="modal fade" id="dlgImport" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:40%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title">
							设备 - 导入
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-3 control-label no-padding">
									<i id="iWaiting" class="icon-spinner icon-spin pull-right red" style="display:none"></i>
									文件：
								</label>
								<div class="col-xs-9">
									<input type="file" id="file" name="file"/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="btnSaveImport">
							导入
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
		
		var dateFormat = {
                format: 'yyyy-mm-dd',
        		weekStart: 1,
        		autoclose: true,
        		todayBtn: 'linked',
        		language: 'zh-CN'
       	};
        	
        // 初始化页面控件
        $(function () {
        	// 初始化日期控件
            $('#installDate').datetimepicker(dateFormat);
            // 载入设备类型
            loadDeviceType();
            // 载入部门
            loadDept();
       	});
       	
       	function loadDeviceType() {
			var res = ajaxCRUD("resDeviceType!findAll.do", {}, false);
			var lst = res.lst;
			var html = "";
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option role='option' value='" + item.id + "'>" + item.name + "</option>";
			});
			$("#deviceTypeId").empty();
			$("#deviceTypeId").append(html);
       	};
       	
       	function loadDept() {
			var res = ajaxCRUD("dept!findAll.do", {}, false);
			var lst = res.lst;
			var html = "<option role='option' value=''>请选择...</option>";
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option role='option' value='" + item.id + "'>" + item.deptname + "</option>";
			});
			$("#resDept").empty();
			$("#resDept").append(html);
       	}
       	
        var table_view;
        var criteria = {};
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "resDevice!findByPage.do",
            	"data": criteria,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
            	{"mDataProp": "deviceCode"},
    			{"mDataProp": "name"},
    			{"mDataProp": "manufacturer"},
    			{"mDataProp": "deviceModel"},
    			{"mDataProp": "address"},
				{"mDataProp": ""}
    		],
			 columnDefs: [
                {
                    targets: 5,
                    render: function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"fn": "showDetailDlg(" + JSON.stringify(c) + ")", "color": "blue", "icon": "zoom-in", "tooltip": "查看"},
                                {"fn": "showUpdateDlg("+ JSON.stringify(c) +")", "color": "green", "icon": "pencil", "tooltip": "修改"},
								{"fn": "del('" + c.id + "')", "color": "red", "icon": "trash" , "tooltip": "删除"},
								{"fn": "generatePort('" + c.id + "')", "color": "purple", "icon": "magic", "tooltip": "生成端口"}
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
        	criteria = {
        		"obj.deviceCode": $("#crDeviceCode").val(),
        		"obj.deviceName": $("#crDeviceName").val()
        	};
			table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
        });
        
        $("#btn_add").click(function() { 
        	showNewDlg();
        });
        
        $("#save").click(function() {
        	if ($("#name").val() == "") {
        		alert("请输入设备名称");
        		return;
        	}
        	if ($("#deviceCode").val() == "") {
        		alert("请输入设备编码");
        		return;
        	}
        	var parm = {
    			"obj.id": $("#id").val(),
    			"obj.name": $("#name").val(),
    			"obj.deviceCode": $("#deviceCode").val(),
    			"obj.deviceTypeId": $("#deviceTypeId").val(),
    			"obj.manufacturer": $("#manufacturer").val(),
    			"obj.deviceModel": $("#deviceModel").val(),
    			"obj.installDate": $("#installDate").val(),
    			"obj.address": $("#address").val(),
    			"obj.startPortCode": $("#startPortCode").val(),
    			"obj.endPortCode": $("#endPortCode").val(),
    			"obj.portDesc": $("#portDesc").val(),
    			"obj.resDept": $("#resDept").val(),
    			"obj.ctrlIp": $("#ctrlIp").val(),
    			"obj.ctrlProtocol": $("#ctrlProtocol").val(),
    			"obj.ctrlUserName": $("#ctrlUserName").val(),
    			"obj.ctrlPwd": $("#ctrlPwd").val(),
    			"obj.ctrlAdvUserName": $("#ctrlAdvUserName").val(),
    			"obj.ctrlAdvPwd": $("#ctrlAdvPwd").val(),
    			"obj.remark": $("#remark").val()
        	};
        	var flag = $("#flag").val();
        	
        	var resData;
        	if (flag == "add") {
        		resData = ajaxCRUD("resDevice!insert.do", parm, true);
        	} else {
        		resData = ajaxCRUD("resDevice!update.do", parm, true);
        	}
        	if (resData.resNum == "0") {
				//table_view.fnSettings().ajax.data = {}; 
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
					    var resData = ajaxCRUD("resDevice!delete.do", parm, true);
						if(resData.resNum == "0"){
							//table_view.fnSettings().ajax.data = {}; 
							table_view.api().ajax.reload();
						}
	            	}
	            }
	    	});
        }
        
        function generatePort(id) {
			var parm = {"id":id };
			var resData = ajaxCRUD("resDevice!generatePort.do", parm, true);
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
        	$("#name").val(obj.name);
        	$("#deviceCode").val(obj.deviceCode);
        	$("#deviceTypeId").val(obj.deviceTypeId);
        	$("#manufacturer").val(obj.manufacturer);
        	$("#deviceModel").val(obj.deviceModel);
        	$("#installDate").val(obj.installDate);
        	$("#address").val(obj.address);
        	$("#startPortCode").val(obj.startPortCode);
        	$("#endPortCode").val(obj.endPortCode);
        	$("#portDesc").val(obj.portDesc);
        	$("#resDept").val(obj.resDept);
        	$("#ctrlIp").val(obj.ctrlIp);
        	$("#ctrlProtocol").val(obj.ctrlProtocol);
        	$("#ctrlUserName").val(obj.ctrlUserName);
        	$("#ctrlPwd").val(obj.ctrlPwd);
        	$("#ctrlAdvUserName").val(obj.ctrlAdvUserName);
        	$("#ctrlAdvPwd").val(obj.ctrlAdvPwd);
        	$("#remark").val(obj.remark);
        }

    	function clear() {
    		$("#id").val("");
        	$("#name").val("");
        	$("#deviceCode").val("");
        	$("#manufacturer").val("");
        	$("#deviceModel").val("");
        	$("#installDate").val("");
        	$("#address").val("");
        	$("#startPortCode").val("");
        	$("#endPortCode").val("");
        	$("#portDesc").val("");
        	$("#resDept").val("");
        	$("#ctrlIp").val("");
        	$("#ctrlProtocol").val("TCP");
        	$("#ctrlUserName").val("");
        	$("#ctrlPwd").val("");
        	$("#ctrlAdvUserName").val("");
        	$("#ctrlAdvPwd").val("");
        	$("#remark").val("");
    	}

		$("#btnImport").click(function() {
			$("#dlgImport").modal("show");
		});
		
		$("#btnSaveImport").click(function() {
			var fileName = $("#file").val();
			var parm = null;
			if (fileName == undefined || fileName == "") {
				alert("请选择XLS文件");
				return;
			}
			var infos = fileName.split("\\");
			var filename = infos[infos.length - 1];
			parm = {
				"parm.importFileName": filename,
				"parm.importer": "${sessionScope.userInfo.userName}"
			};
			$("#iWaiting").css("display", "block");
        	var fileObj = $("#file").get(0).files[0];
        	var form = new FormData();
        	form.append("file", fileObj);
        	var xhr = new XMLHttpRequest(); 
        	xhr.open("post", "file.upload", false); 
        	xhr.send(form); 
        	xhr.addEventListener("load", uploadComplete(parm), false);
		});
		
		function uploadComplete(parm) {
			var res = ajaxCRUD("resDevice!importFromExcel.do", parm, false);
			if (res.resNum == "0") {
				$("#iWaiting").css("display", "none");
	        	$("#dlgImport").modal("hide");
				table_view.api().ajax.reload(null, false);
			} else {
				alert(res.res);
			}
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
