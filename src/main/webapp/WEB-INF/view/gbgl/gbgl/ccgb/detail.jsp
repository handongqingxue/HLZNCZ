<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<style type="text/css">
.center_con_div{
	width: 83%;
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

.detail_glddmz_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_glddmz_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_glddmz_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_glddmz_div .xgst_span{
	margin-left: 30px;
}
.detail_glddmz_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_glddmz_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_glddmz_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_glddmz_div .title_span{
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

var glddpzdNum=2;
var dglddpzjbsxzdNum=3;

var glddmzdNum=4;
var dglddmzjbsxzdNum=5;

$(function(){
	initDetailDialog();//0
	
	initGLDDPZDialog();//2.关联订单皮重窗口
	initDetailGLDDPZJBSXZDialog();//3.查看关联订单皮重窗口

	initGLDDMZDialog();//4.关联订单毛重窗口
	initDetailGLDDMZJBSXZDialog();//5.查看关联订单毛重窗口

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
	var glddpzdpw=$("body").find(".panel.window").eq(glddpzdNum);
	var glddpzdws=$("body").find(".window-shadow").eq(glddpzdNum);

	//查看关联订单皮重
	var dglddpzjbsxzdpw=$("body").find(".panel.window").eq(dglddpzjbsxzdNum);
	var dglddpzjbsxzdws=$("body").find(".window-shadow").eq(dglddpzjbsxzdNum);

	//关联订单毛重
	var glddmzdpw=$("body").find(".panel.window").eq(glddmzdNum);
	var glddmzdws=$("body").find(".window-shadow").eq(glddmzdNum);

	//查看关联订单毛重
	var dglddmzjbsxzdpw=$("body").find(".panel.window").eq(dglddmzjbsxzdNum);
	var dglddmzjbsxzdws=$("body").find(".window-shadow").eq(dglddmzjbsxzdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);
	
	ccDiv.append(glddpzdpw);
	ccDiv.append(glddpzdws);

	ccDiv.append(glddmzdpw);
	ccDiv.append(glddmzdws);

	var dgbcldDiv=$("#detail_gbcl_dialog_div");
	dgbcldDiv.append(dgbcljbsxzdpw);
	dgbcldDiv.append(dgbcljbsxzdws);

	var dglddpzdDiv=$("#detail_glddpz_dialog_div");
	dglddpzdDiv.append(dglddpzjbsxzdpw);
	dglddpzdDiv.append(dglddpzjbsxzdws);

	var dglddmzdDiv=$("#detail_glddmz_dialog_div");
	dglddmzdDiv.append(dglddmzjbsxzdpw);
	dglddmzdDiv.append(dglddmzjbsxzdws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("#center_con_div","detail_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft
	});

	$("#detail_div table").css("width",(setFitWidthInParent("#center_con_div","detail_div_table"))+"px");
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

function initGLDDPZDialog(){
	dialogTop+=340;//230
	glddpzDialog=$("#glddpz_div").dialog({
		title:"关联订单皮重",
		width:setFitWidthInParent("#center_con_div","glddpz_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(glddpzdNum).css("width",(setFitWidthInParent("#center_con_div","panel_window"))+"px");
	$(".panel.window").eq(glddpzdNum).css("margin-top","20px");
	//$(".panel.window").eq(glddpzdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(glddpzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(glddpzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(glddpzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(glddpzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(glddpzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(glddpzdNum).css("width","1000px");
	$(".window-shadow").eq(glddpzdNum).css("margin-top","20px");
	//$(".window-shadow").eq(glddpzdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(glddpzdNum).css("border-color","#ddd");

	initGLDDPZTab();
}

function initGLDDPZTab(){
	glddpzTab=$("#glddpz_tab").datagrid({
		width:setFitWidthInParent("#center_con_div","glddpz_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="关联订单皮重";
					break;
				}
				return str;
			}},
            {field:"ddh",title:"订单号",width:200,align:"center"},
            {field:"sjzl",title:"实际重量",width:150,align:"center"},
            {field:"zlceb",title:"重量差额比",width:150,align:"center"},
            {field:"lxlx",title:"流向类型",width:100,align:"center",formatter:function(value,row){
            	var str;
				switch (value) {
				case "1":
					str="送运";
					break;
				case "2":
					str="取运";
					break;
				}
				return str;
            }},
            {field:"yzxzl",title:"预装卸重量",width:150,align:"center"},
            {field:"ddzt",title:"订单状态",width:100,align:"center"},
			{field:"wybm",title:"操作",width:80,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showGLDDPZDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:8});
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
	if('${requestScope.pzdd}'==""){
		rows=[];
	}
	else{
		var ddh='${requestScope.pzdd.ddh}';
		var sjzl='${requestScope.pzdd.sjzl}';
		var zlceb='${requestScope.pzdd.zlceb}';
		var lxlx='${requestScope.pzdd.lxlx}';
		var yzxzl='${requestScope.pzdd.yzxzl}';
		var ddztmc='${requestScope.pzdd.ddztmc}';
		var wybm='${requestScope.pzdd.wybm}';
		rows=[{gx:"1",ddh:ddh,sjzl:sjzl,zlceb:zlceb,lxlx:lxlx,yzxzl:yzxzl,ddzt:ddztmc,wybm:wybm}];
	}
	loadGLDDPZTabData(rows);
}

function initDetailGLDDPZJBSXZDialog(){
	detailGLDDPZDialog=$("#detail_glddpz_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_glddpz_div","detail_glddpz_jbsxz_dialog_div"),
		height:350,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailGLDDPZDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailGLDDPZDialog(0);
           }}
        ]
	});

	$("#detail_glddpz_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_glddpz_div","detail_glddpz_jbsxz_dialog_div"))+"px");
	$("#detail_glddpz_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_glddpz_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_glddpz_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_glddpz_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_glddpz_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dglddpzjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dglddpzjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dglddpzjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dglddpzjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dglddpzjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_glddpz_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_glddpz_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_glddpz_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_glddpz_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailGLDDPZDialog(0);
}

