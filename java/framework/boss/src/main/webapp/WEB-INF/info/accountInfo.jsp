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
		<link rel="stylesheet" href="assets/css/datepicker/datetimepicker.css" />
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
		
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
		<script src="assets/js/datepicker/bootstrap-datetimepicker.js"></script>
		<script src="assets/js/datepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="assets/js/bootstrap-select.min.js"></script>
		<script src="assets/js/defaults-zh_CN.js"></script>
</head>
<body>
     <div class="breadcrumbs" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon green"></i>
					<a href="#">信息查询</a>
				</li>
				<li class="active">
					账户资料综合查询
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
                            			<i class="icon-book green bigger-110"></i>
                            			账户资料综合查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            			    <label>
												账户号:
											</label>		                 											
											<input type="text" id="accNo" />
											<label>
												大客户号:
											</label>										
											<input type="text" id="customerProp"/>
											<label>
												用户号:
											</label>
											<input type="text" id="businessKey"/> 																						 
											<label>
												账户名称:
											</label> 
											<input id="bankAccOwner" type="text"/> 
                            				<label>
												账户类型:
											</label> 
											<select calss="input-sm" id="payPolicy">												
											</select> &nbsp; &nbsp;	&nbsp;	&nbsp;	&nbsp;												
											<label>
												状态:
											</label> 
											<select calss="input-sm" id="status">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="1">正常</option>
												<option role="option" value="9">注销</option>
											</select>
											<label>
												是否代收:
											</label> 
											<select calss="input-sm" id="creditorKey">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="已设置">代收</option>
												<option role="option" value="未设置">不代收</option>
											</select>  
											<label>
												用户类别:
											</label> 
											<select calss="input-sm" id="userType">
											</select> 
											<label>
												业务区域:
											</label> 
											<select class="input-sm" id="userArea">
										    </select> 
										    <button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_infoquery">
                            					<i class="icon-search green"></i>
                            					打印报表
                            				</button>                      				
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_accountInfo" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
												 <th>客户号</th>
												 <th>账单电话</th>												 
												 <th>用户名称</th>
												 <th>用户类别</th>
												 <th>账户类型</th>
												 <th>是否代收</th>
												 <th>联系电话</th>												
												 <th>状态</th>
												 <th>销户日期</th>
												 <th>用户地址</th>
												 <th>业务区域</th>
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
		
		<script type="text/javascript">
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////		
		$(document).ready(function() {
			$("[data-toggle='tooltip']").tooltip();
			initTableAccountInfo();
			//查询业务区域
			var res = ajaxCRUD("dept!findAll.do", {}, false);
			var lst = res.lst;
			var html = null;
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option role='option' value='" + item.deptname + "'>" + item.deptname + " " + item.abbr + "</option>";
			});
			$("#userArea").empty();
			$("#userArea").append(html);
			//$("#deptArea").find("option[value='" + deptName + "']").attr("selected",true);
			$("#btn_infoquery").attr("disabled",true);
			
			loadRef("ref_customer_type", "userType", "--请选择--");
			loadRef("ref_pay_policy", "payPolicy", "--请选择--");
		});
		
		var table_accountInfo;
	    var criteria = {};
	    function initTableAccountInfo(){
	    	table_accountInfo = $('#table_accountInfo').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "account!findAccountInfoPage.do",
	            	"data": criteria,
	            	"dataSrc": "ulst"
	            },
	            "aoColumns": [ 
	                {"mDataProp": "customerDesc"},
	              	{"mDataProp": "businessKey"},
	              	{"mDataProp": "name"},
	              	{"mDataProp": "userType"},
	              	{"mDataProp": "payPolicy"},
	               	{"mDataProp": "creditorKey"},
	               	{"mDataProp": "linkPhone"},
	               	{"mDataProp": "statusDesc"},
	               	{"mDataProp": "regDesc"},
	               	{"mDataProp": "address"},
	               	{"mDataProp": "userArea"},
	             ],      	
				 columnDefs: [{	     	           				 
				 	 	targets: 4,
     	        	 	render: function (a, b, c, d) {
	         	    	if(c.payPolicy==1){
	         	    		return "后付费";
	         	    	}if(c.payPolicy==2){
	         	    		return "预付费";
	         	    	}
             	      }
				    },
				      {	     	           				 
				 	 	targets: 3,
     	        	 	render: function (a, b, c, d) {
	         	    	if(c.userType==1){
	         	    		return "自费";
	         	    	}if(c.userType==2){
	         	    		return "公费";
	         	    	}
             	      }
				    },{
     	            targets: 5,
        	        render: function (a, b, c, d) {
            	    	if(c.creditorKey=="已设置"){
            	    		return "代收";
            	    	}else{
            	    		return "不代收";
            	    	}
                	}
				 },{
	     	            targets: 7,
	        	        render: function (a, b, c, d) {
	            	    	if(c.statusDesc=="1"){
	            	    		return "正常";
	            	    	}else if(c.statusDesc=="9"){
	            	    		return "注销";
	            	    	}else{
	            	    		return "正在注册";
	            	    	}
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
		 $("#btn_inquiry").click(function() {
			 $("#btn_infoquery").removeAttr("disabled");
			 criteria = {
		        "user.customerDesc": $("#accNo").val(),
		        "user.customerProp": $("#customerProp").val(),
		        "user.businessKey": $("#businessKey").val(),
		        "user.bankAccDesc": $("#bankAccOwner").val(),
		        "user.payPolicy": $("#payPolicy").val(),
		        "user.statusDesc": $("#status").val(),
		        "user.creditorKey": $("#creditorKey").val(),
		        "user.userType": $("#userType").val(),
		        "user.userArea": $("#userArea").val()
		       };
			 table_accountInfo.fnSettings().ajax.data = criteria; 
			 table_accountInfo.api().ajax.reload(); 
		 })
		
		//打印报表
		$("#btn_infoquery").click(function() {
			var rptFileName = "hthinfoquery.cpt";
			var accNo = $("#accNo").val();
			var customerProp = $("#customerProp").val();
			var businessKey = $("#businessKey").val();
			var bankAccOwner = $("#bankAccOwner").val();
			var payPolicy = $("#payPolicy").val();
			var status = $("#status").val();
			var creditorKey = $("#creditorKey").val();
			var userType = $("#userType").val();
			var userArea = $("#userArea").val()
	        var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&status=" + status + "&userType=" + userType + "&accNo=" + accNo + "&customerProp=" + customerProp + "&businessKey=" + businessKey + "&bankAccOwner=" + bankAccOwner + "&payPolicy=" + payPolicy + "&creditorKey=" + creditorKey + "&userArea=" + userArea;
	        window.open(uri);
				
		})
		 
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