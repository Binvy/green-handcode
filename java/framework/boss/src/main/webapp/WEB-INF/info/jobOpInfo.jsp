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
					业务工单查询
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
                            			 业务工单查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            			    <label>业务类型:</label>
											<select calss="input-sm" id="businessChName">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="电话">电话</option>
												<option role="option" value="宽带">宽带</option>
												<option role="option" value="专线">专线</option>
										    </select>
                            			    <label>业务名称:</label>
											<select calss="input-sm" id="processDefinitionName">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="装机">装机</option>
												<option role="option" value="拆机">拆机</option>
												<option role="option" value="移机">移机</option>
												<option role="option" value="业务变更">业务变更</option>
												<option role="option" value="过户">过户</option>
												<option role="option" value="电话改号">电话改号</option>
												<option role="option" value="停复机">停复机</option>
												<option role="option" value="电话调级">电话调级</option>
											</select>
                            			    <label>客户名称:</label>		                 											
											<input type="text" id="customerName" />
											<label>号码:</label>										
											<input type="text" id="userKey"/>																					
											<label>状态:</label> 
											<select calss="input-sm" id="status">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="1">办理中</option>
												<option role="option" value="9">完工</option>
												<option role="option" value="91">撤销</option>
											</select>
											<label>时间:</label> 
											<input id="crStartTime" type="text" class="date-timepicker" placeholder="开始时间"/> - 
                            				<input id="crEndTime" type="text" class="date-timepicker" placeholder="截止时间"/>											
											<label>业务区域:</label> 
											<select class="input-sm" id="businessSta">
										    </select>
										    <label>部门:</label> 
										    <input type="text" id="deptDesc"/>
										    <button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>                     				
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_jobOpInfo" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
												 <th>客户号</th>
												 <th>电话</th>												 
												 <th>客户名称</th>
												 <th>业务区域</th>												 
												 <th>业务类型</th>
												 <th>工单日期</th>												
												 <th>工单发起人</th>
												 <th>业务操作名称</th>
												 <th>状态</th>
												 <th>部门</th>
												 <th>查看详细</th>
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
		$(document).ready(function() {
			$("[data-toggle='tooltip']").tooltip();
			//加载数据
			initTablejobOpInfo();
			//查询业务区域
			var res = ajaxCRUD("dept!findAll.do", {}, false);
			var lst = res.lst;
			var html = null;
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option role='option' value='" + item.deptname + "'>" + item.deptname + " " + item.abbr + "</option>";
			});
			$("#businessSta").empty();
			$("#businessSta").append(html);
			$(".date-timepicker").datetimepicker();
		});
		
		var table_jobOpInfo;
	    var criteria = {};
	    function initTablejobOpInfo(){
	    	table_jobOpInfo = $('#table_jobOpInfo').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "jobOpInstance!goToPage.do",
	            	"data": criteria,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	                {"mDataProp": "customerNo"},
	              	{"mDataProp": "userKey"},
	              	{"mDataProp": "customerName"},
	              	{"mDataProp": "businessSta"},
	               	{"mDataProp": "businessChName"},
	               	{"mDataProp": "originateTime"},
	               	{"mDataProp": "originator"},
	               	{"mDataProp": "businessOpName"},
	               	{"mDataProp": "status"},
	               	{"mDataProp": "deptDesc"},
	            	{"mDataProp": ""}
	             ],      	
				 columnDefs: [{
	     	            targets: 8,
	        	        render: function (a, b, c, d) {
	            	    	if(c.status=="1"){
	            	    		return "办理中";
	            	    	}else if(c.status=="9"){
	            	    		return "完工";
	            	    	}else{
	            	    		return "撤销";
	            	    	}
	                	}
				   },{
                    targets: 10,
                    render: function (a, b, c, d) {
                    	console.log(arguments);
                    	var func = [];
                    	func.push({"fn": "viewjobOpInfo(" + JSON.stringify(c) + ")", "color": "blue", "icon": "user-md", "tooltip": "详细信息"});
                        var context =
                        {
                            "func": func 
                        };
                        var html = template(context);
                        return html;
                    }
                }],
				"bLengthChange": false,//
				"iDisplayLength" :10,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"bDestory": true,
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
	     //事件处理
		 $("#btn_inquiry").click(function() {
			 criteria = {
		        "obj.processDefinitionName": $("#processDefinitionName").val(),
		        "obj.customerName": $("#customerName").val(),
		        "obj.userKey": $("#userKey").val(),
		        "obj.status": $("#status").val(),
		        "obj.businessSta": $("#businessSta").val(),
		        "obj.deptDesc": $("#deptDesc").val(),
		        "obj.startTime": $("#crStartTime").val(),
		        "obj.endTime": $("#crEndTime").val(),
		        "obj.businessChName": $("#businessChName").val()
		       };
			 table_jobOpInfo.fnSettings().ajax.data = criteria; 
			 table_jobOpInfo.api().ajax.reload(); 
		 });
		 
		function viewjobOpInfo(obj){
		   loadJobOpInfo(obj.id); 
		   loadCustomerInfo(obj.customerNo);
		   loadAccountInfo(obj.customerNo);
		   loadUserInfo(obj.userId);
		   loadOrderInfoById(obj.id, obj.userId, obj.userKey);
		   $("#dlgJobOpInfo").modal("show");
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
    
    <jsp:include page="../info/dlgJobOpInfo.jsp" flush="true"/>
</body>
</html>