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
var dialogTop=10;
var dialogLeft=20;
var ndNum=0;
$(function(){
	initNewDialog();
	initZGZYXQZDB();
	initJZYXQZDB();
	initZYZTCBB();
	initSHZTCBB();

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","new_div"),
		height:431,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkNew();
           }}
        ]
	});

	$("#new_div table").css("width",(setFitWidthInParent("body","new_div_table"))+"px");
	$("#new_div table").css("magin","-100px");
	$("#new_div table td").css("padding-left","50px");
	$("#new_div table td").css("padding-right","20px");
	$("#new_div table td").css("font-size","15px");
	$("#new_div table tr").css("height","45px");

	$(".panel.window").eq(ndNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(ndNum).css("color","#000");
	$(".panel.window .panel-title").eq(ndNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ndNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ndNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ndNum).css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initZGZYXQZDB(){
	zgzyxqzDB=$('#zgzyxqz_db').datebox({
		width:160,
        required:false,
        onHidePanel:function(){
        	$("#zgzyxqz").val(zgzyxqzDB.datebox("getValue"));
        },
        onSelect:function(){
        	$("#zgzyxqz").val(zgzyxqzDB.datebox("getValue"));
        }
    });
	zgzyxqzDB.datebox('textbox').attr('placeholder', '请选择资格证有效期至');
}

function initJZYXQZDB(){
	jzyxqzDB=$('#jzyxqz_db').datebox({
		width:160,
        required:false,
        onHidePanel:function(){
        	$("#jzyxqz").val(jzyxqzDB.datebox("getValue"));
        },
        onSelect:function(){
        	$("#jzyxqz").val(jzyxqzDB.datebox("getValue"));
        }
    });
	jzyxqzDB.datebox('textbox').attr('placeholder', '请选择驾证有效期至');
}

function initZYZTCBB(){
	zyztCBB=$("#zyzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择在用状态"},{"value":"1","text":"是"},{"value":"0","text":"否"}
		],
		onSelect:function(){
			$("#zyzt").val($(this).combobox("getValue"));
		}
	});
}

function initSHZTCBB(){
	shztCBB=$("#shzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择审核状态"},{"value":"1","text":"编辑中"},{"value":"2","text":"待审核"},{"value":"3","text":"审核通过"}],
		onSelect:function(){
			$("#shzt").val($(this).combobox("getValue"));
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

function checkNew(){
	if(checkXM()){
		if(checkSFZ()){
			if(checkSHZT()){
				if(checkZYZT()){
					newSiJi();
				}
			}
		}
	}
}

function newSiJi(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:path+"main/newSiJi",
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

function focusXM(){
	var xm = $("#xm").val();
	if(xm=="姓名不能为空"){
		$("#xm").val("");
		$("#xm").css("color", "#555555");
	}
}

//验证姓名
function checkXM(){
	var xm = $("#xm").val();
	if(xm==null||xm==""||xm=="姓名不能为空"){
		$("#xm").css("color","#E15748");
    	$("#xm").val("姓名不能为空");
    	return false;
	}
	else
		return true;
}

function focusSFZ(){
	var sfz = $("#sfz").val();
	if(sfz=="身份证不能为空"){
		$("#sfz").val("");
		$("#sfz").css("color", "#555555");
	}
}

//验证身份证
function checkSFZ(){
	var sfz = $("#sfz").val();
	if(sfz==null||sfz==""||sfz=="身份证不能为空"){
		$("#sfz").css("color","#E15748");
    	$("#sfz").val("身份证不能为空");
    	return false;
	}
	else
		return true;
}

//验证审核状态
function checkSHZT(){
	var shzt=shztCBB.combobox("getValue");
	if(shzt==null||shzt==""){
	  	alert("请选择审核状态");
	  	return false;
	}
	else
		return true;
}

//验证在用状态
function checkZYZT(){
	var zyzt=zyztCBB.combobox("getValue");
	if(zyzt==null||zyzt==""){
	  	alert("请选择在用状态");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "new_div":
		space=340;
		break;
	case "new_div_table":
	case "panel_window":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>创建</title>
</head>
<body>
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">综合管理-创建</div>
	
	<div id="new_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				姓名
			</td>
			<td style="width:30%;">
				<input type="text" id="xm" name="xm" placeholder="请输入姓名" style="width: 150px;height:30px;" onfocus="focusXM()" onblur="checkXM()"/>
			</td>
			<td align="right" style="width:15%;">
				手机号
			</td>
			<td style="width:30%;">
				<input type="text" id="sjh" name="sjh" placeholder="请输入手机号" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				照片
			</td>
			<td>
				<input type="file" name="zp_file"/>
			</td>
			<td align="right">
				身份证
			</td>
			<td>
				<input type="text" id="sfz" name="sfz" placeholder="请输入身份证" style="width: 150px;height:30px;" onfocus="focusSFZ()" onblur="checkSFZ()"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				资格证有效期至
			</td>
			<td style="width:30%;">
				<input id="zgzyxqz_db"/>
				<input type="hidden" id="zgzyxqz" name="zgzyxqz"/>
			</td>
			<td align="right" style="width:15%;">
				驾证有效期至
			</td>
			<td style="width:30%;">
				<input id="jzyxqz_db"/>
				<input type="hidden" id="jzyxqz" name="jzyxqz"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				资格证书
			</td>
			<td style="width:30%;">
				<input type="file" name="zgzs_file"/>
			</td>
			<td align="right" style="width:15%;">
				驾证
			</td>
			<td style="width:30%;">
				<input type="file" name="jz_file"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				在用状态
			</td>
			<td style="width:30%;">
				<input id="zyzt_cbb"/>
				<input type="hidden" id="zyzt" name="zyzt"/>
			</td>
			<td align="right" style="width:15%;">
				审核状态
			</td>
			<td style="width:30%;">
				<input id="shzt_cbb"/>
				<input type="hidden" id="shzt" name="shzt"/>
			</td>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>