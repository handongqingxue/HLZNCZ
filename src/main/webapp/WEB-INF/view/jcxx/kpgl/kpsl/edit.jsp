<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
$(function(){
	initEditDialog();
	initSLZTCBB();
});

function initEditDialog(){
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body"),
		height:200,
		top:60,
		left:308,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkEdit();
           }}
        ]
	});

	$("#edit_div table").css("width",(setFitWidthInParent("body")-15)+"px");
	$("#edit_div table").css("magin","-100px");
	$("#edit_div table td").css("padding-left","50px");
	$("#edit_div table td").css("padding-right","20px");
	$("#edit_div table td").css("font-size","15px");
	$("#edit_div table tr").css("height","45px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").css("color","#000");
	$(".panel.window .panel-title").css("font-size","15px");
	$(".panel.window .panel-title").css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","45%");
	$("#edit_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initSLZTCBB(){
	slztCBB=$("#slzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择申领状态"},{"value":"1","text":"成功"},{"value":"0","text":"失败"}
		],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.kpsl.slzt }'?1:0);
		},
		onSelect:function(){
			$("#slzt").val($(this).combobox("getValue"));
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
	if(checkSFZH()){
		if(checkSLZT()){
			editKaPianShenLing();
		}
	}
}

function editKaPianShenLing(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:path+"main/editKaPianShenLing",
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

function focusSFZH(){
	var sfzh = $("#sfzh").val();
	if(mc=="身份证号不能为空"){
		$("#sfzh").val("");
		$("#sfzh").css("color", "#555555");
	}
}

//验证身份证号
function checkSFZH(){
	var sfzh = $("#sfzh").val();
	if(sfzh==null||sfzh==""||sfzh=="名称不能为空"){
		$("#sfzh").css("color","#E15748");
    	$("#sfzh").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

//验证申领状态
function checkSLZT(){
	var slzt=slztCBB.combobox("getValue");
	if(slzt==null||slzt==""){
	  	alert("请选择申领状态");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-340;
}
</script>
<title>修改</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.kpsl.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				身份证号
			</td>
			<td style="width:30%;">
				<input type="text" id="sfzh" name="sfzh" value="${requestScope.kpsl.sfzh }" placeholder="请输入身份证号" style="width: 150px;height:30px;" onfocus="focusSFZH()" onblur="checkSFZH()"/>
			</td>
			<td align="right" style="width:15%;">
				申领状态
			</td>
			<td style="width:30%;">
				<input id="slzt_cbb"/>
				<input type="hidden" id="slzt" name="slzt" value="${requestScope.kpsl.slzt }"/>
			</td>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>