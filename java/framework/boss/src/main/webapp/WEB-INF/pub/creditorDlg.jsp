<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	</head>

	<body>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="dlgCreditor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:70%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						设置代缴关系
					</h4>
				</div>
				<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">客户号：</label>
								<div class="col-xs-4">
									<input type="text" id="crCreditorCustomerNo" class="form-control" />
								</div>
								<label class="col-xs-2 control-label no-padding">客户名称：</label>
								<div class="col-xs-4">
									<input type="text" id="crCreditorCustomerName" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">电话：</label>
								<div class="col-xs-4">
									<input type="text" id="crCreditorBusinessKey" class="form-control" />
								</div>
								<label class="col-xs-2 control-label no-padding"></label>
								<div class="col-xs-4">
									<button type="button" id="btnCreditorFind" class="btn btn-sm">
										查找
									</button>
								</div>
							</div>
							<div class="hr hr8 hr-double hr-dotted"></div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">客户号：</label>
								<div class="col-xs-4">
									<input type="hidden" id="dlgCreditorCustomerId">
									<input type="text" id="dlgCreditorCustomerNo" class="form-control" readonly/>
								</div>
								<label class="col-xs-2 control-label no-padding">客户名：</label>
								<div class="col-xs-4">
									<input type="text" id="dlgCreditorCustomerName" class="form-control" readonly/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">电话：</label>
								<div class="col-xs-4">
									<input type="hidden" id="dlgCreditorUserId">
									<input type="text" id="dlgCreditorBusinessKey" class="form-control" readonly/>
								</div>
								<label class="col-xs-2 control-label no-padding">用户名：</label>
								<div class="col-xs-4">
									<input type="text" id="dlgCreditorUserName" class="form-control" readonly/>
								</div>
							</div>
							<div class="hr hr8 hr-double hr-dotted"></div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">代缴项目：</label>
								<div class="col-xs-10">
									<select id="dlgCreditorTemplateId" class="form-control">
									</select>
								</div>
							</div>
							<!--  
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">代缴模式：</label>
								<div class="col-xs-4">
									<select id="dlgCreditorType" class="form-control" readonly>
										<option value="0">全额</option>
										<option value="1">限额</option>
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">代缴金额：</label>
								<div class="col-xs-4">
									<div class="input-group">
										<div class="input-group-addon">
											<span>￥</span>
										</div>
										<input type="text" id="dlgCreditAmount" class="form-control" readonly/>	
									</div>
								</div>
							</div>
							-->
						</form>
				
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnCreditorChoosed">
						确认
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
	<script type="text/javascript">
		$(document).ready(function() {
			var parm = {
				"obj.status": 1,
				"start": 0,
				"length": 100
			};
			var res = ajaxCRUD("sidCreditorTemplate!findByPage.do", parm, false);
			var lst = res.lst;
			var html = "<option role='option' value='' selected='selected'>--请选择--</option>";
			$(lst).each(function(index) {
				var item = lst[index];
				var name = item.name + " " + (item.creditorType == "0" ? "全额" : " ￥" + item.amount);
				if (html == "") {
					html += "<option role='option' value='" + item.id + "' selected='selected'>" + name + "</option>";
				} else {
					html += "<option role='option' value='" + item.id + "'>" + name + "</option>";
				}
			});
			$("#dlgCreditorTemplateId").empty();
			$("#dlgCreditorTemplateId").append(html);
		});
		
		$("#btnCreditorFind").click(function() {
			var businessKey = $("#crCreditorBusinessKey").val().trim();
			var customerNo = $("#crCreditorCustomerNo").val().trim();
			var customerName = $("#crCreditorCustomerName").val().trim();
			if (businessKey == "" && customerNo == "" && customerName == "") {
				alert("请输入查询条件");
				return;
			}
			var parm = {
				"parm.customerNo": customerNo,
				"parm.customerName": customerName,
				"parm.businessKey": businessKey
			};
			var res = ajaxCRUD("crmUser!findCustomerUserInfo.do", parm, false);
			if (res.resNum == "0") {
				var user = res.userFullInfo;
				$("#dlgCreditorCustomerId").val(user.customerId);
				$("#dlgCreditorUserId").val(user.userId);
				$("#dlgCreditorCustomerNo").val(user.customerNo);
				$("#dlgCreditorCustomerName").val(user.customerName);
				$("#dlgCreditorBusinessKey").val(user.businessKey);
				$("#dlgCreditorUserName").val(user.userName);
			} else {
				alert("无法匹配到客户或用户，请重新输入查询条件");
			}
		});
		
		$("#btnCreditorChoosed").click(function() {
			var targetCustomerId = $("#dlgCreditorCustomerId").val();
			var targetUserId = $("#dlgCreditorUserId").val();
			var templateId = $("#dlgCreditorTemplateId").val();
			if (targetCustomerId == "") {
				alert("请查询客户或用户");
				return;
			}
			if (templateId == "") {
				alert("请选择代缴项目");
				return;
			}
			fnCreditorChoosed(targetCustomerId, targetUserId, templateId);
			$("#dlgCreditor").modal("hide");
		});
		
	</script>
	</body>
</html>
