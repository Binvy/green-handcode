<%@ page language="java" pageEncoding="UTF-8"%>  
<%@taglib prefix="s" uri="/struts-tags"%>  
<!DOCTYPE html>
<HTML>
<head>

	<script language=JavaScript src="js/cardId.js" ></script>
	<%-- <script language=JavaScript src='assets/js/jquery-2.0.3.min.js'></script> --%>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>中国电信CRM系统身份证阅读器接入浏览器测试网页</title>
	
	<script type="text/javascript" src="assets/js/crud/crud.js"></script>
	<script type="text/javascript" src='assets/js/jquery-2.0.3.min.js'></script>

</head>

<body topmargin="0" bgcolor="#D2F0FF">

<table border="0" cellpadding="0" cellspacing="0" width="100%" >
  <tr>
    <td width="100%" height="10">
      <p align="center"><b><font color="#5555FF" size="4"><br/>二代居民身份证阅读器接入</font></b>
      </td>
  </tr>
</table>
<object id="CertCtl" TYPE="application/cert-reader" width=0 height=0">
[Object not available! Did you forget to build and register the server?]
</object>

<table border="0" width="100%" cellpadding="0" cellspacing="1">

<!-- <tr>
<td><input type="button"  value="Connect" onclick="Connect()"></td>
<td><input type="button"  value="GetStatus" onclick="GetStatus()"></td>
<td><input type="button"  value="ReadCert" onclick="ReadCert()"></td>
<td><input type="button"  value="Disconnect" onclick="Disconnect()"></td>
</tr> -->

<tr>
<td><input type="button"  value="读取" onclick="ReadIDCard()"></td>
<td><input type="button"  value="确定" onclick="WriteIDCard()" ></td>
</tr>


</table>

<table border="0" width="100%" cellpadding="0" cellspacing="0">


<tr>
<td align="right">时间：</td>
<td><input type="text" name="ReadCard_time"  id="ReadCard_time" size="49"></td>
</tr>

<tr>
<td align="right">姓名：</td>
<td><input type="text" name="Name" size="49">(要求中间，两头都没有空格)</td>
</tr>

<tr>
<td align="right">性别：</td>
<td><input type="text" name="Sex" size="49">(取值为“1”（表示“男”）或“0”（表示“女”）)</td>
</tr>

<tr>
<td align="right">民族：</td>
<td><input type="text" name="Nation" size="49">(汉字即可)</td>
</tr>

<tr>
<td align="right">出生：</td>
<td><input type="text" name="Born" size="49">(要求格式为:yyyyMMdd，长度为8)</td>
</tr>

<tr>
<td align="right">地址：</td>
<td><input type="text" name="Address" size="49"></td>
</tr>


<tr>
<td align="right">身份证号：</td>
<td><input type="text" name="CardNo" size="49" style="color: #FF0000">(居民身份号码，长度18位)</td>
</tr>


<tr>
<td align="right">签发机关：</td>
<td><input type="text" name="Police" size="49"></td>
</tr>

<tr>
<td align="right">期限起始：</td>
<td><input type="text" name="ActivityLFrom" size="49">(要求格式为:yyyyMMdd，长度为8)</td>
</tr>


<tr>
<td align="right">期限失效：</td>
<td><input type="text" name="ActivityLTo" size="49">(要求格式为:yyyyMMdd，长度为8)</td>
</tr>

<tr>
<td align="right">机具编号：</td>
<td><input type="text" name="SAM" size="49"></td>
</tr>

<tr>
<td align="right">结果：</td>
<td><textarea rows="4"  id="result" cols="47"></textarea></td>
</tr>

<td align="right">头像信息：</td>
<td><img id="image_1" name="PhotoDisplay" style="width:96px; height:118px;"/>(显示图片的Base64编码)</td>
</tr>

</table>

</body>

<script language="JavaScript">


