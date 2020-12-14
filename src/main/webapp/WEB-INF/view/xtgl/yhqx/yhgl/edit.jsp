<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<style type="text/css">
.center_con_div{
	width: 100%;
	height: 90vh;
	margin-left:288px;
	overflow-y: scroll;
	position: absolute;
}
.page_location_div{
	height: 50px;
	line-height: 50px;
	margin-left: 20px;
	font-size: 18px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var xtglPath=path+'xtgl/';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var edNum=0;
$(function(){
	initEditDialog();

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:280,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkEdit();
           }}
        ]
	});

	$("#edit_div table").css("width",(setFitWidthInParent("body","edit_div_table"))+"px");
	$("#edit_div table").css("magin","-100px");
	$("#edit_div table td").css("padding-left","50px");
	$("#edit_div table td").css("padding-right","20px");
	$("#edit_div table td").css("font-size","15px");
	$("#edit_div table tr").css("height","45px");

	$(".panel.window").eq(edNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(edNum).css("color","#000");
	$(".panel.window .panel-title").eq(edNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(edNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(edNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(edNum).css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","45%");
	$("#edit_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initZTCBB();
}

function initZTCBB(){
	ztCBB=$("#zt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择状态"},{"value":"1","text":"新增"},{"value":"2","text":"正常使用"},{"value":"3","text":"废弃"},{"value":"4","text":"有误"}
		],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.yh.zt }');
		},
		onSelect:function(){
			$("#zt").val($(this).combobox("getValue"));
		}
	});
}

//重设列宽
function reSizeCol(){
	var width=$(".panel.datagrid").css("width");
	width=width.substring(0,width.length-2);
	var cols=$(".datagrid-htable tr td");
	var colCount=cols.length;
	width=width-colCount*2;
	cols.css("width",width/colCount+"px");
	cols=$(".datagrid-btable tr").eq(0).find("td");
	colCount=cols.length;
	cols.css("width",width/colCount+"px");
}

function checkEdit(){
	if(checkYHM()){
		if(checkSM()){
			if(checkZT()){
				if(checkYSMM()){
					editYongHu();
				}
			}
		}
	}
}

function editYongHu(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:xtglPath+"editYongHu",
		dataType: "json",
		data:formData,
		cache: false,
		processData: false,
		contentType: false,
		success: function (data){
			if(data.message=="ok"){
				alert(data.info);
				history.go(-1);
			}
			else{
				alert(data.info);
			}
		}
	});
}

function focusYHM(){
	var yhm = $("#yhm").val();
	if(yhm=="用户名不能为空"){
		$("#yhm").val("");
		$("#yhm").css("color", "#555555");
	}
}

//验证用户名
function checkYHM(){
	var xm = $("#yhm").val();
	if(xm==null||xm==""||xm=="用户名不能为空"){
		$("#yhm").css("color","#E15748");
    	$("#yhm").val("用户名不能为空");
    	return false;
	}
	else
		return true;
}

function focusSM(){
	var sfz = $("#sm").val();
	if(sfz=="实名不能为空"){
		$("#sm").val("");
		$("#sm").css("color", "#555555");
	}
}

//验证实名
function checkSM(){
	var sfz = $("#sm").val();
	if(sfz==null||sfz==""||sfz=="实名不能为空"){
		$("#sm").css("color","#E15748");
    	$("#sm").val("实名不能为空");
    	return false;
	}
	else
		return true;
}

//验证状态
function checkZT(){
	var zt=ztCBB.combobox("getValue");
	if(zt==null||zt==""){
	  	alert("请选择状态");
	  	return false;
	}
	else
		return true;
}

//验证原始密码
function checkYSMM(){
	var ysmm = $("#ysmm").val();
	if(ysmm==null||ysmm==""){
	  	alert("请输入原始密码");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "edit_div":
		space=340;
		break;
	case "edit_div_table":
	case "panel_window":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>修改</title>
</head>
<body>
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">用户管理-修改</div>

	<div id="edit_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.yh.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				用户名
			</td>
			<td style="width:30%;">
				<input type="text" id="yhm" name="yhm" value="${requestScope.yh.yhm }" placeholder="请输入用户名" style="width: 150px;height:30px;" onfocus="focusYHM()" onblur="checkYHM()"/>
			</td>
			<td align="right" style="width:15%;">
				昵称
			</td>
			<td style="width:30%;">
				<input type="text" id="nc" name="nc" value="${requestScope.yh.nc }" placeholder="请输入昵称" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				头像
			</td>
			<td>
				<input type="file" name="tx_file"/>
				<div>${requestScope.yh.tx }</div>
			</td>
			<td align="right">
				实名
			</td>
			<td>
				<input type="text" id="sm" name="sm" value="${requestScope.yh.sm }" placeholder="请输入实名" style="width: 150px;height:30px;" onfocus="focusSM()" onblur="checkSM()"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				状态
			</td>
			<td style="width:30%;">
				<input id="zt_cbb"/>
				<input type="hidden" id="zt" name="zt" value="${requestScope.yh.zt }"/>
			</td>
			<td align="right" style="width:15%;">
				原始密码
			</td>
			<td style="width:30%;">
				<input type="password" id="ysmm" name="ysmm" value="${requestScope.yh.ysmm }" placeholder="请输入原始密码" style="width: 150px;height:30px;" onblur="checkYSMM()"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				简述
			</td>
			<td style="width:30%;">
				<input type="text" id="js" name="js" value="${requestScope.yh.js }" placeholder="请输入简述" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
			</td>
			<td style="width:30%;">
			</td>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>