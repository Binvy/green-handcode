<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<style type="text/css">
			table#table_view_big_customer>thead>tr>th {
				text-align: center;
			}
			table#table_view_big_customer>tbody>tr>td {
				text-align: center;
			}
		
		</style>
	</head>

	<body>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="dlgBigCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabelBigCustomer" aria-hidden="true">
		<div class="modal-dialog" style="width:70%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabelBigCustomer">
						选择大客户
					</h4>
				</div>
				<div class="modal-body">
                    <div class="widget-box widget-color-blue2">
                    	<div class="widget-header">
                           	<h4 class="widget-title lighter smaller">大客户列表</h4>
                           	<div class="widget-toolbar">
                           		<span id="selectedBigCustomerNo" class="badge badge-danger">请选择大客户</span>
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
                           						<label>
                           						 	按大客户：
                           						</label>
                           						<input type="text" id="crBigCustomer" class="form-control search-query" placeholder="客户号、客户名、证件号码、联系电话" style="width:40%;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           						<label>
                           						 	按用户：
                           						</label>
                           						<input type="text" id="unabridged" class="form-control search-query" placeholder="用户名、电话号码、联系电话、联系地址" style="width:40%;"/>
                           						<input type="hidden" id="selectedBigCustomerId" />
                           						<input type="hidden" id="selectedBigCustomerName" />
                           						<span class="input-group-btn">
                           							<button type="button" class="btn btn-purple btn-sm" id="btnSearchBigCustomer">
                           								<span class="icon-search icon-on-right bigger-110"></span>
                           								查找
                           							</button>&nbsp;
                           							<button type="button" class="btn btn-success btn-sm" id="btnResetBigCustomer">
                           								<span class="icon-refresh icon-on-right bigger-110"></span>
                           								重置
                           							</button>
                           						</span>
                           					</div>
                           				</div>
                           			</div>
                           			<div class="row">
                           				<div class="col-xs-12 col-sm-12">
                           				<table id="table_view_big_customer" class="table table-striped table-bordered table-hover">
                           					<thead>
                           						<tr>
                           							<th>客户号</th>
                           							<th>名称</th>
                           							<th>证件号码</th>
                           							<th>联系电话</th>
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
					<button type="button" class="btn btn-sm btn-primary" id="btnChooseBigCustomer">
						确认
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
	<script type="text/javascript">
	/* 	$("#dlgCustomer").on('shown.bs.modal', function(){
			$(this).draggable({
			//handle: ".modal-header"   // 只能点击头部拖动
		    });
			 $(this).css("overflow", "hidden");
		}); */
        var table_view_big_customer;
        var criteria_big_customer = {
       		"obj.customerProp" : 1
        };
		table_view_big_customer = $('#table_view_big_customer').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "customer!findByPage.do",
            	"data": criteria_big_customer,
            	"dataSrc": "lst"
            },
        	"columns": [
            	{ 
            		"data": "customerNo",
            		"width": "120px"
            	},
            	{ 
            		"data": "name",
            		"width": "*"
            	},
            	{ 
            		"data": "certId",
            		"width": "240px"
            	},
            	{ 
            		"data": "linkPhone",
            		"width": "120px"
            	}
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
		
		function resetBigCustomerDlg() {
			$("#crBigCustomer").val("");
			$("#selectedBigCustomerId").val("");
			$("#selectedBigCustomerName").val("");
			$("#selectedBigCustomerNo").text("请选择大客户");
			
		};
		
		function doSearchCompanyCustomer() {
			criteria_big_customer = {
				"obj.customerProp" : 1,
				"obj.fullText": $("#crBigCustomer").val(),
				"obj.unabridged": $("#unabridged").val()
	        };
			table_view_big_customer.fnSettings().ajax.data = criteria_big_customer; 
			table_view_big_customer.api().ajax.reload();
		};
		
		$(document).keydown(function (event) {	
			if (event.keyCode == 13) {	
				doSearchCompanyCustomer();
				event.preventDefault();
			}
		});
		
		$("#btnSearchBigCustomer").click(function () {
			doSearchCompanyCustomer();
		});
		
		$("#btnResetBigCustomer").click(function () {
			resetBigCustomerDlg();
			doSearchCompanyCustomer();
		});
		
		$("#table_view_big_customer tbody").on("dblclick", "tr", function (event) {
			$("#table_view_big_customer tbody").find("tr").each(function () {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_big_customer.fnGetData(event.target.parentNode);
			$("#selectedBigCustomerNo").text(aData.customerNo);
			$("#selectedBigCustomerId").val(aData.id);
			$("#selectedBigCustomerName").val(aData.name);
			$("#btnChooseBigCustomer").click();
		});
		
		$("#table_view_big_customer tbody").on("click", "tr", function (event) {
			$("#table_view_big_customer tbody").find("tr").each(function () {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_big_customer.fnGetData(event.target.parentNode);
			$("#selectedBigCustomerNo").text(aData.customerNo);
			$("#selectedBigCustomerId").val(aData.id);
			$("#selectedBigCustomerName").val(aData.name);
		});
		
		$("#btnChooseBigCustomer").click(function () {
			var customerId = $("#selectedBigCustomerId").val();
			var customerNo = $("#selectedBigCustomerNo").text();
			var customerName = $("#selectedBigCustomerName").val();
			if ("请选择大客户" === customerNo) {
				bbAlert("请查询并选择大客户");
				return;
			}
			fnBtnClickedBigCustomer(customerId, customerNo, customerName);
			$("#dlgBigCustomer").modal("hide");
		});
		
	</script>
	</body>
</html>
