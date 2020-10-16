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
var showZIndex=9999;
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
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:200,
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
	case "yss_div":
	case "detail_yss_div":
	case "wlxx_div":
	case "detail_wlxx_div":
	case "fhdw_div":
	case "detail_fhdw_div":
	case "shdw_div":
	case "detail_shdw_div":
	case "cycl_div":
	case "detail_cycl_div":
		space=340;
		break;
	case "detail_div_table":
	case "panel_window":
	case "yss_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "detail_yss_jbsxz_dialog_div":
	case "detail_wlxx_jbsxz_dialog_div":
	case "detail_fhdw_jbsxz_dialog_div":
	case "detail_shdw_jbsxz_dialog_div":
	case "detail_cycl_jbsxz_dialog_div":
	case "detail_cysj_jbsxz_dialog_div":
		space=50;
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
<div id="center_con_div" style="margin-left:288px;width: 100%;height: 90vh;overflow-y: scroll;position: absolute;">
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.dd.wybm }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.ddh }</span>
			</td>
			<td align="right" style="width:15%;">
				预装卸重量
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.yzxzl }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				流向类型
			</td>
			<td>
				<span>
				<c:if test="${requestScope.dd.lxlx eq 1 }">
					送运
				</c:if>
				<c:if test="${requestScope.dd.lxlx eq 2 }">
					取运
				</c:if>
				</span>
			</td>
			<td align="right">
				编辑时间
			</td>
			<td>
				<span>${requestScope.dd.bjsj }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				二维码
			</td>
			<td>
				<span>
					${requestScope.dd.ewm }
				</span>
			</td>
			<td align="right">
				实际重量
			</td>
			<td>
				<span>${requestScope.dd.sjzl }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				重量差额比
			</td>
			<td>
				<span>${requestScope.dd.zlceb }</span>
			</td>
			<td align="right">
				订单状态
			</td>
			<td>
				<span>${requestScope.dd.ddztmc }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				计划运输日期
			</td>
			<td>
				<span>${requestScope.dd.jhysrq }</span>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</div>
	
	<!-- 
	<div id="yss_div">
		<table id="yss_tab"></table>
	</div>
	
	<div id="wlxx_div">
		<table id="wlxx_tab"></table>
	</div>
	
	<div id="fhdw_div">
		<table id="fhdw_tab"></table>
	</div>
	
	<div id="shdw_div">
		<table id="shdw_tab"></table>
	</div>
	
	<div id="cycl_div">
		<table id="cycl_tab"></table>
	</div>
	
	<div id="cysj_div">
		<table id="cysj_tab"></table>
	</div>
	 -->
</div>
</body>
</html>