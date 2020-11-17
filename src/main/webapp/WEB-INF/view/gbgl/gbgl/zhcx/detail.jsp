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

.detail_gbcl_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_gbcl_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_gbcl_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_gbcl_div .xgst_span{
	margin-left: 30px;
}
.detail_gbcl_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_gbcl_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_gbcl_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_gbcl_div .title_span{
	margin-left: 30px;
}

.detail_glddpz_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_glddpz_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_glddpz_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_glddpz_div .xgst_span{
	margin-left: 30px;
}
.detail_glddpz_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_glddpz_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_glddpz_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_glddpz_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var ddNum=0;
var dgbcljbsxzdNum=1;

$(function(){
	initDetailDialog();//0
	
	//initGLDDPZDialog();//2.关联订单皮重窗口
	//initSelectGLDDPZDialog();//3.选择关联订单皮重窗口
	//initDetailGLDDPZJBSXZDialog();//4.查看关联订单皮重窗口

	//initGLDDMZDialog();//5.关联订单毛重窗口
	//initSelectGLDDMZDialog();//6.选择关联订单毛重窗口
	//initDetailGLDDMZJBSXZDialog();//7.查看关联订单毛重窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//新字段组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	//查看过磅车辆
	var dgbcljbsxzdpw=$("body").find(".panel.window").eq(dgbcljbsxzdNum);
	var dgbcljbsxzdws=$("body").find(".window-shadow").eq(dgbcljbsxzdNum);

	//关联订单皮重
	//var glddpzdpw=$("body").find(".panel.window").eq(glddpzdNum);
	//var glddpzdws=$("body").find(".window-shadow").eq(glddpzdNum);

	//选择关联订单皮重
	//var sglddpzdpw=$("body").find(".panel.window").eq(sglddpzdNum);
	//var sglddpzdws=$("body").find(".window-shadow").eq(sglddpzdNum);

	//查看关联订单皮重
	//var dglddpzjbsxzdpw=$("body").find(".panel.window").eq(dglddpzjbsxzdNum);
	//var dglddpzjbsxzdws=$("body").find(".window-shadow").eq(dglddpzjbsxzdNum);

	//关联订单毛重
	//var glddmzdpw=$("body").find(".panel.window").eq(glddmzdNum);
	//var glddmzdws=$("body").find(".window-shadow").eq(glddmzdNum);

	//选择关联订单毛重
	//var sglddmzdpw=$("body").find(".panel.window").eq(sglddmzdNum);
	//var sglddmzdws=$("body").find(".window-shadow").eq(sglddmzdNum);

	//查看关联订单毛重
	//var dglddmzjbsxzdpw=$("body").find(".panel.window").eq(dglddmzjbsxzdNum);
	//var dglddmzjbsxzdws=$("body").find(".window-shadow").eq(dglddmzjbsxzdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);
	
	//ccDiv.append(glddpzdpw);
	//ccDiv.append(glddpzdws);

	//ccDiv.append(glddmzdpw);
	//ccDiv.append(glddmzdws);

	var dgbcldDiv=$("#detail_gbcl_dialog_div");
	dgbcldDiv.append(dgbcljbsxzdpw);
	dgbcldDiv.append(dgbcljbsxzdws);

	var sglddpzDiv=$("#select_glddpz_div");
	//sglddpzDiv.append(sglddpzdpw);
	//sglddpzDiv.append(sglddpzdws);

	var dglddpzdDiv=$("#detail_glddpz_dialog_div");
	//dglddpzdDiv.append(dglddpzjbsxzdpw);
	//dglddpzdDiv.append(dglddpzjbsxzdws);

	var sglddmzDiv=$("#select_glddmz_div");
	//sglddmzDiv.append(sglddmzdpw);
	//sglddmzDiv.append(sglddmzdws);

	var dglddmzdDiv=$("#detail_glddmz_dialog_div");
	//dglddmzdDiv.append(dglddmzjbsxzdpw);
	//dglddmzdDiv.append(dglddmzjbsxzdws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("body","detail_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft
	});

	$("#detail_div table").css("width",(setFitWidthInParent("body","detail_div_table"))+"px");
	$("#detail_div table").css("magin","-100px");
	$("#detail_div table td").css("padding-left","50px");
	$("#detail_div table td").css("padding-right","20px");
	$("#detail_div table td").css("font-size","15px");
	for(var i=0;i<4;i++){
		$("#detail_div table tr").eq(i).css("height","45px");
	}
	$("#detail_div table tr").eq(4).css("height","90px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").eq(ddNum).css("color","#000");
	$(".panel.window .panel-title").eq(ddNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ddNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ddNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").eq(ddNum).css("border-color","#ddd");

	$("#detail_div #ok_but").css("left","45%");
	$("#detail_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initDetailGBCLJBSXZDialog();//1
}


function initDetailGBCLJBSXZDialog(){
	detailGBCLDialog=$("#detail_gbcl_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_gbcl_div","detail_gbcl_jbsxz_dialog_div"),
		height:500,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailGBCLDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailGBCLDialog(0);
           }}
        ]
	});

	$("#detail_gbcl_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_gbcl_div","detail_gbcl_jbsxz_dialog_div"))+"px");
	$("#detail_gbcl_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_gbcl_jbsxz_dialog_div table td").css("padding-left","20px");
	$("#detail_gbcl_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_gbcl_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_gbcl_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dgbcljbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dgbcljbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dgbcljbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dgbcljbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dgbcljbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_gbcl_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_gbcl_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_gbcl_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_gbcl_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailGBCLDialog(0);
}

