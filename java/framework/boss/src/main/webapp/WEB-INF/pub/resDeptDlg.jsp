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
	<div class="modal fade" id="dlgResDept" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						选择部门
					</h4>
				</div>
				<div class="modal-body">
                    <div class="widget-box widget-color-blue2">
                    	<div class="widget-header">
                           	<h4 class="widget-title lighter smaller">部门列表</h4>
                        </div>
                   		<form class="form-search">
                   			<div class="row">
                   				<div class="col-xs-12 col-sm-12">
                   					<div class="input-group">
                   						<span class="input-group-addon">
                   							<i class="icon-ok"></i>
                   						</span>
                   						<input type="text" id="crResDept" class="form-control search-query" placeholder="部门号、部门名" />
                   						<input type="hidden" id="selectedResDeptId" />
                   						<input type="hidden" id="selectedResDeptName" />
                   						<span class="input-group-btn">
                   							<button type="button" class="btn btn-purple btn-sm" id="btnSearchResDept">
                   								<span class="icon-search icon-on-right bigger-110"></span>
                   								查找
                   							</button>
                   						</span>
                   					</div>
                   				</div>
                   			</div>
                   		</form>
                        <div class="widget-body">
                           	<div class="widget-main padding-8">
                           		<ul id="treeResDept" class="ztree" style="overflow:auto;"></ul>
                           	</div>
                        </div>
                    </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnChooseResDept">
						确认
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
	<script type="text/javascript">
		$("#btnChooseResDept").click(function() {
			var node = getSelectedNode();
			if (node == undefined) return;
			fnDeptChoosed(node.id, node.name);
			$("#dlgResDept").modal("hide");
		});
		
		function doSearchResDept(){
			var zTreeResDept;
			var resDeptSearch = $("#crResDept").val();//获取搜索框里输入的值
			var res = ajaxCRUD("resDept!doSearch.do",{"resDeptSearch":resDeptSearch},false);
			var setting = {
				data: {
					simpleData: { 
						enable: true 
					}
				}
			};
			zTreeResDept = $.fn.zTree.init($("#treeResDept"), setting, res.ztree);
		}
		
		//添加查找部门的点击事件：
		$("#btnSearchResDept").click(function(){
			doSearchResDept();
		});
		
	</script>
	</body>
</html>
