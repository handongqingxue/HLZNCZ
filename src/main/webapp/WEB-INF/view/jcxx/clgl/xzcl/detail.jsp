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
		height:465,
		top:dialogTop,
		left:dialogLeft
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

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-340;
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
	<div class="page_location_div">新增车辆-详情</div>
	
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.cl.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车牌号
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.cph }</span>
			</td>
			<td align="right" style="width:15%;">
				发动机号码
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.fdjhm }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				车辆识别代号
			</td>
			<td>
				<span>${requestScope.cl.clsbdh }</span>
			</td>
			<td align="right">
				注册日期
			</td>
			<td>
				<span>${requestScope.cl.zcrq }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				排放阶段
			</td>
			<td style="width:30%;">
				<span>
				<c:if test="${requestScope.cl.pfjd eq 1 }">
					国五燃油
				</c:if>
				<c:if test="${requestScope.cl.pfjd eq 2 }">
					国五燃气
				</c:if>
				<c:if test="${requestScope.cl.pfjd eq 3 }">
					国六燃油
				</c:if>
				<c:if test="${requestScope.cl.pfjd eq 4 }">
					国六燃气
				</c:if>
				<c:if test="${requestScope.cl.pfjd eq 5 }">
					电动
				</c:if>
				</span>
			</td>
			<td align="right" style="width:15%;">
				车辆运输类型
			</td>
			<td style="width:30%;">
				<span>
				<c:if test="${requestScope.cl.clyslx eq 1 }">
					普货运输
				</c:if>
				<c:if test="${requestScope.cl.clyslx eq 2 }">
					厂内运输
				</c:if>
				<c:if test="${requestScope.cl.clyslx eq 3 }">
					危化品运输
				</c:if>
				</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				品牌型号
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.ppxh }</span>
			</td>
			<td align="right" style="width:15%;">
				车主信息
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.czxx }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				发证日期
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.fzrq }</span>
			</td>
			<td align="right" style="width:15%;">
				皮重
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.pz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车辆类型
			</td>
			<td style="width:30%;">
				<span>
				<c:if test="${requestScope.cl.cllx eq 1 }">
					重型
				</c:if>
				</span>
			</td>
			<td align="right" style="width:15%;">
				照片
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.zp }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				行驶证
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.xsz }</span>
			</td>
			<td align="right" style="width:15%;">
				随车清单
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.scqd }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				排放阶段查询截图
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.pfjdcxjt }</span>
			</td>
			<td align="right" style="width:15%;">
				备注
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.bz }</span>
			</td>
		  </tr>
		</table>
	</div>
</div>
</body>
</html>