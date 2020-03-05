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
		<script src="assets/js/datepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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
					用户综合查询
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
                            			用户综合查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            			    <label>
												查询条件:
											</label>		                 											
											<select calss="input-sm" id="">
												<option role="option" value="">--请选择--</option>
												<option role="option" value="">电话号码</option>
												<option role="option" value="">用户名称</option>
												<option role="option" value="">客户号</option>
												<option role="option" value="">联系电话</option>
											</select>	
											<input type="text" id="exactText" placeholder="精确查询 ">																				
											<input type="text" id="fullText" placeholder="模糊查询 "/>																						
											<label>
												信誉度:
											</label> 											
											<select calss="input-sm" id="vipDesc">
											</select> 
											<label>
												装机日期:
											</label> 
											<input id="startTime" type="text" class="date-timepicker" placeholder="开始时间"/> 至  
                            				<input id="endTime" type="text" class="date-timepicker" placeholder="截止时间"/>
                            				<label>
												用户状态:
											</label> 
											<select calss="input-sm" id="status">
											</select>											 
											<label>
											          业务类型:
											</label> 
											<select calss="input-sm" id="businessType">
											</select>
											<label>
												用户类型:
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
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_yhinfoquery">
                            					<i class="icon-search green"></i>
                            					打印报表
                            				</button>                      				
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_userInfo" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
												 <th>电话号码</th>
												 <th>业务类型</th>
												 <th>客户号</th>
												 <th>信誉度</th>
												 <th>用户名称</th>
												 <th>联系电话</th>
												 <th>用户地址</th>
												 <th>用户类型</th>
												 <th>装机日期</th>
												 <th>业务区域</th>
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
    </div>
		
	<div class="tabbable">
					<ul class="nav nav-tabs padding-18">
						<li class="active">
							<a data-toggle="tab" href="#ne"> <i
								class="green icon-phone bigger-120"></i>信息列表 </a>
						</li>
					</ul>

					<div id="div_sub" class="tab-pane">
						<div class="col-sm-12">
                            <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">                                
                            </div>
							<table id="table_view_item" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>
											业务号
										</th>
										<th>
											项目名称
										</th>
										<th>
											项目类型
										</th>
										<th>
											费用类型
										</th>
										<th>
										          价格
										</th>
										<th>
											周期
										</th>
										<th>
											生效日期
										</th>
										<th>
											失效日期
										</th>
										<th>
											到期日
										</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>

		
		<script type="text/javascript">
		/////////////////////////////////////////////////////////////////////////////////
		// 装载数据
		/////////////////////////////////////////////////////////////////////////////////		
		$(document).ready(function() {
			$("[data-toggle='tooltip']").tooltip();
			initTableUserInfo();
			//$(".date-timepicker").datetimepicker();
			$('.date-timepicker').datetimepicker({  
			language:  'zh-CN',  //显示中文
			autoclose: 1
            }); 
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
			$("#btn_yhinfoquery").attr("disabled",true);
			//字典表获取数据字典
			loadRef("ref_vip", "vipDesc", "--请选择--");
			loadRef("ref_user_status", "status", "--请选择--");
			loadRef("ref_phone_prop", "userType", "--请选择--");
			loadRef("ref_business_type", "businessType", "--请选择--");
		});
		
		var table_userInfo;
	    var criteria = {};
	    function initTableUserInfo(){
	    	table_userInfo = $('#table_userInfo').dataTable({
				"serverSide": true, //服务器模式，分页用
				"ajax": {
	            	"type": "post",
	            	"url": "crmUser!findUserInfoPage.do",
	            	"data": criteria,
	            	"dataSrc": "lst"
	            },
	            "aoColumns": [ 
	                {"mDataProp": "businessKey"},
	                {"mDataProp": "businessType"},
	              	{"mDataProp": "customerDesc"},
	              	{"mDataProp": "vipDesc"},
	              	{"mDataProp": "name"},
	               	{"mDataProp": "linkPhone"},
	               	{"mDataProp": "address"},
	               	{"mDataProp": "userType"},
	               	{"mDataProp": "effectiveTime"},
	               	{"mDataProp": "userArea"},
	               	{"mDataProp": "status"},
	               	{"mDataProp": ""}
	             ],      	
				 columnDefs: [{	     	           				 
				 	 	targets: 7,
     	        	 	render: function (a, b, c, d) {
	         	    	if(c.userType==1){
	         	    		return "住宅";
	         	    	}if(c.userType==2){
	         	    		return "办公";
	         	    	}if(c.userType==3){
	         	    		return "商用";
	         	    	}
             	      }
				  },{
					targets: 10,
        	        render: function (a, b, c, d) {
            	    	if(c.status==0){
            	    		return "未完工";
            	    	}if(c.status==1){
            	    		return "审批";
            	    	}if(c.status==2){
            	    		return "正常";
            	    	}if(c.status==3){
            	    		return "欠费停机";
            	    	}if(c.status==4){
            	    		return "停机";
            	    	}if(c.status==90){
            	    		return "正在拆除";
            	    	}if(c.status==91){
            	    		return "拆除";
            	    	}
                	}
				 },{
                    targets: 11,
                    render: function (a, b, c, d) {
                    	var func = [];
                    	func.push({"fn": "viewUserInfo('" + c.id + "')", "color": "blue", "icon": "bars", "tooltip": "查看信息"});
                    	func.push({"fn": "dlgUserInfo('" + c.id + "','"+c.customerId+"')", "color": "blue", "icon": "user-md", "tooltip": "查看详细信息"});
                        var context =
                        {
                            "func": func 
                        };
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
		//事件处理
		 $("#btn_inquiry").click(function() {
			 $("#btn_yhinfoquery").removeAttr("disabled");
			 criteria = {
		        "obj.fullText": $("#fullText").val(),
		        "obj.vipDesc": $("#vipDesc").val(),
		        "obj.startTime": $("#startTime").val(),
		        "obj.endTime": $("#endTime").val(),
		        "obj.status": $("#status").val(),		        
		        "obj.businessType": $("#businessType").val(),
		        "obj.userType": $("#userType").val(),
		        "obj.userArea": $("#userArea").val(),
		        "obj.exactText": $("#exactText").val()
		       };
			 table_userInfo.fnSettings().ajax.data = criteria; 
			 table_userInfo.api().ajax.reload(); 
		 })
		  
		var table_view_item;
		var parmItem;
		initTableItem("");
		///查看套餐信息
		function viewUserInfo(id){
			 var parm = {"item.orderId":id};				
			 table_view_item.fnSettings().ajax.data = parm; 
			 table_view_item.api().ajax.reload();
		}
		
		// 查看具体信息
		function initTableItem(id){
			var parm = {"item.orderId":id};
			table_view_item = $('#table_view_item').dataTable({
					"serverSide": true, //服务器模式，分页用
					"ajax": {
		            	"type": "post",
		            	"url": "crmUser!findByUserId.do",
		            	"data": parm,
		            	"dataSrc": "ulst"
		            },
		            "aoColumns": [ 
		                {"mDataProp": "keyName"},
		              	{"mDataProp": "itemName"},
		              	{"mDataProp": "itemType"},
		              	{"mDataProp": "saleType"},
		              	{"mDataProp": "itemPrice"},
		               	{"mDataProp": "term"},
		               	{"mDataProp": "effectiveTime"},
		               	{"mDataProp": "expiryTime"},
		               	{"mDataProp": "dueTime"}
		             ],      	
					 columnDefs: [{
	     	            targets: 2,
	        	        render: function (a, b, c, d) {
	            	    	if(c.itemType==1){
	            	    		return "套餐";
	            	    	}if(c.itemType==2){
	            	    		return "增值服务";
	            	    	}if(c.itemType==3){
	            	    		return "业务受理费";
	            	    	}
	                	}
					 },{	     	           				 
					 	 	targets: 3,
	     	        	 	render: function (a, b, c, d) {
		         	    	if(c.saleType==1){
		         	    		return "一次性费用";
		         	    	}if(c.saleType==2){
		         	    		return "周期性费用";
		         	    	}
	             	      }
					}],
					"bLengthChange": false,//
					"iDisplayLength" :5,
					"searching":false,//关闭dataTable自带搜索
					"bPaginate": true,//开启分页功能
					"bSort" : false,//关闭排序
					"language": { //国际化
						"url": "assets/js/Chinese.json"
					}
				});
		    }
		 
		//打印报表
		$("#btn_yhinfoquery").click(function() {
			var rptFileName = "yhinfoquery.cpt";
			var fullText = $("#fullText").val();
			var vipDesc = $("#vipDesc").val();
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			var status = $("#status").val();
			var businessType = $("#businessType").val();
			var userType = $("#userType").val();
			var userArea = $("#userArea").val();
			var exactText = $("#exactText").val()
	        var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&status=" + status + "&userType=" + userType + "&fullText=" + fullText + "&vipDesc=" + vipDesc + "&startTime=" + startTime + "&endTime=" + endTime + "&businessType=" + businessType + "&userArea=" + userArea + "&exactText=" + exactText;
	        window.open(uri);
				
		})
		
		//查看用户详细信息
		var resType;
		function dlgUserInfo(id,customerId){
			loadCustomerInfo(id);
			loadJfxxInfo(customerId);
			loadFormInfo(id);
			loadOrderInfo(id);
			loadDJxxInfo(id);
			loadCustomerIdInfo(customerId);
			loadActionInfo(id);
			var id = {"id":id};
			var res = ajaxCRUD("crmUser!findByUserType.do", id, false);
			resType = res.obj.businessType;
			//$("#price_href").text(resType === "p" ? "电话套餐" : "宽带套餐" );
			if(resType=="p"){
				$("#price_href").text("电话套餐");
			}else if(resType=="b"){
				$("#price_href").text("宽带套餐");
			}else{
				$("#price_href").text("专线套餐");
			} 
			$("#dlgUserInfo").modal("show");
		}
		
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
        
        <jsp:include page="../info/dlgUserInfo.jsp"></jsp:include>
</body>
</html>