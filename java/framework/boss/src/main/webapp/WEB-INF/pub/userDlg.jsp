<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<style type="text/css">
			table#table_view_user>thead>tr>th {
				text-align: center;
			}
			table#table_view_user>tbody>tr>td {
				text-align: center;
			}
		</style>
	</head>

	<body>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="dlgUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:70%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						选择用户
					</h4>
				</div>
				<div class="modal-body">
                    <div class="widget-box widget-color-blue2">
                    	<div class="widget-header">
                           	<h4 class="widget-title lighter smaller">用户列表</h4>
                           	<div class="widget-toolbar">
                           		<span id="selectedBusinessKey" class="badge badge-danger">请选择用户</span>
                           	</div>
                        </div>
                        <div class="widget-body">
                           	<div class="widget-main padding-8">
                           		<form class="form-search">
                           			<div class="row">
                           				<div class="col-xs-12 col-sm-12">
                           					<div class="input-group">
                           						<span class="input-group-addon">
                           							<i class="icon-ok"></i>
                           						</span>
                           						<input type="text" id="crUserKey" placeholder="号码、账号" style="width: 20%;" />
                           						<input type="text" id="crUser" placeholder="用户名、地址、联系电话" style="width: 50%;"/>
                           						<input type="hidden" id="selectedUserId" />
                           						<input type="hidden" id="userBusinessType" />
                           						<input type="hidden" id="selectedBusinessType" />
                           						<input type="hidden" id="userStatus" value=""/>
                           						<input type="hidden" id="beginStatus" value="2"/>
                           						<input type="hidden" id="endStatus" value="89"/>
                          						<button type="button" class="btn btn-purple btn-sm" id="btnSearchUser">
                           							<span class="icon-search icon-on-right bigger-110"></span>
                           							查找
                           						</button>&nbsp;
                           						<button type="button" class="btn btn-success btn-sm" id="btnResetUser">
                           							<span class="icon-refresh icon-on-right bigger-110"></span>
                           							重置
                           						</button>
                           					</div>
                           				</div>
                           			</div>
                           			<div class="row">
                           				<div class="col-xs-12 col-sm-12">
                           				<table id="table_view_user" class="table table-striped table-bordered table-hover">
                           					<thead>
                           						<tr>
                           							<th>类型</th>
                           							<th>号码（账号）</th>
                           							<th>名称</th>
                           							<th>联系电话</th>
                           							<th>安装地址</th>
                           						</tr>
                           					</thead>
                           					<tbody></tbody>
                           				</table>
                           				</div>
                           			</div>
                           		</form>
                           	</div>
                        </div>
                    </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnUserChoosed">
						确认
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
	<script type="text/javascript">
        var table_view_user;
        //var businessType = $("#userBusinessType").val();
        var criteria_user = {
        	"obj.beginStatus": $("#beginStatus").val(),
			"obj.endStatus": $("#endStatus").val(),
        	"obj.businessType": businessType
        	//"obj.businessSta": $("#deptArea").val()
        };
        if ($("#deptArea").val()) {
        	criteria_user["obj.businessSta"] = $("#deptArea").val();
        }
        if ($("#userStatus").val()) {
        	criteria_user["obj.status"] = $("#userStatus").val();
        }
		table_view_user = $('#table_view_user').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "crmUser!findByPage.do",
	           	"data": criteria_user,
            	"dataSrc": "lst"
            },
        	"columns": [
				{ 
					"data": "businessTypeDesc",
					"width": "80px"
				},
            	{ 
            		"data": "businessKey",
            		"width": "120px"
            	},
            	{ 
            		"data": "name",
            		"width": "240px",
            	},
            	{ 
            		"data": "linkPhone",
            		"width": "100px",
            	},
            	{ 
            		"data": "address",
            		"width": "*",
            	}
        	],
			 columnDefs: [
            ],
			"bLengthChange": false,//
			"iDisplayLength" :5,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"bAutoWidth" : false,
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
		$("#btnSearchUser").click(doSearch);
		$("#btnResetUser").click(resetUserDlg);
		
		function doSearch() {
			criteria_user = {
        		"obj.beginStatus": $("#beginStatus").val(),
				"obj.endStatus": $("#endStatus").val(),	
				"obj.fullText": $("#crUser").val(),
				"obj.businessKey": $("#crUserKey").val(),
				//"obj.businessSta": $("#deptArea").val()	//跨区域办理
	        };
       	 	if ($("#userStatus").val()) {
       	 		criteria_user["obj.status"] = $("#userStatus").val();
        	}
	        if (businessType) {
	        	criteria_user["obj.businessType"] = businessType;
	        }
			showUserStatu();
			table_view_user.fnSettings().ajax.data = criteria_user; 
			table_view_user.api().ajax.reload();
		}
		
		function showUserStatu() {
			//如果没有查询条件，不显示任何状态
			if ($("#crUserKey").val() == "" && $("#crUser").val() == "" ) {
				return;
			}
			var parm = {
					"obj.businessKey" : $("#crUserKey").val(),
					"obj.fullText" : $("#crUser").val(),	
					"obj.businessType" : businessType
					//"obj.businessSta": $("#deptArea").val()
			};
			var res = ajaxCRUD("crmUser!findUserStatu.do", parm, false);
			var users = res.lst;
			if (users.length == 0) {
				bbAlert("查找的用户不存在");
			} else if (users.length == 1) {
				switch(users[0].status) {
					case 0:
						bbAlert("查找的用户正在建立档案"); break;
					case 1:
						bbAlert("查找的用户正在审批"); break;
					case 3:
						bbAlert("查找的用户已欠费停机（单向停机）"); break;
					case 4:
						bbAlert("查找的用户已停机（双向停机）"); break;
					case 5:
						bbAlert("查找的用户已办理（限呼保号）"); break;
					case 6:
						bbAlert("查找的用户已办理（停机保号）"); break;
					case 90:
						bbAlert("查找的用户正在拆除"); break;
					case 91:
						bbAlert("查找的用户已拆除"); break;
					default:
						return;
				}
				/* if (users[0].status != "2") {
					bbAlert("查找的用户:" + users[0].statusDesc);
				} */
			}
		}
		
		$(document).keydown(function (e) {	
			if (e.keyCode == 13) {	
				doSearch();
				event.preventDefault();
			}
		});
		
		function resetUserDlg() {
			$("#crUserKey").val("");
			$("#crUser").val("");
			$("#selectedUserId").val("");
			$("#userBusinessType").val("");
			$("#userStatus").val("");
			$("#selectedBusinessKey").text("请选择用户");
			$("#selectedBusinessType").val("");
			doSearch();
		}
		
		$("#table_view_user tbody").on("click", "tr", function(event) {
			$("#table_view_user tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_user.fnGetData(event.target.parentNode);
			$("#selectedUserId").val(aData.id);
			$("#selectedBusinessKey").text(aData.businessKey);
			$("#selectedBusinessType").val(aData.businessType);
		});
		
		$("#btnUserChoosed").click(function() {
			var userId = $("#selectedUserId").val();
			var businessKey = $("#selectedBusinessKey").text();
			businessType = businessType ? businessType : $("#selectedBusinessType").val();
			if ("请选择用户" == businessKey) {
				alert("请查询并选择用户");
				return;
			}
			fnUserChoosed(userId, businessKey, businessType);
			$("#dlgUser").modal("hide");
		});
		
		/*双击选中*/
		$("#table_view_user tbody").on("dblclick", "tr", function(event) {
			$("#table_view_user tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_user.fnGetData(event.target.parentNode);
			$("#selectedUserId").val(aData.id);
			$("#selectedBusinessKey").text(aData.businessKey);
			$("#selectedBusinessType").val(aData.businessType);
			$("#btnUserChoosed").click();
		});
		
	</script>
	</body>
</html>
