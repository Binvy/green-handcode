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
		<link rel="stylesheet" href="assets/css/datepicker.css" />
		<link rel="stylesheet" href="assets/css/datepicker/bootstrap-datetimepicker.min.css" />
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">话单分拣</a>
				</li>
				<li class="active">
					分拣日志
				</li>
			</ul>
			<!-- .breadcrumb -->
		</div>


		<div class="page-content">
			<div id="user-profile-2" class="user-profile">
				<div class="tabbable">
					<ul class="nav nav-tabs padding-18">
						<li class="active">
							<a data-toggle="tab" href="#ne"> <i
								class="green icon-bookmark-empty bigger-120"></i> 日志列表 </a>
						</li>
					</ul>

					<div id="ne" class="tab-pane">
						<div class="col-sm-12">
                            <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                                <div>
                                    <br/>
                                </div>
                            </div>
                            <div class="widget-toolbox" id="widget-toolbox-1">
	                   			<div class="btn-toolbar">
	                   				<div class="col-md-12 column"><div class="row clearfix">
	                   					<div class="col-md-2 column">
	                   						<button class="btn btn-success btn-white btn-round" id="btnDelete">
	                   							<i class="icon-trash orange"></i>
	                   							批量删除
	                   						</button>
		                   				</div>
	                   					<div class="col-md-2 column">
	                   						<input class="form-control" id="crHost" type="text" placeholder="主机"/>
	                   					</div>
	                   					<div class="col-md-2 column">
	                   						<input class="form-control" id="crFileName" type="text" placeholder="文件名"/>
	                   					</div>	                   					
	                   					<div class="col-md-3 column">
	                   						<div class="input-group">
	                   							<input id="crCreateTime" type="text" class="form-control date-timepicker" placeholder="日志采集时间"/>
	                   							<span class="input-group-addon"><i class="icon-calendar bigger-110"></i></span>
	                   						</div>
	                   					</div>
	                   					<div class="col-md-1 column">
	                   						<button class="btn btn-success btn-white btn-round" id="btnInquiry">
	                   							<i class="icon-search green"></i>
	                   							查询
	                   						</button>
		                   				</div>
		                   				<div class="col-md-1 column">
	                   						<button class="btn btn-success btn-white btn-round" id="btnReset">
	                   							<i class="icon-repeat green"></i>
	                   							重置
	                   						</button>
		                   				</div>
	                   				</div></div>
	                   			</div>
							<table id="table_view" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>
											<input type="checkbox" id="check_all" name="check_all" checked>&nbsp&nbsp全选
										</th>
										<th>
											主机
										</th>
										<th>
											文件名
										</th>
										<th>
											状态
										</th>
										<th>
											话单数
										</th>
										<th>
											异常话单数
										</th>
										<th>
											采集时间
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
				</div>
			</div>
		</div>


		<!-- 模态框（Modal） -->
		<div class="modal fade" id="dlg" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:50%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title">
						</h4>
					</div>

					<input type="hidden" id="flag" value="">
					<input type="hidden" id="id" name="cdrSource.id" value="">
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									主机：
								</label>
								<div class="col-xs-4">
									<input type="text" id="host" name="obj.host" class="" style="width:93%;"/>
								</div>
								<label class="col-xs-2 control-label no-padding">文件名：</label>
								<div class="col-xs-4">
									<input type="text" id="filename" name="obj.filename" class="" style="width:93%;"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">源目录：</label>
								<div class="col-xs-4">
									<input type="text" id="sourceDirectory" name="obj.sourceDirectory" class="" style="width:93%;"/>
								</div>
								<label class="col-xs-2 control-label no-padding">缓存文件：</label>
								<div class="col-xs-4">
									<input type="text" id="cachedDirectory" name="obj.cachedDirectory" class="" style="width:93%;"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">存档文件：</label>
								<div class="col-xs-4">
									<input type="text" id="archiveDirectory" name="obj.archiveDirectory" class="" style="width:93%;"/>
								</div>
								<label class="col-xs-2 control-label no-padding">解码器：</label>
								<div class="col-xs-4">
									<input type="text" id="decoderName" name="obj.decoderName" class="" style="width:93%;"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									状态：
								</label>
								<div class="col-xs-4">
									<input type="text" id="flag" name="obj.flag" class="" style="width:93%;"/>
								</div>
								<label class="col-xs-2 control-label no-padding">
									话单数：
								</label>
								<div class="col-xs-4">
									<input type="text" id="recordCount" name="obj.recordCount" class="" style="width:93%;"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									异常话单数：
								</label>
								<div class="col-xs-4">
									<input type="text" id="abnormalCount" name="obj.abnormalCount" class="" style="width:93%;"/>
								</div>
								<label class="col-xs-2 control-label no-padding">采集时间：</label>
								<div class="col-xs-4">
									<input type="text" id="createTime" name="obj.createTime" class="" style="width:93%;"/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="save">
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
		<script src="assets/js/datepicker/bootstrap-datetimepicker.min.js"></script>
		 
		<script type="text/javascript">
		
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
		$(document).ready(function(){
			$(".date-timepicker").datetimepicker();//日历控件加载
		});
		
        var table_view;
        var parm = {};
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "cdrLog!selectByPage.do",
            	"data": parm,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
				{"mDataProp": ""},
            	{"mDataProp": "host"},
    			{"mDataProp": "filename"},
    			{"mDataProp": "flag"},
    			{"mDataProp": "recordCount"},
    			{"mDataProp": "abnormalCount"},
    			{"mDataProp": "createTime"},
				{"mDataProp": ""}
    		],
			 columnDefs: [
                {
                	targets: 0,
	                render: function (a, b, c, d) {//(data,type,row,meta)
	                	return '<input id="cid' + c.id + '" type="checkbox" onclick=onCidClick("' + c.id + '") checked/>';
	                    var html = template(context);
	                    return html;
	                }
                },
                {
                	targets: 3,
	                render: function (a, b, c, d) {
	                	if(flag = 0) return "采集";
	                	if(flag = 1) return "解码";
	                	if(flag = 2) return "批价";
	                	if(flag = 3) return "累帐";
	                	if(flag = 9) return "完成";
	                	else return "失败";
	                    var html = template(context);
	                    return html;
	                }
                },
                {
                    targets: 7,
                    render: function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"fn": "showDetailDlg(" + JSON.stringify(c) + ")", "color": "blue", "icon": "zoom-in"},
								{"fn": "del('" + c.id + "')", "color": "red", "icon": "trash"}
                            ]
                        };
                        var html = template(context);
                        return html;
                    }
                }

            ],
			"bLengthChange": false,//
			"iDisplayLength" :12,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
		//TODO
		/* $("#checkAll").click(function () {
			if (table_view == null) return;
			var isCheck = $("#checkAll").get(0).checked;
        	var tableData = table_view.rows().data();
        	var count = tableData.length;
        	for (var i = 0; i < count; i++) {
        		var data = tableData[i];
        		$("#cid" + data.customerId).get(0).checked = isCheck;
        		data.customerChoosed = isCheck ? 1 : 0;
        	}
		}); */
		
		$("input[name='check_all']").click(function(){
			$("input[name='check_row']").each(function () {
                if ($(this).prop("checked")) {
                    $(this).removeProp("checked");
                } else {
                    $(this).prop("checked", true);
                }
            });
		})
		
		var ids = "";
		var id = "";
		$("#btnDelete").click(function(){
			var nTrs = table_view.fnGetNodes();
			if($("input[name='check_row']").prop("checked")){
				for(var i = 0; i < nTrs.length; i++){
					if($("input[name='check_row']").prop("checked")){
						id = table_view.fnGetData(nTrs[i]).id;//获取单行数据
						ids += id+",";
					}
				}
				del(ids);//执行批量删除方法
			}else{
				bootbox.alert({  
           		 message: "没有选中的数据，请至少选中一行数据",   
           		 title: "失败",
           		 locale: "zh_CN",
   				 size: 'small'
  				}); 
			}
		})
		
        function del(ids) {
	   		bootbox.confirm({
	   			locale: "zh_CN",
				size: 'small',
				title:"提示",
				message: "确认要删除？", 
				callback: function(result){
	   				if(result){
						var parm = {"ids":ids };
					    var resData = ajaxCRUD("cdrLog!delete.do", parm, true);
						if(resData.resNum == "0"){
							table_view.fnSettings().ajax.data = {}; 
							table_view.api().ajax.reload();
						}
	            	}
	            }
	    	});
        }
        
		$("#btnInquiry").click(function() {
			parm["obj.host"] = $("#crHost").val() == "" ? "" : $("#crHost").val();
			parm["obj.filename"] = $("#crFileName").val() == "" ? "" : $("#crFileName").val();
			parm["crCreateTime"] = $("#crCreateTime").val() == "" ? "" : $("#crCreateTime").val();
			/*for(var p in parm){ //遍历parm参数的属性字段和值
				console.info("p:"+p+"value:"+parm[p]);
			}*/
			/*if(parm["obj.host"]=="" && parm["obj.filename"]=="" && parm["crCreateTime"]==""){//如果输入条件为空，弹窗提示
				bootbox.alert({  
	           		 message: "输入为空,请重新输入条件再进行查询",   
	           		 title: "失败",
	           		 locale: "zh_CN",
	   				 size: 'small'
	  				}); 
			}*/
			table_view.fnSettings().ajax.data = parm;//重设datatable中的ajax参数
			table_view.api().ajax.reload();//ajax重新加载表格数据
		});
		
		$("#btnReset").click(function(){
			$("#crHost").val("");
			$("#crFileName").val("");
			$("#crCreateTime").val("");
			table_view.fnSettings().ajax.data={};//ajax无参刷新表格数据
			table_view.api().ajax.reload();
		})
		/////////////////////////////////////////////////////////////////////////////////
		// 辅助函数
		/////////////////////////////////////////////////////////////////////////////////
        function showDetailDlg(obj) {
            $("#dlg_title").text("详情");
        	detail(obj);
            $("#flag").val("");
            $("#save").hide();
            $("#dlg").modal("show");
        }
        
        function detail(obj) {
    		$("#id").val(obj.id);
        	$("#host").val(obj.host);
        	$("#filename").val(obj.filename);
        	$("#sourceDirectory").val(obj.sourceDirectory);
        	$("#cachedDirectory").val(obj.cachedDirectory);
        	$("#archiveDirectory").val(obj.archiveDirectory);
        	$("#decoderName").val(obj.decoderName);
        	$("#flag").val(obj.flagDesc);
        	$("#recordCount").val(obj.recordCount);
        	$("#abnormalCount").val(obj.abnormalCount);
        	$("#createTime").val(obj.createTime);
        }

    	function clear() {
    		$("#id").val("");
        	$("#host").val("");
        	$("#filename").val("");
        	$("#sourceDirectory").val("");
        	$("#cachedDirectory").val("");
        	$("#archiveDirectory").val("");
        	$("#decoderName").val("");
        	$("#flag").val("");
        	$("#recordCount").val("");
        	$("#abnormalCount").val("");
        	$("#createTime").val("");
    	}

		</script>

		<script id="tpl" type="text/x-handlebars-template">
        <div class="action-buttons">
    	{{#each func}}
    	<a class="{{this.color}}" href="javascript:{{this.fn}}"><i class="icon-{{this.icon}} bigger-130"></i></a>
    	{{/each}}
		</div>
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
