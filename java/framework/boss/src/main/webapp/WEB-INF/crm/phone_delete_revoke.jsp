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
		<!-- page specific plugin styles -->
		<!-- fonts -->
		<link rel="stylesheet" href="assets/font/fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker/datetimepicker.css" />
		<link rel="stylesheet" href="assets/css/chosen.css" />
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
		<!-- zTree -->
		<link rel="stylesheet" href="assets/css/zTreeStyle/metro.css">
		<!-- inline styles related to this page -->
		<link rel="stylesheet" href="css/datatable.css">
		<!-- button css -->
		<link rel="stylesheet" href="assets/css/buttons.css">

		<script src="assets/js/ace-extra.min.js"></script>	
		<!-- inline styles related to this page -->
		
		<!-- basic scripts -->
		<script src="assets/js/handlebars-v3.0.1.js"></script>
		<script type="text/javascript" src="assets/js/crud/crud.js"></script>
		
		<script src='assets/js/jquery-2.0.3.min.js'></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script src="assets/js/chosen.jquery.min.js"></script>
		<script src="assets/js/jquery.dataTables.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="assets/js/crud/crud.js"></script>
		<script src="assets/js/datepicker/bootstrap-datetimepicker.js"></script>
		<script src="assets/js/datepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="assets/js/jquery.tabledit.min.js"></script>
		<script src="assets/js/bootstrap-select.min.js"></script>
		<script src="assets/js/defaults-zh_CN.js"></script>
		<!-- Customize -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<script src="assets/js/crud/crud.js"></script>
		<script src="assets/js/handlebars-v3.0.1.js"></script>
		<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="assets/js/bootstrap-dialog.min.js"></script>
			
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">电话业务受理</a>
				</li>
				<li class="active">
					拆机恢复
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="icon-magic red"></i>
									拆机恢复&nbsp;&nbsp;&nbsp;&nbsp;<code style="color: red;font-size: 10px;background: transparent;">( 带  * 的为必填项  )</code>
							</h3>
						</div>
						
						<!-- tab-panel标签页部分 -->
						<div class="panel-body">
							<!-- <form class="form-horizontal" role="form">  -->
								<div class="tabbable" id="tabtable1">
								
					 				
									<div class="tab-content">
										<!-- 拆机 -->
										<div class="tab-pane active">
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="businessKey" class="col-sm-1 control-label">
					 								电话号码<code style="color:red; text-align: right; background-color: transparent;">*</code>
				 								</label>
												<div class="col-sm-3">
													<div class="input-group">
													<input id="userId" type="hidden"/>
													<input class="form-control" id="businessKey" type="text" placeholder="选择号码"/>
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" id="btnChooseUser">
															<i class="ace-icon fa fa-calendar bigger-110"></i>
															选择
														</button>
													</span>
													</div>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="linkPhone1" class="col-sm-1 control-label">联系电话</label>
												<div class="col-sm-3">
													<input class="form-control" id="linkPhone1" type="text" placeholder="请输入联系电话"/>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="revokeReason" class="col-sm-1 control-label">恢复原因</label>	
				 								<div class="col-sm-5">	
													<textarea class="form-control" id="revokeReason" rows="3" cols="80" placeholder="请输入原因"></textarea>
				 								</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2"></div>
												<label for="revokeRemark" class="col-sm-1 control-label">备注</label>	
				 								<div class="col-sm-5">	
													<textarea class="form-control" id="revokeRemark" rows="3" cols="80" placeholder="请输入备注"></textarea>
				 								</div>
											</div>
											
										</div>
										
									<!-- panel end -->
									
									</div>
								</div>					
							<!-- </form> -->
						</div>
								<div id="ne" class="tab-pane">
						<div class="col-sm-12">
                            <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                                <div>
                                </div>
                            </div>
							<table id="table_view_revoke" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>
											流程标识
										</th>
										<th>
											流程名称
										</th>
										<th>
											客户名称
										</th>
										<th>
											号码
										</th>
										<th>
											发起人
										</th>
										<th>
											发起时间
										</th>
										<th>
											结束时间
										</th>
										<th>
											操作
										</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
						<div class="panel-footer" style="text-align: right;" >
							<button type="button" id="save" class="btn btn-sm btn-primary">恢复</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">重置</button>
							
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script type="text/javascript">
		
		var parentProductId = "p"; // Used by product.js
		var businessType = "P";
		var opType = "delete_revoke";
		var busiType = (businessType + "_" + opType).toLowerCase(); // Used by fee.js
		var deptName = "${sessionScope.userInfo.deptName}";
		$(function() {
			$("[data-toggle='tooltip']").tooltip();
		});
       
       	 
        // 选择号码
        var table_view_revoke;
		var op = "${sessionScope.userInfo.userName}";
        $("#btnChooseUser").click(function() { 
        	var userkey=$("#businessKey").val();
        	var parm = { "userKey": userkey };		
        	var res = ajaxCRUD("crmUser!findDebitUserCount.do", parm);
        	if(res.i == 0){
        		alert("该用户没有拆机或者拆机没有完工！！！");
        		if (table_view_revoke) {
        			table_view_revoke.fnSettings().ajax.data = parm; 
        			table_view_revoke.api().ajax.reload();
        		return;
        		}
        		return;
        	} 
        	var re = ajaxCRUD("crmUser!findCustormUserCount.do", parm);
        	if(re.j===0){
        		alert("该用户没有拆机或者拆机没有完工！！！");
        		if (table_view_revoke) {
        			parm=null;
        			table_view_revoke.fnSettings().ajax.data = parm; 
        			table_view_revoke.api().ajax.reload();
        		return;
        		}
        		return;
        	}
        	var lst =  ajaxCRUD("crmUser!findDebitUser.do", parm);
        	  $("#linkPhone1").val(lst.linkPhone);
        	 if (table_view_revoke) {
        		 table_view_revoke.fnSettings().ajax.data = parm; 
        		 table_view_revoke.api().ajax.reload();
    		return;
    	} 
        	
        	 table_view_revoke = $('#table_view_revoke').dataTable({
					"serverSide": true, //服务器模式，分页用
					"destroy": true,
					"ajax": {
		            	"type": "post",
		            	"url": "crmUser!findDebitUserKeys.do",
		            	"data": parm,
		            	"dataSrc": "lsts"
		            },
		           
		            "aoColumns": [ 
		            	{"mDataProp": "processDefinitionKey"},
		    			{"mDataProp": "processDefinitionName"},
		    			{"mDataProp": "customerName"},
		    			{"mDataProp": "userKey"},
		    			{"mDataProp": "originator"},
		    			{"mDataProp": "originateTime"},
		    			{"mDataProp": "instanceEndTime"},
						{"mDataProp": ""}
		    		],
					 columnDefs: [
		                 {
		                    targets: 7,
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
					"bPaginate": false,//开启分页功能
					"bSort" : false,//关闭排序
					"language": { //国际化
				    "url": "assets/js/Chinese.json"
				    
					}
		            
		           	
				});
				
					
        });
        

        $("#save").click(function() {
        	var userkey=$("#businessKey").val();
        	var op = "${sessionScope.userInfo.userName}";
        	var reason ="业务类型:" + busiType + ",拆机原因:" + ($("#revokeReason").val() ? $("#revokeReason").val() + ";" : "");
        	var remark = "备注:" + ($("#revokeRemark").val() ? $("#revokeRemark").val() + ";" : "");
	        var	parm = {
	        		"obj.creator": op,
	        		"obj.opType": opType,
	        		"obj.businessType": businessType,
	        		"obj.businessKey": userkey,
	        		"obj.remark": reason + remark,
	        		"obj.linkPhone": $("#linkPhone1").val()
        	};
	       
	       var r = ajaxCRUD("order!findDebitUserSave.do", parm);
	       
	    	   alert(r.res);
             
	    	   reset(); 
	        
        }); 
        $("#reset").click(function(){
        	reset(); 
        });
        
        function reset(){
        	$(".khtips").remove();
           	
        	$("#linkPhone1").val("");
        	$("#businessKey").val("");
        	$("#revokeRemark").val("");
        	$("#revokeReason").val("");
        	var parm = null;
        	table_view_revoke.fnSettings().ajax.data = parm; 
			table_view_revoke.api().ajax.reload();
        	
        }
 
  		function viewUserInfo(obj) {
			loadCustomerInfo(obj.customerId);
			loadAccountInfo(obj.customerId);
			loadUserInfo(obj.userId);
			loadOrderInfo(obj);
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
			
        </script>
        <jsp:include page="../pub/userInfo.jsp" flush="true"/>
		
		
		
        
	</body>
</html>
		