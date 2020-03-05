<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<style type="text/css">
			table#table_view_customer>thead>tr>th {
				text-align: center;
			}
		
		</style>
	</head>

	<body>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="dlgContract" tabindex="-1" role="dialog" aria-labelledby="my_modal_label" aria-hidden="true">
		<div class="modal-dialog" style="width:70%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="my_modal_label">
						选择代缴合同号
					</h4>
				</div>
				<div class="modal-body">
                    <div class="widget-box widget-color-blue2">
                    	<div class="widget-header">
                           	<h4 class="widget-title lighter smaller">合同号列表</h4>
                           	<div class="widget-toolbar">
                           		<span id="selected_customer_no" class="badge badge-danger">请选择合同号</span>
                           	</div>
                        </div>
                        <div class="widget-body">
                           	<div class="widget-main padding-8">
                           		<form class="form-search">
                           			<div class="row">
                           				<div class="col-xs-12 col-sm-12">
                           					<div class="input-group">
                           						<span class="input-group-addon">
                           							查询类型
                           						</span>
                           						<select id="searchType" name="searchType">
                           							<option value="businessKey">电话</option>
                           							<option value="customerNo">合同号</option>
                           							<option value="customerName" selected="selected">名称</option>
                           						</select>
                           						<span class="input-group-addon">
                           							<i class="icon-ok"></i>
                           						</span>
                           						<input type="text" id="cr_customer" class="form-control search-query" placeholder="请输入电话，代缴合同号或者合同名称" />
                           						<input type="hidden" id="selected_customer_id" />
                           						<input type="hidden" id="selected_customer_name" />
                           						<span class="input-group-btn">
                           							<button type="button" class="btn btn-purple btn-sm" id="btn_search_contract">
                           								<span class="icon-search icon-on-right bigger-110"></span>
                           								查找
                           							</button>&nbsp;
                           							<button type="button" class="btn btn-purple btn-sm" id="btn_reset_contract">
                           								<span class="icon-refresh icon-on-right bigger-110"></span>
                           								刷新
                           							</button>
                           						</span>
                           					</div>
                           				</div>
                           			</div>
                           			<div class="row">
                           				<div class="col-xs-12 col-sm-12">
                           				<table id="table_customer" class="table table-striped table-bordered table-hover">
                           					<thead>
                           						<tr>
                           							<th>合同号</th>
                           							<th>电话</th>
                           							<th>名称</th>
                           							<th>地址</th>
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
                     <div>
	                     <table id="table_user" class="table table-striped table-bordered table-hover" style="width: 100%;">
           					<thead>
           						<tr>
           							<th>代缴电话</th>
           							<th>用户姓名</th>
           							<th>用户地址</th>
           						</tr>
           					</thead>
           					<tbody></tbody>
				         </table>
                     </div> 
                     <div class="widget-box widget-color-blue2"> 	
                       		<div class="widget-header">
	                           	<h4 class="widget-title lighter smaller">代缴信息</h4>
	                           	<div class="widget-toolbar">
	                           		<span id="selectedCustomerPaymentInfo" class="badge badge-danger">请填写相关代缴信息</span>
	                           	</div>
                   			</div>
                      			
                   			<div class="widget-body">
                   				<table id="table_payment" style="margin-left: 20px; border-collapse:separate; border-spacing: 10px;" >
                   					<tbody>
                   					<tr>
                   						<td style="width: 80px;">代缴名称</td>
                   						<td style="width: 130px;">
                   							<select id="paymentName" name="paymentName" style="width:130px;">
                   							</select>
                   						</td>
                   						<td style="width: 80px;">是否全部代缴</td>
                   						<td style="width: 130px;">
                   							<select id="paymentAllCheck" name="paymentAllCheck" style="width:130px;">
                   								<option value="0">是</option>
                   								<option value="1">否</option>
                   							</select>
                   						</td>
                   						<td style="width: 80px;">代缴金额</td>
                   						<td style="width: 130px;">
                   							<input type="text" id="paymentFee" name="paymentFee" style="width: 130px;"></input>
                   						</td>
                   					</tr>
                   					<tr>
                   						<td style="width: 80px;">代缴合同号</td>
                   						<td style="width: 130px;">
                   							<input type="text" id="paymentCustomerNo" name="paymentCustomerNo" style="width: 130px;"/>
                   						</td>
                   						<td style="width: 80px;">代缴电话</td>
                   						<td>
                   							<input type="text" id="paymentPhone" name="paymentPhone" style="width: 130px;"/>
                   						</td>
                   						<td style="width: 80px;"></td>
                   						<td style="width: 130px;text-align: center;">
			                      			<button type="button" class="btn btn-sm btn-primary" id="btnSaveContractInfo">保存</button>
			                      			<button type="button" class="btn btn-sm btn-primary" id="btnDelContractInfo">删除</button>
                   						</td>
                   					</tr>
                   					</tbody>
                   				</table>
                      		</div><!-- widget-body -->
                     </div>
                     
                     <table id="table_view_payment_info" class="table table-striped table-bordered table-hover">
           					<thead>
           						<tr>
           							<th>
           								<input id="paymenttable_checkalls" type="checkbox"/>
           							</th>
           							<th>代缴项目</th>
           							<th>代缴金额</th>
           							<th>代缴合同号</th>
           							<th>代缴电话</th>
           						</tr>
           					</thead>
           					<tbody></tbody>
			          </table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-sm btn-primary" id="btn_choose_creditor">
						确认
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
	<script type="text/javascript">
		$(document).ready(function () {
			loadSidWithholdTerm();
			
		})
	
        var table_customer;
        var criteria = {
        };
        table_customer = $('#table_customer').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "customer!findByCriteria.do",
            	"data": criteria,
            	"dataSrc": "lst"
            },
        	"columns": [
            	{ 
            		"data": "customerNo",
            		"width": "150px",
            	},
            	{ 
            		"data": "linkPhone",
            		"width": "150px",
            	},
            	{ 
            		"data": "name",
            		"width": "200px",
            	},
            	{ 
            		"data": "linkAddress",
            		"width": "*",
            	}
        	],
			 columnDefs: [
            ],
			"bLengthChange": false,//
			"iDisplayLength" :3,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
        
        
		function doSearchCustomerInfo() {
			var searchType = $("#searchType").val();
			if("customerName" == searchType){
				criteria = {
						"obj.name": $("#cr_customer").val()	
				}
			}else if("customerNo" == searchType){
				criteria = {
						"obj.customerNo": $("#cr_customer").val()	
				}
			}else{
				criteria = {
						"businessKey": $("#cr_customer").val()
			        };
			}
			table_customer.fnSettings().ajax.data = criteria; 
			table_customer.api().ajax.reload();
		}
		
		function resetCustomerInfo(){
			$("#searchType").val("customerName");
			$("#cr_customer").val("");
			criteria={};
			table_customer.fnSettings().ajax.data = criteria; 
			table_customer.api().ajax.reload();
		}
		
		$("#btn_search_contract").click(function() {
			doSearchCustomerInfo();
		});
		
		$("#btn_reset_contract").click(function() {
			resetCustomerInfo();
		});
		
		var table_user;
		criteria={};
		table_user = $('#table_user').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "crmUser!findByCustomerId.do",
            	"data": criteria,
            	"dataSrc": "lst"
            },
        	"columns": [
            	{ 
            		"data": "businessKey",
            	},
            	{ 
            		"data": "name",
            	},
            	{ 
            		"data": "address",
            	}
        	],
			 columnDefs: [
            ],
			"bLengthChange": false,//
			"iDisplayLength" :3,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
		
		$("#table_customer tbody").on("click", "tr", function(event) {
		 	$("#table_customer tbody").find("tr").each(function() {
				$(this).removeClass('success');
			});
			$(this).addClass('success');
			var aData = table_customer.fnGetData(event.target.parentNode);
			$("#selected_customer_id").val(aData.id);
			$("#selected_customer_no").text(aData.customerNo);
			$("#selected_customer_name").val(aData.name);
			
			$("#paymentCustomerNo").val(aData.customerNo);
			criteria = {
					"obj.customerId": aData.id
		    };
			
			table_user.fnSettings().ajax.data = criteria; 
			table_user.api().ajax.reload();
		});
		
		$("#table_user tbody").on("click", "tr", function(event) {
		 	$("#table_user tbody").find("tr").each(function() {
				$(this).removeClass('success');
			});
			$(this).addClass('success');
			var aData = table_user.fnGetData(event.target.parentNode);
			$("#paymentPhone").val(aData.businessKey);
		});
		
		/*加载代缴信息*/
		function loadSidWithholdTerm(){
			var parm= {};
			var res = ajaxCRUD("sidWithholdTerm!selectByPage.do", parm, false);
			var lst = res.lst;
			for(var item in lst){
				$('#paymentName').append("<option value='"+lst[item].id+"'>"+lst[item].name+"</option>");
			}
			$('#paymentName').prepend("<option value='' selected='selected'>--请选择--</option>");
		}
		
		/*	代缴信息      */
		$('#paymentName').change(function(){
			var parm = {
					"id":$(this).val()
			};
			var res = ajaxCRUD("sidWithholdTerm!selectById.do", parm, false);
			var obj = res.obj;
			//是否代缴全部--赋值
			$('#paymentAllCheck').val(obj.withholdPercent);
			$('#paymentAllCheck').attr("disabled","disabled");
			
			//代缴金额--赋值
			if(0 == obj.withholdPercent){
				$('#paymentFee').val(obj.fee);
				$('#paymentFee').attr("disabled","disabled");
			}else{
				$('#paymentFee').val(obj.fee);
				$('#paymentFee').removeAttr("disabled");
			}
		})
		
		
		/*	保存操作    */
		
		$('#btnSaveContractInfo').click(function(){
			var tr = "<tr>"+
						"<td>"+"<input type='checkbox'>"+"</td>"+
						"<td>"+$('#paymentName').val()+"</td>"+
						"<td>"+$('#paymentFee').val()+"</td>"+
						"<td>"+$('#paymentCustomerNo').val()+"</td>"+
						"<td>"+$('#paymentPhone').val()+"</td>"
					"</tr>";
			//代缴名称不能为空
			if($('#paymentName').val() == null || $('#paymentName').val() == "" || $('#paymentName').val() == 0){
				bootbox.alert({
					locale : "zh_CN",
					size : 'small',
					title : "提示",
					message : "请选择代缴项目"
				});
				return false;
			}	
			//代缴合同号不能为空		
			if($('#paymentCustomerNo').val() == null || $('#paymentCustomerNo').val() == ""){
				bootbox.alert({
					locale : "zh_CN",
					size : 'small',
					title : "提示",
					message : "请选择代缴合同号"
				});
				return false;
			}
			//代缴电话不能为空		
			if($('#paymentPhone').val() == null || $('#paymentPhone').val() == ""){
				bootbox.alert({
					locale : "zh_CN",
					size : 'small',
					title : "提示",
					message : "请选择代缴电话"
				});
				return false;
			}
			//防止重复添加
			var text = $('#paymentName').val()+$('#paymentFee').val()+$('#paymentCustomerNo').val()+$('#paymentPhone').val();
			$('#table_view_payment_info tr:gt(0)').each(function(){
				if($(this).text()==text){
					bootbox.alert({
						locale : "zh_CN",
						size : 'small',
						title : "提示",
						message : "相同的代缴信息不能重复添加"
					});
					$(this).remove();
					//$('#table_view_payment_info').remove($(this));
				}
			})
			$('#table_view_payment_info').append(tr);
		})
		
		//删除代缴信息
		$('#btnDelContractInfo').click(function(){
			if($('#table_view_payment_info tr').length == 1){
				bootbox.alert({
					locale : "zh_CN",
					size : 'small',
					title : "提示",
					message : "没有可删除的代缴信息"
				});
			}
			
			if($('#table_view_payment_info tr').length > 1){
				if($('#table_view_payment_info tr:gt(0)').find('input[type="checkbox"]:checked').length == 0){
					bootbox.alert({
						locale : "zh_CN",
						size : 'small',
						title : "提示",
						message : "请先选择要删除的代缴信息"
					});
				}else{
					$('#table_view_payment_info tr:gt(0)').each(function(){
						if($(this).find('input[type="checkbox"]').prop('checked') == true){
							$(this).remove();
						}
					})
				}
			}
			
		})
		
		/*	全选框选中事件   */
		$('#paymenttable_checkalls').change(function(){
			if($('#paymenttable_checkalls').is(':checked')){
				$('#table_view_payment_info tr').each(function(){
					$(this).find('input[type="checkbox"]').prop("checked",true);
				})
			}else{
				$('#table_view_payment_info tr').each(function(){
					$(this).find('input[type="checkbox"]').prop("checked",false);
				})
			}
		})
		
		$('#btn_choose_creditor').click(function(){
			var customerId = $("#selected_customer_id").val();
			var customerNo = $("#selected_customer_no").text();
			var customerName = $("#selected_customer_name").val();
			if ("请选择客户" == customerNo) {
				alert("请查询并选择客户");
				return;
			}
			fnBtnClickedCustomer(customerId, customerNo, customerName);
			$("#dlgContract").modal("hide");
		})
		
	</script>
	</body>
</html>