function initGLDDMZDialog(){
	dialogTop+=240;//230
	glddmzDialog=$("#glddmz_div").dialog({
		title:"关联订单毛重",
		width:setFitWidthInParent("#center_con_div","glddmz_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(glddmzdNum).css("width",(setFitWidthInParent("#center_con_div","panel_window"))+"px");
	$(".panel.window").eq(glddmzdNum).css("margin-top","20px");
	//$(".panel.window").eq(glddmzdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(glddmzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(glddmzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(glddmzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(glddmzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(glddmzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(glddmzdNum).css("width","1000px");
	$(".window-shadow").eq(glddmzdNum).css("margin-top","20px");
	//$(".window-shadow").eq(glddmzdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(glddmzdNum).css("border-color","#ddd");

	initGLDDMZTab();
}

function initGLDDMZTab(){
	glddmzTab=$("#glddmz_tab").datagrid({
		width:setFitWidthInParent("#center_con_div","glddmz_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="关联订单毛重";
					break;
				}
				return str;
			}},
            {field:"ddh",title:"订单号",width:200,align:"center"},
            {field:"sjzl",title:"实际重量",width:150,align:"center"},
            {field:"zlceb",title:"重量差额比",width:150,align:"center"},
            {field:"lxlx",title:"流向类型",width:100,align:"center",formatter:function(value,row){
            	var str;
				switch (value) {
				case "1":
					str="送运";
					break;
				case "2":
					str="取运";
					break;
				}
				return str;
            }},
            {field:"yzxzl",title:"预装卸重量",width:150,align:"center"},
            {field:"ddzt",title:"订单状态",width:100,align:"center"},
			{field:"wybm",title:"操作",width:80,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showGLDDMZDetail()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:8});
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
	if('${requestScope.mzdd}'==""){
		rows=[];
	}
	else{
		var ddh='${requestScope.mzdd.ddh}';
		var sjzl='${requestScope.mzdd.sjzl}';
		var zlceb='${requestScope.mzdd.zlceb}';
		var lxlx='${requestScope.mzdd.lxlx}';
		var yzxzl='${requestScope.mzdd.yzxzl}';
		var ddztmc='${requestScope.mzdd.ddztmc}';
		var wybm='${requestScope.mzdd.wybm}';
		rows=[{gx:"1",ddh:ddh,sjzl:sjzl,zlceb:zlceb,lxlx:lxlx,yzxzl:yzxzl,ddzt:ddztmc,wybm:wybm}];
	}
	loadGLDDMZTabData(rows);
}

function initDetailGLDDMZJBSXZDialog(){
	detailGLDDMZDialog=$("#detail_glddmz_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_glddmz_div","detail_glddmz_jbsxz_dialog_div"),
		height:350,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailGLDDMZDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailGLDDMZDialog(0);
           }}
        ]
	});

	$("#detail_glddmz_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_glddmz_div","detail_glddmz_jbsxz_dialog_div"))+"px");
	$("#detail_glddmz_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_glddmz_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_glddmz_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_glddmz_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_glddmz_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dglddmzjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dglddmzjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dglddmzjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dglddmzjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dglddmzjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_glddmz_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_glddmz_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_glddmz_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_glddmz_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailGLDDMZDialog(0);
}

function loadGLDDPZTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	glddpzTab.datagrid('loadData',obj);
}

function loadGLDDMZTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	glddmzTab.datagrid('loadData',obj);
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

function openDetailGLDDPZDialog(flag){
	if(flag==1){
		$("#detail_glddpz_bg_div").css("display","block");
		$("#detail_glddpz_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_glddpz_bg_div").css("display","none");
		$("#detail_glddpz_bg_div").css("z-index","9016");
	}
	openDetailGLDDPZJBSXZDialog(flag);
}

function openDetailGLDDPZJBSXZDialog(flag){
	if(flag==1){
		detailGLDDPZDialog.dialog("open");
	}
	else{
		detailGLDDPZDialog.dialog("close");
	}
}

function openDetailGLDDMZDialog(flag){
	if(flag==1){
		$("#detail_glddmz_bg_div").css("display","block");
		$("#detail_glddmz_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_glddmz_bg_div").css("display","none");
		$("#detail_glddmz_bg_div").css("z-index","9016");
	}
	openDetailGLDDMZJBSXZDialog(flag);
}

function openDetailGLDDMZJBSXZDialog(flag){
	if(flag==1){
		detailGLDDMZDialog.dialog("open");
	}
	else{
		detailGLDDMZDialog.dialog("close");
	}
}

function showGLDDPZDetail(){
	var row=glddpzTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要查看的信息！","warning");
		return false;
	}
	$("#detail_glddpz_div #id").val(row.id);
	$("#detail_glddpz_div #ddh").text(row.ddh);
	$("#detail_glddpz_div #yzxzl").text(row.yzxzl);
	var lxlxStr;
	switch (row.lxlx) {
		case "1":
			lxlxStr="送运";
			break;
		case "2":
			lxlxStr="取运";
			break;
	}
	$("#detail_glddpz_div #lxlx").text(lxlxStr);
	$("#detail_glddpz_div #bjsj").text(row.bjsj);
	$("#detail_glddpz_div #ewm").text(row.ewm);
	$("#detail_glddpz_div #sjzl").text(row.sjzl);
	$("#detail_glddpz_div #zlceb").text(row.zlceb);
	$("#detail_glddpz_div #bz").text(row.bz);
	openDetailGLDDPZDialog(1);
}

