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
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
		<!-- zTree -->
		<link rel="stylesheet" href="assets/css/zTreeStyle/metro.css">
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">资费管理</a>
				</li>
				<li class="active">
					套餐
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
                            			<i class="icon-suitcase blue bigger-110"></i>
                            			套餐
                            		</h4>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            				<input type="text" id="nameCond" placeholder="套餐名称" style="width:100px;"/>
											<select id="crBusinessType" style="width:120px;">
												<option role="option" value=''>--业务--</option>
												<option role="option" value='p'>电话</option>
												<option role="option" value='a'>ADSL</option>
												<option role="option" value='b'>宽带</option>
												<option role="option" value='l'>专线</option>
											</select>
											<select id="planTypeCond" style="width:120px;">
												<option role="option" value=-1>--套餐类型--</option>
												<option role="option" value=0>兜底套餐</option>
												<option role="option" value=1>用户套餐</option>
												<option role="option" value=2>客户套餐</option>
											</select>
											<select id="statusCond" style="width:120px;">
												<option role="option" value=-1>--状态--</option>
												<option role="option" value=0>创建</option>
												<option role="option" value=1>发布</option>
												<option role="option" value=2>下线</option>
											</select>
											<button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>
											<button class="btn btn-sm btn-success btn-white btn-round pull-right" id="btn_add">
                            					<i class="icon-plus green"></i>
                            					添加
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>名称</th>
													<th>类型</th>
													<th>周期</th>
													<th>套餐费(￥)</th>
													<th>账目</th>
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
                            			套餐费率
                            		</h4>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
											<button class="btn btn-sm btn-success btn-white btn-round pull-right" id="btn_add_sub">
                            					<i class="icon-plus green"></i>
                            					添加
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view_sub" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>费率名称</th>
													<th>备注</th>
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

		<!-- 套餐模态框（Modal） -->
		<div class="modal fade" id="dlg" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:60%;">
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
									名称：
								</label>
								<div class="col-xs-4">
									<input type="text" id="name" name="obj.name" class="form-control" placeholder="套餐名称"/>
								</div>
								<label class="col-xs-2 control-label no-padding">
									套餐类型：
								</label>
								<div class="col-xs-4">
									<select name="obj.planType" class="form-control" id="planType">
										<option role="option" value=0>兜底套餐</option>
										<option role="option" value=1>用户套餐</option>
										<option role="option" value=2>客户套餐</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									套餐周期：
								</label>
								<div class="col-xs-4">
									<select class="form-control" id="term">
										<option role="option" value="DAY">天</option>
										<option role="option" value="MONTH">月</option>
										<option role="option" value="YEAR">年</option>
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">
									周期数：
								</label>
								<div class="col-xs-4">
									<input type="text" id="termCount" class="form-control" placeholder="周期数"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									套餐费：
								</label>
								<div class="col-xs-4">
									<input type="text" id="planFee" name="obj.planFee" class="form-control" placeholder="套餐费"/>
								</div>
								<label class="col-xs-2 control-label no-padding">业务：</label>
								<div class="col-xs-4">
									<select id="bearable" class="form-control selectpicker show-tick" 
										multiple data-live-search="false">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									应用站点：
								</label>
								<div class="col-xs-10">
									<select id="businessSta" class="form-control selectpicker show-tick" 
										multiple data-live-search="false">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									资费策略：
								</label>
								<div class="col-xs-10">
									<select class="form-control" id="policy">
										<option role="option" value="None">--无--</option>
										<option role="option" value="Lowest">最低消费</option>
										<option role="option" value="Deduce">包月</option>
										<option role="option" value="Discount">打折</option>
										<option role="option" value="DiscountByCond">条件优惠</option>
									</select>
								</div>
							</div>
							<div class="form-group" id="divUsedInAccount" style="display:none">
								<label class="col-xs-2 control-label no-padding">
									应用科目：
								</label>
								<div class="col-xs-10">
									<select id="usedInAccounts" class="form-control selectpicker show-tick" 
										multiple data-live-search="false">
									</select>
								</div>
							</div>
							<div class="form-group" id="divLowest" style="display:none">
								<label class="col-xs-2 control-label no-padding">
									最低消费：
								</label>
								<div class="col-xs-4">
									<input type="text" id="durationLimit" class="form-control"/>
								</div>
							</div>
							<div class="form-group" id="divDeduce" style="display:none">
								<label class="col-xs-2 control-label no-padding">
									免费量：
								</label>
								<div class="col-xs-4">
									<input type="text" id="durationFree" class="form-control"/>
								</div>
							</div>
							<div class="form-group" id="divDiscountByCond" style="display:none">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									减免阀值：
								</label>
								<div class="col-xs-4">
									<input type="text" id="trafficLimit" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									减免科目：
								</label>
								<div class="col-xs-4">
									<select class="form-control" id="targetAccount">
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">
									费用：
								</label>
								<div class="col-xs-3">
									<input type="text" id="trafficFree" class="form-control"/>
								</div>
							</div>
							</div>
							<div class="form-group" id="divDiscount" style="display:none">
								<label class="col-xs-2 control-label no-padding">
									折扣(%)：
								</label>
								<div class="col-xs-4">
									<input type="text" id="occuranceFree" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									记账科目：
								</label>
								<div class="col-xs-4">
									<select class="form-control" id="accountItemId">
									</select>
									<!-- 
									<input id="accountItemId" type="hidden"/>
									<input class="form-control" id="accountItemName" type="text" placeholder="选择账目"/>
									-->
								</div>
								<label class="col-xs-2 control-label no-padding">
									套餐描述：
								</label>
								<div class="col-xs-4">
									<input type="text" id="planDesc" name="obj.planDesc" class="form-control"/>
								</div>
							</div>
							<!-- 
							<div class="form-group" id="divAccountItem" style="display:none;">
								<div class="col-xs-2">
								</div>
								<div class="col-xs-4">
									<ul id="treeAccountItem" class="ztree" style="overflow:auto;" onmouseleave="hideAccountItem()"></ul>
								</div>
								<div class="col-xs-6">
								</div>
							</div>
							-->
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									状态：
								</label>
								<div class="col-xs-4">
									<select name="obj.status" class="form-control" id="status">
										<option role="option" value=0>创建</option>
										<option role="option" value=1>发布</option>
										<option role="option" value=2>下线</option>
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">
									备注：
								</label>
								<div class="col-xs-4">
									<input type="text" id="remark" name="obj.remark" class="form-control"/>
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

		<!-- 字冠模态框（Modal） -->
		<div class="modal fade" id="dlg_sub" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:70%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title_sub">
						</h4>
					</div>

					<input type="hidden" id="sub_id" name="obj.sub_id" value="">
					<input type="hidden" id="planId" name="obj.planId" value="">
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">
									<font color="green"><b>费率：</b></font>
								</label>
								<div class="col-xs-4">
									<select name="obj.rateId" calss="input-sm" id="rateId" style="width:93%;">
									</select>
								</div>
								<label class="col-xs-2 control-label no-padding">
									备注：
								</label>
								<div class="col-xs-4">
									<input type="text" id="sub_remark" name="obj.sub_remark" class="" style="width:93%;"/>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary " id="save_sub">
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
		<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="assets/js/bootstrap-select.min.js"></script>
		<script src="assets/js/defaults-zh_CN.js"></script>
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		<!-- Customize 
		<script src="js/accountItemDlg.js"></script>
		-->
		 
		<script type="text/javascript">
		
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
	    $(document).ready(function(){
			loadDictData();
			loadRef("ref_business_type", "bearable");
			loadSqlRef("select ITEM_NAME as itemName, ITEM_FIELD as itemField from sys_account_item where PARENT_ID IS NOT NULL", "itemField", "itemName", "usedInAccounts");
			loadSqlRef("select ITEM_NAME as itemName, ITEM_FIELD as itemField from sys_account_item where PARENT_ID IS NOT NULL", "itemField", "itemName", "targetAccount", "--请选择--");
			loadSqlRef("select ITEM_NAME as itemName, ID as id from sys_account_item where PARENT_ID IS NOT NULL", "id", "itemName", "accountItemId", "--请选择--");
			loadSqlRef("select DEPT_NAME as deptName from sys_dept where ABBR IS NOT NULL and ABBR != ''", "deptName", "deptName", "businessSta");
		});
		
		function loadDictData() {
			// 载入费率
			var obj = {"start":0,"length":999};
			var res = ajaxCRUD("sidRate!findAll.do", obj, false);
			var lst = res.lst;
			var html = "<option role='option' value=''>--请选择--</option>";
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option role='option' value='" + item.id + "'>" + item.name + "</option>";
			});
			$("#rateId").append(html);
		}
	
        var table_view;
        var parm = {};
		table_view = $('#table_view').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "sidPricePlan!selectByCriteria.do",
            	"data": parm,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
            	{"mDataProp": "name"},
    			{"mDataProp": "planType"},
    			{"mDataProp": "termDesc"},
    			{"mDataProp": "planFee"},
    			{"mDataProp": "accountItemName"},
    			{"mDataProp": "statusDesc"},
				{"mDataProp": ""}
    		],
			 columnDefs: [
                {
                    targets: 1,
                    render: function (a, b, c, d) {
                    	if (c.planType == 0) {
                    		return "兜底套餐";
                    	} else if (c.planType == 1) {
                    		return "用户套餐";
                    	} else if (c.planType == 2) {
                    		return "客户套餐";
                    	} else {
                    		return ""
                    	}
                    }
                }, {
                    targets: 2,
                    render: function (a, b, c, d) {
                    	if (c.termCount > 1) {
                    		return "" + c.termCount + c.termDesc;
                    	} else {
                    		return c.termDesc;
                    	}
                    }
                }, {
                    targets: 6,
                    render: function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"fn": "showDetailDlg(" + JSON.stringify(c) + ")", "color": "blue", "icon": "zoom-in"},
                                {"fn": "showUpdateDlg(" + JSON.stringify(c) + ")", "color": "green", "icon": "pencil"},
								{"fn": "del('" + c.id + "')", "color": "red", "icon": "trash"}
                            ]
                        };
                        var html = template(context);
                        return html;
                    }
                }
            ],
			"bLengthChange": false,//
			"iDisplayLength" :6,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		
        var table_view_sub;
        var parmSub;
        function initSubTable(fk) {
        	parmSub = {"fk": fk};
			table_view_sub = $('#table_view_sub').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
	            	"url": "sidPlanRate!findByFk.do",
    	        	"data": parmSub,
        	    	"dataSrc": "lst"
            	},
	            "aoColumns": [ 
    	        	{"mDataProp": "rateName"},
    				{"mDataProp": "remark"},
					{"mDataProp": ""}
	    		],
				columnDefs: [{
                    targets: 2,
                    render: function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"fn": "showDetailSubDlg(" + JSON.stringify(c) + ")", "color": "blue", "icon": "zoom-in"},
                                {"fn": "showUpdateSubDlg(" + JSON.stringify(c) + ")", "color": "green", "icon": "pencil"},
								{"fn": "delSub('" + c.id + "')", "color": "red", "icon": "trash"}
                            ]
                        };
                        var html = template(context);
                        return html;
                    }
                }],
				"bLengthChange": false,//
				"iDisplayLength" :10,
				"scrollY": "150px",
				"scrollCollapse": true,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": false,//开启分页功能
				"bSort" : false,//关闭排序
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
        }
        
		initSubTable("");
		
		
		/////////////////////////////////////////////////////////////////////////////////
		// 事件处理
		/////////////////////////////////////////////////////////////////////////////////
        $("#btn_inquiry").click(function() { 
        	var name = $("#nameCond").val();
        	var planType = $("#planTypeCond").val();
        	var status = $("#statusCond").val();
        	parm = {
        		"criteria.name": name, 
        		"criteria.planType": planType, 
        		"criteria.status": status,
        		"criteria.businessType": $("#crBusinessType").val()
        	};
			table_view.fnSettings().ajax.data = parm; 
			table_view.api().ajax.reload();
        });
        
		$("#table_view tbody").on("click", "tr", function(event) {
			$("#table_view tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view.fnGetData(event.target.parentNode);
			showSubList(aData.id);
		});
		
        $("#btn_add").click(function() { 
        	showNewDlg();
        });
        
        $("#policy").change(function() {
        	onPolicyChange();
        });
        
        function onPolicyChange() {
        	var policy = $("#policy").val();
        	if (policy == "None") {
        		$("#divUsedInAccount").css("display", "none");
        	} else {
        		$("#divUsedInAccount").css("display", "block");
        	}
        	$("#divLowest").css("display", "none");
        	$("#divDeduce").css("display", "none");
        	$("#divDiscount").css("display", "none");
        	$("#divDiscountByCond").css("display", "none");
        	$("#div" + policy).css("display", "block");
        }
        
        function buildPolicy(parm) {
        	var policy = $("#policy").val();
        	var usedInAccounts = ($("#usedInAccounts").val() == null ? [] : $("#usedInAccounts").val()).join("");
        	if ("None" == policy) {
    			parm["obj.durationFree"] = 0;
    			parm["obj.durationLimit"] = 0;
    			parm["obj.trafficFree"] = 0;
    			parm["obj.trafficLimit"] = 0;
    			parm["obj.occuranceFree"] = 0;
    			parm["obj.occuranceLimit"] = 0;
    			parm["obj.usedInAccounts"] = "";
    			parm["obj.targetAccount"] = "";
        	} else if ("Deduce" == policy) {
    			parm["obj.usedInAccounts"] = usedInAccounts;
    			parm["obj.durationFree"] = $("#durationFree").val();
    			parm["obj.durationLimit"] = 0;
    			parm["obj.trafficFree"] = 0;
    			parm["obj.trafficLimit"] = 0;
    			parm["obj.occuranceFree"] = 0;
    			parm["obj.occuranceLimit"] = 0;
    			parm["obj.targetAccount"] = "";
        	} else if ("Lowest" == policy) {
    			parm["obj.usedInAccounts"] = usedInAccounts;
    			parm["obj.durationFree"] = $("#durationLimit").val();
    			parm["obj.durationLimit"] = 0;
    			parm["obj.trafficFree"] = 0;
    			parm["obj.trafficLimit"] = 0;
    			parm["obj.occuranceFree"] = 0;
    			parm["obj.occuranceLimit"] = 0;
    			parm["obj.targetAccount"] = "";
        	} else if ("Discount" == policy) {
    			parm["obj.usedInAccounts"] = usedInAccounts;
    			parm["obj.durationFree"] = 0;
    			parm["obj.durationLimit"] = 0;
    			parm["obj.trafficFree"] = 0;
    			parm["obj.trafficLimit"] = 0;
    			parm["obj.occuranceFree"] = $("#occuranceFree").val();
    			parm["obj.occuranceLimit"] = 0;
    			parm["obj.targetAccount"] = "";
        	} else if ("DiscountByCond" == policy) {
    			parm["obj.usedInAccounts"] = usedInAccounts;
    			parm["obj.durationFree"] = 0;
    			parm["obj.durationLimit"] = 0;
    			parm["obj.trafficFree"] = $("#trafficFree").val();
    			parm["obj.trafficLimit"] = $("#trafficLimit").val();
    			parm["obj.occuranceFree"] = 0;
    			parm["obj.occuranceLimit"] = 0;
    			parm["obj.targetAccount"] = $("#targetAccount").val();
        	}
        }
        
        $("#save").click(function() {
        	if ($("#name").val() == "") {
        		alert("请输入套餐名称");
        		return;
        	}
        	if ($("#planFee").val() == "") {
        		alert("请输入套餐费用");
        		return;
        	}
        	
        	var business = ($("#bearable").val() == null ? [] : $("#bearable").val()).join("");
        	var businessSta = ($("#businessSta").val() == null ? [] : $("#businessSta").val()).join("");
        	var obj = {
    			"obj.id": $("#id").val(),
    			"obj.name": $("#name").val(),
    			"obj.planType": $("#planType").val(),
    			"obj.term": $("#term").val(),
    			"obj.termCount": $("#termCount").val(),
    			"obj.planFee": $("#planFee").val(),
    			/*
    			"obj.durationFree": $("#durationFree").val(),
    			"obj.durationLimit": $("#durationLimit").val(),
    			"obj.trafficFree": $("#trafficFree").val(),
    			"obj.trafficLimit": $("#trafficLimit").val(),
    			"obj.occuranceFree": 0,
    			"obj.occuranceLimit": $("#occuranceLimit").val(),
    			*/
    			"obj.planDesc": $("#planDesc").val(),
    			"obj.status": $("#status").val(),
    			"obj.remark": $("#remark").val(),
    			"obj.bearable": business,
    			"obj.businessSta": businessSta,
    			"obj.accountItemId": $("#accountItemId").val(),
    			"obj.accountItemName": $("#accountItemName").val()
        	};
        	buildPolicy(obj);
        	var flag = $("#flag").val();
        	
        	var resData;
        	if (flag == "add") {
        		resData = ajaxCRUD("sidPricePlan!insert.do", obj, true);
        	} else {
        		resData = ajaxCRUD("sidPricePlan!update.do", obj, true);
        	}
        	if (resData.resNum == "0") {
				table_view.fnSettings().ajax.data = parm; 
				table_view.api().ajax.reload(null, false);
				$("#dlg").modal("hide");
        	}
        });
        
        function del(id) {
	   		bootbox.confirm({
	   			locale: "zh_CN",
				size: 'small',
				title:"提示",
				message: "确认要删除？", 
				callback: function(result){
	   				if(result){
						var obj = {"id":id };
					    var resData = ajaxCRUD("sidPricePlan!delete.do", obj, true);
						if(resData.resNum == "0"){
							table_view.fnSettings().ajax.data = parm; 
							table_view.api().ajax.reload(null, false);
						}
	            	}
	            }
	    	});
        }
        
        $("#btn_add_sub").click(function() { 
        	showNewSubDlg();
        });
        
        $("#save_sub").click(function() {
        	if ($("#rateId").val() == "") {
        		alert("请选择费率");
        		return;
        	}
        	var obj = {
    			"obj.id": $("#sub_id").val(),
    			"obj.planId": $("#planId").val(),
    			"obj.rateId": $("#rateId").val(),
    			"obj.remark": $("#sub_remark").val()
        	};
        	var flag = $("#flag").val();
        	
        	var resData;
        	if (flag == "add") {
        		resData = ajaxCRUD("sidPlanRate!insert.do", obj, true);
        	} else {
        		resData = ajaxCRUD("sidPlanRate!update.do", obj, true);
        	}
        	if (resData.resNum == "0") {
				table_view_sub.fnSettings().ajax.data = parmSub; 
				table_view_sub.api().ajax.reload(null, false);
				$("#dlg_sub").modal("hide");
        	}
        });
        
        function delSub(id) {
	   		bootbox.confirm({
	   			locale: "zh_CN",
				size: 'small',
				title:"提示",
				message: "确认要删除？", 
				callback: function(result){
	   				if(result){
						var obj = {"id":id };
					    var resData = ajaxCRUD("sidPlanRate!delete.do", obj, true);
						if(resData.resNum == "0"){
							table_view_sub.fnSettings().ajax.data = parmSub; 
							table_view_sub.api().ajax.reload(null, false);
						}
	            	}
	            }
	    	});
        }
        
		/////////////////////////////////////////////////////////////////////////////////
		// 辅助函数
		/////////////////////////////////////////////////////////////////////////////////
        function showSubList(fk) {
        	parmSub = {"fk": fk};
			table_view_sub.fnSettings().ajax.data = parmSub; 
			table_view_sub.api().ajax.reload();
        }
        
        function showNewDlg() {
            $("#dlg_title").text("添加");
            clear();
            $("#flag").val("add");
            $("#save").show();
            $("#dlg").modal("show");
        }
        
        function showUpdateDlg(obj) {
            $("#dlg_title").text("修改");
        	detail(obj);
            $("#flag").val("edit");
            $("#save").show();
            $("#dlg").modal("show");
        }
        
        function showDetailDlg(obj) {
            $("#dlg_title").text("详情");
        	detail(obj);
            $("#flag").val("");
            $("#save").hide();
            $("#dlg").modal("show");
        }
        
        function detail(obj) {
    		$("#id").val(obj.id);
        	$("#name").val(obj.name);
        	$("#planType").val(obj.planType);
        	$("#term").val(obj.term);
        	$("#termCount").val(obj.termCount);
        	$("#planFee").val(obj.planFee);
        	$("#durationFree").val(obj.durationFree);
        	$("#durationLimit").val(obj.durationLimit);
        	$("#trafficFree").val(obj.trafficFree);
        	$("#trafficLimit").val(obj.trafficLimit);
        	$("#occuranceFree").val(obj.occuranceFree);
        	//$("#occuranceLimit").val(obj.occuranceLimit);
        	$("#planDesc").val(obj.planDesc);
        	$("#status").val(obj.status);
        	$("#remark").val(obj.remark);
        	var arr = [];
        	var str = obj.bearable;
        	if (str != undefined && str != "") {
	        	for (var i = 0; i < str.length; i++) {
	        		var ch = str.substring(i, i + 1);
	        		arr.push(ch);
	        	}
        	} 
        	$("#bearable").selectpicker("val", arr);
        	$("#accountItemId").val(obj.accountItemId);
        	$("#accountItemName").val(obj.accountItemName);
        	arr = [];
        	str = obj.usedInAccounts;
        	if (str != undefined && str != "") {
        		arr = str.split(",");
        	} 
        	$("#usedInAccounts").selectpicker("val", arr);
        	arr = [];
        	if (obj.businessSta != undefined && obj.businessSta != "") {
        		arr = obj.businessSta.split(",");
        	}
        	$("#businessSta").selectpicker("val", arr);
        	$("#targetAccount").val(obj.targetAccount);
        	if (obj.durationLimit > 0) {
        		$("#policy").val("Lowest");
        	} else if (obj.durationFree > 0) {
        		$("#policy").val("Deduce");
        	} else if (obj.trafficLimit > 0) {
        		$("#policy").val("DiscountByCond");
        	} else if (obj.occuranceFree > 0) {
        		$("#policy").val("Discount");
        	} else {
        		$("#policy").val("None");
        	}
        	onPolicyChange();
        }

    	function clear() {
    		$("#id").val("");
        	$("#name").val("");
        	$("#planType").val(1);
        	$("#term").val("MONTH");
        	$("#termCount").val("1");
        	$("#planFee").val("0");
        	$("#durationFree").val("0");
        	$("#durationLimit").val("0");
        	$("#trafficFree").val("0");
        	$("#trafficLimit").val("0");
        	$("#occuranceFree").val("0");
        	//$("#occuranceLimit").val("0");
        	$("#planDesc").val("");
        	$("#status").val(0);
        	$("#remark").val("");
        	$("#bearable").selectpicker("val", []);
        	$("#accountItemId").val("");
        	$("#accountItemName").val("");
        	$("#targetAccount").val("");
        	$("#usedInAccounts").selectpicker("val", []);
        	$("#businessSta").selectpicker("val", []);
        	$("#policy").val("None");
        	onPolicyChange();
    	}

        function showNewSubDlg() {
        	if (parmSub.fk == "") {
        		alert("请选择套餐");
        		return;
        	}
            $("#dlg_title_sub").text("添加");
            clearSub();
            $("#flag").val("add");
            $("#save_sub").show();
            $("#dlg_sub").modal("show");
        }
        
        function showUpdateSubDlg(obj) {
            $("#dlg_title_sub").text("修改");
        	detailSub(obj);
            $("#flag").val("edit");
            $("#save_sub").show();
            $("#dlg_sub").modal("show");
        }
        
        function showDetailSubDlg(obj) {
            $("#dlg_title_sub").text("详情");
        	detailSub(obj);
            $("#flag").val("");
            $("#save_sub").hide();
            $("#dlg_sub").modal("show");
        }
        
        function detailSub(obj) {
    		$("#sub_id").val(obj.id);
    		$("#planId").val(obj.planId);
        	$("#rateId").val(obj.rateId);
        	$("#sub_remark").val(obj.remark);
        }

    	function clearSub() {
    		$("#sub_id").val("");
    		$("#planId").val(parmSub.fk);
        	$("#rateId").val("");
        	$("#sub_remark").val("");
    	}
    	
    	function hideAccountItem() {
    		$("#divAccountItem").css("display", "none");
    	}
    	
    	$("#accountItemName").focus(function() {
    		initAccountItemTree();
    		$("#divAccountItem").css("display", "block");
    	});

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
