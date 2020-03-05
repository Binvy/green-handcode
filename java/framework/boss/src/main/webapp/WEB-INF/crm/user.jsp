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
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					用户查询
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
                            			用户查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
											<select id="crBusinessType">
											</select>
                            				<input type="text" id="crBusinessKey" placeholder="用户号码"/>
											<input type="text" id="crUserName" placeholder="用户名"/>
											<input type="text" id="crLinkPhone" placeholder="联系电话"/>
											<input type="text" id="crAddress" placeholder="地址"/>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>类型</th>
													<th>号码</th>
													<th>用户名</th>
													<th>联系人</th>
													<th>联系电话</th>
													<th>地址</th>
													<th>付费策略</th>
													<th>装机(移机)时间</th>
													<th>到期时间</th>
													<th>状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
                            		</div>
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
		
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
        var table_view;
        var criteria = {};

		$(function() {
			$("[data-toggle='tooltip']").tooltip();
			loadRef("ref_business_type", "crBusinessType", "--类型--");
			initTableView();
		});
		
		function initTableView() {
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "crmUser!findByPage.do",
            	"data": criteria,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
            	{"mDataProp": "businessType"},
    			{"mDataProp": "businessKey"},
    			{"mDataProp": "name"},
    			{"mDataProp": "linker"},
    			{"mDataProp": "linkPhone"},
    			{"mDataProp": "address"},
    			{"mDataProp": "payPolicy"},
    			{"mDataProp": "effectiveTime"},
    			{"mDataProp": "pauseTime"},
    			{"mDataProp": "status"},
				{"mDataProp": ""}
    		],
			 columnDefs: [{
                    targets: 0,
                    render: function (a, b, c, d) {
                    	if (c.businessType == 'a') {
                    		return "ADSL";
                    	} else if (c.businessType == 'b') {
                    		return "宽带";
                    	} else if (c.businessType == 'p') {
                    		return "电话";
                    	} else if (c.businessType == 'l') {
                    		return "专线";
                    	} else {
                    		return "新业务";
                    	}
                    }
			 },{
                    targets: 6,
                    render: function (a, b, c, d) {
                    	if (c.payPolicy == 1) {
                    		return "后付费";
                    	} else {
                    		return "预付费";
                    	}
                    }
			 },{
                    targets: 7,
                    render: function (a, b, c, d) {
                    	return new Date(c.effectiveTime).format("yyyy-MM-dd");
                    	//return new Date(c.effectiveTime).toLocaleString();
                    }
			 },{
                    targets: 8,
                    render: function (a, b, c, d) {
                    	if (c.pauseTime != null) {
                    		return new Date(c.pauseTime).format("yyyy-MM-dd");
                    	} else {
                    		return "";
                    	}
                    }
			 },{
                    targets: 10,
                    render: function (a, b, c, d) {
                    	var func = [];
                    	func.push({"fn": "viewUserInfo(" + JSON.stringify(c) + ")", "color": "blue", "icon": "user-md", "tooltip": "查看用户信息"});
                        var context =
                        {
                            "func": func 
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
		}
		
		
		/////////////////////////////////////////////////////////////////////////////////
		// 事件处理
		/////////////////////////////////////////////////////////////////////////////////
		
		$("#btn_inquiry").click(function() {
			criteria = {
				"obj.businessType": $("#crBusinessType").val(),
				"obj.businessKey": $("#crBusinessKey").val(),
				"obj.name": $("#crUserName").val(),
				"obj.linkPhone": $("#crLinkPhone").val(),
				"obj.address": $("#crAddress").val(),
			};
			table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
		});
		
		// 查看用户信息
		function viewUserInfo(obj) {
			loadCustomerInfo(obj.customerId);
			loadAccountInfo(obj.customerId);
			loadUserInfo(obj.id);
			loadOrderInfo(obj.customerId, obj.id, obj.businessKey);
			$("#dlgUserInfo").modal("show");
		}
		
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
        
		<jsp:include page="../pub/userInfo.jsp" flush="true"/>
		
	</body>
</html>
