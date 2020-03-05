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
		 <style type="text/css">
			table#table_view>thead>tr>th {
				text-align: center;
			}
			table#table_view>tbody>tr>td {
				text-align: center;
			}
		</style>
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
		<script src="js/customer.js"></script>
		
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
					公费账户收费
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
                            			公费账户收费
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                  
                            				
                            				
                            				<select class=""  id="crBillNo" >
                            			</select>
                            			<select class=""  id="deptArea" >
                            			</select>
                            			<select class=""  id="payMethod" >
                            			</select>
                            			
                            				<!-- <input class="" id="crCustomerNo" type="text" placeholder="客户号" style="width:100px"/>
                            				<input class="" id="crUserKey" type="text" placeholder="电话" style="width:210px"/> -->
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btnInquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btnSave">
                            					<i class="icon-ok red"></i>
                            					收费并且打印收费票据
                            				</button>
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_view" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkAll"/></th>
													<th>账单月份</th>
													<th>客户号</th>
													<th>用户名称</th>
													<th>当月话费(￥)</th>
                                                    <th>欠费(￥)</th>
													<th>缴费标志</th>
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
		
　　　　　　　　　
		
		
		<script type="text/javascript">
		
		var userName = "${sessionScope.userInfo.userName}";
		var deptName = "${sessionScope.userInfo.deptName}";	
		var table_view;
        var criteria = {};
		
        $(document).ready(function() {
			loadRef("ref_bill_month", "crBillNo", "--账单月份--");
			loadArea();
			loadRef("ref_pay_method", "payMethod");
			$("#payMethod").val("2");
		});
		
		
		function initCustomerBills(criteria) {
			table_view = $('#table_view').DataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
            		"type": "post",
	            	"url": "ocsBill!findExpenseBill.do",
    	        	"data": criteria,
        	    	"dataSrc": "explist"
            	},
	            "columns": [ 
                    {
	                    "data": "customerChoosed",
	                    "width": "100px",
	                    "defaultContent": ""
                    },
	            	{
        	    		"data": "billMonth",
            			"width": "150px"
    	        	},
	            	{ 
    	        		"data": "customerNo",
        	    		"width": "150px",
            		},

	            	{ 
    	        		"data": "customerName",
        	    		"width": "*",
            		},
	            	{ 
    	        		"data": "amountTotal",
        	    		"width": "150px",
            		},
            		{ 
    	        		"data": "amountDue",
        	    		"width": "150px",
            		},
            		{ 
    	        		"data": "paySign",
        	    		"width": "150px",
            		}
	    		],
				columnDefs: [{
                    targets: 6,
                    render: function (a, b, c, d) {
                    	if (c.paySign == 9) {
                    		return '完成';
                    	} else if(c.paySign == 2)  {
                    		return '发布执行';
                    	}else if(c.paySign == 0)  {
                    		return '正在累账';
                    	}
                    }
				}, 
				    {
                    targets: 0,
                    render: function (a, b, c, d) {
                    	if (c.paySign == 9 || c.paySign == 0){
                    		return '<input id="cid' + c.customerId + '" type="checkbox" disabled/>';
                    	} else {
                    		return '<input id="cid' + c.customerId + '" type="checkbox" onclick=onCidClick("' + c.customerId + '") />';
                    	}
                    },
				    createdCell: function (a, b, c, d) {//模糊化显示
				      	if ( c.paySign == 9 || c.paySign == 0 ) {
				      		$(a).parent().css("color","#B4B4B4");
				      	}
                    }
                }],
				"bLengthChange": false,//
				"iDisplayLength" :10,
				"scrollY": "500px",
				"scrollCollapse": true,
				"searching":false,//关闭dataTable自带搜索
				"bPaginate": true,//开启分页功能
				"bInfo": false, //页脚信息
				"bSort" : false,//关闭排序
				"bDestroy": true,
				"language": { //国际化
					"url": "assets/js/Chinese.json"
				}
			});
		}
		
		$("#btnInquiry").click(function() {
			criteria = {};
		    if ($("#crBillNo").val() == ""){
		    	bbAlert("请选择账期");
				return;
		    }
		    if ($("#deptArea").val() == ""){
		    	bbAlert("请选择通信站");
				return;
		    }
		   
			if ($("#crBillNo").val() != "") {
				criteria["obj.billNo"] = $("#crBillNo").find("option:selected").text();
			}
			
		    if ($("#deptArea").val() != "") {
				criteria["obj.deptArea"] = $("#deptArea").find("option:selected").text();
			}

		    if ($("#payMethod").val() != "") {
				criteria["obj.payMethod"] = $("#payMethod").val();
			}
			initCustomerBills(criteria);
			table_view.ajax.reload();
		});
		
		function loadArea() {
			var res = ajaxCRUD("dept!findAll.do", {}, false);
			var lst = res.lst;
			var html = "";
			$(lst).each(function (index) {
				var item = lst[index];
				if (item.deptname !== "通信管理处") {
					html += "<option role='option' value='" + item.deptname + "'>" + item.deptname +"</option>";
				}
			});
			$("#deptArea").empty();
			$("#deptArea").append(html);
			//$("#deptArea option[value='通信管理处']").remove();//去掉"通信管理处"选项
			$("#deptArea").prepend("<option value=''>--通信站--</option>");
			if (deptName === "通信管理处") {
				$("#deptArea").find("option[value='']").attr("selected",true);
			} else {
				$("#deptArea").find("option[value='" + deptName + "']").attr("selected",true);
			}
		}

		//全选事件
		$("#checkAll").click(function () {
			if (table_view == null) return;
			var isCheck = $("#checkAll").get(0).checked;
        	var tableData = table_view.rows().data();
        	var count = tableData.length;
        	var i = 0;
        	for (i = 0; i < count; i++) {
        		var data = tableData[i];
        		if (data.paySign == 2) {
	        		$("#cid" + data.customerId).get(0).checked = isCheck;
	        		data.customerChoosed = isCheck ? 1 : 0;
        		}
        	}
		});
		
		//单选事件
		function onCidClick(customerId) {
			if (table_view == null) return;
			var tableData = table_view.rows().data();
			var count = tableData.length;
			var i = 0;
			for (i = 0; i < count; i++) {
				var data = tableData[i];
				if (data.customerId == customerId) {
					data.customerChoosed = $("#cid" + data.customerId).get(0).checked ? 1 : 0;
				}
			}
		}
		
       	var ids = "";
		function getSelectCustomer() {
			ids = "";
        	var tableData = table_view.rows().data();
        	var count = tableData.length;
        	for (var i = 0; i < count; i++) {
        		var data = tableData[i];
        		if (data.customerChoosed == 1) {
        			ids += (ids == "" ? "" : ",") + data.customerId;
        		}
        	}
        	console.log(ids);
        	return ids;
		}
		
		//遍历获取选中数据
		$("#btnSave").click(function () {
        	getSelectCustomer();
			var parm = {
				"obj.creator": userName,
				"obj.billMonth": $("#crBillNo").find("option:selected").text(),
				"obj.ids": ids
			};
			var res = null;
			res = ajaxCRUD("ocsBill!statePay.do", parm, true);
			if (res.resNum == "0") {
       			var id = res.id;
       			var rptFileName = 'rpt_phone_batch.cpt';
       			var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&id=" + id;
       			window.open(uri);
				table_view.ajax.reload();
        	}
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
