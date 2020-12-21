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
.detail_yss_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_yss_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_yss_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_yss_div .xgst_span{
	margin-left: 30px;
}
.detail_yss_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_yss_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_yss_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_yss_div .title_span{
	margin-left: 30px;
}

.detail_wlxx_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_wlxx_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_wlxx_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_wlxx_div .xgst_span{
	margin-left: 30px;
}
.detail_wlxx_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_wlxx_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_wlxx_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_wlxx_div .title_span{
	margin-left: 30px;
}

.detail_fhdw_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_fhdw_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_fhdw_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_fhdw_div .xgst_span{
	margin-left: 30px;
}
.detail_fhdw_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_fhdw_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_fhdw_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_fhdw_div .title_span{
	margin-left: 30px;
}

.detail_shdw_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_shdw_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_shdw_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_shdw_div .xgst_span{
	margin-left: 30px;
}
.detail_shdw_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_shdw_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_shdw_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_shdw_div .title_span{
	margin-left: 30px;
}

.detail_cycl_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_cycl_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_cycl_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_cycl_div .xgst_span{
	margin-left: 30px;
}
.detail_cycl_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_cycl_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_cycl_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_cycl_div .title_span{
	margin-left: 30px;
}

.detail_cysj_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_cysj_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_cysj_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_cysj_div .xgst_span{
	margin-left: 30px;
}
.detail_cysj_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_cysj_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_cysj_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_cysj_div .title_span{
	margin-left: 30px;
}

.detail_xdyh_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_xdyh_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_xdyh_div .ckst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_xdyh_div .ckst_span{
	margin-left: 30px;
}
.detail_xdyh_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_xdyh_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_xdyh_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_xdyh_div .title_span{
	margin-left: 30px;
}

