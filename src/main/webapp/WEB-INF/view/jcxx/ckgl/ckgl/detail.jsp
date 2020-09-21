<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
$(function(){
	initDetailDialog();
});

function initDetailDialog(){
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body"),
		height:200,
		top:60,
		left:308
	});

	$("#detail_div table").css("width",(setFitWidthInParent("body")-15)+"px");
	$("#detail_div table").css("magin","-100px");
	$("#detail_div table td").css("padding-left","50px");
	$("#detail_div table td").css("padding-right","20px");
	$("#detail_div table td").css("font-size","15px");
	$("#detail_div table tr").css("height","45px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").css("color","#000");
	$(".panel.window .panel-title").css("font-size","15px");
	$(".panel.window .panel-title").css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");
}

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-340;
}
</script>
<title>详情</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.ck.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				名称
			</td>
			<td style="width:30%;">
				<span>${requestScope.ck.mc }</span>
			</td>
			<td align="right" style="width:15%;">
				位置
			</td>
			<td style="width:30%;">
				<span>${requestScope.ck.wz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				备注
			</td>
			<td>
				<span>${requestScope.ck.bz }</span>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</div>
</div>
</body>
</html>