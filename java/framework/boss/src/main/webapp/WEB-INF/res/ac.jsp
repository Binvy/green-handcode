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
					<a href="#">资源管理</a>
				</li>
				<li class="active">
					自控日志
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
                            			<i class="icon-indent-right blue bigger-110"></i>
                            			自控日志
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<select id="crStatus">
                            					<option value="">--状态--</option>
                            					<option value="0">确认</option>
                            					<option value="1">生成指令</option>
                            					<option value="2">执行</option>
                            					<option value="9">完成</option>
                            					<option value="91">空指令</option>
                            					<option value="98">失败重试</option>
                            					<option value="99">失败</option>
                            				</select>
                            				<select id="crBusinessType">
                            				</select>
                            				<select id="crOssKey">
                            				</select>
                            				<input class="" id="crBusinessKey" type="text" placeholder="电话、账号、业务号" style="width:200px"/>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>											
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>业务类型</th>
													<th>业务号</th>
													<th>指令</th>
													<th>指令名称</th>
													<th>生成时间</th>
													<th>执行时间</th>
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
				
					<div id="ne1" class="tab-pane">
						<div class="col-sm-12">
                            <div class="row">
                            <!-- treeview -->
                            <div class="widget-box widget-color-blue2">
                            	<div class="widget-header">
                            		<h4 class="widget-title lighter smaller">
                            			<i class="icon-ticket green bigger-110"></i>
                            			业务指令
                            		</h4>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
											
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_command" class="table table-striped table-bordered table-hover" style="table-layout:fixed">
											<thead>
												<tr>
													<th>设备</th>
													<th>指令</th>												 
													<th>结果码</th>
													<th>结果描述</th>	
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

		<div class="modal fade" id="dlg" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:70%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title">
						</h4>
					</div>
					<input type="hidden" id="id">
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">设备：</label>
								<div class="col-xs-4">
									<input type="text" id="deviceCode" class="form-control"/>
								</div>
								<label class="col-xs-2 control-label no-padding">结果码：</label>
								<div class="col-xs-4">
									<input type="text" id="retCode" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">指令：</label>
								<div class="col-xs-10">
									<input type="text" id="cmd" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">结果描述：</label>
								<div class="col-xs-10">
									<input type="text" id="retDesc" class="form-control"/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary" id="save_command">
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
		
        var table_view;
        var criteria = {};

    	/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
		$(document).ready(function() {
			loadRef("ref_business_type", "crBusinessType", "--业务类型--");
			loadRef("ref_oss_key", "crOssKey", "--指令--");
			initTableView();
		});
		
		function initTableView() {
			table_view = $('#table_view').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
            		"url": "ac!findByPage.do",
            		"data": criteria,
            		"dataSrc": "lst"
            	},
        		"columns": [   
					{ 
						"data": "businessType",
						"width": "120px",
					},
            		{ 
            			"data": "businessKey",
            			"width": "120px",
            		},
            		{ 
            			"data": "ossKey",
            			"width": "120px",
            		},
            		{ 
            			"data": "ossKeyName",
            			"width": "120px",
            		},
            		{ 
            			"data": "createTime",
            			"width": "200px",
            		},
            		{ 
            			"data": "updateTime",
            			"width": "200px",
            		},
            		{ 
            			"data": "statusDesc",
            			"width": "100px",
            		},
            		{ 
            			"data": "null",
            			"width": "200px",
                		"defaultContent": ''
            		},
            	],
				columnDefs: [{
                    targets: 0,
                    render: function (a, b, c, d) {
                    	if(c.businessType == "p"){
                    		return "电话";
                    	}else if(c.businessType == "b"){
                    		return "宽带";
                    	}else if(c.businessType == "l"){
                    		return "专线";
                    	}                    	
                   	 }
                	},{
	                    targets: 7,
	                    render: function (a, b, c, d) {
	                    	var fs = [];
	                    	if (c.status > 1) {
	                    		fs.push({"fn": "reset('" + c.id + "')", "color": "red", "icon": "refresh", "tooltip": "重置执行"});	                    		
	                    	}
	                    	fs.push({"fn": "rerun('" + c.id + "')", "color": "green", "icon": "pencil", "tooltip": "重新执行"});                    	
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
		
		//事件处理
		$("#table_view tbody").on("click", "tr", function(event) {
			$("#table_view tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view.fnGetData(event.target.parentNode);
			showTableCommand(aData.id);
		});
		
		var parm;
		var table_command;
        initTableCommand("");
		function showTableCommand(id){
			parm = {"id":id};
			table_command.fnSettings().ajax.data = parm; 
			table_command.api().ajax.reload(); 
		}
		
		var remarkShowLength = 80;//默认现实的字符串长度
		
		function initTableCommand(id){
			parm = {"id":id};
			table_command = $('#table_command').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "ac!findCmdsByActId.do",
	            	"data": parm,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 	         	              		                      		            		
					{ 
						"data": "deviceCode",
						"width": "100px",
					},
            		{ 
            			"data": "cmd",
            			"width": "350px",
            		},
            		{ 
            			"data": "retCode",
            			"width": "120px",
            		},
            		{ 
            			"data": "retDesc",
            			"width": "120px",
            		},
            		{ 
            			"data": "null",
            			"width": "100px",
            			"defaultContent": ''
            		},
	             ], 
	             "createdRow": function( row, data, dataIndex ) {
            	   if(data.cmd.length > remarkShowLength){//只有超长，才有td点击事件
            	      $(row).children('td').eq(1).attr('onclick','javascript:changeShowRemarks(this);');
            	      $(row).children('td').eq(1).css({"width":"100", "word-break": "break-all"});
            	   }
            	   $(row).children('td').eq(1).attr('content',data.cmd);
	             },
				 columnDefs: [
			         {
		                 "type": "date",
		                 "targets": 1,
		                 "render": function (data, type, full, meta) {
		                 if (full.cmd.length > remarkShowLength) {
		         		  	return getPartialRemarksHtml(full.cmd);//显示部分信息
		         	     } else {
		         	 		return full.cmd;//显示原始全部信息
		         	 		}
		         	     }
			        },{
	                    targets: 4,
	                    render: function (a, b, c, d) {
	                    	var context =
	                        {
	                            func: [
	                                {"fn": "remodify(" + JSON.stringify(c) + ")", "color": "green", "icon": "pencil"}	                           
	                            ]
	                        };
	                        var html = template(context);
	                        return html;
	                    }
               		 }            
				 ],
				 "bLengthChange": false,//
				 "iDisplayLength" :10,
				 "scrollCollapse": true,
				 "searching":false,//关闭dataTable自带搜索
				 "bPaginate": false,//开启分页功能
				 "bSort" : false,//关闭排序
				 "language": { //国际化
					"url": "assets/js/Chinese.json"
				 }
			});
	    }
	    
	    function changeShowRemarks(obj){//obj是td
	    	   var content = $(obj).attr("content");
	    	   if(content != null && content != ''){
	    	      if($(obj).attr("isDetail") == 'true'){//当前显示的是详细备注，切换到显示部分
	    	         //$(obj).removeAttr('isDetail');//remove也可以
	    	         $(obj).attr('isDetail',false);
	    	         $(obj).html(getPartialRemarksHtml(content));
	    	      }else{//当前显示的是部分备注信息，切换到显示全部
	    	         $(obj).attr('isDetail',true);
	    	         $(obj).html(getTotalRemarksHtml(content));
	    	      }
	    	   }
		}
	    
	  //部分备注信息
	    function getPartialRemarksHtml(remarks){
	          return remarks.substr(0,remarkShowLength) + '&nbsp;&nbsp;<a href="javascript:void(0);" ><b>...</b></a>';
	    }

	    //全部备注信息
	    function getTotalRemarksHtml(remarks){
	          return remarks + '&nbsp;&nbsp;<a href="javascript:void(0);" >收起</a>';
	    }
				
		function reset(id) {
			var res = ajaxCRUD("ac!reset.do", {"id": id}, true);
			if (res.resNum == "0") {
				table_view.api().ajax.reload();
			}
		}
		
		function rerun(id) {
			var res = ajaxCRUD("ac!rerun.do", {"id": id}, true);
			if (res.resNum == "0") {
				table_view.api().ajax.reload();
			}
		}
		
		function remodify(obj) {			
			$("#dlg_title").text("修改业务指令");
			detail(obj);
            $("#dlg").modal("show");							
		}
		
		function detail(obj) {
			$("#id").val(obj.id);
			$("#deviceCode").val(obj.deviceCode);
        	$("#cmd").val(obj.cmd);
        	$("#retCode").val(obj.retCode);
        	$("#retDesc").val(obj.retDesc);
		}
		
		$("#save_command").click(function() {
			var parm = {
    			"ac.id": $("#id").val(),
    			"ac.deviceCode": $("#deviceCode").val(),
    			"ac.cmd": $("#cmd").val(),
    			"ac.retCode": $("#retCode").val(),
    			"ac.retDesc": $("#retDesc").val()
	        };
			var resData = ajaxCRUD("ac!updateCommand.do", parm, true);
			if (resData.resNum == "0") {
				table_command.api().ajax.reload();
				$("#dlg").modal("hide");
        	}
		})
		
		$("#btnInquiry").click(function() {
			criteria = {};
			if ($("#crOssKey").val() != "") {
				criteria["obj.ossKey"] = $("#crOssKey").val();
			}
			if ($("#crBusinessKey").val() != "") {
				criteria["obj.businessKey"] = $("#crBusinessKey").val();
			}
			if ($("#crStatus").val() != "") {
				criteria["obj.status"] = $("#crStatus").val();
			}
			if ($("#crBusinessType").val() != "") {
				criteria["obj.businessType"] = $("#crBusinessType").val();
			}
			table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
		});
		
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