function Connect(){
	clearForm();
	var start = new Date();
    var ret = CertCtl.connect();
	var end = new Date();
    var conn = JSON.parse(ret);
	document.getElementById("ReadCard_time").value = end.getTime() - start.getTime() + "毫秒";
    document.all['result'].value = ret;
}

function Disconnect(){
	clearForm();
	var start = new Date();
    var ret = CertCtl.disconnect();
	var end = new Date();
    var disConn = JSON.parse(ret);
	document.getElementById("ReadCard_time").value = end.getTime() - start.getTime() + "毫秒";
    document.all['result'].value = ret;
}

function GetStatus() {
	clearForm();
		var start = new Date();
    var ret = CertCtl.getStatus();
	var end = new Date();
    var cert  = JSON.parse(ret);
    document.all['result'].value = ret;
		document.getElementById("ReadCard_time").value = end.getTime() - start.getTime() + "毫秒";
}


function ReadCert() {
	clearForm();
	var start = new Date();
    var ret = CertCtl.readCert();
	var end = new Date();
    var cert  = JSON.parse(ret);
	document.getElementById("ReadCard_time").value = end.getTime() - start.getTime() + "毫秒";
	//document.getElementById("image_1").src = 'data:image/jpeg;base64,' + cert.resultContent.identityPic;
    document.all['result'].value = ret;
}
	/*读取身份证信息*/
function ReadIDCard(){
	clearForm();
    var ret = CertCtl.connect();
    var conn = JSON.parse(ret);
	if(conn.resultFlag != 0){
		 document.all['result'].value = "连接失败:"+conn.errorMsg;
	}
	var start = new Date();
	ret = CertCtl.readCert();
	var end = new Date();
	document.getElementById("ReadCard_time").value = end.getTime() - start.getTime() + "毫秒";

	var cert  = JSON.parse(ret);
	if(cert.resultFlag != 0){
		document.all['result'].value = "readCert失败:"+cert.errorMsg;
	}else{
		document.all['result'].value = "读卡成功";
		document.all['Name'].value = cert.resultContent.partyName;
		document.all['Sex'].value = cert.resultContent.gender;
		document.all['Nation'].value = cert.resultContent.nation;
		document.all['Born'].value = cert.resultContent.bornDay;
		document.all['Address'].value = cert.resultContent.certAddress;
		document.all['CardNo'].value = cert.resultContent.certNumber;
		document.all['Police'].value = cert.resultContent.certOrg;
		document.all['ActivityLFrom'].value = cert.resultContent.effDate;
		document.all['ActivityLTo'].value = cert.resultContent.expDate;
		document.all['SAM'].value = cert.resultContent.cardReaderId ;
		document.getElementById("image_1").src = 'data:image/jpeg;base64,' + cert.resultContent.identityPic;
             
	}
	ret = CertCtl.disconnect();
    var disConn = JSON.parse(ret);
	if(disConn.resultFlag != 0){
		document.all['result'].value = "disconnect失败:"+disConn.errorMsg;
	}
}


function clearForm() {
  document.all['Name'].value = '';
  document.all['Sex'].value = '';
  document.all['Nation'].value = '';
  document.all['Born'].value = '';
  document.all['Address'].value = '';
  document.all['CardNo'].value = '';
  document.all['Police'].value = '';
  document.all['ActivityLFrom'].value = '';
  document.all['ActivityLTo'].value = '';
  document.all['result'].value = '';
  document.all['SAM'].value = '';
}

function SetBtAddr(){
	var addr = document.getElementById("btmac").value;
	CertCtl.SetBtDeviceAddress(addr);
}
function WriteIDCard(){
	//vat CardNo=document.all['CardNo'].value;
	alert("身份证号码："+document.all['CardNo'].value);
	window.opener.document.getElementById('certId').value = document.all['CardNo'].value;//顶层窗口的页面赋值Name
	window.opener.document.getElementById('name').value = document.all['Name'].value;
    window.close(); // 关闭窗口
}
</script>

</HTML>
