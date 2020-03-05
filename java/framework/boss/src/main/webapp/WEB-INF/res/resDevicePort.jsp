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
					设备端口
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
                            			设备端口
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<input type="text" id="crDeviceCode" placeholder="设备编码"/>
                            				<input type="text" id="crPortCode" placeholder="端口编码"/>
                            				<input type="text" id="crBusinessKey" placeholder="号码"/>
											<select id="cdStatus">
												<option role="option" value="" selected="selected">--端口状态--</option>
												<option role="option" value="1">正常</option>
												<option role="option" value="2">损坏</option>
												<option role="option" value="3">保留</option>
											</select>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_parent_port">
                            					<i class="icon-arrow-right red"></i>
                            					生成入线端口
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>设备编码</th>
													<th>端口编码</th>
													<th>状态</th>
													<th>入线设备</th>
													<th>入线端口</th>
													<th>业务</th>
													<th>业务号</th>
													<th>预绑定号码</th>
													<th>拆机保留</th>
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

					<input type="hidden" id="flag" value="">
					<input type="hidden" id="id" name="cdrSource.id" value="">
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									设备编码：
								</label>
								<div class="col-xs-4">
									<input type="text" id="deviceCode" class="form-control" readonly/>
								</div>
								<label class="col-xs-2 control-label no-padding">端口编码：</label>
								<div class="col-xs-4">
									<input type="text" id="portCode" class="form-control" readonly/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">状态：</label>
								<div class="col-xs-4">
									<select id="status" class="form-control">
										<option role="option" value="1">正常</option>
										<option role="option" value="2">损坏</option>
										<option role="option" value="3">保留</option>
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">承载业务：</label>
								<div class="col-xs-4">
									<input type="text" id="bearing" class="form-control" readonly/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">入线设备：</label>
								<div class="col-xs-4">
									<input type="text" id="parentDeviceCode" class="form-control" readonly/>
								</div>
								<label class="col-xs-2 control-label no-padding">入线端口：</label>
								<div class="col-xs-4">
									<input type="text" id="parentPortCode" class="form-control" readonly/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">业务号：</label>
								<div class="col-xs-4">
									<input type="text" id="businessKey" class="form-control" readonly/>
								</div>
								<label class="col-xs-2 control-label no-padding">绑定号码：</label>
								<div class="col-xs-4">
									<input type="text" id="holdBusinessKey" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">拆机保留：</label>
								<div class="col-xs-4">
									<select id="status" class="form-control">
										<option role="option" value="0">不保留</option>
										<option role="option" value="1">保留</option>
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">备注：</label>
								<div class="col-xs-4">
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

		<!-- 模态框 -->
		<div class="modal fade" id="dlg_parent_port" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:50%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title_parent_port">
							批量生成入线端口
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									入线类型：
								</label>
								<div class="col-xs-4">
									<select class="form-control" id="inDeviceType">
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">
									入线设备：
								</label>
								<div class="col-xs-4">
									<select class="form-control" id="inDevice">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									前缀：
								</label>
								<div class="col-xs-4">
									<input type="text" id="inPortPrefix" class="form-control" placeholder="如42#"/>
								</div>
								<label class="col-xs-2 control-label no-padding">
									编号：
								</label>
								<div class="col-xs-4">
									<div class="input-group">
										<input type="text" class="form-control" id="inPortSuffixBegin" />
										<span class="input-group-addon">
											<i class="icon-forward "></i>
										</span>
										<input type="text" class="form-control" id="inPortSuffixEnd" />
									</div>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									出线类型：
								</label>
								<div class="col-xs-4">
									<select class="form-control" id="outDeviceType">
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">
									出线设备：
								</label>
								<div class="col-xs-4">
									<select class="form-control" id="outDevice">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									前缀：
								</label>
								<div class="col-xs-4">
									<input type="text" id="outPortPrefix" class="form-control" placeholder="如42#"/>
								</div>
								<label class="col-xs-2 control-label no-padding">
									编号：
								</label>
								<div class="col-xs-4">
									<div class="input-group">
										<input type="text" class="form-control" id="outPortSuffixBegin" />
										<span class="input-group-addon">
											<i class="icon-forward "></i>
										</span>
										<input type="text" class="form-control" id="outPortSuffixEnd" />
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="save_parent_port">
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

		<script type="text/javascript">
		
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
		
        // 初始化页面控件
        $(function () {
        	loadRef("res_device_type", "inDeviceType", true);
        	loadRef("res_device_type", "outDeviceType", true);
       	});
       	
        var table_view;
        var criteria = {};
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "resDevicePort!findByPage.do",
            	"data": criteria,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
            	{"mDataProp": "deviceCode"},
    			{"mDataProp": "portCode"},
    			{"mDataProp": "statusDesc"},
    			{"mDataProp": "parentDeviceCode"},
    			{"mDataProp": "parentPortCode"},
    			{"mDataProp": "bearingDesc"},
    			{"mDataProp": "businessKey"},
    			{"mDataProp": "holdBusinessKey"},
    			{"mDataProp": "reserved"},
				{"mDataProp": ""}
    		],
			 columnDefs: [
                {
                    targets: 8,
                    render: function (a, b, c, d) {
                    	return c.reserved == "1" ? "是" : "否";
                    }
                },
                {
                    targets: 9,
                    render: function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"fn": "showDetailDlg(" + JSON.stringify(c) + ")", "color": "blue", "icon": "zoom-in"},
                                {"fn": "showUpdateDlg("+ JSON.stringify(c) +")", "color": "green", "icon": "pencil"}
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
        		"obj.portCode": $("#crPortCode").val(),
        		"obj.status": $("#crStatus").val(),
        		"obj.businessKey": $("#crBusinessKey").val()
        	};
			table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
        });
        
        $("#save").click(function() {
        	var parm = {
    			"obj.id": $("#id").val(),
    			"obj.status": $("#status").val(),
    			"obj.holdBusinessKey": $("#holdBusinessKey").val(),
    			"obj.reserved": $("#reserved").val(),
    			"obj.remark": $("#remark").val()
        	};
        	var resData = ajaxCRUD("resDevicePort!update.do", parm, true);
        	if (resData.resNum == "0") {
				//table_view.fnSettings().ajax.data = {}; 
				table_view.api().ajax.reload();
				$("#dlg").modal("hide");
        	}
        });
        
        $("#btn_parent_port").click(function() {
        	$("#dlg_parent_port").modal("show");
        });
        
        $("#inDeviceType").change(function() {
        	var deviceType = $("#inDeviceType").val();
        	if (deviceType == "") {
        		$("#inDevice").clear();
        	} else {
        		loadRefByKey("res_device", "DEVICE_TYPE_ID", deviceType, "inDevice");
        	}
        });
        
        $("#outDeviceType").change(function() {
        	var deviceType = $("#outDeviceType").val();
        	if (deviceType == "") {
        		$("#outDevice").clear();
        	} else {
        		loadRefByKey("res_device", "DEVICE_TYPE_ID", deviceType, "outDevice");
        	}
        });
        
        $("#save_parent_port").click(function() {
        	var inDevice = $("#inDevice").val();
        	if (inDevice == "") {
        		bbAlert("请选择入线设备");
        		return;
        	}
        	var outDevice = $("#outDevice").val();
        	if (outDevice == "") {
        		bbAlert("请选择出线设备");
        		return;
        	}
        	var inPortPrefix = $("#inPortPrefix").val();
        	var outPortPrefix = $("#outPortPrefix").val();
        	var inPortSuffixBegin = $("#inPortSuffixBegin").val();
        	var inPortSuffixEnd = $("#inPortSuffixEnd").val();
        	var outPortSuffixBegin = $("#outPortSuffixBegin").val();
        	var outPortSuffixEnd = $("#outPortSuffixEnd").val();
        	if (inPortSuffixBegin == "" || inPortSuffixEnd == "" || outPortSuffixBegin == "" || outPortSuffixEnd == ""
        		|| isNaN(inPortSuffixBegin) || isNaN(inPortSuffixEnd)  || isNaN(outPortSuffixBegin) || isNaN(outPortSuffixEnd)) {
        		bbAlert("入线编号段和出线编号段必须填写完整，且必须为数字");
        		return;
        	}
        	var inPortCount = parseInt(inPortSuffixEnd) - parseInt(inPortSuffixBegin);
        	var outPortCount = parseInt(outPortSuffixEnd) - parseInt(outPortSuffixBegin);
        	if (inPortCount < 0 || outPortCount < 0 || inPortCount != outPortCount) {
        		bbAlert("起始编号必须必截止编号小，且出入线端口数必须相等");
        		return;
        	}
        	var parm = {
        		"parm.inDeviceId": inDevice,
        		"parm.inPortPrefix": inPortPrefix,
        		"parm.inPortSuffixBegin": inPortSuffixBegin,
        		"parm.inPortSuffixEnd": inPortSuffixEnd,
        		"parm.outDeviceId": outDevice,
        		"parm.outPortPrefix": outPortPrefix,
        		"parm.outPortSuffixBegin": outPortSuffixBegin,
        		"parm.outPortSuffixEnd": outPortSuffixEnd,
        	};
        	var resData = ajaxCRUD("resDevicePort!generateParentPort.do", parm, true);
        	if (resData.resNum == "0") {
				table_view.api().ajax.reload();
				$("#dlg_parent_port").modal("hide");
        	}
        });
        
		/////////////////////////////////////////////////////////////////////////////////
		// 辅助函数
		/////////////////////////////////////////////////////////////////////////////////
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
        	$("#deviceCode").val(obj.deviceCode);
        	$("#portCode").val(obj.portCode);
        	$("#status").val(obj.status);
        	$("#bearBusiness").val(obj.bearingDesc);
        	$("#parentDeviceCode").val(obj.parentDeviceCode);
        	$("#parentPortCode").val(obj.parentPortCode);
        	$("#businessKey").val(obj.businessKey);
        	$("#holdBusinessKey").val(obj.holdBusinessKey);
        	$("#reserved").val(obj.reserved);
        	$("#remark").val(obj.remark);
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
