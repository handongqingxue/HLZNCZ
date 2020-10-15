<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
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
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:200,
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
	if(checkMC()){
		editYunShuShang();
	}
}

function editYunShuShang(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:path+"main/editYunShuShang",
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

function focusMC(){
	var mc = $("#mc").val();
	if(mc=="名称不能为空"){
		$("#mc").val("");
		$("#mc").css("color", "#555555");
	}
}

//验证名称
function checkMC(){
	var mc = $("#mc").val();
	if(mc==null||mc==""||mc=="名称不能为空"){
		$("#mc").css("color","#E15748");
    	$("#mc").val("名称不能为空");
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
<div id="center_con_div" style="margin-left:288px;width: 100%;height: 90vh;overflow-y: scroll;position: absolute;">
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.yss.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				名称
			</td>
			<td style="width:30%;">
				<input type="text" id="mc" name="mc" value="${requestScope.yss.mc }" placeholder="请输入名称" style="width: 150px;height:30px;" onfocus="focusMC()" onblur="checkMC()"/>
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