function showGLDDMZDetail(){
	var row=glddmzTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要查看的信息！","warning");
		return false;
	}
	$("#detail_glddmz_div #id").val(row.id);
	$("#detail_glddmz_div #ddh").text(row.ddh);
	$("#detail_glddmz_div #yzxzl").text(row.yzxzl);
	var lxlxStr;
	switch (row.lxlx) {
		case "1":
			lxlxStr="送运";
			break;
		case "2":
			lxlxStr="取运";
			break;
	}
	$("#detail_glddmz_div #lxlx").text(lxlxStr);
	$("#detail_glddmz_div #bjsj").text(row.bjsj);
	$("#detail_glddmz_div #ewm").text(row.ewm);
	$("#detail_glddmz_div #sjzl").text(row.sjzl);
	$("#detail_glddmz_div #zlceb").text(row.zlceb);
	$("#detail_glddmz_div #bz").text(row.bz);
	openDetailGLDDMZDialog(1);
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "detail_div":
		space=85;
		break;
	case "detail_div_table":
		space=100;
		break;
	case "detail_glddpz_div":
	case "detail_glddmz_div":
		space=340;
		break;
	case "glddpz_div":
	case "glddmz_div":
		space=50;
		break;
	case "glddpz_tab":
	case "glddmz_tab":
		space=435;
		break;
	case "panel_window":
		space=100;
		break;
	case "detail_gbcl_jbsxz_dialog_div":
	case "detail_glddpz_jbsxz_dialog_div":
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
				<span class="title_span">出厂过磅-过磅车辆-查看</span>
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
						品牌型号
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.ppxh }</span>
					</td>
					<td align="right" style="width:15%;">
						车主信息
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.czxx }</span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						发证日期
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.fzrq }</span>
					</td>
					<td align="right" style="width:15%;">
						皮重
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.pz }</span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						车辆类型
					</td>
					<td style="width:30%;">
						<span>
							<c:if test="${requestScope.gbcl.cllx eq 1 }">
								重型
							</c:if>
						</span>
					</td>
					<td align="right" style="width:15%;">
						照片
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.zp }</span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						行驶证
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.xsz }</span>
					</td>
					<td align="right" style="width:15%;">
						随车清单
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.scqd }</span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						排放阶段查询截图
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.pfjdcxjt }</span>
					</td>
					<td align="right" style="width:15%;">
						是否在用
					</td>
					<td style="width:30%;">
						<span>
							<c:choose>
								<c:when test="${requestScope.gbcl.sfzy }">
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
						信息状态
					</td>
					<td style="width:30%;">
						<span>
							<c:if test="${requestScope.gbcl.shzt eq 1 }">
								待审核
							</c:if>
							<c:if test="${requestScope.gbcl.shzt eq 2 }">
								审核通过
							</c:if>
							<c:if test="${requestScope.gbcl.shzt eq 3 }">
								编辑中
							</c:if>
						</span>
					</td>
					<td align="right" style="width:15%;">
						备注
					</td>
					<td style="width:30%;">
						<span>${requestScope.gbcl.bz }</span>
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
				<span class="title_span">出厂过磅-关联订单皮重-查看</span>
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

<!-- 查看关联订单毛重 start -->
<div class="detail_glddmz_bg_div" id="detail_glddmz_bg_div">
	<div class="detail_glddmz_div" id="detail_glddmz_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailGLDDMZDialog(0)">X</span>
		</div>
		<div class="detail_glddmz_dialog_div" id="detail_glddmz_dialog_div">
			<div class="title_div">
				<span class="title_span">出厂过磅-关联订单毛重-查看</span>
			</div>
			<div id="detail_glddmz_jbsxz_dialog_div">
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
<!--查看关联订单毛重 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">出厂过磅-详情</div>

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
		<table id="glddpz_tab"></table>
	</div>
	
	<div id="glddmz_div">
		<table id="glddmz_tab"></table>
	</div>

</div>
</body>
</html>