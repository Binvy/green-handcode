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
					 公费电话明细查询
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
                            			公费电话明细查询
                            		</h4>
                            		<div class="widget-toolbar">
                            			<span class="badge badge-danger"></span>
                            		</div>
                            	</div>
                            	<div class="widget-body">
                            		<div class="widget-toolbox" id="widget-toolbox-1">
                            			<div class="btn-toolbar">
                            			    <label>
												账期:
											</label>	
											<input type="text" id="billMonth" readonly>
											<input type="hidden" id="bData">
											<input type="hidden" id="cData">
											<label>
												查询方式:
											</label>
											<select id="cxfs" calss="input-sm">
											   <option role="option" value="1">大客户号</option>
											   <option role="option" value="2">账号或号码</option>											 
											</select>
											<div style="display: inline-block;" id="cust">
												<label>
													大客户号:
												</label>
												<input type="text" id="customerNo">
											</div>		
											<div style="display: none;" id="full">
												<label>
													电话号码:
												</label>
												<input type="text" id="fullText">
											</div>																																																																																																							    												
											<label>
												业务区域:
											</label> 
											<select class="input-sm" id="businessSta">
											</select> 
										    <button class="btn btn-sm btn-success btn-white btn-round" id="btn_inquiry">
                            					<i class="icon-search green"></i>
                            					查询
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_zhinfoquery">
                            					<i class="icon-search green"></i>
                            					查询账户明细
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_dhinfoquery">
                            					<i class="icon-search green"></i>
                            					查询电话明细
                            				</button>
                            				<button class="btn btn-sm btn-success btn-white btn-round" id="btn_yhinfoquery">
                            					<i class="icon-search green"></i>
                            					打印报表
                            				</button>                      				
                            			</div>
                            		</div>
                            		<div class="widget-main padding-8">
										<table id="table_hthInfo" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
												 <th>账号名称</th>
												 <th>账户号</th>
												 <th>账期</th>
												 <th>站别</th>												 
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
    
    <div class="tabbable" style="display: none;" id="tableAccount">
		<ul class="nav nav-tabs padding-18">
				<li class="active">
					<a data-toggle="tab" href="#ne" id="dhmx"><iclass="green icon-phone bigger-120"></i></a>
				</li>
		</ul>

		<div id="div_sub" class="tab-pane">
			<div class="col-sm-12">
                <div class="col-sm-12" style="padding-top:5px;padding-bottom:5px;">
                    <div>
                        
                    </div>
                </div>
				<table id="table_accountInfo" class="table table-striped table-bordered table-hover">
					<thead>
						 <tr>
							<th>用户名称</th>
							<th>电话号码</th>	
							<th>业务区域</th>											 
							<th>客户号</th>
							<th>客户名称</th>
							<th>用户性质</th>
							<th>汇总月份</th>												
							<th>合计</th>
							<th>月租</th>
							<th>市话</th>
							<th>国内长途</th>
							<th>国际长途</th>
							<th>专网长途</th>
							<th>专线费</th>
							<th>套餐费</th>
							<th>优惠费</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
    
   <script type="text/javascript">
   $(document).ready(function(){
	   $("#billMonth").datetimepicker({
	        format: 'yyyymm', 
	        autoclose: true,
	        language: 'zh-CN',		       	 
	        weekStart: 1,  
	        startView: 3,  
	        minView: 3,  
	        forceParse: false     
	   });
	    //查询业务区域
		var res = ajaxCRUD("dept!findAll.do", {}, false);
		var lst = res.lst;
		var html = null;
		$(lst).each(function(index) {
			var item = lst[index];
			html += "<option role='option' value='" + item.deptname + "'>" + item.deptname + " " + item.abbr + "</option>";
		});
		$("#businessSta").empty();
		$("#businessSta").append(html);
		$("#btn_yhinfoquery").attr("disabled",true);
		$("#tableAccount").hide();
		//默认显示上个月
		 var Nowdate = new Date();
		 var vYear = Nowdate.getFullYear();
		 var vMon = Nowdate.getMonth();
		 var month;
		 if(vMon<10){
			 month = "0"+vMon;
		 }else{
			 month = vMon;
		 }
		 var ym = vYear + month;
		 $("#billMonth").val(ym);
   });
   
   $("#cxfs").change(function() {
	   if($("#cxfs").val()=="1"){
		    $("#full").css("display", "none");
			$("#cust").css("display", "inline-block");
	   }else{
		   	$("#full").css("display", "inline-block");
			$("#cust").css("display", "none");
	   }   
   });
   
    var table_hthInfo;
    function initTableHthInfo(parm){
    	if (table_hthInfo) {
    		table_hthInfo.fnSettings().ajax.data = parm; 
    		table_hthInfo.api().ajax.reload();
			return;
		}
    	table_hthInfo = $('#table_hthInfo').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "ocsBill!findCompanyInfo.do",
            	"data": parm,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
                {"mDataProp": "name"},
                {"mDataProp": "customerNo"},
              	{"mDataProp": "billMonth"},
              	{"mDataProp": "businessSta"}
             ],      	
			 columnDefs: [],
			"bLengthChange": false,//
			"scrollY":"300px",//table增加Y轴方向上的滚动条
			"iDisplayLength" :100,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort" : false,//关闭排序
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
    }
     
    $("#btn_inquiry").click(function() {
    	 var billMonth = $("#billMonth").val();
    	 if(billMonth == ""){
    		 alert("请输入账期");
    		 return;
    	 }
		 if($("#cxfs").val()=="1"){
			 var parm = {
				"obj.billMonth": $("#billMonth").val(),
				"obj.customerNo": $("#customerNo").val(),
				"obj.fullText": $("#fullText").val(),
				"obj.businessSta": $("#businessSta").val(),
				"obj.type":1
			 };
			 initTableHthInfo(parm);
		 }else{
			 var parm = {
				"obj.billMonth": $("#billMonth").val(),
				"obj.customerNo": $("#customerNo").val(),
				"obj.fullText": $("#fullText").val(),
				"obj.businessSta": $("#businessSta").val(),
				"obj.type":2
			};
			initTableHthInfo(parm);
		 }
	 });
	 	 	
	 $("#table_hthInfo tbody").on("click", "tr", function(event) {
		$(this).toggleClass('success');	
		var aData = table_hthInfo.fnGetNodes();	
		var bData = "";
		var cData = "";
		for(var i = 0; i < aData.length; i++){
			if($(aData[i]).hasClass('success')){
				bData += table_hthInfo.fnGetData(aData[i]).id + ",";
				cData += table_hthInfo.fnGetData(aData[i]).billMonth + ",";
			}
		}
		//去掉最后一个逗号(如果不需要去掉，就不用写)
		if (bData.length > 0) {
	    	bData = bData.substr(0, bData.length - 1);
	    }
		if(cData.length > 0){
			cData = cData.substr(0, cData.length - 1);
		}
		$("#bData").val(bData);
		$("#cData").val(cData);
	});
	
	//账户信息查询
	var table_accountInfo;
    var ocsCustomerBill = "ocsCustomerBill";
    var ocsUserBill = "ocsUserBill";
    var flag;
	$("#btn_zhinfoquery").click(function() {		
		$("#tableAccount").show();
		$("#dhmx").text("账户明细");
		$("#btn_yhinfoquery").removeAttr("disabled");
		flag = "1";
		var parm = {
				"obj.customerId": $("#bData").val(),
				"obj.billMonth": $("#cData").val(),
				"obj.relTable": ocsCustomerBill
		};
		tableAccountDhmx(parm);
	});
	
	$("#btn_dhinfoquery").click(function() {
		$("#tableAccount").show();
		$("#dhmx").text("电话明细");
		$("#btn_yhinfoquery").removeAttr("disabled");
		flag = "2";
		var parm = {
				"obj.customerId": $("#bData").val(),
				"obj.billMonth": $("#cData").val(),
				"obj.relTable": ocsUserBill
		};
		tableAccountDhmx(parm);
	});
	
	function indexof(str){
		var st = "";
		var strs= new Array(); //定义一数组 
		strs=str.split(","); //字符分割 
		for (i=0;i<strs.length ;i++ ) 
		{ 	
		  st+="'"+strs[i]+"',";
		} 
		if (st.length > 0) {
        	st = st.substr(0, st.length - 1);
	    } 
		return st;
	}
	
	 $("#btn_yhinfoquery").click(function() {
		var dataId = indexof($("#bData").val());
		var bMonth = $("#billMonth").val()
    	if(flag=="1"){
    	   var rptFileName = "gfhthhfmx.cpt";
    	   var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&dataId=" + dataId + "&bMonth=" + bMonth;
	       window.open(uri);
    	}else{
    	   var rptFileName = "ghdhmx_withoutusername.cpt";
     	   var uri = "<%=request.getContextPath()%>" + "/ReportServer?reportlet=" + rptFileName + "&dataId=" + dataId + "&bMonth=" + bMonth;
 	       window.open(uri);
    	}
    });
   
	function tableAccountDhmx(parm){
		if (table_accountInfo) {
			table_accountInfo.fnSettings().ajax.data = parm; 
			table_accountInfo.api().ajax.reload();
			return;
		}
		table_accountInfo = $('#table_accountInfo').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "ocsBill!findAccountInfo.do",
            	"data": parm,
            	"dataSrc": "lst"
            },
            "aoColumns": [ 
      	                {"mDataProp": "userName"},
      	              	{"mDataProp": "businessKey"},
      	              	{"mDataProp": "businessSta"},
      	              	{"mDataProp": "customerNo"},
      	               	{"mDataProp": "customerName"},
      	               	{"mDataProp": "userType"},
      	               	{"mDataProp": "billMonth"},
      	               	{"mDataProp": "amountDue"},
      	               	{"mDataProp": "zfs1"},
      	               	{"mDataProp": "shf"},
      	                {"mDataProp": "gnctf"},
    	               	{"mDataProp": "gjctf"},
    	               	{"mDataProp": "hf19"},
    	               	{"mDataProp": "zfs3"},
    	               	{"mDataProp": "zfs4"},
    	               	{"mDataProp": "zfs5"}
      	             ],      	
      				 columnDefs: [{	     	           				 
   				 	 	targets: 5,
        	        	render: function (a, b, c, d) {
   	         	    	if(c.userType==1){
   	         	    		return "住宅";
   	         	    	}if(c.userType==2){
   	         	    		return "办公";
   	         	    	}if(c.userType==3){
   	         	    		return "商用";
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
		})	
	}
	
   </script>
</body>
</html>