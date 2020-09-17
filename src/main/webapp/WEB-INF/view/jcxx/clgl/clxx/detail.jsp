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
		height:431,
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
				车主信息
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.czxx }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				皮重
			</td>
			<td>
				<span>${requestScope.cl.pz }</span>
			</td>
			<td align="right">
				车辆类型
			</td>
			<td>
				<span>
				<c:if test="${requestScope.cl.cllx eq 1 }">
					重型
				</c:if>
				</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				照片
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.zp }</span>
			</td>
			<td align="right" style="width:15%;">
				发动机号码
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.fdjhm }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车辆识别代号
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.clsbdh }</span>
			</td>
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
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				注册日期
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.zcrq }</span>
			</td>
			<td align="right" style="width:15%;">
				是否在用
			</td>
			<td style="width:30%;">
				<span>
				<c:choose>
					<c:when test="${requestScope.cl.pfjd eq 1 }">
						是
					</c:when>
					<c:otherwise>
						否
					</c:otherwise>
				</c:choose>
				</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
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
			<td align="right" style="width:15%;">
				行驶证
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.xsz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				随车清单
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.scqd }</span>
			</td>
			<td align="right" style="width:15%;">
				排放阶段查询截图
			</td>
			<td style="width:30%;">
				<span>${requestScope.cl.pfjdcxjt }</span>
			</td>
		  </tr>
		</table>
	</div>
</div>
</body>
</html>