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
				大客户资料综合查询 
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
                           			大客户资料综合查询 
                           		</h4>
                           		<div class="widget-toolbar">
                           			<span class="badge badge-danger"></span>
                           		</div>
                           	</div>
                           	<div class="widget-body">
                           		<div class="widget-toolbox" id="widget-toolbox-1">                           		  
                           			<div class="btn-toolbar">
                           					<label>
												大客户部门：
											</label> 
											<select class="input-sm" id="name"></select>
											<label>
												客户号：
											</label>
											<input type="text" id="customerNo">
											<button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                           					<i class="icon-search green"></i>
                           						查询
                           					</button>  
                           					<button class="btn btn-sm btn-success btn-white btn-round" id="btn_infoquery">
                           					<i class="icon-search green"></i>
                           						打印报表
                           					</button> 
                           			</div>
                           		</div>
                           		<div class="widget-main padding-8">
									<table id="table_view_bigCustomer" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>客户号</th>
                          						<th>客户名称</th>
                          						<th>客户类型</th>
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
	
	<!-- 大客户所属账号 -->
	<div class="tabbable">
		<ul class="nav nav-tabs padding-18">
				<li class="active">
					<a data-toggle="tab" href="#ne"><iclass="green icon-phone bigger-120"></i> 大客户所属账号 </a>
				</li>
		</ul>

		<div id="div_sub" class="tab-pane">
			<div class="col-sm-12">
                <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                    <div>
                        
                    </div>
                </div>
				<table id="table_accountInfo" class="table table-striped table-bordered table-hover">
					<thead>
						 <tr>
							<th>客户号</th>
							<th>账单电话</th>												 
							<th>用户名称</th>
							<th>用户类别</th>
							<th>是否代收</th>
							<th>联系电话</th>												
							<th>销户标志</th>
							<th>销户日期</th>
							<th>用户地址</th>
							<th>业务区域</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- 大客户所属电话 -->
	<div class="tabbable">
		<ul class="nav nav-tabs padding-18">
				<li class="active">
					<a data-toggle="tab" href="#ne"><iclass="green icon-phone bigger-120"></i> 大客户所属电话 </a>
				</li>
		</ul>

		<div id="div_sub" class="tab-pane">
			<div class="col-sm-12">
                <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                    <div>
                        
                    </div>
                </div>
				<table id="table_userInfo" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
						 <th>电话号码</th>
						 <th>客户号</th>
						 <th>信誉度</th>
						 <th>用户名称</th>
						 <th>联系电话</th>
						 <th>用户地址</th>
						 <th>用户类型</th>
						 <th>装机日期</th>
						 <th>业务区域</th>
						 <th>状态</th>
					  </tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
		
     <script type="text/javascript">
		
		$(document).ready(function() {	
			bigCustomerInfo();
			//查询大客户号
			var res = ajaxCRUD("customer!findNameAll.do", {}, false);
			var lst = res.nameAll;
			var html = null;
			html += "<option value=''>" +'--请选择--'+ "</option>";
			$(lst).each(function(index) {
				var item = lst[index];				
				html += "<option role='option' value='" + item + "'>" + item + "</option>";
			});
			$("#name").empty();
			$("#name").append(html);
			$('#btn_infoquery').attr("disabled",true); 
		})
		
		var table_view_bigCustomer;
	    var criteria = {"obj.customerProp":1};
	    function bigCustomerInfo(){
	    	table_view_bigCustomer = $('#table_view_bigCustomer').dataTable({
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
	              	{"mDataProp": "customerType"}
	             ],      	
				 columnDefs: [{	     	           				 
				 	 	targets: 2,
     	        	 	render: function (a, b, c, d) {
	         	    	if(c.customerType==1){
	         	    		return "个人";
	         	    	}else{
	         	    		return "公司";
	         	    	}
             	      }
				    }],
				"bLengthChange": false,//
				"iDisplayLength": 5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
	    	
		//事件处理
		  $("#btn_inquiry").click(function() {
			 $("#btn_infoquery").removeAttr("disabled");
			 criteria = {
			    "obj.customerProp": 1,		 
		        "obj.name": $("#name").val(),
		        "obj.customerNo": $("#customerNo").val()		        
		       };
			 table_view_bigCustomer.fnSettings().ajax.data = criteria; 
			 table_view_bigCustomer.api().ajax.reload(); 
		 }); 
			
		//////  大客户所属账号		
		//事件处理
		$("#table_view_bigCustomer tbody").on("click", "tr", function(event) {
			$("#table_view_bigCustomer tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_bigCustomer.fnGetData(event.target.parentNode);
			showTableAccountInfo(aData.departmentId);
		});
		
		var parm;
		var table_accountInfo;
        initTableAccountInfo("");
		function showTableAccountInfo(id){
			parm = {"user.customerId":id};
			table_accountInfo.fnSettings().ajax.data = parm; 
			table_accountInfo.api().ajax.reload(); 
		}
		
		function initTableAccountInfo(id){
			parm = {"user.customerId":id};
	    	table_accountInfo = $('#table_accountInfo').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "account!findAccountInfoPage.do",
	            	"data": parm,
	            	"dataSrc": "ulst"
	            },
	            "aoColumns": [ 
	                {"mDataProp": "customerDesc"},
	              	{"mDataProp": "businessKey"},
	              	{"mDataProp": "name"},
	              	{"mDataProp": "userType"},
	               	{"mDataProp": "creditorKey"},
	               	{"mDataProp": "linkPhone"},
	               	{"mDataProp": "statusDesc"},
	               	{"mDataProp": "regDesc"},
	               	{"mDataProp": "address"},
	               	{"mDataProp": "userArea"},
	             ],      	
				 columnDefs: [{	     	           				 
				 	 	targets: 3,
     	        	 	render: function (a, b, c, d) {
	         	    	if(c.userType==1){
	         	    		return "住宅";
	         	    	}if(c.userType==2){
	         	    		return "办公";
	         	    	}if(c.userType==3){
	         	    		return "商用";
	         	    	}
             	      }
				    },{
     	            targets: 4,
        	        render: function (a, b, c, d) {
            	    	if(c.creditorKey=="已设置"){
            	    		return "代收";
            	    	}else{
            	    		return "不代收";
            	    	}
                	}
				 },{
	     	            targets: 6,
	        	        render: function (a, b, c, d) {
	            	    	if(c.statusDesc=="1"){
	            	    		return "正常";
	            	    	}else if(c.statusDesc=="9"){
	            	    		return "注销";
	            	    	}else{
	            	    		return "正在注册";
	            	    	}
	                	}
				}],
				"bLengthChange": false,//
				"iDisplayLength" :5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
		
		//////多选行
		/*  $('#table_accountInfo tbody').on('click', 'tr', function () {
		     $(this).toggleClass('selected');		     
		    }); */
	    /* $("#table_accountInfo tbody").find("tr").each(function() {
			$(this).removeClass("success");			
		});
		$(this).addClass('success'); */ 	    		
		//////////大客户所属电话
		//事件处理
		$("#table_accountInfo tbody").on("click", "tr", function(event) {
			////单选行
			/* $(this).toggleClass('success');
			var aData = table_accountInfo.fnGetData(event.target.parentNode);
			showTableUserInfo(aData.customerId); */
			/////多选行
			$(this).toggleClass('success');
			var aData = table_accountInfo.fnGetNodes();
			var bData = "";
			for(var i = 0; i < aData.length; i++){
				if($(aData[i]).hasClass('success')){
					bData += table_accountInfo.fnGetData(aData[i]).customerId + ",";					
				}
			}
			//去掉最后一个逗号(如果不需要去掉，就不用写)
		    if (bData.length > 0) {
		    	bData = bData.substr(0, bData.length - 1);
		    }
		    showTableUserInfo(bData)
		}) 
		
		var table_userInfo;
		initTableUserInfo("");
        
		function showTableUserInfo(id){
			parm = {"obj.customerId":id};
			table_userInfo.fnSettings().ajax.data = parm; 
			table_userInfo.api().ajax.reload(); 
		}
		
	    function initTableUserInfo(id){
	    	parm = {"obj.customerId":id};
	    	table_userInfo = $('#table_userInfo').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "crmUser!findUserInfoPage.do",
	            	"data": parm,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	                {"mDataProp": "businessKey"},
	              	{"mDataProp": "customerDesc"},
	              	{"mDataProp": "vipDesc"},
	              	{"mDataProp": "name"},
	               	{"mDataProp": "linkPhone"},
	               	{"mDataProp": "address"},
	               	{"mDataProp": "userType"},
	               	{"mDataProp": "effectiveTime"},
	               	{"mDataProp": "userArea"},
	               	{"mDataProp": "status"}
	             ],      	
				 columnDefs: [{	     	           				 
				 	 	targets: 6,
     	        	 	render: function (a, b, c, d) {
	         	    	if(c.userType==1){
	         	    		return "住宅";
	         	    	}if(c.userType==2){
	         	    		return "公办";
	         	    	}if(c.userType==3){
	         	    		return "商用";
	         	    	}
             	      }
				    },{
					targets: 9,
        	        render: function (a, b, c, d) {
            	    	if(c.status==0){
            	    		return "草稿";
            	    	}if(c.status==1){
            	    		return "审批";
            	    	}if(c.status==2){
            	    		return "正常";
            	    	}if(c.status==3){
            	    		return "欠费停机";
            	    	}if(c.status==4){
            	    		return "停机";
            	    	}if(c.status==90){
            	    		return "正在拆除";
            	    	}if(c.status==91){
            	    		return "拆除";
            	    	}
                	}
				 }],
				"bLengthChange": false,//
				"iDisplayLength" :5,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
		
				
		//打印报表
		$("#btn_infoquery").click(function() {
			var rptFileName = "dkhinfoquery.cpt";
			var name = $("#name").val();
			var customerNo = $("#customerNo").val()					
	        var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&name=" + name + "&customerNo=" + customerNo;
	        window.open(uri);				
		})
				
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