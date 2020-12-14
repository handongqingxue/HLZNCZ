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
var ddNum=0;
$(function(){
	initDetailDialog();

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:431,
		top:dialogTop,
		left:dialogLeft,
	});

	$("#detail_div table").css("width",(setFitWidthInParent("body","detail_div_table"))+"px");
	$("#detail_div table").css("magin","-100px");
	$("#detail_div table td").css("padding-left","50px");
	$("#detail_div table td").css("padding-right","20px");
	$("#detail_div table td").css("font-size","15px");
	$("#detail_div table tr").css("height","45px");

	$(".panel.window").eq(ddNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(ddNum).css("color","#000");
	$(".panel.window .panel-title").eq(ddNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ddNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ddNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ddNum).css("border-color","#ddd");
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "detail_div":
		space=340;
		break;
	case "detail_div_table":
	case "panel_window":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>详情</title>
</head>
<body>
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">司机审核-详情</div>
	
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.sj.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				姓名
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.xm }</span>
			</td>
			<td align="right" style="width:15%;">
				手机号
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.sjh }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				照片
			</td>
			<td>
				<span>${requestScope.sj.zp }</span>
			</td>
			<td align="right">
				身份证
			</td>
			<td>
				<span>${requestScope.sj.sfz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				资格证有效期至
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.zgzyxqz }</span>
			</td>
			<td align="right" style="width:15%;">
				驾证
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.jz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				驾证有效期至
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.jzyxqz }</span>
			</td>
			<td align="right" style="width:15%;">
				资格证书
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.zgzs }</span>
			</td>
		  </tr>
		</table>
	</div>
</div>
</body>
</html>