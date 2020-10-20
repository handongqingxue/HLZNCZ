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

.detail_yswl_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_yswl_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_yswl_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_yswl_div .xgst_span{
	margin-left: 30px;
}
.detail_yswl_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_yswl_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_yswl_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_yswl_div .title_span{
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
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var tbxxdNum=0;
var ddNum=1;
var yssdNum=2;
var dyssjbsxzdNum=3;
var yswldNum=4;
var dyswljbsxzdNum=5;
var fhdwdNum=6;
var dfhdwjbsxzdNum=7;
var shdwdNum=8;
var dshdwjbsxzdNum=9;
var cycldNum=10;
var dcycljbsxzdNum=11;
var cysjdNum=12;
var dcysjjbsxzdNum=13;
$(function(){
	initTBXXDialog();//0
	initDetailDialog();//1
	
	initYSSDialog();//2.运输商窗口
	initDetailYSSJBSXZDialog();//3.运输商详情窗口

	initYSWLDialog();//4.运输物料
	initDetailYSWLJBSXZDialog();//5.运输物料详情窗口
	
	initFHDWDialog();//6.发货单位窗口
	initDetailFHDWJBSXZDialog();//7.发货单位详情窗口

	initSHDWDialog();//8.收货单位窗口
	initDetailSHDWJBSXZDialog();//9.收货单位详情窗口

	initCYCLDialog();//10.承运车辆窗口
	initDetailCYCLJBSXZDialog();//11.承运车辆详情窗口

	initCYSJDialog();//12.承运司机窗口
	initDetailCYSJJBSXZDialog();//13.承运司机详情窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//填报信息
	var tbxxdpw=$("body").find(".panel.window").eq(tbxxdNum);
	var tbxxdws=$("body").find(".window-shadow").eq(tbxxdNum);

	//新字段组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	//运输商
	var yssdpw=$("body").find(".panel.window").eq(yssdNum);
	var yssdws=$("body").find(".window-shadow").eq(yssdNum);

	//查看运输商
	var dyssjbsxdpw=$("body").find(".panel.window").eq(dyssjbsxzdNum);
	var dyssjbsxdws=$("body").find(".window-shadow").eq(dyssjbsxzdNum);

	//运输物料
	var yswldpw=$("body").find(".panel.window").eq(yswldNum);
	var yswldws=$("body").find(".window-shadow").eq(yswldNum);

	//查看运输物料
	var dyswljbsxdpw=$("body").find(".panel.window").eq(dyswljbsxzdNum);
	var dyswljbsxdws=$("body").find(".window-shadow").eq(dyswljbsxzdNum);

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

	var ccDiv=$("#center_con_div");
	ccDiv.append(tbxxdpw);
	ccDiv.append(tbxxdws);
	
	ccDiv.append(ddpw);
	ccDiv.append(ddws);

	ccDiv.append(yssdpw);
	ccDiv.append(yssdws);

	ccDiv.append(yswldpw);
	ccDiv.append(yswldws);

	ccDiv.append(fhdwdpw);
	ccDiv.append(fhdwdws);

	ccDiv.append(shdwdpw);
	ccDiv.append(shdwdws);

	ccDiv.append(cycldpw);
	ccDiv.append(cycldws);

	ccDiv.append(cysjdpw);
	ccDiv.append(cysjdws);

	var dyssdDiv=$("#detail_yss_dialog_div");
	dyssdDiv.append(dyssjbsxdpw);
	dyssdDiv.append(dyssjbsxdws);

	var dyswldDiv=$("#detail_yswl_dialog_div");
	dyswldDiv.append(dyswljbsxdpw);
	dyswldDiv.append(dyswljbsxdws);

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
}

function initTBXXDialog(){
	dialogTop+=20;
	$("#tbxx_div").dialog({
		title:"填报信息",
		width:setFitWidthInParent("body","tbxx_div"),
		height:160,
		top:dialogTop,
		left:dialogLeft
	});

	$("#tbxx_div table").css("width",(setFitWidthInParent("body","tbxx_div_table"))+"px");
	$("#tbxx_div table").css("magin","-100px");
	$("#tbxx_div table td").css("padding-left","50px");
	$("#tbxx_div table td").css("padding-right","20px");
	$("#tbxx_div table td").css("font-size","15px");
	$("#tbxx_div table tr").eq(0).css("height","100px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").eq(tbxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(tbxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(tbxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(tbxxdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");
}

function initDetailDialog(){
	dialogTop+=190;
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:325,
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
	$(".window,.window .window-body").css("border-color","#ddd");
}

function initYSSDialog(){
	dialogTop+=350;//230
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
	$(".panel.window").eq(yssdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(yssdNum).css("color","#000");
	$(".panel.window .panel-title").eq(yssdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(yssdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(yssdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(yssdNum).css("width","1000px");
	$(".window-shadow").eq(yssdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(yssdNum).css("border-color","#ddd");

	initYSSTab();
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

function loadYSSTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	yssTab.datagrid('loadData',obj);
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
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dyssjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_yss_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_yss_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_yss_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_yss_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailYSSDialog(0);
}

function initYSWLDialog(){
	dialogTop+=230;//230
	yswlDialog=$("#yswl_div").dialog({
		title:"运输物料",
		width:setFitWidthInParent("body","yswl_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(yswldNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(yswldNum).css("margin-top","20px");
	$(".panel.window").eq(yswldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(yswldNum).css("color","#000");
	$(".panel.window .panel-title").eq(yswldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(yswldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(yswldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(yswldNum).css("width","1000px");
	$(".window-shadow").eq(yswldNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(yswldNum).css("border-color","#ddd");

	initYSWLTab();
}

function initYSWLTab(){
	yswlTab=$("#yswl_tab").datagrid({
		width:setFitWidthInParent("body","yswl_tab"),
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
            	var str="<a onclick=\"showYSWLDetail()\">查看</a>";
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
	if('${requestScope.yswl}'==""){
		rows=[];
	}
	else{
		var mc='${requestScope.yswl.mc}';
		var bjsj='${requestScope.yswl.bjsj}';
		var id='${requestScope.yswl.id}';
		rows=[{gx:"1",mc:mc,bjsj:bjsj,id:id}];
	}
	loadYSWLTabData(rows);
}

function loadYSWLTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	yswlTab.datagrid('loadData',obj);
}

function initDetailYSWLJBSXZDialog(){
	detailYSWLDialog=$("#detail_yswl_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_yswl_div","detail_yswl_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailYSWLDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailYSWLDialog(0);
           }}
        ]
	});

	$("#detail_yswl_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_yswl_div","detail_yswl_jbsxz_dialog_div"))+"px");
	$("#detail_yswl_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_yswl_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_yswl_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_yswl_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_yswl_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dyswljbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dyswljbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dyswljbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dyswljbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dyswljbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_yswl_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_yswl_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_yswl_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_yswl_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailYSWLDialog(0);
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
	$(".panel.window").eq(fhdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(fhdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(fhdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(fhdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(fhdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(fhdwdNum).css("width","1000px");
	$(".window-shadow").eq(fhdwdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(fhdwdNum).css("border-color","#ddd");

	initFHDWTab();
}

function initFHDWTab(){
	fhdwTab=$("#fhdw_tab").datagrid({
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

function loadFHDWTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	fhdwTab.datagrid('loadData',obj);
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
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dfhdwjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_fhdw_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_fhdw_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_fhdw_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_fhdw_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailFHDWDialog(0);
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
	$(".panel.window").eq(shdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(shdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(shdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(shdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(shdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(shdwdNum).css("width","1000px");
	$(".window-shadow").eq(shdwdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(shdwdNum).css("border-color","#ddd");

	initSHDWTab();
}

function initSHDWTab(){
	shdwTab=$("#shdw_tab").datagrid({
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

function loadSHDWTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	shdwTab.datagrid('loadData',obj);
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
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dshdwjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_shdw_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_shdw_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_shdw_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_shdw_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSHDWDialog(0);
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
	$(".panel.window").eq(cycldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(cycldNum).css("color","#000");
	$(".panel.window .panel-title").eq(cycldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(cycldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(cycldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(cycldNum).css("width","1000px");
	$(".window-shadow").eq(cycldNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(cycldNum).css("border-color","#ddd");

	initCYCLTab();
}

function initCYCLTab(){
	cyclTab=$("#cycl_tab").datagrid({
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

function loadCYCLTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	cyclTab.datagrid('loadData',obj);
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
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dcycljbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_cycl_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_cycl_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_cycl_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_cycl_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailCYCLDialog(0);
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
	$(".panel.window").eq(cysjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(cysjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(cysjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(cysjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(cysjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(cysjdNum).css("width","1000px");
	$(".window-shadow").eq(cysjdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(cysjdNum).css("border-color","#ddd");

	initCYSJTab();
}

function initCYSJTab(){
	cysjTab=$("#cysj_tab").datagrid({
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

function loadCYSJTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	cysjTab.datagrid('loadData',obj);
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
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dcysjjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_cysj_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_cysj_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_cysj_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_cysj_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailCYSJDialog(0);
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

function openDetailYSWLDialog(flag){
	if(flag==1){
		$("#detail_yswl_bg_div").css("display","block");
		$("#detail_yswl_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_yswl_bg_div").css("display","none");
		$("#detail_yswl_bg_div").css("z-index","9016");
	}
	openDetailYSWLJBSXZDialog(flag);
}

function openDetailYSWLJBSXZDialog(flag){
	if(flag==1){
		detailYSWLDialog.dialog("open");
	}
	else{
		detailYSWLDialog.dialog("close");
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

function showYSWLDetail(){
	var row=yswlTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_yswl_div #id").val(row.id);
	$("#detail_yswl_div #mc").text(row.mc);
	$("#detail_yswl_div #bjsj").text(row.bjsj);
	openDetailYSWLDialog(1);
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

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "tbxx_div":
	case "detail_div":
	case "sssj_div":
	case "ssdl_div":
	case "select_sssj_tab":
	case "wlxx_div":
	case "select_wlxx_tab":
	case "detail_wlxx_div":
	case "fhdw_div":
	case "select_fhdw_tab":
	case "detail_fhdw_div":
	case "shdw_div":
	case "select_shdw_tab":
	case "detail_shdw_div":
	case "cycl_div":
	case "select_cycl_tab":
		space=340;
		break;
	case "tbxx_div_table":
	case "edit_div_table":
	case "panel_window":
	case "sssj_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "select_yss_dialog_div":
	case "detail_yss_jbsxz_dialog_div":
	case "select_yswl_dialog_div":
	case "detail_yswl_jbsxz_dialog_div":
	case "select_fhdw_dialog_div":
	case "detail_fhdw_jbsxz_dialog_div":
	case "select_shdw_dialog_div":
	case "detail_shdw_jbsxz_dialog_div":
	case "select_cycl_dialog_div":
	case "detail_cycl_jbsxz_dialog_div":
	case "select_cysj_dialog_div":
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

<!-- 查看运输商 start -->
<div class="detail_yss_bg_div" id="detail_yss_bg_div">
	<div class="detail_yss_div" id="detail_yss_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailYSSDialog(0)">X</span>
		</div>
		<div class="detail_yss_dialog_div" id="detail_yss_dialog_div">
			<div class="title_div">
				<span class="title_span">订单填报-运输商-查看</span>
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

<!-- 查看运输物料 start -->
<div class="detail_yswl_bg_div" id="detail_yswl_bg_div">
	<div class="detail_yswl_div" id="detail_yswl_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailYSWLDialog(0)">X</span>
		</div>
		<div class="detail_yswl_dialog_div" id="detail_yswl_dialog_div">
			<div class="title_div">
				<span class="title_span">订单填报-运输物料-查看</span>
			</div>
			<div id="detail_yswl_jbsxz_dialog_div">
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
<!--查看运输物料 end -->
	
<!-- 查看发货单位 start -->
<div class="detail_fhdw_bg_div" id="detail_fhdw_bg_div">
	<div class="detail_fhdw_div" id="detail_fhdw_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailFHDWDialog(0)">X</span>
		</div>
		<div class="detail_fhdw_dialog_div" id="detail_fhdw_dialog_div">
			<div class="title_div">
				<span class="title_span">订单填报-发货单位-查看</span>
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
				<span class="title_span">订单填报-收货单位-查看</span>
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
				<span class="title_span">订单填报-承运车辆-查看</span>
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
				<span class="title_span">订单填报-承运司机-查看</span>
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

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">订单填报-修改</div>
	
	<div id="tbxx_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				实际重量
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.sjzl }</span>
			</td>
			<td align="right" style="width:15%;">
				备注
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.bz }</span>
			</td>
		  </tr>
		</table>
	</div>
	
	<!-- 基本信息 start -->
	<div id="detail_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车牌号
			</td>
			<td style="width:30%;">
				<span>${requestScope.cycl.cph }</span>
			</td>
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.ddh }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				预装卸重量
			</td>
			<td>
				<span>${requestScope.dd.yzxzl }</span>
			</td>
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
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				编辑时间
			</td>
			<td>
				<span>${requestScope.dd.bjsj }</span>
			</td>
			<td align="right">
				二维码
			</td>
			<td>
				<span>${requestScope.dd.ewm }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				实际重量
			</td>
			<td>
				<span>${requestScope.dd.sjzl }</span>
			</td>
			<td align="right">
				重量差额比
			</td>
			<td>
				<span>${requestScope.dd.zlceb }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				订单状态
			</td>
			<td>
				<span>${requestScope.dd.ddztmc }</span>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</div>
	<!-- 基本信息 end -->
	
	<div id="yss_div">
		<table id="yss_tab"></table>
	</div>
	
	<div id="yswl_div">
		<table id="yswl_tab"></table>
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
</div>
</body>
</html>