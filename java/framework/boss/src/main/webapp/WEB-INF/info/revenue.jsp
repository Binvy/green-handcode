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
					 营收、业务流水和统计
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
                            			营收、业务流水和统计
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            			    <label>
												时间范围:
											</label>
											<input id="startTime" type="text" class="date-timepicker" placeholder="开始时间"/> 至  
                            				<input id="endTime" type="text" class="date-timepicker" placeholder="截止时间"/> 
                            				<label>
												收款人工号:
											</label> 
											<input id="checker" type="text" name="checker"/> 
                            			    <button class="btn btn-sm btn-success btn-white btn-round" id="btn_addquiry">
                            					<i class="icon-search green"></i>
                            					添加统计工号
                            				</button>                          			    
										    <button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					统计
                            				</button>                           				                     				
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<ul class="nav nav-tabs">
											<li id="firstPage" class="active">
												<a href="#panel-1" data-toggle="tab">
													<i class="green icon-user-md bigger-110"></i>
										 			营收和业务统计信息
										 		</a>
											</li>
											<li>
											 	 <a href="#panel-2" data-toggle="tab">
											 		<i class="green icon-user-md bigger-110"></i>
											 		电话缴费明细
											 	 </a>
											</li>
											<li>
										 		<a href="#panel-3" data-toggle="tab">
										 			<i class="green icon-user-md bigger-110"></i>
										 			电话业务明细
										 		</a>
							                </li>	
							              </ul>	
							              <div class="tab-content">
							              	   <div class="tab-pane active" id="panel-1">							              		
													<table id="table_tjxx" class="table table-striped table-bordered table-hover">
														<thead>
															<tr>
																<th>业务类型</th>
																<th>费用类型</th>
																<th>笔数</th>
																<th>费用</th>																
															</tr>
														</thead>									
													</table>
													<button class="btn btn-sm btn-success btn-white btn-round" id="btn_tjxxquery">
                            							<i class="icon-search green"></i>
                            								预览/打印
                            						</button>
												</div>
												<div class="tab-pane" id="panel-2">
													<table id="table_dhjfmx" class="table table-striped table-bordered table-hover">
														<thead>
															<tr>
																<th>业务类型</th>
																<th>区域</th>
																<th>实收金额</th>
																<th>电话</th>
																<th>合同号</th>
																<th>缴费时间</th>
																<th>流水号</th>
																<th>缴费方式</th>
																<th>收款人员</th>
																<th>月份</th>
																<th>用户名称</th>																
															</tr>
														</thead>									
													</table>
													<button class="btn btn-sm btn-success btn-white btn-round" id="btn_jfmxquery">
                            							<i class="icon-search green"></i>
                            								预览/打印
                            						</button> 
												</div>
												<div class="tab-pane" id="panel-3">
													<table id="table_dhywmx" class="table table-striped table-bordered table-hover">													
														<thead>
															<tr>
															    <th>姓名</th>																
																<th>合同号</th>
																<th>业务类型</th>
																<th>电话</th>																															
																<th>受理日期</th>
																<th>受理人员</th>																
																<th>区域</th>
																<th>备注</th>																
															</tr>
														</thead>									
													</table>
													<button class="btn btn-sm btn-success btn-white btn-round" id="btn_ywmxquery">
                            							<i class="icon-search green"></i>
                            								预览/打印
                            						</button>
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
		</div>
		
		<div class="modal fade" id="dlg" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:60%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title">
						 添加工号
						</h4>
					</div>
					<div class="modal-body" id="html_gh">
						
					</div>
					<div class="modal-footer">	
					    <button type="button" class="btn btn-sm btn-primary" id="save">
							提交
						</button>
						<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">
							关闭
						</button>					
					</div>
				</div>				
			</div>			
		</div>
		
		<script type="text/javascript">
		$(document).ready(function() {
			initTableViewJf();
			initTableViewYw();
			initTableViewTjxx();
			$('.date-timepicker').datetimepicker({  
				language:  'zh-CN',  //显示中文
				autoclose: 1
	        });
			$("#btn_ywmxquery").attr("disabled",true);
			$("#btn_jfmxquery").attr("disabled",true);
			$("#btn_tjxxquery").attr("disabled",true);
			$("#btn_inquiry").attr("disabled",true);
		})	
		var userName = "${sessionScope.userInfo.userName}";
		var parm = {};
		var table_tjxx;
		function initTableViewTjxx() {
			parm = {"obj.userName":userName};
			table_tjxx = $('#table_tjxx').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
            		"url": "ocsInvoice!dhtjxx.do",
            		"data": parm,
            		"dataSrc": "lst"
            	},
        		"columns": [
						{"data": "","defaultContent": "电话营收"},
						{"mDataProp": "name"},
						{"mDataProp": "sl"},
						{"mDataProp": "amount"}
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
			})
		}
		
		var table_dhjfmx;
		function initTableViewJf() {
			parm = {"obj.userName":userName};
			table_dhjfmx = $('#table_dhjfmx').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
            		"url": "ocsInvoice!dhjfmx.do",
            		"data": parm,
            		"dataSrc": "lst"
            	},
        		"columns": [
						{"mDataProp": "userType"},    
						{"mDataProp": "businessSta"},
						{"mDataProp": "amount"},
						{"mDataProp": "userKey"},
						{"mDataProp": "customerNo"},
						{"mDataProp": "createTime"},
						{"mDataProp": "invoiceNo"},
						{"mDataProp": "payMethod"},
						{"mDataProp": "creater"},
						{"mDataProp": "billMonth"},
						{"mDataProp": "name"}
            	],
				columnDefs: [{	     	           				 
				 	 targets: 0,
	 	        	 render: function (a, b, c, d) {
		         	     if(c.userType=="p"){
		         	    	return "电话";
		         	     }else if(c.userType=="b"){
		         	    	return "宽带";
		         	     }else if(c.userType=="l"){
		         	    	return "专线";
		         	     }
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
			})
		}
		
		var table_dhywmx;
		function initTableViewYw() {
			parm = {"obj.userName":userName};
			table_dhywmx = $('#table_dhywmx').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
            		"url": "ocsInvoice!dhjfyw.do",
            		"data": parm,
            		"dataSrc": "lst"
            	},
        		"columns": [
						{"mDataProp": "bName"},
						{"mDataProp": "customerNo"},
						{"mDataProp": "cName"},
						{"mDataProp": "userKey"},						
						{"mDataProp": "originateTime"},
						{"mDataProp": "originator"},
						{"mDataProp": "businessSta"},
						{"mDataProp": "remark"}		
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
			})
		}
		
		//添加工号
		$("#btn_addquiry").click(function() {
			 $("#dlg").modal("show");
			 $("#btn_inquiry").removeAttr("disabled");
			 var resData = ajaxCRUD("ocsInvoice!selectDeptByName.do", {}, false);
			 var lst = resData.lst;
			 var html = "";
			 $(lst).each(function(index) {
				  var item = lst[index];
				  if (html.indexOf(item.deptName) > 0) {
					html += "<input type='checkbox' value='"+item.userName+"' name='"+item.deptId+"' onclick=checkName('"+item.deptId+"','"+item.userName+"') id='"+item.userName+"'>" + item.userName;
				  } else {
					html += "</br>";
				  	html += "<input type='checkbox' value='" + item.deptName + "' onclick=checkDept('"+item.deptId+"') >" + item.deptName + "</br>";	
				  	html += "<input type='checkbox' value='"+item.userName+"' name='"+item.deptId+"' onclick=checkName('"+item.deptId+"','"+item.userName+"') id='"+item.userName+"'>" + item.userName;
				  }
			 });
			 $("#html_gh").empty();
			 $("#html_gh").append(html);
		});
		
		function checkDept(deptId){		
			$("input[name='"+deptId+"']").each(function () {
                if ($(this).prop("checked")) {
                    $(this).removeProp("checked");
                } else {                	
                    $(this).prop("checked", true);
                    var obj = document.getElementsByName(deptId);
                    var str = "";
                    for(i=0;i<obj.length;i++){
                    	 str += obj[i].id + ",";
                    }
                    if (str.length > 0) {
                    	str = str.substr(0, str.length - 1);
        		    }           
                }
                $("#checker").val(str);
            })			
		}
		
		function checkName(deptId,userName){
			$("input[name='"+deptId+"']").each(function () {
				var obj = document.getElementsByName(deptId);
                var str = "";
                for(i=0;i<obj.length;i++){
                	if(obj[i].checked) {
                		str += obj[i].id + ",";
                	}               	 
                }
                if (str.length > 0) {
                	str = str.substr(0, str.length - 1);
    		    }  
                $("#checker").val(str);
			})
		}
		
		$("#save").click(function(){			
			$("#dlg").modal("hide");
		});
		
		function indexof(str){
			var st = "";
			var strs= new Array(); //定义一数组 
			strs=str.split(","); //字符分割 
			for (i=0;i<strs.length ;i++ ) 
			{ 	
			  st+="'"+strs[i]+"',";
			} 
			if (st.length > 0) {
            	st = st.substr(0, st.length - 1);
		    } 
			return st;
		}
		
		//打印/预览		
		$("#btn_tjxxquery").click(function() {	
			var rptFileName = "Duty_radkdls.cpt";
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			var checker = indexof($("#checker").val());
			var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&startTime=" + startTime + "&endTime=" + endTime + "&checker=" + checker + "&userName=" + userName;
	        window.open(uri);
		})
		$("#btn_jfmxquery").click(function() {
			var rptFileName = "Duty_dhjiaofei.cpt";
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			var checker = indexof($("#checker").val());
			var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&startTime=" + startTime + "&endTime=" + endTime + "&checker=" + checker + "&userName=" + userName;
			window.open(uri);
		})
		$("#btn_ywmxquery").click(function() {
			var rptFileName = "Duty_dhjob.cpt";
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			var checker = indexof($("#checker").val());
			var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&startTime=" + startTime + "&endTime=" + endTime + "&checker=" + checker + "&userName=" + userName;
			window.open(uri);
		})
		
		$("#btn_inquiry").click(function() {	
			$("#btn_ywmxquery").removeAttr("disabled");
			$("#btn_jfmxquery").removeAttr("disabled");
			$("#btn_tjxxquery").removeAttr("disabled");
			parm = {
				"obj.startTime":$("#startTime").val(),
				"obj.endTime":$("#endTime").val(),
				"obj.checker":$("#checker").val()
			}
			table_dhjfmx.fnSettings().ajax.data = parm; 
			table_dhjfmx.api().ajax.reload(); 
			table_dhywmx.fnSettings().ajax.data = parm; 
			table_dhywmx.api().ajax.reload();
			table_tjxx.fnSettings().ajax.data = parm; 
			table_tjxx.api().ajax.reload();			
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