function openDetailGBCLDialog(flag){
	if(flag==1){
		$("#detail_gbcl_bg_div").css("display","block");
		$("#detail_gbcl_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_gbcl_bg_div").css("display","none");
		$("#detail_gbcl_bg_div").css("z-index","9016");
	}
	openDetailGBCLJBSXZDialog(flag);
}

function openDetailGBCLJBSXZDialog(flag){
	if(flag==1){
		detailGBCLDialog.dialog("open");
	}
	else{
		detailGBCLDialog.dialog("close");
	}
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "detail_div":
	case "detail_glddpz_div":
	case "detail_glddmz_div":
		space=340;
		break;
	case "glddpz_div":
	case "glddmz_div":
		space=320;
		break;
	case "select_glddpz_tab":
	case "select_glddmz_tab":
		space=860;
		break;
	case "detail_div_table":
	case "panel_window":
	case "glddpz_tab":
	case "glddmz_tab":
		space=355;
		break;
	case "detail_gbcl_jbsxz_dialog_div":
	case "select_glddpz_dialog_div":
	case "detail_glddpz_jbsxz_dialog_div":
	case "select_glddmz_dialog_div":
	case "detail_glddmz_jbsxz_dialog_div":
		space=50;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}

function initWindowMarginLeft(){
	var editDivWidth=$("#glddpz_div").css("width");
	editDivWidth=editDivWidth.substring(0,editDivWidth.length-2);
	var pwWidth=$(".panel.window").css("width");
	pwWidth=pwWidth.substring(0,pwWidth.length-2);
	return ((editDivWidth-pwWidth)/2)+"px";
}
</script>
<title>Insert title here</title>
</head>
<body>

<!-- 查看过磅车辆start -->
<div class="detail_gbcl_bg_div" id="detail_gbcl_bg_div">
	<div class="detail_gbcl_div" id="detail_gbcl_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailGBCLDialog(0)">X</span>
		</div>
		<div class="detail_gbcl_dialog_div" id="detail_gbcl_dialog_div">
			<div class="title_div">
				<span class="title_span">综合查询-过磅车辆-查看</span>
			</div>
			<div id="detail_gbcl_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						车牌号
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.cph }</span>
					</td>
					<td align="right" style="width:15%;">
						发动机号码
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.fdjhm }</span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						车辆识别代号
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.clsbdh }</span>
					</td>
					<td align="right" style="width:15%;">
						注册日期
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.zcrq }</span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						排放阶段
					</td>
					<td style="width:30%;">
						<span>
							<c:if test="${requestScope.gbcl.pfjd eq 1 }">
								国五燃油
							</c:if>
							<c:if test="${requestScope.gbcl.pfjd eq 2 }">
								国五燃气
							</c:if>
							<c:if test="${requestScope.gbcl.pfjd eq 3 }">
								国六燃油
							</c:if>
							<c:if test="${requestScope.gbcl.pfjd eq 4 }">
								国六燃气 
							</c:if>
							<c:if test="${requestScope.gbcl.pfjd eq 5 }">
								电动
							</c:if>
						</span>
					</td>
					<td align="right" style="width:15%;">
						车辆运输类型
					</td>
					<td style="width:30%;">
						<span>
							<c:if test="${requestScope.gbcl.clyslx eq 1 }">
								普货运输
							</c:if>
							<c:if test="${requestScope.gbcl.clyslx eq 2 }">
								厂内运输
							</c:if>
							<c:if test="${requestScope.gbcl.clyslx eq 3 }">
								危化品运输
							</c:if>
						</span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						<span></span>
					</td>
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						<span></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						<span></span>
					</td>
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						<span></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						<span></span>
					</td>
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						<span></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						<span></span>
					</td>
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						<span></span>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!--查看过磅车辆 end -->

