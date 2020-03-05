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
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker/datetimepicker.css" />
		<link rel="stylesheet" href="assets/css/chosen.css" />
			
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/datepicker.css" />
		
		<link rel="stylesheet" href="css/datatable.css">
		 
		<!-- scripts -->
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
		<!-- zTree -->
		<!-- zTree -->
		<script src="assets/js/jquery.ztree.core-3.5.js"></script>
		<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
		 
	</head>

	<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">账务管理</a>
				</li>
				<li class="active">
					实时账单
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
                            			<i class="icon-film blue bigger-110"></i>
                            			费用调整
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                  
                            				
                            				
                            				<select class=""  id="crBillNo" >
                            			</select>
                            				<input class="" id="crCustomerNo" type="text" placeholder="客户号" style="width:100px"/>
                            				<input class="" id="crUserKey" type="text" placeholder="电话" style="width:210px"/>
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
													<th>#</th>
													<th>账单号</th>
													<th>类型</th>
													<th>客户号</th>
													<th>客户名</th>
													<th>业务号</th>
													<th>业务类别</th>
													<th>账户余额(￥)</th>
													<th>话费合计(￥)</th>
													<th>应缴费(￥)</th>
													<th>补收补退(￥)</th>
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
				</div>
			</div>
		
　　　　　　　　　<div class="tabbable">
		　　　　　　　<ul class="nav nav-tabs padding-18">
				<li class="active">
					<a data-toggle="tab" href="#ne"><iclass="green icon-phone bigger-120"></i> 修改日志 </a>
				</li>
		　　　　　　</ul>

		　　　　　　
			　　　　<div class="col-sm-12">
				　　　　　　<table id="table_accountInfo" class="table table-striped table-bordered table-hover">
					             <thead>
