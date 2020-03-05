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
					<i class="icon-home home-icon green"></i>
					<a href="#">信息查询</a>
				</li>
				<li class="active">
					空号查询
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
                            			空号查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<label>
												电话号码:
											</label>
                            					<input type="text" id="crPhoneNumber"/>
                            				<label>
												号码类型:
											</label>
                            				<select id="crNumberLevel"/>
                           						<option role="option" value="">--请选择--</option>
                           				        <option role="option" value="0">普通号码</option>
                                   				<option role="option" value="1">VIP号码</option>
                            				</select>
                            				<label>
												号码区域:
											</label>
                            					<select class="input-sm" id="crPhoneArea"></select>                       
                            				<label>
												号码站区:
											</label>
                            					<select class="input-sm" id="crPhoneSta"></select>                            				
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
													<th>号码</th>
													<th>号码类型</th>
													<th>保留</th>
													<th>状态</th>
													<th>客户名</th>									
													<th>号码区域</th>	
													<th>号码站区</th>	
													<th>绑定设备</th>											
													<th>绑定端口</th>													
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
		
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
		
		$(document).ready(function(){
			//号码区域
			var res = ajaxCRUD("dept!findAreaAll.do", {}, false);
			var lst = res.lst;
			var html = "<option role='option' value=''>请选择营业区域</option>";
			$(lst).each(function(index) {
				var item = lst[index];
				if (item.name !== "通信管理处") {
					html += "<option role='option' value='" + item.name + "'>" + item.name + "</option>";
				}				
			});
			$("#crPhoneArea").empty();
			$("#crPhoneArea").append(html);			
			//查询号码站区
			var res = ajaxCRUD("dept!findAll.do", {}, false);
			var lst = res.lst;
			var html = null;
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option role='option' value='" + item.deptname + "'>" + item.deptname + "</option>";
			});
			$("#crPhoneSta").empty();
			$("#crPhoneSta").append(html);
		})
		
        var table_view;
        var criteria = {};
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "resPhoneNumber!findInfoByPage.do",
            	"data": criteria,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
            	{"mDataProp": "phoneNumber"},
    			{"mDataProp": "numberLevelDesc"},
    			{"mDataProp": "reservedDesc"},
    			{"mDataProp": "statusDesc"},
    			{"mDataProp": "customerName"},
    			{"mDataProp": "phoneArea"},
    			{"mDataProp": "phoneSta"},
    			{"mDataProp": "deviceCode"},
    			{"mDataProp": "portCode"}				
    		],
			 columnDefs: [],
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
        		"obj.phoneNumber": $("#crPhoneNumber").val(),
        		"obj.numberLevel": $("#crNumberLevel").val(),
        		"obj.rootDeviceCode": $("#crRootDeviceCode").val(),
        		"obj.phoneArea": $("#crPhoneArea").val(),
        		"obj.phoneSta": $("#crPhoneSta").val()
        	};
			table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
        });
        
		
		</script>

		<script id="tpl" type="text/x-handlebars-template">

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