<!-- 查看关联订单皮重 start -->
<div class="detail_glddpz_bg_div" id="detail_glddpz_bg_div">
	<div class="detail_glddpz_div" id="detail_glddpz_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailGLDDPZDialog(0)">X</span>
		</div>
		<div class="detail_glddpz_dialog_div" id="detail_glddpz_dialog_div">
			<div class="title_div">
				<span class="title_span">综合查询-关联订单皮重-查看</span>
			</div>
			<div id="detail_glddpz_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						订单号
					</td>
					<td style="width:30%;">
						<span id="ddh"></span>
					</td>
					<td align="right" style="width:15%;">
						预装卸重量
					</td>
					<td style="width:30%;">
						<span id="yzxzl"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						流向类型
					</td>
					<td style="width:30%;">
						<span id="lxlx"></span>
					</td>
					<td align="right" style="width:15%;">
						编辑时间
					</td>
					<td style="width:30%;">
						<span id="bjsj"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						二维码
					</td>
					<td style="width:30%;">
						<span id="ewm"></span>
					</td>
					<td align="right" style="width:15%;">
						实际重量
					</td>
					<td style="width:30%;">
						<span id="sjzl"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						重量差额比
					</td>
					<td style="width:30%;">
						<span id="zlceb"></span>
					</td>
					<td align="right" style="width:15%;">
						备注
					</td>
					<td style="width:30%;">
						<span id="bz"></span>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!--查看关联订单皮重 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">综合查询-详情</div>

	<div id="detail_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" id="pzddbm" name="pzddbm"/>
		<input type="hidden" id="mzddbm" name="mzddbm"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				过磅车辆
			</td>
			<td style="width:30%;">
				<span onclick="openDetailGBCLDialog(1)">${requestScope.gb.cph }</span>
			</td>
			<td align="right" style="width:15%;">
				过磅重量
			</td>
			<td style="width:30%;">
				<span>${requestScope.gb.gbzl }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				过磅标签
			</td>
			<td style="width:30%;">
				<span>
					<c:if test="${requestScope.gb.gbbq.contains('1') }">
						,入厂
					</c:if>
					<c:if test="${requestScope.gb.gbbq.contains('2') }">
						,出厂
					</c:if>
					<c:if test="${requestScope.gb.gbbq.contains('3') }">
						,皮重
					</c:if>
					<c:if test="${requestScope.gb.gbbq.contains('4') }">
						,载重
					</c:if>
				</span>
			</td>
			<td align="right" style="width:15%;">
				过磅状态
			</td>
			<td style="width:30%;">
				<span>
					<c:if test="${requestScope.gb.gbzt eq 1 }">
						正常
					</c:if>
					<c:if test="${requestScope.gb.gbzt eq 2 }">
						异常
					</c:if>
				</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				过磅时间
			</td>
			<td style="width:30%;">
				<span>${requestScope.gb.gbsj }</span>
			</td>
			<td align="right" style="width:15%;">
				照片1
			</td>
			<td style="width:30%;">
				<span>${requestScope.gb.zp1 }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				照片2
			</td>
			<td>
				<span>${requestScope.gb.zp2 }</span>
			</td>
			<td align="right">
				照片3
			</td>
			<td>
				<span>${requestScope.gb.zp3 }</span>
			</td>
		  </tr>
		</table>
	</form>
	</div>

	<div id="glddpz_div">
		<div id="glddpz_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="glddpz_tab"></table>
	</div>
	
	<!-- 
	<div id="glddmz_div">
		<div id="glddmz_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="glddmz_tab"></table>
	</div>
	 -->

</div>
</body>
</html>