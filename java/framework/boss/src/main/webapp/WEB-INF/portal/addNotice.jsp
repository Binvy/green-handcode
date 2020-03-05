<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>新建公告</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<!-- basic styles -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
	<!-- fonts -->
	<link rel="stylesheet" href="assets/font/fonts.css" />
	<!-- ace styles -->
	<link rel="stylesheet" href="assets/css/ace.min.css" />
	<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

	<script src="assets/js/jquery-1.10.2.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootbox.js"></script>
	<script src="assets/js/jquery.ztree.core-3.5.js"></script>
	<script src="assets/js/jquery.ztree.excheck-3.5.js"></script>
	<script src="assets/js/crud/crud.js"></script>
	<script src="assets/js/jquery.dataTables.js"></script>
	<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
	<script src="assets/js/handlebars-v3.0.1.js"></script>

    <script type="text/javascript" charset="utf-8" src="webjs/ueditor1_4_3_3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="webjs/ueditor1_4_3_3/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="webjs/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="#">工具</a>
			</li>
			<li class="active">
				新建公告
			</li>
		</ul>
		<!-- .breadcrumb -->
	</div>
	
	<div class="page-content">
			<div class="row clearfix">
				<div class="col-md-12 column">
                        <!-- treeview -->
                        <div class="widget-box widget-color-blue2">
                        	<div class="widget-header">
                        		<h4 class="widget-title lighter smaller">
                        			<i class="icon-rss blue bigger-110"></i>
                        			系统公告
                        		</h4>
                        		<div class="widget-toolbar">
                        			<span class="badge badge-danger"></span>
                        		</div>
                        	</div>
                        	<div class="widget-body">
                        		<div class="row form-group">
					    	<label for="title" class="col-sm-1 control-label">标题</label>
							<div class="col-sm-3">
						    	<input class="form-control" id="title" type="text" placeholder="请输入公告标题" />
					    	</div>
					    	<label for="title" class="col-sm-1 control-label">级别</label>
							<div class="col-sm-3">
						    	<select class="form-control" id="level">
						    		<option value="critical">重要</option>
					    			<option value="normal">普通</option>
						    	</select>
					    	</div>
							<label for="status" class="col-sm-1 control-label">状态</label>
							<div class="col-sm-3">
						    	<select class="form-control" id="status">
						    		<option value="0">草稿</option>
					    			<option value="1">发布</option>
					    			<option value="9">撤销</option>
						    	</select>
					    	</div>
						</div>
						<div class="row form-group">
					    	<label for="deptArea" class="col-sm-1 control-label">接收区域</label>
							<div class="col-sm-3">
						    	<select class="form-control" id="deptArea">
						    		<option value="A">中心通信站</option>
					    			<option value="B">濮城通信站</option>
					    			<option value="C">柳屯通信站</option>
						    	</select>
					    	</div>
					    	<label for="deptName" class="col-sm-1 control-label">接收部门</label>
							<div class="col-sm-3">
						    	<select class="form-control" id="deptName">
						    		<option value="a01">营业室</option>
					    			<option value="a02">有线室</option>
					    			<option value="a03">外线班</option>
						    	</select>
					    	</div>
					    	<label for="userName" class="col-sm-1 control-label">接收工号</label>
							<div class="col-sm-3">
						    	<select class="form-control" id="userName">
						    		<option value="a01">a01</option>
					    			<option value="a02">a02</option>
					    			<option value="a03">a03</option>
						    	</select>
					    	</div>
						</div>
						<div class="row form-group">
							<button type="button" id="save" class="btn btn-sm btn-primary" style="display: none;">发送</button>
							<button type="button" id="reset" class="btn btn-sm btn-primary">撤销</button>
						</div>
                    </div>
                </div>
            </div>
		</div>
	</div>
    <script id="editor" type="text/plain" style="width:1024px;height:500px;margin:20px;"></script>
<!-- 	<div id="btns">
	    <div>
	        <button onclick="getAllHtml()">获得整个html的内容</button>
	        <button onclick="getContent()">获得内容</button>
	        <button onclick="setContent()">写入内容</button>
	        <button onclick="setContent(true)">追加内容</button>
	        <button onclick="getContentTxt()">获得纯文本</button>
	        <button onclick="getPlainTxt()">获得带格式的纯文本</button>
	        <button onclick="hasContent()">判断是否有内容</button>
	        <button onclick="setFocus()">使编辑器获得焦点</button>
	        <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
	        <button onmousedown="setblur(event)" >编辑器失去焦点</button>
	
	    </div>
	    <div>
	        <button onclick="getText()">获得当前选中的文本</button>
	        <button onclick="insertHtml()">插入给定的内容</button>
	        <button id="enable" onclick="setEnabled()">可以编辑</button>
	        <button onclick="setDisabled()">不可编辑</button>
	        <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
	        <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
	        <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
	    </div>
	
	    <div>
	        <button onclick="getLocalData()" >获取草稿箱内容</button>
	        <button onclick="clearLocalData()" >清空草稿箱</button>
	    </div>
	
	</div>
	<div>
	    <button onclick="createEditor()">
	    创建编辑器</button>
	    <button onclick="deleteEditor()">
	    删除编辑器</button>
	</div> -->

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
</body>
</html>