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
					<i class="icon-home home-icon green"></i>
					<a href="#">业务受理</a>
				</li>
				<li class="active">
					客户查询
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
                            			客户查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<input type="text" id="crCustomerNo" placeholder="用户号码"/>
											<input type="text" id="crCustomerName" placeholder="客户名"/>
											<select type="text" id="crCustomerType" /></select>
											<input type="text" id="crLinker" placeholder="联系人"/>
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
													<th>客户号</th>
													<th>客户名称</th>
													<th>类型</th>
													<th>证件号</th>
													<th>联系人</th>
													<th>联系电话</th>
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
			loadRef("ref_customer_type", "crCustomerType", "--客户类型--");
			initTableView();
			//$('#table_view tbody').on('click', 'td.details-control', openDetail);
		});
		
		function initTableView() {
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "customer!findByPage.do",
            	"data": criteria,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
            	{"mDataProp": "customerNo"},
    			{"mDataProp": "name"},
    			{"mDataProp": "customerType"},
    			{"mDataProp": "certId"},
    			{"mDataProp": "linker"},
    			{"mDataProp": "address"},
				{"mDataProp": ""}
    		],
			 columnDefs: [{
                    targets: 2,
                    render: function (a, b, c, d) {
                    	if (c.customerType == 1) {
                    		return "散户";
                    	} else {
                    		return "大户";
                    	}
                    }
			 },{
                    targets: 6,
                    render: function (a, b, c, d) {
                    	var func = [];
                    	func.push({"fn": "viewCustomerInfo('" + c.id + "')", "color": "blue", "icon": "user-md", "tooltip": "查看用户信息"});
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
				"obj.customerNo": $("#crCustomerNo").val(),
				"obj.name": $("#crCustomerName").val(),
				"obj.customerType": $("#crCustomerType").val(),
				"obj.linker": $("#crLinker").val(),
			};
			table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
		});
		
		// 查看客户信息
		function viewCustomerInfo(id) {
			loadCustomerInfo(id);
			loadAccountInfo(id);
			$("#dlgCustomerInfo").modal("show");
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
        
		<jsp:include page="../pub/customerInfo.jsp" flush="true"/>
		
	</body>
</html>
