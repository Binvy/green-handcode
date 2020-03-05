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
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
			
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker.css" />
		
		<link rel="stylesheet" href="css/datatable.css">
		 
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
		 
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					待拆用户
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
                            			<i class="icon-tags red bigger-110"></i>
                            			待拆用户（停机超过三个月）
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<select id="crBusinessType">
                            					<option value="">--业务类型--</option>
                            					<option value="p">电话</option>
                            					<option value="a">ADSL</option>
                            					<option value="b">宽带</option>
                            					<option value="l">专线</option>
                            					<option value="n">新业务</option>
                            				</select>
                            				<input class="" id="crBusinessKey" type="text" placeholder="业务号，如电话、账号" style="width:180px"/>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
                            					<i class="icon-search blue"></i>
                            					查询
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>业务号</th>
													<th>业务类型</th>
													<th>用户名</th>
													<th>联系电话</th>
													<th>地址</th>
													<th>停机时间</th>
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

		<script type="text/javascript">
		
        var table_view;
        var criteria = {};

    	/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
		$(document).ready(function() {
			initTableView();
		});
		
		function initTableView() {
			table_view = $('#table_view').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
            		"url": "crmUser!findDeletingUsers.do",
            		"data": criteria,
            		"dataSrc": "lst"
            	},
        		"columns": [
            		{ 
            			"data": "businessKey",
            			"width": "120px",
            		},
            		{ 
            			"data": "businessType",
            			"width": "120px",
            		},
            		{ 
            			"data": "name",
            			"width": "120px",
            		},
            		{ 
            			"data": "linkPhone",
            			"width": "100px",
            		},
            		{ 
            			"data": "address",
            			"width": "*",
            		},
            		{ 
            			"data": "convertTime",
            			"width": "100px",
            		},
            		{ 
            			"data": "null",
            			"width": "120",
                		"defaultContent": ''
            		},
            	],
				columnDefs: [{
                    targets: 1,
                    render: function (a, b, c, d) {
                    	if (c.businessType == 'a') {
                    		return "ADSL";
                    	} else if (c.businessType == 'p') {
                    		return "电话";
                    	} else if (c.businessType == 'b') {
                    		return "宽带";
                    	} else if (c.businessType == 'l') {
                    		return "专线";
                    	} else if (c.businessType == 'n') {
                    		return "新业务";
                    	} else {
                    		return "ERROR";
                    	}
                    }
                },{
                    targets: 6,
                    render: function (a, b, c, d) {
                    	var fs = [];
                    	fs.push({"fn": "deleteUser(" + JSON.stringify(c) + ")", "color": "red", "icon": "tag", "tooltip": "发送拆机工单"});
                        var context = {func: fs};
                        var html = template(context);
                        return html;
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
		}
		
		$("#btnInquiry").click(function(){
			criteria = {
				"obj.businessType": $("#crBusinessType").val(),
				"obj.businessKey": $("#crBusinessKey").val()
			}
			table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
		});
		
		function deleteUser(user) {
        	var op = "${sessionScope.userInfo.userName}";
        	var parm = {
        		"obj.id": user.id,
        		"obj.creator": op,
        		"obj.opType": "delete",
        		"obj.customerId": user.customerId,
        		"obj.businessType": user.businessType,
        		"obj.businessKey": user.businessKey,
        		"obj.amountDue": 0,
        		"obj.amountProceed": 0,
        		"obj.printFlag": 0,
        		"obj.remark": "force"
        	};
        	var res = ajaxCRUD("order!deleteUser.do", parm, true);
        	if (res.resNum == "0") {
				table_view.api().ajax.reload(null, false);
        	}
		}
		
		/////////////////////////////////////////////////////////////////////////////////
		// 辅助函数
		/////////////////////////////////////////////////////////////////////////////////
		
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
