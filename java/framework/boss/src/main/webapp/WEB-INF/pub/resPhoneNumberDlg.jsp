<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<style type="text/css">
			table#table_view_pn>thead>tr>th {
				text-align: center;
			}
			table#table_view_pn>tbody>tr>td {
				text-align: center;
			}
		</style>
	</head>

	<body>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="dlgPhoneNumber" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						选择号码
					</h4>
				</div>
				<div class="modal-body">
                    <div class="widget-box widget-color-blue2">
                    	<div class="widget-header">
                           	<h4 class="widget-title lighter smaller">号码列表</h4>
                           	<div class="widget-toolbar">
                           		<span id="selectedPhoneNumber" class="badge badge-danger">请选择号码</span>
                           		<input type="hidden" id="selectedPhoneArea" />
                           		<input type="hidden" id="selectedPhoneSta" />
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
                           						<input type="text" id="crPN" class="form-control search-query" placeholder="输入要查找的号码" />
                           						<input type="hidden" id="crPhoneSta" />
                           						<span class="input-group-btn">
                           							<button type="button" class="btn btn-purple btn-sm" id="btnSearchPN">
                           								<span class="icon-search icon-on-right bigger-110"></span>
                           								查找
                           							</button>&nbsp;
                           							<button type="button" class="btn btn-success btn-sm" id="btnResetPN">
	                           							<span class="icon-refresh icon-on-right bigger-110"></span>
	                           							重置
	                           						</button>
                           						</span>
                           					</div>
                           				</div>
                           			</div>
                           			<div class="row">
                           				<div class="col-xs-12 col-sm-12">
                           				<table id="table_view_pn" class="table table-striped table-bordered table-hover">
                           					<thead>
                           						<tr>
                           							<th>号码</th>
                           							<th>业务区域</th>
                           							<th>通信站</th>
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
					<button type="button" class="btn btn-sm btn-primary" id="btnChoosePhoneNumber">
						确认
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
	<script type="text/javascript">
        var table_view_pn;
        var criteria = {
	        	"obj.status": 0,
	        	"obj.reserved": 0,
	        	//LoginService.java中设置的session信息, 数据库中：sys_user.dept_id ==> sys_dept.dept_name ==> res_phone_number.phone_sta
	        	"obj.phoneSta": "${sessionScope.userInfo.deptName}"
        	}
		table_view_pn = $('#table_view_pn').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "resPhoneNumber!findByPage.do",
            	"data": criteria,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
            	{
            		"mDataProp": "phoneNumber",
            		"width" : "120px",
            	},
    			{
            		"mDataProp": "phoneArea",
            		"width" : "120px",
           		},
    			{
            		"mDataProp": "phoneSta",
            		"width" : "*",
           		},
    		],
			 columnDefs: [
            ],
			"bLengthChange": false,//
			"iDisplayLength" :5,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
		$("#btnSearchPN").click(doSearchPhoneNumber);
		$("#btnResetPN").click(resetPN);
		
		function doSearchPhoneNumber() {
			criteria = {
				"obj.phoneNumber": $("#crPN").val(),
    	    	"obj.status": 0,
        		"obj.reserved": 0,
        		"obj.phoneSta": $("#crPhoneSta").val()
	        };
			table_view_pn.fnSettings().ajax.data = criteria; 
			table_view_pn.api().ajax.reload();
		}
		
		$(document).keydown(function (e) {	
			if (e.keyCode == 13) {	
				doSearchPhoneNumber();
				event.preventDefault();
			}
		});
		
		function resetPN(){
			$("#selectedPhoneNumber").text("请选择号码");
			$("#selectedPhoneArea").val("");
			$("#selectedPhoneSta").val("");
			$("#crPN").val("");
			doSearchPhoneNumber();
		}
		
		$("#table_view_pn tbody").on("click", "tr", function(event) {
			$("#table_view_pn tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_pn.fnGetData(event.target.parentNode);
			$("#selectedPhoneNumber").text(aData.phoneNumber);
			$("#selectedPhoneArea").val(aData.phoneArea);
			$("#selectedPhoneSta").val(aData.phoneSta);
		});
		
		$("#btnChoosePhoneNumber").click(function() {
			var phoneNumber = $("#selectedPhoneNumber").text();
			var phoneArea = $("#selectedPhoneArea").val();
			var phoneSta = $("#selectedPhoneSta").val();
			if ("请选择号码" == phoneNumber) {
				alert("请选择号码");
				return;
			}
			fnPhoneNumberChoosed(phoneNumber, phoneArea, phoneSta);
			$("#dlgPhoneNumber").modal("hide");
		});
		
		$("#table_view_pn tbody").on("dblclick", "tr", function(event) {
			$("#table_view_pn tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_pn.fnGetData(event.target.parentNode);
			$("#selectedPhoneNumber").text(aData.phoneNumber);
			$("#selectedPhoneArea").val(aData.phoneArea);
			$("#selectedPhoneSta").val(aData.phoneSta);
			$("#btnChoosePhoneNumber").click();
		});
		
	</script>
	</body>
</html>
