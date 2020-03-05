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
<div>
    <div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon green"></i>
					<a href="#">财务管理</a>
				</li>
				<li class="active">
					自定义发票查询
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
                            			 自定义发票查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">                            			   											
                            			    <label>
												客户名称:
											</label>		                 											
											<input type="text" id="yhmc" />
											<label>
												号码:
											</label>										
											<input type="text" id="dh"/>																					
											<label>
												付费方式:
											</label> 
											<select calss="input-sm" id="payFlag">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="现金">现金</option>
												<option role="option" value="内行">内行</option>
												<option role="option" value="支票">支票</option>
											</select>
											<label>
												时间:
											</label> 
											<input id="crStartTime" type="text" class="date-timepicker" placeholder="开始时间"/> - 
                            				<input id="crEndTime" type="text" class="date-timepicker" placeholder="截止时间"/>											
											<label>
												工号:
											</label> 
											<input type="text" id="skrid"/>
										    <label>
										                    状态:
										    </label> 
										    <select calss="input-sm" id="isdestroy">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="0">正常</option>
												<option role="option" value="1">撤销</option>
											</select>
										    <button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>  
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_save">
                            					<i class="icon-search green"></i>
                            					添加
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_InfoPoint">
                            					<i class="icon-search green"></i>
                            					打印
                            				</button>                     				
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_reportInfo" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
												 <th>电话</th>
												 <th>用户名称</th>												 
												 <th>付费方式</th>
												 <th>费用金额</th>												 
												 <th>打印时间</th>
												 <th>流水号</th>												
												 <th>工号</th>
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
			//加载数据
			initTableReportInfo();
			$(".date-timepicker").datetimepicker();
			$("#btn_InfoPoint").attr("disabled",true);
		});
		
		var table_reportInfo;
	    var criteria = {};
	    function initTableReportInfo(){
	    	table_reportInfo = $('#table_reportInfo').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "ocsBill!findReportInfoPage.do",
	            	"data": criteria,
	            	"dataSrc": "rlst"
	            },
	            "aoColumns": [ 
	                {"mDataProp": "dh"},
	              	{"mDataProp": "yhmc"},
	              	{"mDataProp": "payFlag"},
	              	{"mDataProp": "fee"},
	               	{"mDataProp": "accttime"},
	               	{"mDataProp": "lsz"},
	               	{"mDataProp": "skrid"},
	               	{"mDataProp": "isdestroy"},
	               	{"mDataProp": ""}
	             ],      	
				columnDefs: [{
     	            targets: 7,
        	        render: function (a, b, c, d) {
            	    	if(c.isdestroy=="0"){
            	    		return "正常";
            	    	}else if(c.isdestroy=="1"){
            	    		return "撤销";
            	    	}
                	}
			   },{
                   targets: 8,
                   render: function (a, b, c, d) {
                   	var func = [];
                   	func.push({"fn": "isDestory('" + c.id + "')", "color": "blue", "icon": "bars", "tooltip": "撤销"});
                   	func.push({"fn": "newReport('" + c.id + "')", "color": "blue", "icon": "pencil", "tooltip": "重打"});
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
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
	    }
	     //事件处理
		 $("#btn_inquiry").click(function() {
			 $("#btn_InfoPoint").removeAttr("disabled");
			 criteria = {
		        "report.yhmc": $("#yhmc").val(),
		        "report.dh": $("#dh").val(),
		        "report.payFlag": $("#payFlag").val(),
		        "report.startTime": $("#crStartTime").val(),
		        "report.endTime": $("#crEndTime").val(),
		        "report.skrid": $("#skrid").val(),
		        "report.isdestroy": $("#isdestroy").val()
		       };
			 table_reportInfo.fnSettings().ajax.data = criteria; 
			 table_reportInfo.api().ajax.reload(); 
		 })	
		 
	  $("#btn_save").click(function() {
		  var rptFileName = "selfconfigreport.cpt";
		  var userName = "${sessionScope.userInfo.userName}";
		  var parm = {"userName":userName};
		  var res = ajaxCRUD("ocsBill!pjhInfo.do", parm, false); 
		  var invoiceNo = res.invoiceNo;
		  var area = res.area;
		  var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName+"&op=write" + "&userName=" + userName + "&invoiceNo=" + invoiceNo + "&area=" + area;
		  window.open(uri);
	  })
	  
	  //撤销
	  function isDestory(id){
		  var userName = "${sessionScope.userInfo.userName}";
		  var parm = {
				  "userName":userName,
				  "pid":id
				  };
		  var res = ajaxCRUD("ocsBill!isDestory.do", parm, false);
		  if(res.resNum=="0"){
			  bbAlert("操作成功！");
		  }else{
			  bbAlert("操作失败！");
		  }
	  }
	     
	  //重新打印
	  function newReport(id){
		  var rptFileName = "selfconfigreport1.cpt";
		  var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&id=" + id;
		  window.open(uri);
	  }
	  
	  $("#btn_InfoPoint").click(function() {
		  var rptFileName = "selfconfigreport2.cpt";
		  var yhmc = $("#yhmc").val();
	      var dh = $("#dh").val();
	      var payFlag = $("#payFlag").val();
	      var crStartTime = $("#crStartTime").val();
	      var crEndTime = $("#crEndTime").val();
	      var skrid = $("#skrid").val();
	      var isdestroy = $("#isdestroy").val()
		  var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&yhmc=" + yhmc + "&dh=" + dh + "&payFlag=" + payFlag + "&crStartTime=" + crStartTime + "&crEndTime=" + crEndTime + "&skrid=" + skrid + "&isdestroy=" + isdestroy;
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