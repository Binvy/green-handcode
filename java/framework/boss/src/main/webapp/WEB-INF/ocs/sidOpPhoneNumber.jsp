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
		
		<!-- scripts -->
		<script src="assets/js/jquery-1.10.2.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script type="text/javascript" src="assets/js/crud/crud.js"></script>
		<script src="assets/js/jquery.dataTables.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="assets/js/handlebars-v3.0.1.js"></script>
		 
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">资费管理</a>
				</li>
				<li class="active">
					外部号码
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
                            			<i class="icon-phone-sign blue bigger-110"></i>
                            			号码列表
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<div class="col-xs-2">
                            					<input type="text" id="crPhoneNumber" class="form-control" placeholder="请输入外部号码"/>
                           					</div>
                            				<div class="col-xs-2">
	                            				<select id="crOpName" name="crOpName" class="form-control">
	                            					<option name="opname" value="">--选择运营商--</option>
	                            					<option value="电信">电信</option>
	                            					<option value="联通">联通</option>
	                            					<option value="移动">移动</option>
	                            				</select>
                            				</div>
                            				<div class="col-xs-3">
                            					<input type="text" id="crBusinessArea" class="form-control" placeholder="请输入业务区域"/>
                            				</div>
                            				<button class="btn btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search blue"></i>
                            					查询
                            				</button>
                            				<button class="btn btn-success btn-white btn-round" id="btn_reset">
                            					<i class="icon-refresh red"></i>
                            					重置
                            				</button>
                            				<button class="btn btn-success btn-white btn-round pull-right" id="btn_add">
                            					<i class="icon-plus green"></i>
                            					添加
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>编号</th>
													<th>电话号码</th>
													<th>运营商</th>
													<th>业务区域</th>
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
		<!-- 模态框（Modal） -->
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
									<font color="green"><b>电话号码：</b></font>
								</label>
								<div class="col-xs-4">
									<input type="text" id="phoneNumber" class="form-control" placeholder="请输入电话号码"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									<font color="green"><b>运营商：</b></font>
								</label>
								<div class="col-xs-4">
									<input type="text" id="opName" class="form-control" placeholder="请输入运营商名称"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									<font color="green"><b>业务区域：</b></font>
								</label>
								<div class="col-xs-10">
									<input type="text" id="businessArea" class="form-control" placeholder="请输入业务区域，多个区域用逗号隔开"/>
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
            	"url": "sidOpPhoneNumber!selectByPage.do",
            	"data": parm,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
   				{"mDataProp": "id"},
             	{"mDataProp": "phoneNumber"},
             	{"mDataProp": "opName"},
     			{"mDataProp": "businessArea"},
 				{"mDataProp": ""}
    		],
			 columnDefs: [
                {
                    targets: 4,
                    render: function (a, b, c, d) {
                        var context =
                        {
                            func: [
								{"fn": "showDetailDlg("+ JSON.stringify(c) +")", "color": "green", "icon": "zoom-in"},
                                {"fn": "showUpdateDlg("+ JSON.stringify(c) +")", "color": "green", "icon": "pencil"},
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
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
		
		/////////////////////////////////////////////////////////////////////////////////
		// 事件处理
		/////////////////////////////////////////////////////////////////////////////////
        $("#btn_add").click(function() { 
        	showNewDlg();
        });
		
        $("#btn_inquiry").click(function() { 
			parm["obj.phoneNumber"] = $("#crPhoneNumber").val() == "" ? "" : $("#crPhoneNumber").val();
			parm["obj.opName"] = $("#crOpName").val() == "" ? "" : $("#crOpName").val();
			parm["obj.businessArea"] = $("crBusinessArea").val() == "" ? "" : $("#crBusinessArea").val();
			table_view.fnSettings().ajax.data = parm;//重设datatable中的ajax参数
			table_view.api().ajax.reload();//ajax重新加载表格数据
        });
        
        $("#btn_reset").click(function() { 
        	$("#crPhoneNumber").val("");
        	$("#crOpName").val("");
        	$("#crBusinessArea").val("");
			table_view.fnSettings().ajax.data = {};//重设datatable中的ajax参数
			table_view.api().ajax.reload();//ajax重新加载表格数据
        });
        
        $("#save").click(function() {
        	if ($("#name").val() == "") {
        		alert("请输入群名称");
        		return;
        	}
        	var parm = {
    			"obj.id": $("#id").val(),
    			"obj.phoneNumber": $("#phoneNumber").val(),
    			"obj.opName": $("#opName").val(),
    			"obj.businessArea": $("#businessArea").val(),
        	};
        	var flag = $("#flag").val();
        	
        	var resData;
        	if (flag == "add") {
        		resData = ajaxCRUD("sidOpPhoneNumber!insert.do", parm, true);
        	} else {
        		resData = ajaxCRUD("sidOpPhoneNumber!update.do", parm, true);
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
					    var resData = ajaxCRUD("sidOpPhoneNumber!delete.do", parm, true);
						if(resData.resNum == "0"){
							table_view.fnSettings().ajax.data = {}; 
							table_view.api().ajax.reload();
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
        	$("#phoneNumber").val(obj.phoneNumber);
        	$("#opName").val(obj.opName);
        	$("#businessArea").val(obj.businessArea);
        }

    	function clear() {
    		$("#id").val("");
        	$("#phoneNumber").val("");
        	$("#opName").val("");
        	$("#businessArea").val("");
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
