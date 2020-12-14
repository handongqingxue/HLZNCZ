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
.bi_tian_xiang{
	color: #f00;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var jcxxPath=path+'jcxx/';
var dialogTop=10;
var dialogLeft=20;
var edNum=0;
$(function(){
	initEditDialog();
	initZGZYXQZDB();
	initJZYXQZDB();

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
		height:431,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"审核通过",id:"shtg_but",iconCls:"icon-ok",handler:function(){
        	   	checkEdit("shtg");
           }},
           {text:"退回",id:"th_but",iconCls:"icon-back",handler:function(){
      	   		checkEdit("th");
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

	$("#edit_div #shtg_but").css("left","30%");
	$("#edit_div #shtg_but").css("position","absolute");

	$("#edit_div #th_but").css("left","45%");
	$("#edit_div #th_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initZGZYXQZDB(){
	zgzyxqzDB=$('#zgzyxqz_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#zgzyxqz").val(zgzyxqzDB.datebox("getValue"));
        }
    });
	zgzyxqzDB.datebox('textbox').attr('placeholder', '请选择资格证有效期至');
	zgzyxqzDB.datebox("setValue",'${requestScope.sj.zgzyxqz }');
}

function initJZYXQZDB(){
	jzyxqzDB=$('#jzyxqz_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#jzyxqz").val(jzyxqzDB.datebox("getValue"));
        }
    });
	jzyxqzDB.datebox('textbox').attr('placeholder', '请选择驾证有效期至');
	jzyxqzDB.datebox("setValue",'${requestScope.sj.jzyxqz }');
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

function checkEdit(flag){
	if(checkXM()){
		if(checkSFZ()){
			editSiJi(flag);
		}
	}
}

function editSiJi(flag){
	if(flag=="shtg"){
		$("#edit_div #zyzt").val(true);
		$("#edit_div #shzt").val(3);
	}
	else if(flag=="th"){
		$("#edit_div #zyzt").val(false);
		$("#edit_div #shzt").val(1);
	}
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:jcxxPath+"editSiJi",
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

function focusSJH(){
	var sjh = $("#sjh").val();
	if(sjh=="手机号不能为空"){
		$("#sjh").val("");
		$("#sjh").css("color", "#555555");
	}
}

//验证手机号
function checkSJH(){
	var sjh = $("#sjh").val();
	if(sjh==null||sjh==""||sjh=="手机号不能为空"){
		$("#sjh").css("color","#E15748");
    	$("#sjh").val("手机号不能为空");
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
	<div class="page_location_div">信息审核-修改</div>
	
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.sj.id }"/>
		<input type="hidden" id="zyzt" name="zyzt"/>
		<input type="hidden" id="shzt" name="shzt"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				<span class="bi_tian_xiang">*</span>
				姓名
			</td>
			<td style="width:30%;">
				<input type="text" id="xm" name="xm" value="${requestScope.sj.xm }" placeholder="请输入姓名" style="width: 150px;height:30px;" onfocus="focusXM()" onblur="checkXM()"/>
			</td>
			<td align="right" style="width:15%;">
				<span class="bi_tian_xiang">*</span>
				手机号
			</td>
			<td style="width:30%;">
				<input type="text" id="sjh" name="sjh" value="${requestScope.sj.sjh }" placeholder="请输入手机号" style="width: 150px;height:30px;" onfocus="focusSJH()" onblur="checkSJH()"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				照片
			</td>
			<td>
				<input type="file" name="zp_file"/>
				<div>
					${requestScope.sj.zp }
				</div>
			</td>
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				身份证
			</td>
			<td>
				<input type="text" id="sfz" name="sfz" value="${requestScope.sj.sfz }" placeholder="请输入身份证" style="width: 150px;height:30px;" onfocus="focusSFZ()" onblur="checkSFZ()"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				资格证有效期至
			</td>
			<td>
				<input id="zgzyxqz_db"/>
				<input type="hidden" id="zgzyxqz" name="zgzyxqz"/>
			</td>
			<td align="right">
				驾证
			</td>
			<td>
				<input type="file" name="jz_file"/>
				<div>
					${requestScope.sj.jz }
				</div>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				驾证有效期至
			</td>
			<td>
				<input id="jzyxqz_db"/>
				<input type="hidden" id="jzyxqz" name="jzyxqz" value="${requestScope.sj.jzyxqz }"/>
			</td>
			<td align="right">
				资格证书
			</td>
			<td>
				<input type="file" name="jz_file"/>
				<div>
					${requestScope.sj.zgzs }
				</div>
			</td>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>