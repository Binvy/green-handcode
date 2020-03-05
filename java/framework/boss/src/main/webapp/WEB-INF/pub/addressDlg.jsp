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
	<div class="modal fade" id="dlgAddress" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:80%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						地址选择
					</h4>
				</div>
				<div class="modal-body">
                    <div class="widget-box widget-color-blue2">
                    	<div class="widget-header">
                           	<h4 class="widget-title lighter smaller">可用地址</h4>
                        </div>
                        <div class="widget-body">
                           	<div class="widget-main padding-8">
                           		<form class="form-search">
                           			<div class="row">
                           				<div class="col-xs-12 col-sm-12">
                           						<!-- 
                           						<input type="text" id="crGroupName2" placeholder="小区、街道" />
                           						 -->
                           						<select class="addressSelect" id="crGroupName2" style="width:120px"></select>
                           						<select class="addressSelect" id="crGroupName3" style="width:120px"></select>
                           						<select class="addressSelect" id="crGroupName4" style="width:120px"></select>
                           						<select class="addressSelect" id="crGroupName5" style="width:120px"></select>
                           						<select class="addressSelect" id="crGroupName6" style="width:120px"></select>
                           						<input type="hidden" id="selectedAddress"/>
                           						<button type="button" class="btn btn-sm btn-purple"
														data-toggle="collapse" data-target="#collapseOne3" 
														aria-expanded="false" aria-controls="collapseOne3">
													<span class="glyphicon glyphicon-pencil" ></span>
												 	 手动输入
												</button>
												<input type="button" class="btn btn-sm btn-success" id="btnResetAddress" value="重置"/>
												<div id="collapseOne3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
											      	<div class="panel-body">
												      	<div id="addressG">
												      		<div class="col-sm-2"></div>
												      		<label for="addressG1" class="col-sm-1 control-label" style="text-align: right;">小区或街道</label>
															<div class="col-sm-2">
																<input class="form-control addressInput" id="addressG1" type="text" placeholder="请输入小区或街道"/>
															</div>
															<label for="addressG2" class="col-sm-1 control-label" style="text-align: right;">详细地址</label>
															<div class="col-sm-4">
																<input class="form-control addressInput" id="addressG2" type="text" placeholder="请输入详细地址"/>
															</div>
												      	</div>
											      	</div>
											    </div>
                           				</div>
                           			</div>
                           			<div class="row">
                           				<div class="col-xs-12 col-sm-12">
                           				<table id="table_view_address" class="table table-striped table-bordered table-hover">
                           					<thead>
                           						<tr>
                           							<th>地址</th>
                           							<th>片区</th>
                           							<th>通讯站</th>
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
					<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnChooseAddress">确认</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
	<script type="text/javascript">
	
        $(document).ready(function () {
        	/*
        	var res = ajaxCRUD("resAddress!findGroupName2.do", {}, false);
       		$("#crGroupName2").autocomplete({
       			source: res.addrs
       		});
       		*/
       		//$('.chosen-select').chosen();
       		//initGroupName2();	//点击输入地址框的时候初始化
       		initTableAddress();
        });
        
        $(".addressInput").on("focus", function () {
        	$(".addressSelect").attr("disabled", true);
        });
        
        function fillSelect(ctrlId, lst, defaultValue) {
			var html = "";
			html = "<option value='' selected='selected'>" + defaultValue + "</option>";
			$(lst).each(function(index) {
				var item = lst[index];
				html += "<option value='" + item + "'>" + item + "</option>";
			});
			$("#" + ctrlId).empty();
			$("#" + ctrlId).append(html);
        }
        
        function initGroupName2() {
        	//移机业务中：需要根据新业务区域(#newDeptArea)来初始化地址,其他业务中：均根据普通业务区域(#deptArea)初始化地址
        	var parm = {"businessArea": $("#newDeptArea").val() || $("#deptArea").val()};
        	var res = ajaxCRUD("resAddress!findGroupName2ByArea.do", parm , false);
			fillSelect("crGroupName2", res.addrs, "--小区、街道--");
        }
        
        function clearGroupName(start) {
        	var i;
        	for (i = start; i <= 6; i++) {
        		$("#crGroupName" + i).empty();
        	}
        }
        
        function loadSubGroup(start) {
        	clearGroupName(start + 1);
        	if ($("#crGroupName" + start).val() === "") {
        		return;
        	}
        	var parm = {
        		"obj.name": "GROUP_NAME" + (start + 1),
        	};
        	var i;
        	for (i = 2; i <= start; i++) {
        		parm["obj.groupName" + i] = $("#crGroupName" + i).val();
        	}
        	var res = ajaxCRUD("resAddress!findSubGroup.do", parm, false);
        	if (res.resNum == "0") {
        		fillSelect("crGroupName" + (start + 1), res.addrs, "--请选择--");
        	}
        	doSearchAddress();
        }
        
        $("#crGroupName2").change(function () {
        	loadSubGroup(2);
        });
        
        $("#crGroupName3").change(function () {
        	loadSubGroup(3);
        });
        
        $("#crGroupName4").change(function () {
        	loadSubGroup(4);
        });
        
        $("#crGroupName5").change(function () {
        	loadSubGroup(5);
        });
        
        $("#crGroupName6").change(function () {
        	doSearchAddress();
        });
        
        var table_view_address;
        var criteria_address = {
        };
        
        function initTableAddress() {
		table_view_address = $('#table_view_address').dataTable({
			"serverSide": true, //服务器模式，分页用
			"ajax": {
            	"type": "post",
            	"url": "resAddress!findByPage.do",
            	"data": criteria_address,
            	"dataSrc": "lst"
            },
        	"columns": [
            	{ 
            		"data": "name",
            		"width": "*"
            	},
            	{ 
            		"data": "groupName1",
            		"width": "300px"
            	},
            	{ 
            		"data": "businessArea",
            		"width": "300px"
            	}
        	],
			 columnDefs: [
            ],
			"bLengthChange": false,//
			"iDisplayLength" :5,
			"searching":false,//关闭dataTable自带搜索
			"bPaginate": true,//开启分页功能
			"bSort": false,//关闭排序
			"bDestroy": true,
			"language": { //国际化
				"url": "assets/js/Chinese.json"
			}
		});
		}
		
        function resetAddressDlg() {
        	criteria_address = {};
        	$("#addressG1").val("");
        	$("#addressG2").val("");
        	$("#collapseOne3").removeClass().addClass("panel-collapse collapse");
        	$(".addressSelect").prop("disabled", false);
        	initTableAddress();
        }
        
		function doSearchAddress() {
			criteria_address = {};
			var i;
        	for (i = 2; i <= 6; i++) {
        		criteria_address["obj.groupName" + i] = $("#crGroupName" + i).val();
        	}
			table_view_address.fnSettings().ajax.data = criteria_address; 
			table_view_address.api().ajax.reload();
		}
		
		/* $("#btnSearchAddress").click(function () {
			doSearchAddress();
		}); */
		
		$("#btnResetAddress").click(function() {
			resetAddressDlg()
		});
		
		$("#table_view_address tbody").on("click", "tr", function (event) {
			$("#table_view_address tbody").find("tr").each(function () {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_address.fnGetData(event.target.parentNode);
			$("#selectedAddress").val(aData.name);
		});
		
		$("#table_view_address tbody").on("dblclick", "tr", function (event) {
			$("#table_view_address tbody").find("tr").each(function () {
				$(this).removeClass("success");
			});
			$(this).addClass('success');
			var aData = table_view_address.fnGetData(event.target.parentNode);
			$("#selectedAddress").val(aData.name);
			$("#btnChooseAddress").click();
		});
		
		$("#btnChooseAddress").click(function () {
			var address = $("#selectedAddress").val();
			var vlan = $("#outerVlan").val();
			var businessArea = $("#deptArea").val();
			var accPrefix = $("#deptArea").text();
			/* var addressP1 = $("#addressP1").val().trim();
			var addressP2 = $("#addressP2").val().trim();
			var addressP3 = $("#addressP3").val().trim();
			var addressP4 = $("#addressP4").val().trim(); */
			var addressG1 = $("#addressG1").val().trim();
			var addressG2 = $("#addressG2").val().trim();	
			var sumCompany = null;
			var sumPersonal = null;
			//手动输入：用户组装地址信息
			if (addressG1 !== "" && addressG2 !== "") {
				sumCompany =  addressG1 + "-" + addressG2;
				address = sumCompany;
			}
			//未选择、未输入任何地址信息
			if (address === "") {
				bbAlert("请查询并选择地址");
				return;
			}
			else {
				fnAddressChoosed(address);
				$("#dlgAddress").modal("hide");
			}
			//根据参数条目调用
			if (fnAddressChoosed.length === 1) {
				fnAddressChoosed(address);
			}
			else {
				fnAddressChoosed(address, vlan, accPrefix, businessArea);				
			}
		});
		
		//链接新建地址: delete-2017-12-18 14:54:23
		/* $("#btnAddAddress").click(function () {
			self.location = "resAddress!goToPage.do";
		}); */
	</script>
	</body>
</html>