.detail_sjyh_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_sjyh_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_sjyh_div .ckst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_sjyh_div .ckst_span{
	margin-left: 30px;
}
.detail_sjyh_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_sjyh_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_sjyh_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_sjyh_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var ddNum=0;
var yssdNum=1;
var dyssjbsxzdNum=2;
var wlxxdNum=3;
var dwlxxjbsxzdNum=4;
var fhdwdNum=5;
var dfhdwjbsxzdNum=6;
var shdwdNum=7;
var dshdwjbsxzdNum=8;
var cycldNum=9;
var dcycljbsxzdNum=10;
var cysjdNum=11;
var dcysjjbsxzdNum=12;
var xdyhdNum=13;
var dxdyhjbsxzdNum=14;
var sjyhdNum=15;
var dsjyhjbsxzdNum=16;
$(function(){
	initDetailDialog();
	
	initYSSDialog();//1.运输商窗口
	initDetailYSSJBSXZDialog();//2.运输商详情窗口
	
	initWLXXDialog();//3.物料信息窗口
	initDetailWLXXJBSXZDialog();//4.物料信息详情窗口
	
	initFHDWDialog();//5.发货单位窗口
	initDetailFHDWJBSXZDialog();//6.发货单位详情窗口

	initSHDWDialog();//7.收货单位窗口
	initDetailSHDWJBSXZDialog();//8.收货单位详情窗口
	
	initCYCLDialog();//9.承运车辆窗口
	initDetailCYCLJBSXZDialog();//10.承运车辆详情窗口
	
	initCYSJDialog();//11.承运司机窗口
	initDetailCYSJJBSXZDialog();//12.承运司机详情窗口

	initXDYHDialog();//13.下单用户窗口
	initDetailXDYHJBSXZDialog();//14.下单用户详情窗口

	initSJYHDialog();//15.司机用户窗口
	initDetailSJYHJBSXZDialog();//16.司机用户详情窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	//运输商
	var yssdpw=$("body").find(".panel.window").eq(yssdNum);
	var yssdws=$("body").find(".window-shadow").eq(yssdNum);
	
	//查看运输商
	var dyssjbsxdpw=$("body").find(".panel.window").eq(dyssjbsxzdNum);
	var dyssjbsxdws=$("body").find(".window-shadow").eq(dyssjbsxzdNum);

	//物料信息
	var wlxxdpw=$("body").find(".panel.window").eq(wlxxdNum);
	var wlxxdws=$("body").find(".window-shadow").eq(wlxxdNum);

	//查看物料信息
	var dwlxxjbsxdpw=$("body").find(".panel.window").eq(dwlxxjbsxzdNum);
	var dwlxxjbsxdws=$("body").find(".window-shadow").eq(dwlxxjbsxzdNum);
	
	//发货单位
	var fhdwdpw=$("body").find(".panel.window").eq(fhdwdNum);
	var fhdwdws=$("body").find(".window-shadow").eq(fhdwdNum);

	//查看发货单位
	var dfhdwjbsxdpw=$("body").find(".panel.window").eq(dfhdwjbsxzdNum);
	var dfhdwjbsxdws=$("body").find(".window-shadow").eq(dfhdwjbsxzdNum);

	//收货单位
	var shdwdpw=$("body").find(".panel.window").eq(shdwdNum);
	var shdwdws=$("body").find(".window-shadow").eq(shdwdNum);

	//查看收货单位
	var dshdwjbsxdpw=$("body").find(".panel.window").eq(dshdwjbsxzdNum);
	var dshdwjbsxdws=$("body").find(".window-shadow").eq(dshdwjbsxzdNum);

	//承运车辆
	var cycldpw=$("body").find(".panel.window").eq(cycldNum);
	var cycldws=$("body").find(".window-shadow").eq(cycldNum);

	//查看承运车辆
	var dcycljbsxdpw=$("body").find(".panel.window").eq(dcycljbsxzdNum);
	var dcycljbsxdws=$("body").find(".window-shadow").eq(dcycljbsxzdNum);

	//承运司机
	var cysjdpw=$("body").find(".panel.window").eq(cysjdNum);
	var cysjdws=$("body").find(".window-shadow").eq(cysjdNum);

	//查看承运司机
	var dcysjjbsxdpw=$("body").find(".panel.window").eq(dcysjjbsxzdNum);
	var dcysjjbsxdws=$("body").find(".window-shadow").eq(dcysjjbsxzdNum);

	//下单用户
	var xdyhdpw=$("body").find(".panel.window").eq(xdyhdNum);
	var xdyhdws=$("body").find(".window-shadow").eq(xdyhdNum);

	//查看下单用户
	var dxdyhjbsxdpw=$("body").find(".panel.window").eq(dxdyhjbsxzdNum);
	var dxdyhjbsxdws=$("body").find(".window-shadow").eq(dxdyhjbsxzdNum);

	//司机用户
	var sjyhdpw=$("body").find(".panel.window").eq(sjyhdNum);
	var sjyhdws=$("body").find(".window-shadow").eq(sjyhdNum);

	//查看司机用户
	var dsjyhjbsxdpw=$("body").find(".panel.window").eq(dsjyhjbsxzdNum);
	var dsjyhjbsxdws=$("body").find(".window-shadow").eq(dsjyhjbsxzdNum);
	
	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);

	ccDiv.append(yssdpw);
	ccDiv.append(yssdws);

	ccDiv.append(wlxxdpw);
	ccDiv.append(wlxxdws);

	ccDiv.append(fhdwdpw);
	ccDiv.append(fhdwdws);

	ccDiv.append(shdwdpw);
	ccDiv.append(shdwdws);

	ccDiv.append(cycldpw);
	ccDiv.append(cycldws);

	ccDiv.append(cysjdpw);
	ccDiv.append(cysjdws);

	ccDiv.append(xdyhdpw);
	ccDiv.append(xdyhdws);

	ccDiv.append(sjyhdpw);
	ccDiv.append(sjyhdws);

	var dyssdDiv=$("#detail_yss_dialog_div");
	dyssdDiv.append(dyssjbsxdpw);
	dyssdDiv.append(dyssjbsxdws);

	var dwlxxdDiv=$("#detail_wlxx_dialog_div");
	dwlxxdDiv.append(dwlxxjbsxdpw);
	dwlxxdDiv.append(dwlxxjbsxdws);

	var dfhdwdDiv=$("#detail_fhdw_dialog_div");
	dfhdwdDiv.append(dfhdwjbsxdpw);
	dfhdwdDiv.append(dfhdwjbsxdws);

	var dshdwdDiv=$("#detail_shdw_dialog_div");
	dshdwdDiv.append(dshdwjbsxdpw);
	dshdwdDiv.append(dshdwjbsxdws);

	var dcycldDiv=$("#detail_cycl_dialog_div");
	dcycldDiv.append(dcycljbsxdpw);
	dcycldDiv.append(dcycljbsxdws);

	var dcysjdDiv=$("#detail_cysj_dialog_div");
	dcysjdDiv.append(dcysjjbsxdpw);
	dcysjdDiv.append(dcysjjbsxdws);

	var dxdyhdDiv=$("#detail_xdyh_dialog_div");
	dxdyhdDiv.append(dxdyhjbsxdpw);
	dxdyhdDiv.append(dxdyhjbsxdws);

	var dsjyhdDiv=$("#detail_sjyh_dialog_div");
	dsjyhdDiv.append(dsjyhjbsxdpw);
	dsjyhdDiv.append(dsjyhjbsxdws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:500,
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
	
	$(".panel-header, .panel-body").eq(ddNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ddNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ddNum).css("border-color","#ddd");
}

function initYSSDialog(){
	dialogTop+=520;//230
	yssDialog=$("#yss_div").dialog({
		title:"运输商",
		width:setFitWidthInParent("body","yss_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(yssdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(yssdNum).css("margin-top","20px");
	$(".panel.window").eq(yssdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(yssdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(yssdNum).css("color","#000");
	$(".panel.window .panel-title").eq(yssdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(yssdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(yssdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(yssdNum).css("width","1000px");
	$(".window-shadow").eq(yssdNum).css("margin-top","20px");
	$(".window-shadow").eq(yssdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(yssdNum).css("border-color","#ddd");

	initYSSTab();
}

function initWLXXDialog(){
	dialogTop+=230;//460
	wlxxDialog=$("#wlxx_div").dialog({
		title:"物料信息",
		width:setFitWidthInParent("body","wlxx_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(wlxxdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(wlxxdNum).css("margin-top","20px");
	$(".panel.window").eq(wlxxdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(wlxxdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(wlxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(wlxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(wlxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(wlxxdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(wlxxdNum).css("width","1000px");
	$(".window-shadow").eq(wlxxdNum).css("margin-top","20px");
	$(".window-shadow").eq(wlxxdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(wlxxdNum).css("border-color","#ddd");

	initWLXXTab();
}

function initFHDWDialog(){
	dialogTop+=230;//690
	fhdwDialog=$("#fhdw_div").dialog({
		title:"发货单位",
		width:setFitWidthInParent("body","fhdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(fhdwdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(fhdwdNum).css("margin-top","20px");
	$(".panel.window").eq(fhdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(fhdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(fhdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(fhdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(fhdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(fhdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(fhdwdNum).css("width","1000px");
	$(".window-shadow").eq(fhdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(fhdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(fhdwdNum).css("border-color","#ddd");

	initFHDWTab();
}

function initSHDWDialog(){
	dialogTop+=230;//920
	shdwDialog=$("#shdw_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("body","shdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(shdwdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(shdwdNum).css("margin-top","20px");
	$(".panel.window").eq(shdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(shdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(shdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(shdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(shdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(shdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(shdwdNum).css("width","1000px");
	$(".window-shadow").eq(shdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(shdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(shdwdNum).css("border-color","#ddd");

	initSHDWTab();
}

function initCYCLDialog(){
	dialogTop+=230;//1150
	cyclDialog=$("#cycl_div").dialog({
		title:"承运车辆",
		width:setFitWidthInParent("body","cycl_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(cycldNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(cycldNum).css("margin-top","20px");
	$(".panel.window").eq(cycldNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(cycldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(cycldNum).css("color","#000");
	$(".panel.window .panel-title").eq(cycldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(cycldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(cycldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(cycldNum).css("width","1000px");
	$(".window-shadow").eq(cycldNum).css("margin-top","20px");
	$(".window-shadow").eq(cycldNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(cycldNum).css("border-color","#ddd");

	initCYCLTab();
}

function initCYSJDialog(){
	dialogTop+=230;//1380
	cysjDialog=$("#cysj_div").dialog({
		title:"承运司机",
		width:setFitWidthInParent("body","cysj_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(cysjdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(cysjdNum).css("margin-top","20px");
	$(".panel.window").eq(cysjdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(cysjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(cysjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(cysjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(cysjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(cysjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(cysjdNum).css("width","1000px");
	$(".window-shadow").eq(cysjdNum).css("margin-top","20px");
	$(".window-shadow").eq(cysjdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(cysjdNum).css("border-color","#ddd");

	initCYSJTab();
}

function initXDYHDialog(){
	dialogTop+=230;//1380
	xdyhDialog=$("#xdyh_div").dialog({
		title:"下单用户",
		width:setFitWidthInParent("body","xdyh_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(xdyhdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(xdyhdNum).css("margin-top","20px");
	$(".panel.window").eq(xdyhdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(xdyhdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(xdyhdNum).css("color","#000");
	$(".panel.window .panel-title").eq(xdyhdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(xdyhdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(xdyhdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(xdyhdNum).css("width","1000px");
	$(".window-shadow").eq(xdyhdNum).css("margin-top","20px");
	$(".window-shadow").eq(xdyhdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(xdyhdNum).css("border-color","#ddd");

	initXDYHTab();
}

function initSJYHDialog(){
	dialogTop+=230;//1380
	sjyhDialog=$("#sjyh_div").dialog({
		title:"司机用户",
		width:setFitWidthInParent("body","sjyh_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(sjyhdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(sjyhdNum).css("margin-top","20px");
	$(".panel.window").eq(sjyhdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sjyhdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sjyhdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sjyhdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sjyhdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sjyhdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sjyhdNum).css("width","1000px");
	$(".window-shadow").eq(sjyhdNum).css("margin-top","20px");
	$(".window-shadow").eq(sjyhdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sjyhdNum).css("border-color","#ddd");

	initSJYHTab();
}

function initYSSTab(){
	yssTab=$("#yss_tab").datagrid({
		width:setFitWidthInParent("body","yss_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="关系运输商";
					break;
				}
				return str;
			}},
            {field:"mc",title:"名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showYSSDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	var rows;
	if('${requestScope.yss}'==""){
		rows=[];
	}
	else{
		var mc='${requestScope.yss.mc}';
		var bjsj='${requestScope.yss.bjsj}';
		var id='${requestScope.yss.id}';
		rows=[{gx:"1",mc:mc,bjsj:bjsj,id:id}];
	}
	loadYSSTabData(rows);
}

function initWLXXTab(){
	wlxxTab=$("#wlxx_tab").datagrid({
		toolbar:"#wlxx_toolbar",
		width:setFitWidthInParent("body","wlxx_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="运输物资";
					break;
				}
				return str;
			}},
            {field:"mc",title:"名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showWLXXDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	var rows;
	if('${requestScope.wlxx}'==""){
		rows=[];
	}
	else{
		var mc='${requestScope.wlxx.mc}';
		var bjsj='${requestScope.wlxx.bjsj}';
		var id='${requestScope.wlxx.id}';
		rows=[{gx:"1",mc:mc,bjsj:bjsj,id:id}];
	}
	loadWLXXTabData(rows);
}

function initFHDWTab(){
	fhdwTab=$("#fhdw_tab").datagrid({
		toolbar:"#fhdw_toolbar",
		width:setFitWidthInParent("body","fhdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="发货单位";
					break;
				}
				return str;
			}},
            {field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showFHDWDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	var rows;
	if('${requestScope.fhdw}'==""){
		rows=[];
	}
	else{
		var dwmc='${requestScope.fhdw.dwmc}';
		var bjsj='${requestScope.fhdw.bjsj}';
		var id='${requestScope.fhdw.id}';
		rows=[{gx:"1",dwmc:dwmc,bjsj:bjsj,id:id}];
	}
	loadFHDWTabData(rows);
}

function initSHDWTab(){
	shdwTab=$("#shdw_tab").datagrid({
		toolbar:"#shdw_toolbar",
		width:setFitWidthInParent("body","shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="收货单位";
					break;
				}
				return str;
			}},
            {field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showSHDWDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	var rows;
	if('${requestScope.shdw}'==""){
		rows=[];
	}
	else{
		var dwmc='${requestScope.shdw.dwmc}';
		var bjsj='${requestScope.shdw.bjsj}';
		var id='${requestScope.shdw.id}';
		rows=[{gx:"1",dwmc:dwmc,bjsj:bjsj,id:id}];
	}
	loadSHDWTabData(rows);
}

function initCYCLTab(){
	cyclTab=$("#cycl_tab").datagrid({
		toolbar:"#cycl_toolbar",
		width:setFitWidthInParent("body","cycl_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="货运车辆";
					break;
				}
				return str;
			}},
            {field:"cph",title:"车牌号",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showCYCLDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	var rows;
	if('${requestScope.cycl}'==""){
		rows=[];
	}
	else{
		var cph='${requestScope.cycl.cph}';
		var czxx='${requestScope.cycl.czxx}';
		var pz='${requestScope.cycl.pz}';
		var cllxStr;
		var cllx='${requestScope.cycl.cllx}';
		switch (cllx) {
		case "1":
			cllxStr="重型";
			break;
		}
		var zp='${requestScope.cycl.zp}';
		var fdjhm='${requestScope.cycl.fdjhm}';
		var clsbdh='${requestScope.cycl.clsbdh}';
		var pfjdStr;
		var pfjd='${requestScope.cycl.pfjd}';
		switch (pfjd) {
		case "1":
			pfjdStr="国五燃油";
			break;
		case "2":
			pfjdStr="国五燃气";
			break;
		case "3":
			pfjdStr="国六燃油";
			break;
		case "4":
			pfjdStr="国六燃气";
			break;
		case "5":
			pfjdStr="电动";
			break;
		}
		var zcrq='${requestScope.cycl.zcrq}';
		var sfzy='${requestScope.cycl.sfzy}';
		var clyslxStr;
		var clyslx='${requestScope.cycl.clyslx}';
		switch (clyslx) {
		case "1":
			clyslxStr="普货运输";
			break;
		case "2":
			clyslxStr="厂内运输";
			break;
		case "3":
			clyslxStr="危化品运输";
			break;
		}
		var xsz='${requestScope.cycl.xsz}';
		var scqd='${requestScope.cycl.scqd}';
		var pfjdcxjt='${requestScope.cycl.pfjdcxjt}';
		var id='${requestScope.cycl.id}';
		rows=[{gx:"1",cph:cph,czxx:czxx,pz:pz,cllx:cllxStr,zp:zp,fdjhm:fdjhm,clsbdh:clsbdh,
			pfjd:pfjdStr,zcrq:zcrq,sfzy:sfzy?"是":"否",clyslx:clyslxStr,xsz:xsz,scqd:scqd,pfjdcxjt:pfjdcxjt,id:id}];
	}
	loadCYCLTabData(rows);
}

function initCYSJTab(){
	cysjTab=$("#cysj_tab").datagrid({
		toolbar:"#cysj_toolbar",
		width:setFitWidthInParent("body","cysj_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="货运司机";
					break;
				}
				return str;
			}},
            {field:"xm",title:"姓名",width:200,align:"center"},
            {field:"sjh",title:"手机号",width:200,align:"center"},
            {field:"sfz",title:"身份证",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showCYSJDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:5});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	var rows;
	if('${requestScope.cysj}'==""){
		rows=[];
	}
	else{
		var xm='${requestScope.cysj.xm}';
		var sjh='${requestScope.cysj.sjh}';
		var zp='${requestScope.cysj.zp}';
		var sfz='${requestScope.cysj.sfz}';
		var zgzyxqz='${requestScope.cysj.zgzyxqz}';
		var jz='${requestScope.cysj.jz}';
		var jzyxqz='${requestScope.cysj.jzyxqz}';
		var zgzs='${requestScope.cysj.zgzs}';
		var shzt='${requestScope.cysj.shzt}';
		var zyzt='${requestScope.cysj.zyzt}';
		var id='${requestScope.cysj.id}';
		rows=[{gx:"1",xm:xm,sjh:sjh,zp:zp,sfz:sfz,zgzyxqz:zgzyxqz,jz:jz,jzyxqz:jzyxqz,zgzs:zgzs,shzt:shzt,zyzt:zyzt,id:id}];
	}
	loadCYSJTabData(rows);
}

function initXDYHTab(){
	xdyhTab=$("#xdyh_tab").datagrid({
		toolbar:"#xdyh_toolbar",
		width:setFitWidthInParent("body","xdyh_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="下单用户";
					break;
				}
				return str;
			}},
            {field:"sm",title:"实名",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showXDYHDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	var rows;
	if('${requestScope.xdyh}'==""){
		rows=[];
	}
	else{
		var yhm='${requestScope.xdyh.yhm}';
		var nc='${requestScope.xdyh.nc}';
		var tx='${requestScope.xdyh.tx}';
		var sm='${requestScope.xdyh.sm}';
		var zt='${requestScope.xdyh.zt}';
		var js='${requestScope.xdyh.js}';
		var id='${requestScope.xdyh.id}';
		rows=[{gx:"1",yhm:yhm,nc:nc,tx:tx,sm:sm,zt:zt,js:js,id:id}];
	}
	loadXDYHTabData(rows);
}

function initSJYHTab(){
	sjyhTab=$("#sjyh_tab").datagrid({
		toolbar:"#sjyh_toolbar",
		width:setFitWidthInParent("body","sjyh_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="订单司机用户";
					break;
				}
				return str;
			}},
            {field:"sm",title:"实名",width:200,align:"center"},
            {field:"yhm",title:"用户名",width:200,align:"center"},
            {field:"js",title:"简述",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showSJYHDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:5});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	var rows;
	if('${requestScope.sjyh}'==""){
		rows=[];
	}
	else{
		var yhm='${requestScope.sjyh.yhm}';
		var nc='${requestScope.sjyh.nc}';
		var tx='${requestScope.sjyh.tx}';
		var sm='${requestScope.sjyh.sm}';
		var zt='${requestScope.sjyh.zt}';
		var js='${requestScope.sjyh.js}';
		var id='${requestScope.sjyh.id}';
		rows=[{gx:"1",yhm:yhm,nc:nc,tx:tx,sm:sm,zt:zt,js:js,id:id}];
	}
	loadSJYHTabData(rows);
}

function initDetailYSSJBSXZDialog(){
	detailYSSDialog=$("#detail_yss_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_yss_div","detail_yss_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailYSSDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailYSSDialog(0);
           }}
        ]
	});

	$("#detail_yss_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_yss_div","detail_yss_jbsxz_dialog_div"))+"px");
	$("#detail_yss_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_yss_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_yss_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_yss_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_yss_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dyssjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dyssjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dyssjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dyssjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dyssjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dyssjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(dyssjbsxzdNum).css("border-color","#ddd");

	$("#detail_yss_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_yss_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_yss_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_yss_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailYSSDialog(0);
}

function initDetailWLXXJBSXZDialog(){
	detailWLXXDialog=$("#detail_wlxx_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_wlxx_div","detail_wlxx_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailWLXXDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailWLXXDialog(0);
           }}
        ]
	});

	$("#detail_wlxx_jbsxz_dialog_div table").css("width",(setFitWidthInParent("body","detail_wlxx_jbsxz_dialog_div"))+"px");
	$("#detail_wlxx_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_wlxx_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_wlxx_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_wlxx_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_wlxx_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dwlxxjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(dwlxxjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dwlxxjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dwlxxjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dwlxxjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dwlxxjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dwlxxjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(dwlxxjbsxzdNum).css("border-color","#ddd");

	$("#detail_wlxx_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_wlxx_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_wlxx_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_wlxx_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailWLXXDialog(0);
}

function initDetailFHDWJBSXZDialog(){
	detailFHDWDialog=$("#detail_fhdw_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_fhdw_div","detail_fhdw_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailFHDWDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailFHDWDialog(0);
           }}
        ]
	});

	$("#detail_fhdw_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_fhdw_div","detail_fhdw_jbsxz_dialog_div"))+"px");
	$("#detail_fhdw_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_fhdw_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_fhdw_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_fhdw_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_fhdw_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dfhdwjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(dfhdwjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dfhdwjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dfhdwjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dfhdwjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dfhdwjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dfhdwjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(dfhdwjbsxzdNum).css("border-color","#ddd");

	$("#detail_fhdw_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_fhdw_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_fhdw_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_fhdw_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailFHDWDialog(0);
}

function initDetailSHDWJBSXZDialog(){
	detailSHDWDialog=$("#detail_shdw_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_shdw_div","detail_shdw_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailSHDWDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailSHDWDialog(0);
           }}
        ]
	});

	$("#detail_shdw_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_shdw_div","detail_shdw_jbsxz_dialog_div"))+"px");
	$("#detail_shdw_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_shdw_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_shdw_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_shdw_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_shdw_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dshdwjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(dshdwjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dshdwjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dshdwjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dshdwjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dshdwjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dshdwjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(dshdwjbsxzdNum).css("border-color","#ddd");

	$("#detail_shdw_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_shdw_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_shdw_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_shdw_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSHDWDialog(0);
}

function initDetailCYCLJBSXZDialog(){
	detailCYCLDialog=$("#detail_cycl_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_cycl_div","detail_cycl_jbsxz_dialog_div"),
		height:500,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailCYCLDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailCYCLDialog(0);
           }}
        ]
	});

	$("#detail_cycl_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_cycl_div","detail_cycl_jbsxz_dialog_div"))+"px");
	$("#detail_cycl_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_cycl_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_cycl_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_cycl_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_cycl_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dcycljbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(dcycljbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dcycljbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dcycljbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dcycljbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dcycljbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dcycljbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(dcycljbsxzdNum).css("border-color","#ddd");

	$("#detail_cycl_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_cycl_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_cycl_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_cycl_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailCYCLDialog(0);
}

function initDetailCYSJJBSXZDialog(){
	detailCYSJDialog=$("#detail_cysj_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_cysj_div","detail_cysj_jbsxz_dialog_div"),
		height:500,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailCYSJDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailCYSJDialog(0);
           }}
        ]
	});

	$("#detail_cysj_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_cysj_div","detail_cysj_jbsxz_dialog_div"))+"px");
	$("#detail_cysj_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_cysj_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_cysj_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_cysj_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_cysj_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dcysjjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(dcysjjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dcysjjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dcysjjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dcysjjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dcysjjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dcysjjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(dcysjjbsxzdNum).css("border-color","#ddd");

	$("#detail_cysj_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_cysj_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_cysj_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_cysj_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailCYSJDialog(0);
}

function initDetailXDYHJBSXZDialog(){
	detailXDYHDialog=$("#detail_xdyh_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_xdyh_div","detail_xdyh_jbsxz_dialog_div"),
		height:300,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailXDYHDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailXDYHDialog(0);
           }}
        ]
	});

	$("#detail_xdyh_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_xdyh_div","detail_xdyh_jbsxz_dialog_div"))+"px");
	$("#detail_xdyh_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_xdyh_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_xdyh_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_xdyh_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_xdyh_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dxdyhjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(dxdyhjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dxdyhjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dxdyhjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dxdyhjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dxdyhjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_xdyh_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_xdyh_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_xdyh_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_xdyh_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailXDYHDialog(0);
}

function initDetailSJYHJBSXZDialog(){
	detailSJYHDialog=$("#detail_sjyh_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_sjyh_div","detail_sjyh_jbsxz_dialog_div"),
		height:300,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailSJYHDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailSJYHDialog(0);
           }}
        ]
	});

	$("#detail_sjyh_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_sjyh_div","detail_sjyh_jbsxz_dialog_div"))+"px");
	$("#detail_sjyh_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_sjyh_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_sjyh_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_sjyh_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_sjyh_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dsjyhjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(dsjyhjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dsjyhjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dsjyhjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dsjyhjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dsjyhjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_sjyh_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_sjyh_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_sjyh_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_sjyh_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSJYHDialog(0);
}

function showYSSDetail(){
	var row=yssTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_yss_div #id").val(row.id);
	$("#detail_yss_div #mc").text(row.mc);
	$("#detail_yss_div #bjsj").text(row.bjsj);
	openDetailYSSDialog(1);
}

function showWLXXDetail(){
	var row=wlxxTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_wlxx_div #id").val(row.id);
	$("#detail_wlxx_div #mc").text(row.mc);
	$("#detail_wlxx_div #bjsj").text(row.bjsj);
	openDetailWLXXDialog(1);
}

function showFHDWDetail(){
	var row=fhdwTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_fhdw_div #id").val(row.id);
	$("#detail_fhdw_div #dwmc").text(row.dwmc);
	$("#detail_fhdw_div #bjsj").text(row.bjsj);
	openDetailFHDWDialog(1);
}

function showSHDWDetail(){
	var row=shdwTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_shdw_div #id").val(row.id);
	$("#detail_shdw_div #dwmc").text(row.dwmc);
	$("#detail_shdw_div #bjsj").text(row.bjsj);
	openDetailSHDWDialog(1);
}

function showCYCLDetail(){
	var row=cyclTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_cycl_div #id").val(row.id);
	$("#detail_cycl_div #cph").text(row.cph);
	$("#detail_cycl_div #czxx").text(row.czxx);
	$("#detail_cycl_div #pz").text(row.pz);
	$("#detail_cycl_div #cllx").text(row.cllx);
	$("#detail_cycl_div #zp").text(row.zp);
	$("#detail_cycl_div #fdjhm").text(row.fdjhm);
	$("#detail_cycl_div #clsbdh").text(row.clsbdh);
	$("#detail_cycl_div #pfjd").text(row.pfjd);
	$("#detail_cycl_div #zcrq").text(row.zcrq);
	$("#detail_cycl_div #sfzy").text(row.sfzy);
	$("#detail_cycl_div #clyslx").text(row.clyslx);
	$("#detail_cycl_div #xsz").text(row.xsz);
	$("#detail_cycl_div #scqd").text(row.scqd);
	$("#detail_cycl_div #pfjdcxjt").text(row.pfjdcxjt);
	openDetailCYCLDialog(1);
}

function showCYSJDetail(){
	var row=cysjTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_cysj_div #id").val(row.id);
	$("#detail_cysj_div #xm").text(row.xm);
	$("#detail_cysj_div #sjh").text(row.sjh);
	$("#detail_cysj_div #zp").text(row.zp);
	$("#detail_cysj_div #sfz").text(row.sfz);
	$("#detail_cysj_div #zgzyxqz").text(row.zgzyxqz);
	$("#detail_cysj_div #jz").text(row.jz);
	$("#detail_cysj_div #jzyxqz").text(row.jzyxqz);
	$("#detail_cysj_div #zgzs").text(row.zgzs);
	var shztStr;
	switch (row.shzt) {
	case "1":
		shztStr="编辑中";
		break;
	case "2":
		shztStr="待审核";
		break;
	case "3":
		shztStr="审核通过";
		break;
	}
	$("#detail_cysj_div #shzt").text(shztStr);
	$("#detail_cysj_div #zyzt").text(row.zyzt?"是":"否");
	openDetailCYSJDialog(1);
}

function showXDYHDetail(){
	var row=xdyhTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_xdyh_div #id").val(row.id);
	$("#detail_xdyh_div #yhm").text(row.yhm);
	$("#detail_xdyh_div #nc").text(row.nc);
	$("#detail_xdyh_div #tx").text(row.tx);
	$("#detail_xdyh_div #sm").text(row.sm);
	var ztStr;
	switch (row.zt) {
	case "1":
		ztStr="新增";
		break;
	case "2":
		ztStr="正常使用";
		break;
	case "3":
		ztStr="废弃";
		break;
	case "4":
		ztStr="有误";
		break;
	}
	$("#detail_xdyh_div #zt").text(ztStr);
	$("#detail_xdyh_div #js").text(row.js);
	openDetailXDYHDialog(1);
}

function showSJYHDetail(){
	var row=sjyhTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_sjyh_div #id").val(row.id);
	$("#detail_sjyh_div #yhm").text(row.yhm);
	$("#detail_sjyh_div #nc").text(row.nc);
	$("#detail_sjyh_div #tx").text(row.tx);
	$("#detail_sjyh_div #sm").text(row.sm);
	var ztStr;
	switch (row.zt) {
	case "1":
		ztStr="新增";
		break;
	case "2":
		ztStr="正常使用";
		break;
	case "3":
		ztStr="废弃";
		break;
	case "4":
		ztStr="有误";
		break;
	}
	$("#detail_sjyh_div #zt").text(ztStr);
	$("#detail_sjyh_div #js").text(row.js);
	openDetailSJYHDialog(1);
}

function openDetailYSSDialog(flag){
	if(flag==1){
		$("#detail_yss_bg_div").css("display","block");
		$("#detail_yss_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_yss_bg_div").css("display","none");
		$("#detail_yss_bg_div").css("z-index","9016");
	}
	openDetailYSSJBSXZDialog(flag);
}

function openDetailYSSJBSXZDialog(flag){
	if(flag==1){
		detailYSSDialog.dialog("open");
	}
	else{
		detailYSSDialog.dialog("close");
	}
}

function openDetailWLXXDialog(flag){
	if(flag==1){
		$("#detail_wlxx_bg_div").css("display","block");
		$("#detail_wlxx_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_wlxx_bg_div").css("display","none");
		$("#detail_wlxx_bg_div").css("z-index","9016");
	}
	openDetailWLXXJBSXZDialog(flag);
}

function openDetailWLXXJBSXZDialog(flag){
	if(flag==1){
		detailWLXXDialog.dialog("open");
	}
	else{
		detailWLXXDialog.dialog("close");
	}
}

function openDetailFHDWDialog(flag){
	if(flag==1){
		$("#detail_fhdw_bg_div").css("display","block");
		$("#detail_fhdw_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_fhdw_bg_div").css("display","none");
		$("#detail_fhdw_bg_div").css("z-index","9016");
	}
	openDetailFHDWJBSXZDialog(flag);
}

function openDetailFHDWJBSXZDialog(flag){
	if(flag==1){
		detailFHDWDialog.dialog("open");
	}
	else{
		detailFHDWDialog.dialog("close");
	}
}

function openDetailSHDWDialog(flag){
	if(flag==1){
		$("#detail_shdw_bg_div").css("display","block");
		$("#detail_shdw_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_shdw_bg_div").css("display","none");
		$("#detail_shdw_bg_div").css("z-index","9016");
	}
	openDetailSHDWJBSXZDialog(flag);
}

function openDetailSHDWJBSXZDialog(flag){
	if(flag==1){
		detailSHDWDialog.dialog("open");
	}
	else{
		detailSHDWDialog.dialog("close");
	}
}

function openDetailCYCLDialog(flag){
	if(flag==1){
		$("#detail_cycl_bg_div").css("display","block");
		$("#detail_cycl_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_cycl_bg_div").css("display","none");
		$("#detail_cycl_bg_div").css("z-index","9016");
	}
	openDetailCYCLJBSXZDialog(flag);
}

function openDetailCYCLJBSXZDialog(flag){
	if(flag==1){
		detailCYCLDialog.dialog("open");
	}
	else{
		detailCYCLDialog.dialog("close");
	}
}

function openDetailCYSJDialog(flag){
	if(flag==1){
		$("#detail_cysj_bg_div").css("display","block");
		$("#detail_cysj_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_cysj_bg_div").css("display","none");
		$("#detail_cysj_bg_div").css("z-index","9016");
	}
	openDetailCYSJJBSXZDialog(flag);
}

function openDetailCYSJJBSXZDialog(flag){
	if(flag==1){
		detailCYSJDialog.dialog("open");
	}
	else{
		detailCYSJDialog.dialog("close");
	}
}

function openDetailXDYHDialog(flag){
	if(flag==1){
		$("#detail_xdyh_bg_div").css("display","block");
		$("#detail_xdyh_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_xdyh_bg_div").css("display","none");
		$("#detail_xdyh_bg_div").css("z-index","9016");
	}
	openDetailXDYHJBSXZDialog(flag);
}

function openDetailXDYHJBSXZDialog(flag){
	if(flag==1){
		detailXDYHDialog.dialog("open");
	}
	else{
		detailXDYHDialog.dialog("close");
	}
}

function openDetailSJYHDialog(flag){
	if(flag==1){
		$("#detail_sjyh_bg_div").css("display","block");
		$("#detail_sjyh_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_sjyh_bg_div").css("display","none");
		$("#detail_sjyh_bg_div").css("z-index","9016");
	}
	openDetailSJYHJBSXZDialog(flag);
}

function openDetailSJYHJBSXZDialog(flag){
	if(flag==1){
		detailSJYHDialog.dialog("open");
	}
	else{
		detailSJYHDialog.dialog("close");
	}
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

function loadYSSTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	yssTab.datagrid('loadData',obj);
}

function loadWLXXTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	wlxxTab.datagrid('loadData',obj);
}

function loadFHDWTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	fhdwTab.datagrid('loadData',obj);
}

function loadSHDWTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	shdwTab.datagrid('loadData',obj);
}

function loadCYCLTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	cyclTab.datagrid('loadData',obj);
}

function loadCYSJTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	cysjTab.datagrid('loadData',obj);
}

function loadXDYHTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	xdyhTab.datagrid('loadData',obj);
}

function loadSJYHTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	sjyhTab.datagrid('loadData',obj);
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
	case "detail_xdyh_jbsxz_dialog_div":
	case "detail_sjyh_jbsxz_dialog_div":
		space=50;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}

function initWindowMarginLeft(){
	var editDivWidth=$("#yss_div").css("width");
	editDivWidth=editDivWidth.substring(0,editDivWidth.length-2);
	var pwWidth=$(".panel.window").css("width");
	pwWidth=pwWidth.substring(0,pwWidth.length-2);
	return ((editDivWidth-pwWidth)/2)+"px";
}
</script>
<title>详情</title>
</head>
<body>
	
<!-- 查看运输商 start -->
<div class="detail_yss_bg_div" id="detail_yss_bg_div">
	<div class="detail_yss_div" id="detail_yss_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailYSSDialog(0)">X</span>
		</div>
		<div class="detail_yss_dialog_div" id="detail_yss_dialog_div">
			<div class="title_div">
				<span class="title_span">我的订单-运输商-查看</span>
			</div>
			<div id="detail_yss_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						名称
					</td>
					<td style="width:30%;">
						<span id="mc"></span>
					</td>
					<td align="right" style="width:15%;">
						编辑时间
					</td>
					<td style="width:30%;">
						<span id="bjsj"></span>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!--查看运输商 end -->
	
<!-- 查看物料信息 start -->
<div class="detail_wlxx_bg_div" id="detail_wlxx_bg_div">
	<div class="detail_wlxx_div" id="detail_wlxx_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailWLXXDialog(0)">X</span>
		</div>
		<div class="detail_wlxx_dialog_div" id="detail_wlxx_dialog_div">
			<div class="title_div">
				<span class="title_span">我的订单-物料信息-查看</span>
			</div>
			<div id="detail_wlxx_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						名称
					</td>
					<td style="width:30%;">
						<span id="mc"></span>
					</td>
					<td align="right" style="width:15%;">
						物资类型
					</td>
					<td style="width:30%;">
						<span id="wzlx"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						编辑时间
					</td>
					<td style="width:30%;">
						<span id="bjsj"></span>
					</td>
					<td align="right">
					</td>
					<td style="width:30%;">
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 查看物料信息 end -->
	
<!-- 查看发货单位 start -->
<div class="detail_fhdw_bg_div" id="detail_fhdw_bg_div">
	<div class="detail_fhdw_div" id="detail_fhdw_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailFHDWDialog(0)">X</span>
		</div>
		<div class="detail_fhdw_dialog_div" id="detail_fhdw_dialog_div">
			<div class="title_div">
				<span class="title_span">我的订单-发货单位-查看</span>
			</div>
			<div id="detail_fhdw_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						单位名称
					</td>
					<td style="width:30%;">
						<span id="dwmc"></span>
					</td>
					<td align="right" style="width:15%;">
						编辑时间
					</td>
					<td style="width:30%;">
						<span id="bjsj"></span>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 查看发货单位 end -->
	
<!-- 查看收货单位 start -->
<div class="detail_shdw_bg_div" id="detail_shdw_bg_div">
	<div class="detail_shdw_div" id="detail_shdw_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailSHDWDialog(0)">X</span>
		</div>
		<div class="detail_shdw_dialog_div" id="detail_shdw_dialog_div">
			<div class="title_div">
				<span class="title_span">我的订单-收货单位-查看</span>
			</div>
			<div id="detail_shdw_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						单位名称
					</td>
					<td style="width:30%;">
						<span id="dwmc"></span>
					</td>
					<td align="right" style="width:15%;">
						编辑时间
					</td>
					<td style="width:30%;">
						<span id="bjsj"></span>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 查看收货单位 end -->
	
<!-- 查看承运车辆 start -->
<div class="detail_cycl_bg_div" id="detail_cycl_bg_div">
	<div class="detail_cycl_div" id="detail_cycl_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailCYCLDialog(0)">X</span>
		</div>
		<div class="detail_cycl_dialog_div" id="detail_cycl_dialog_div">
			<div class="title_div">
				<span class="title_span">我的订单-承运车辆-查看</span>
			</div>
			<div id="detail_cycl_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						车牌号
					</td>
					<td style="width:30%;">
						<span id="cph"></span>
					</td>
					<td align="right" style="width:15%;">
						车主信息
					</td>
					<td style="width:30%;">
						<span id="czxx"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						皮重
					</td>
					<td>
						<span id="pz"></span>
					</td>
					<td align="right">
						车辆类型
					</td>
					<td>
						<span id="cllx"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						照片
					</td>
					<td>
						<span id="zp"></span>
					</td>
					<td align="right">
						发动机号码
					</td>
					<td>
						<span id="fdjhm"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						车辆识别代号
					</td>
					<td>
						<span id="clsbdh"></span>
					</td>
					<td align="right">
						排放阶段
					</td>
					<td>
						<span id="pfjd"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						注册日期
					</td>
					<td>
						<span id="zcrq"></span>
					</td>
					<td align="right">
						是否在用
					</td>
					<td>
						<span id="sfzy"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						车辆运输类型
					</td>
					<td>
						<span id="clyslx"></span>
					</td>
					<td align="right">
						行驶证
					</td>
					<td>
						<span id="xsz"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						随车清单
					</td>
					<td>
						<span id="scqd"></span>
					</td>
					<td align="right">
						排放阶段查询截图
					</td>
					<td>
						<span id="pfjdcxjt"></span>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 查看承运车辆 end -->

<!-- 查看承运司机 start -->
<div class="detail_cysj_bg_div" id="detail_cysj_bg_div">
	<div class="detail_cysj_div" id="detail_cysj_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailCYSJDialog(0)">X</span>
		</div>
		<div class="detail_cysj_dialog_div" id="detail_cysj_dialog_div">
			<div class="title_div">
				<span class="title_span">我的订单-承运司机-查看</span>
			</div>
			<div id="detail_cysj_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						姓名
					</td>
					<td style="width:30%;">
						<span id="xm"></span>
					</td>
					<td align="right" style="width:15%;">
						手机号
					</td>
					<td style="width:30%;">
						<span id="sjh"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						照片
					</td>
					<td>
						<span id="zp"></span>
					</td>
					<td align="right">
						身份证
					</td>
					<td>
						<span id="sfz"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						资格证有效期至
					</td>
					<td>
						<span id="zgzyxqz"></span>
					</td>
					<td align="right">
						驾证
					</td>
					<td>
						<span id="jz"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						驾证有限期至
					</td>
					<td>
						<span id="jzyxqz"></span>
					</td>
					<td align="right">
						资格证书
					</td>
					<td>
						<span id="zgzs"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						审核状态
					</td>
					<td>
						<span id="shzt"></span>
					</td>
					<td align="right">
						在用状态
					</td>
					<td>
						<span id="zyzt"></span>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 查看承运司机 end -->

<!-- 查看下单用户 start -->
<div class="detail_xdyh_bg_div" id="detail_xdyh_bg_div">
	<div class="detail_xdyh_div" id="detail_xdyh_div">
		<div class="ckst_div">
			<span class="ckst_span">查看实体</span>
			<span class="close_span" onclick="openDetailXDYHDialog(0)">X</span>
		</div>
		<div class="detail_xdyh_dialog_div" id="detail_xdyh_dialog_div">
			<div class="title_div">
				<span class="title_span">我的订单-下单用户-查看</span>
			</div>
			<div id="detail_xdyh_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						用户名
					</td>
					<td style="width:30%;">
						<span id="yhm"></span>
					</td>
					<td align="right" style="width:15%;">
						昵称
					</td>
					<td style="width:30%;">
						<span id="nc"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						头像
					</td>
					<td>
						<span id="tx"></span>
					</td>
					<td align="right">
						实名
					</td>
					<td>
						<span id="sm"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						状态
					</td>
					<td>
						<span id="zt"></span>
					</td>
					<td align="right">
						原始密码
					</td>
					<td>
						<span id="ysmm"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						简述
					</td>
					<td>
						<span id="js"></span>
					</td>
					<td align="right">
						
					</td>
					<td>
						
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 查看下单用户end -->

<!-- 查看司机用户 start -->
<div class="detail_sjyh_bg_div" id="detail_sjyh_bg_div">
	<div class="detail_sjyh_div" id="detail_sjyh_div">
		<div class="ckst_div">
			<span class="ckst_span">查看实体</span>
			<span class="close_span" onclick="openDetailSJYHDialog(0)">X</span>
		</div>
		<div class="detail_sjyh_dialog_div" id="detail_sjyh_dialog_div">
			<div class="title_div">
				<span class="title_span">我的订单-司机用户-查看</span>
			</div>
			<div id="detail_sjyh_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						用户名
					</td>
					<td style="width:30%;">
						<span id="yhm"></span>
					</td>
					<td align="right" style="width:15%;">
						昵称
					</td>
					<td style="width:30%;">
						<span id="nc"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						头像
					</td>
					<td>
						<span id="tx"></span>
					</td>
					<td align="right">
						实名
					</td>
					<td>
						<span id="sm"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						状态
					</td>
					<td>
						<span id="zt"></span>
					</td>
					<td align="right">
						原始密码
					</td>
					<td>
						<span id="ysmm"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						简述
					</td>
					<td>
						<span id="js"></span>
					</td>
					<td align="right">
						
					</td>
					<td>
						
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 查看司机用户end -->
	
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">我的订单-详情</div>
	
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.wddd.wybm }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<span>${requestScope.wddd.ddh }</span>
			</td>
			<td align="right" style="width:15%;">
				预装卸重量
			</td>
			<td style="width:30%;">
				<span>${requestScope.wddd.yzxzl }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				流向类型
			</td>
			<td>
				<span>
				<c:if test="${requestScope.wddd.lxlx eq 1 }">
					送运
				</c:if>
				<c:if test="${requestScope.wddd.lxlx eq 2 }">
					取运
				</c:if>
				</span>
			</td>
			<td align="right">
				编辑时间
			</td>
			<td>
				<span>${requestScope.wddd.bjsj }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				二维码
			</td>
			<td>
				<span>${requestScope.wddd.ewm }</span>
			</td>
			<td align="right">
				实际重量
			</td>
			<td>
				<span>${requestScope.wddd.sjzl }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				重量差额比
			</td>
			<td>
				<span>${requestScope.wddd.zlceb }</span>
			</td>
			<td align="right">
				订单状态
			</td>
			<td>
				<span>${requestScope.wddd.ddztmc }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				包数
			</td>
			<td>
				<span>${requestScope.bd.bs }</span>
			</td>
			<td align="right">
				块数
			</td>
			<td>
				<span>${requestScope.bd.ks }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				毛重
			</td>
			<td>
				<span></span>
			</td>
			<td align="right">
				皮重
			</td>
			<td>
				<span></span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				对方过磅净重
			</td>
			<td>
				<span>${requestScope.bd.dfgbjz }</span>
			</td>
			<td align="right">
				对方过磅毛重
			</td>
			<td>
				<span>${requestScope.bd.dfgbmz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				对方榜单照片
			</td>
			<td>
				<span>${requestScope.bd.dfbdzp }</span>
			</td>
			<td align="right">
				对方过磅皮重
			</td>
			<td>
				<span>${requestScope.bd.dfgbpz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				备注
			</td>
			<td>
				<span>${requestScope.wddd.bz }</span>
			</td>
			<td align="right">
				
			</td>
			<td>
				<span></span>
			</td>
		  </tr>
		</table>
	</div>
	
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
	
	<div id="xdyh_div">
		<table id="xdyh_tab"></table>
	</div>
	
	<div id="sjyh_div">
		<table id="sjyh_tab"></table>
	</div>
</div>
</body>
</html>