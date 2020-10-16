<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<style type="text/css">
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
$(function(){
	initDetailDialog();

	initYSSDialog();//1.运输商窗口
	initDetailYSSJBSXZDialog();//2.运输商详情窗口
	
	initWLXXDialog();//3.物料信息窗口
	initDetailWLXXJBSXZDialog();//4.物料信息详情窗口

	initFHDWDialog();//5.发货单位窗口
	initDetailFHDWJBSXZDialog();//6.发货单位详情窗口
	
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

	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);

	ccDiv.append(yssdpw);
	ccDiv.append(yssdws);

	ccDiv.append(wlxxdpw);
	ccDiv.append(wlxxdws);

	ccDiv.append(fhdwdpw);
	ccDiv.append(fhdwdws);

	var dyssdDiv=$("#detail_yss_dialog_div");
	dyssdDiv.append(dyssjbsxdpw);
	dyssdDiv.append(dyssjbsxdws);

	var dwlxxdDiv=$("#detail_wlxx_dialog_div");
	dwlxxdDiv.append(dwlxxjbsxdpw);
	dwlxxdDiv.append(dwlxxjbsxdws);

	var dfhdwdDiv=$("#detail_fhdw_dialog_div");
	dfhdwdDiv.append(dfhdwjbsxdpw);
	dfhdwdDiv.append(dfhdwjbsxdws);
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

function initYSSDialog(){
	dialogTop+=220;//230
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

function loadWLXXTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	wlxxTab.datagrid('loadData',obj);
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
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dwlxxjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_wlxx_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_wlxx_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_wlxx_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_wlxx_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailWLXXDialog(0);
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
				<span class="title_span">综合管理-运输商-查看</span>
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
				<span class="title_span">综合管理-物料信息-查看</span>
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
				<span class="title_span">综合管理-发货单位-查看</span>
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
	
	<div id="yss_div">
		<table id="yss_tab"></table>
	</div>
	
	<div id="wlxx_div">
		<table id="wlxx_tab"></table>
	</div>
	
	<div id="fhdw_div">
		<table id="fhdw_tab"></table>
	</div>
	
	<!-- 
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