　　　　　　　　　　　　　　　　　　　 <tr>
							　　　　　　　　　　　　　　<th>电话号码</th>
							　　　　　　　　　　　　　　<th>修改时间</th>												 
							　　　　　　　　　　　　　　<th>修改人员</th>
							　　　　　　　　　　　　　　<th>日志</th>
						　　　　　　　</tr>
					　　　　　　　　</thead>
					　　　　　　<tbody></tbody>
				　　　　　　</table>
			</div>
		
	</div>
		<!-- 模态框 -->
		<div class="modal fade" id="dlg" tabindex="-1" role="dialog"
			aria-labelledby="eModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:80%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="dlg_title">
							调账
						</h4>
					</div>

					<input type="hidden" id="flag" value="">
					<input type="hidden" id="id" value="">
					<div class="modal-body">
						<form class="form-horizontal">
				     <div class="row form-group">
							
							<label class="col-xs-2 control-label no-padding">客户账期：</label>
								<div class="col-xs-3">
									<input type="text" id="boMonth" class="form-control" readonly/>	
								</div>

								<label class="col-xs-2 control-label no-padding">用户号码：</label>
								<div class="col-xs-3">
									<input type="text" id="userKey" class="form-control" readonly/>	
								</div>
					      </div>
								<div class="form-group">
								<label class="col-xs-2 control-label no-padding">客户名称：</label>
								<div class="col-xs-3">
									<input type="text" id="customerName" class="form-control" readonly/>	
								</div>
								<label class="col-xs-2 control-label no-padding">话费合计：</label>
								<div class="col-xs-3">
									<input type="text" id="amountTotal" class="form-control" readonly/>	
								</div>
								
							</div>
							<div>
									<table id="table_view_amount" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th><i class="icon-edit purple bigger-110"></i></th>
												<th><i class="icon-flag red bigger-110"></th>
												<th>项目</th>
												<th>项目金额（￥）</th>
												<th>调整金额（￥）</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding">备注：</label>
								<div class="col-xs-10">
									<input type="text" id="remark" class="form-control"/>	
									<input type="text" id="billid" style="display:none"/>
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
		
		<script type="text/javascript">
		var userName = "${sessionScope.userInfo.userName}";
        var table_view;
        var table_view_amount;
        var criteria = {};
        var currProductTr;
        var currProductRow;
    	/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////
		$(document).ready(function() {
			loadRef("ref_bill_month", "crBillNo", "--账单月份--");
			/* $('#table_view tbody').on('click', 'td.details-control', openBillItem); */
			$('#table_view_amount tbody').on('click', 'td.details-control', openProductEditor); 
			$("#crCustomerNo").focus(function(){
				$("#crUserKey").val("");
				
			});
			$("#crUserKey").focus(function(){
				$("#crCustomerNo").val("");
				
			});
		});
		
		$(document).keyup(function(event){
			  if(event.keyCode ==13){
			    $("#btnInquiry").trigger("click");
			  }
			});
		function initTableView(criteria) {
			table_view = $('#table_view').dataTable({
				"serverSide": true, //服务器模式，分页用
				"destroy" :true,
				"ajax": {
            		"type": "post",
            		"url": "ocsBill!findByCorBillPage.do",
            		"data": criteria,
            		"dataSrc": "lst"
            	},
        		"columns": [
            		{
                		"className":      'details-control',
                		"orderable":      false,
                		"data":           null,
                		"width": "30px",
                		"defaultContent": ''
            		},
            		{ 
            			"data": "billNo",
            			"width": "120px",
            		},
            		{ 
            			"data": "customerType",
            			"width": "60",
            		},
            		{ 
            			"data": "customerNo",
            			"width": "60",
            		},
            		{ 
            			"data": "customerName",
            			"width": "*",
            		},
            		{ 
            			"data": "businessKey",
            			"width": "80px",
            		},
            		{ 
            			"data": "businessType",
            			"width": "80px",
            		},
            		{ 
            			"data": "balance",
            			"width": "100px",
            		},
            		{ 
            			"data": "amountTotal",
            			"width": "100px",
            		},
            		{ 
            			"data": "amountDue",
            			"width": "100px",
            		},
            		{ 
            			"data": "amountAdjust",
            			"width": "100px",
            		},
            		{ 
            			"data": "status",
            			"width": "80px",
            		},
            		{ 
            			"data": "null",
            			"width": "100",
                		"defaultContent": ''
            		},
            	],
				columnDefs: [{
                    targets: 2,
                    render: function (a, b, c, d) {
                    	if (c.customerType == 1) {
                    		return '散户';
                    	} else {
                    		return '大户';
                    	}
                    }
                },{
                    targets: 6,
                    render: function (a, b, c, d) {
                    	if (c.businessType == 'a') {
                    		return 'ADSL';
                    	} else if (c.businessType == 'b') {
                    		return '宽带';
                    	} else if (c.businessType == 'l') {
                    		return '专线';
                    	} else if (c.businessType == 'n') {
                    		return '新业务';
                    	} else if (c.businessType == 'p') {
                    		return '电话';
                    	} else {
                    		return ' ';
                    	}
                    }
                },{
                    targets: 11,
                    render: function (a, b, c, d) {
                    	if (c.status == 0) {
                    		return '<span class="label label-info arrowed-in">累账</span>';
                    	} else if (c.status == 1) {
                    		return '<span class="label label-info arrowed-in">核账</span>';
                    	} else if (c.status == 2) {
                    		return '<span class="label label-inverse arrowed">执行</span>';
                    	} else if (c.status == 9) {
                    		return '<span class="label label-success arrowed-in-right">完成</span>';
                    	} else {
                    		return '<span class="label label-warning">呆坏账</span>';
                    	}
                    }
                },{
                    targets: 12,
                    render: function (a, b, c, d) {
                    	var fs = [];
                    	if (c.status < 9) {
                    		
                    		fs.push({"fn": "adjustBill('" + c.id + "','" + c.customerName + "','" + $("#crUserKey").val() + "')", "color": "red", "icon": "adjust", "tooltip": "调账"});
                    	}
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
		
		function initTableView_amount(billId , userKey) {
			var parm = {"obj.bill_id": billId,"obj.viwe_userKey":userKey};
			
				table_view_amount = $('#table_view_amount').dataTable({
					"serverSide": true, //服务器模式，分页用
					"destroy" :true,
					"ajax": {
            			"type": "post",
            			//"url": "ocsBill!findItemsByBillId.do",
            			"url": "ocsBill!countItemsByBillAmount.do",
            			"data": parm,
	            		"dataSrc": "lst"
    	        	},
        	    	"columns": [ 
                         {
	                       "className":      'details-control',
	                       "orderable":      false,
	                       "data":           null,
	                       "width": "30px",
	                       "defaultContent": ''
                           },
                           {
                       		"data": "productChoosed",
                       		"width": "30px",
                       		"defaultContent": ""
                        	},
                         { 
                       		"data": "name",
                       		"width": "280px",
                          },
                          { 
                           	"data": "value",
                           	"width": "200px",
                            },
                            { 
                        		"data": "productOrderPrice",
                        		"width": "120",
                        		"defaultContent": "0"
                        	},
	    			    ],
	    			
					columnDefs: [{
						
		                    targets: 1,
		                    render: function (a, b, c, d) {
		                    	var html = "";
		                    	if (c.productChoosed == "1") {
		                    		html = '<i class="icon-shopping-cart red bigger-110"></i>';
		                    	}
		                        return html;
		                    }
						
	                }],
	                
					"bLengthChange": false,//
					"iDisplayLength" :10,
					"searching":false,//关闭dataTable自带搜索
					"bPaginate": false,//开启分页功能
					"bInfo": false,
					"bSort" : false,//关闭排序
					"bDestroy" : true,//重绘
					"language": { //国际化
						"url": "assets/js/Chinese.json"
					}
    	        	
				});
				
			
		}
		function openProductEditor() {
			var tr = $(this).closest('tr');
		    var row = table_view_amount.api().row( tr );
		    currProductTr = tr;
		    currProductRow = row;
		 
		    if ( row.child.isShown() ) {
		    	// This row is already open - close it
		        row.child.hide();
		        tr.removeClass('shown');
		    }
		    else {
		    	// Open this row
		        row.child(getOpenProductEditor(row.data())).show();
		        tr.addClass('shown');
		        
			}
		}
		
		$("#table_view tbody").on("click", "tr", function(event) {
			$("#table_view tbody").find("tr").each(function() {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view.fnGetData(event.target.parentNode);
			initTableView_accountInfo(aData.businessKey);
		});
		var table_accountInfo;
		initTableView_accountInfo("");
		function showTableAccountInfo(businessKey){
			parm = {"sysLog.phongOn":businessKey};
			table_accountInfo.fnSettings().ajax.data = parm; 
			table_accountInfo.api().ajax.reload(); 
		}
		
		function initTableView_accountInfo(businessKey) {
			parm = {"obj.phongOn":businessKey};
			table_accountInfo = $('#table_accountInfo').dataTable({
					"serverSide": true, //服务器模式，分页用
					"destroy" :true,
					"ajax": {
            			"type": "post",
            			"url": "ocsBill!findSysLog.do",
            			"data": parm,
	            		"dataSrc": "slst"
    	        	},
        	    	"columns": [ 
        	    	           
                                 {
                                	 "data": "phoneNo",
                                	 "width": "30px",
                                	  },
	                             {
                                      "data": "createDate",
	                                  "width": "70px",
                                		  },
	                             {
                                	  "data": "creator",
	                            	  "width": "30px",
	                            	 },
	                             {
	                            	  "data": "log",
	                            	  "width": "500px",
	                            	 },
	    			            ],
	                
	    			            "bLengthChange": false,//
	    						"iDisplayLength" :10,
	    						"searching":false,//关闭dataTable自带搜索
	    						"bPaginate": false,//开启分页功能
	    						"bInfo": false,
	    						"bSort" : false,//关闭排序
	    						"bDestroy" : true,//重绘
	    						"language": { //国际化
	    							"url": "assets/js/Chinese.json"
					}
    	        	
				});
				
			
		}
		function getOpenProductEditor(d) {
			var orderCount = (d.productOrderPrice == undefined || d.productOrderPrice == "")  ? 0 : d.productOrderPrice;
			return '<table cellpadding="0" cellspacing="0" border="0" >' +
		        		'<tr>'+
		            		'<td>修改金额:</td>' +
		            		'<td><input type="text" class="form-control" id="productOrderCount" value="' + orderCount + '" style="width: 100px"/></td>' +
		            		'<td><button class="btn btn-sm btn-success" id="btnChooseProduct" onclick="btnChooseProductClicked()">' +
								'<i class="icon-shopping-cart bigger-110"></i>' +
									'修改' +
								'</button> &nbsp;' +
		            			'<button class="btn btn-sm btn-fail" id="btnCancelProduct" onclick="btnCancelProductClicked()">' +
								'<i class="icon-trash bigger-110"></i>' +
									'撤销' +
								'</button>' +
							'</td>' +
		        		'</tr>' +
		    		'</table>';
		}
		function btnChooseProductClicked() {
			
			var orderCount = $("#productOrderCount").val();
			var i =table_view_amount.api().cell(currProductRow.index(),3).data();
			var orderCount= parseFloat(orderCount)+parseFloat(i);
			
			table_view_amount.api().cell(currProductRow.index(), 4).data(orderCount);
			table_view_amount.api().cell(currProductRow.index(), 1).data("1");
			currProductRow.child.hide();
			currProductTr.removeClass('shown');
			
		}
		function btnCancelProductClicked() {
		
			table_view_amount.api().cell(currProductRow.index(), 1).data("0");
			table_view_amount.api().cell(currProductRow.index(), 4).data("0");
			currProductRow.child.hide();
			currProductTr.removeClass('shown');
		}
		var openBillItem = (function() {
			var tr = $(this).closest('tr');
    		var row = table_view.api().row( tr );
 
    		if ( row.child.isShown() ) {
    			// This row is already open - close it
        		row.child.hide();
        		tr.removeClass('shown');
    		} else {
    			// Open this row
    			
        		row.child(getBillItem(row.data())).show();
        		tr.addClass('shown');
			}
		});
		
		function getBillItem(d) {
			var res = ajaxCRUD("ocsBill!findItemsByBillId.do", {"id": d.id}, false);
			var lst = res.lst;
			var content = '<table cellpadding="0" cellspacing="0" border="0" >';
			var odd = 0;
			for (var i = 0; i < lst.length; i++) {
				var row = lst[i];
				var td = '<td>' + row.name + '(￥):</td>' +
						 '<td>' + row.value + '</td><td>&nbsp;</td>';
				if (odd == 0) {
					content +=  '<tr>' + td;
				} else if (odd == 3) {
					content += td + '</tr>';
				} else {
					content += td;
				}
				odd = odd + 1;
				if (odd > 3) {
					odd = 0;
				}
			}
			if (odd == 0) {
				content += '</tr>';
			}
			content += '</table>';
			return content;
		}
		
		function releaseBill(id) {
			var res = ajaxCRUD("ocsBill!releaseBill.do", {"id": id}, true);
			if (res.resNum == "0") {
				table_view.api().ajax.reload();
			}
		}
		
		function amountTotal(criteria){
			
			var res = ajaxCRUD("ocsBill!amountTotal.do", criteria);
			$("#amountTotal").val(res.amount); 
		}
		
		function adjustBill(id, customerName, userKey) {
			$("#id").val(id);
			var boMonth = $("#crBillNo").find("option:selected").text();
			$("#boMonth").val(boMonth);
			
			$("#customerName").val(customerName);
			$("#userKey").val(userKey == "null" ? "" : userKey);
			$("#amountAdjust").val("");
			$("#remark").val("");
			$("#billid").val(id);
			var billId = id ;
			
			initTableView_amount(billId,userKey);		
			$("#dlg").modal("show");
		}
		var parm = {};
		$("#save").click(function() {
			if ($("#remark").val() == "") {
				alert("必须添加备注！");
				$("#remark").focus();
				
				return;
			}
			parm = {
					"saItem.userName":userName,
					"saItem.billId": $("#billid").val(),
					"saItem.userKey": $("#userKey").val(),
					"saItem.remark": $("#remark").val(),
			       };
			tableData = table_view_amount.api().rows().data();
			var productCount = tableData.length;
			var i ;
			var index = 0;
			
			for (i = 0; i < productCount; i++) {
        		var data = tableData[i];
        		if (data.productChoosed === "1") {
    		    	parm["sysAccountItem[" + index + "].itemName"] = data.name;
    	   		    parm["sysAccountItem[" + index + "].itemPrice"] = data.productOrderPrice;
    	    		index++;
    	    	}
        	}    	  
			var res = ajaxCRUD("ocsBill!adjustBill.do", parm, true);
			if (res.resNum == "0") {
				$("#dlg").modal("hide");
				table_view.api().ajax.reload();
			} 
		});
				
		/* function badBill(id) {
			var res = ajaxCRUD("ocsBill!badBill.do", {"id": id}, true);
			if (res.resNum == "0") {
				table_view.api().ajax.reload();
			}
		}
		
		function normalBill(id) {
			var res = ajaxCRUD("ocsBill!normalBill.do", {"id": id}, true);
			if (res.resNum == "0") {
				table_view.api().ajax.reload();
			}
		}
		
		function payBill(customerId) {
			self.location = "ocsBill!goToPayPage.do?customerId=" + customerId;
		}
		 */
		$("#btnInquiry").click(function() {
			criteria = {};
		    if ($("#crBillNo").val() == ""){
		    	bbAlert("请输入账期");
				return;
		    }
		    if ($("#crCustomerNo").val() == "" && $("#crUserKey").val() == ""  ){
		    	bbAlert("请输入帐号或者电话号码");
				return;
		    }
			if ($("#crCustomerNo").val() != "") {
				criteria["obj.customerNo"] = $("#crCustomerNo").val();
			}

			if ($("#crBillNo").val() != "") {
				criteria["obj.billNo"] = $("#crBillNo").find("option:selected").text();
			}

			if ($("#crUser").val() != "") {
				criteria["obj.userKey"] = $("#crUserKey").val();
			}
			initTableView(criteria);
			
			//table_view.fnSettings().ajax.data = criteria; 
			table_view.api().ajax.reload();
			amountTotal(criteria);
		});
		
		
		
		/////////////////////////////////////////////////////////////////////////////////
		// 辅助函数
		/////////////////////////////////////////////////////////////////////////////////
		
		</script>

		<!-- 按钮组的Handlebars模板 -->
		<jsp:include page="../pub/tpl.jsp" flush="true"/>


		<script type="text/javascript">
            var tpl = $("#tpl").html();
            //预编译模板
            var template = Handlebars.compile(tpl);
			
			// alert(userName);
        </script>
	</body>
</html>
