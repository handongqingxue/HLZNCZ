<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var ddNum=0;
var yssdNum=1;
var dyssdNum=2;
var wlxxdNum=3;
var dwlxxdNum=4;
var fhdwdNum=5;
var dfhdwdNum=6;
var shdwdNum=7;
var dshdwdNum=8;
var cycldNum=9;
var dcycldNum=10;
var cysjdNum=11;
var dcysjdNum=12;
$(function(){
	initDetailDialog();
	
	initYSSDialog();//1.运输商窗口
	initDetailYSSDialog();//2.运输商详情窗口
	
	initWLXXDialog();//3.物料信息窗口
	initDetailWLXXDialog();//4.物料信息详情窗口
	
	initFHDWDialog();//5.发货单位窗口
	initDetailFHDWDialog();//6.发货单位详情窗口

	initSHDWDialog();//7.收货单位窗口
	initDetailSHDWDialog();//8.发货单位详情窗口
	
	initCYCLDialog();//9.承运车辆窗口
	initDetailCYCLDialog();//10.承运车辆详情窗口
	
	initCYSJDialog();//11.承运司机窗口
	initDetailCYSJDialog();//12.承运司机详情窗口
});

function initDetailDialog(){
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:200,
		top:60,
		left:308
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
	yssDialog=$("#yss_div").dialog({
		title:"运输商",
		width:setFitWidthInParent("body","yss_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:300,
		left:308
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
	wlxxDialog=$("#wlxx_div").dialog({
		title:"物料信息",
		width:setFitWidthInParent("body","wlxx_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:650,
		left:308
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
	fhdwDialog=$("#fhdw_div").dialog({
		title:"发货单位",
		width:setFitWidthInParent("body","fhdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:1000,
		left:308
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
	shdwDialog=$("#shdw_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("body","shdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:1350,
		left:308
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
	cyclDialog=$("#cycl_div").dialog({
		title:"承运车辆",
		width:setFitWidthInParent("body","cycl_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:1700,
		left:308
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
	cysjDialog=$("#cysj_div").dialog({
		title:"承运司机",
		width:setFitWidthInParent("body","cysj_div"),
		height:300,
		top:2050,
		left:308
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
		var cllx='${requestScope.cycl.cllx}';
		var zp='${requestScope.cycl.zp}';
		var fdjhm='${requestScope.cycl.fdjhm}';
		var clsbdh='${requestScope.cycl.clsbdh}';
		var pfjd='${requestScope.cycl.pfjd}';
		var zcrq='${requestScope.cycl.zcrq}';
		var sfzy='${requestScope.cycl.sfzy}';
		var clyslx='${requestScope.cycl.clyslx}';
		var xsz='${requestScope.cycl.xsz}';
		var scqd='${requestScope.cycl.scqd}';
		var pfjdcxjt='${requestScope.cycl.pfjdcxjt}';
		var id='${requestScope.cycl.id}';
		rows=[{gx:"1",cph:cph,czxx:czxx,pz:pz,cllx:cllx,zp:zp,fdjhm:fdjhm,clsbdh:clsbdh,
			pfjd:pfjd,zcrq:zcrq,sfzy:sfzy,clyslx:clyslx,xsz:xsz,scqd:scqd,pfjdcxjt:pfjdcxjt,id:id}];
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

function initDetailYSSDialog(){
	detailYSSDialog=$("#detail_yss_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_yss_div"),
		height:231,
		top:160,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailYSSDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailYSSDialog(0);
           }}
        ]
	});

	$("#detail_yss_div table").css("width",(setFitWidthInParent("body","detail_yss_div"))+"px");
	$("#detail_yss_div table").css("magin","-100px");
	$("#detail_yss_div table td").css("padding-left","50px");
	$("#detail_yss_div table td").css("padding-right","20px");
	$("#detail_yss_div table td").css("font-size","15px");
	$("#detail_yss_div table tr").css("height","45px");

	$(".panel.window").eq(dyssdNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(dyssdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dyssdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dyssdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dyssdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dyssdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(dyssdNum).css("border-color","#ddd");

	$("#detail_yss_div #cancel_but").css("left","30%");
	$("#detail_yss_div #cancel_but").css("position","absolute");

	$("#detail_yss_div #ok_but").css("left","45%");
	$("#detail_yss_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailYSSDialog(0);
}

function initDetailWLXXDialog(){
	detailWLXXDialog=$("#detail_wlxx_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_wlxx_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailWLXXDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailWLXXDialog(0);
           }}
        ]
	});

	$("#detail_wlxx_div table").css("width",(setFitWidthInParent("body","detail_wlxx_div"))+"px");
	$("#detail_wlxx_div table").css("magin","-100px");
	$("#detail_wlxx_div table td").css("padding-left","50px");
	$("#detail_wlxx_div table td").css("padding-right","20px");
	$("#detail_wlxx_div table td").css("font-size","15px");
	$("#detail_wlxx_div table tr").css("height","45px");

	$(".panel.window").eq(dwlxxdNum).css("margin-top","20px");
	$(".panel.window").eq(dwlxxdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dwlxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dwlxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dwlxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dwlxxdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dwlxxdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(dwlxxdNum).css("border-color","#ddd");

	$("#detail_wlxx_div #cancel_but").css("left","30%");
	$("#detail_wlxx_div #cancel_but").css("position","absolute");

	$("#detail_wlxx_div #ok_but").css("left","45%");
	$("#detail_wlxx_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailWLXXDialog(0);
}

function initDetailFHDWDialog(){
	detailFHDWDialog=$("#detail_fhdw_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_fhdw_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailFHDWDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailFHDWDialog(0);
           }}
        ]
	});

	$("#detail_fhdw_div table").css("width",(setFitWidthInParent("body","detail_fhdw_div"))+"px");
	$("#detail_fhdw_div table").css("magin","-100px");
	$("#detail_fhdw_div table td").css("padding-left","50px");
	$("#detail_fhdw_div table td").css("padding-right","20px");
	$("#detail_fhdw_div table td").css("font-size","15px");
	$("#detail_fhdw_div table tr").css("height","45px");

	$(".panel.window").eq(dfhdwdNum).css("margin-top","20px");
	$(".panel.window").eq(dfhdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dfhdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dfhdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dfhdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dfhdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dfhdwdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(dfhdwdNum).css("border-color","#ddd");

	$("#detail_fhdw_div #cancel_but").css("left","30%");
	$("#detail_fhdw_div #cancel_but").css("position","absolute");

	$("#detail_fhdw_div #ok_but").css("left","45%");
	$("#detail_fhdw_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailFHDWDialog(0);
}

function initDetailSHDWDialog(){
	detailSHDWDialog=$("#detail_shdw_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_shdw_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailSHDWDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailSHDWDialog(0);
           }}
        ]
	});

	$("#detail_shdw_div table").css("width",(setFitWidthInParent("body","detail_shdw_div"))+"px");
	$("#detail_shdw_div table").css("magin","-100px");
	$("#detail_shdw_div table td").css("padding-left","50px");
	$("#detail_shdw_div table td").css("padding-right","20px");
	$("#detail_shdw_div table td").css("font-size","15px");
	$("#detail_shdw_div table tr").css("height","45px");

	$(".panel.window").eq(dshdwdNum).css("margin-top","20px");
	$(".panel.window").eq(dshdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dshdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dshdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dshdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dshdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dshdwdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(dshdwdNum).css("border-color","#ddd");

	$("#detail_shdw_div #cancel_but").css("left","30%");
	$("#detail_shdw_div #cancel_but").css("position","absolute");

	$("#detail_shdw_div #ok_but").css("left","45%");
	$("#detail_shdw_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSHDWDialog(0);
}

function initDetailCYCLDialog(){
	detailCYCLDialog=$("#detail_cycl_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_cycl_div"),
		height:500,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailCYCLDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailCYCLDialog(0);
           }}
        ]
	});

	$("#detail_cycl_div table").css("width",(setFitWidthInParent("body","detail_cycl_div"))+"px");
	$("#detail_cycl_div table").css("magin","-100px");
	$("#detail_cycl_div table td").css("padding-left","50px");
	$("#detail_cycl_div table td").css("padding-right","20px");
	$("#detail_cycl_div table td").css("font-size","15px");
	$("#detail_cycl_div table tr").css("height","45px");

	$(".panel.window").eq(dcycldNum).css("margin-top","20px");
	$(".panel.window").eq(dcycldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dcycldNum).css("color","#000");
	$(".panel.window .panel-title").eq(dcycldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dcycldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dcycldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dcycldNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(dcycldNum).css("border-color","#ddd");

	$("#detail_cycl_div #cancel_but").css("left","30%");
	$("#detail_cycl_div #cancel_but").css("position","absolute");

	$("#detail_cycl_div #ok_but").css("left","45%");
	$("#detail_cycl_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailCYCLDialog(0);
}

function initDetailCYSJDialog(){
	detailCYSJDialog=$("#detail_cysj_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_cysj_div"),
		height:500,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailCYSJDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailCYSJDialog(0);
           }}
        ]
	});

	$("#detail_cysj_div table").css("width",(setFitWidthInParent("body","detail_cysj_div"))+"px");
	$("#detail_cysj_div table").css("magin","-100px");
	$("#detail_cysj_div table td").css("padding-left","50px");
	$("#detail_cysj_div table td").css("padding-right","20px");
	$("#detail_cysj_div table td").css("font-size","15px");
	$("#detail_cysj_div table tr").css("height","45px");

	$(".panel.window").eq(dcysjdNum).css("margin-top","20px");
	$(".panel.window").eq(dcysjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dcysjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dcysjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dcysjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dcysjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dcysjdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(dcysjdNum).css("border-color","#ddd");

	$("#detail_cysj_div #cancel_but").css("left","30%");
	$("#detail_cysj_div #cancel_but").css("position","absolute");

	$("#detail_cysj_div #ok_but").css("left","45%");
	$("#detail_cysj_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailCYSJDialog(0);
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

function openDetailYSSDialog(flag){
	if(flag==1){
		detailYSSDialog.dialog("open");
	}
	else{
		detailYSSDialog.dialog("close");
	}
}

function openDetailWLXXDialog(flag){
	if(flag==1){
		detailWLXXDialog.dialog("open");
	}
	else{
		detailWLXXDialog.dialog("close");
	}
}

function openDetailFHDWDialog(flag){
	if(flag==1){
		detailFHDWDialog.dialog("open");
	}
	else{
		detailFHDWDialog.dialog("close");
	}
}

function openDetailSHDWDialog(flag){
	if(flag==1){
		detailSHDWDialog.dialog("open");
	}
	else{
		detailSHDWDialog.dialog("close");
	}
}

function openDetailCYCLDialog(flag){
	if(flag==1){
		detailCYCLDialog.dialog("open");
	}
	else{
		detailCYCLDialog.dialog("close");
	}
}

function openDetailCYSJDialog(flag){
	if(flag==1){
		detailCYSJDialog.dialog("open");
	}
	else{
		detailCYSJDialog.dialog("close");
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
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.wyxd.wybm }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<span>${requestScope.wyxd.ddh }</span>
			</td>
			<td align="right" style="width:15%;">
				计划运输日期
			</td>
			<td style="width:30%;">
				<span>${requestScope.wyxd.jhysrq }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				预装卸重量
			</td>
			<td>
				<span>${requestScope.wyxd.yzxzl }</span>
			</td>
			<td align="right">
				流向类型
			</td>
			<td>
				<span>
				<c:if test="${requestScope.wyxd.lxlx eq 1 }">
					送运
				</c:if>
				<c:if test="${requestScope.wyxd.lxlx eq 2 }">
					取运
				</c:if>
				</span>
			</td>
		  </tr>
		</table>
	</div>
	
	<div id="yss_div">
		<table id="yss_tab"></table>
	</div>
	
	<div id="detail_yss_div">
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
	
	<div id="wlxx_div">
		<table id="wlxx_tab"></table>
	</div>
	
	<div id="detail_wlxx_div">
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
	
	<div id="fhdw_div">
		<table id="fhdw_tab"></table>
	</div>
	
	<div id="detail_fhdw_div">
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
	
	<div id="shdw_div">
		<table id="shdw_tab"></table>
	</div>
	
	<div id="detail_shdw_div">
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
	
	<div id="cycl_div">
		<table id="cycl_tab"></table>
	</div>
	
	<div id="detail_cycl_div">
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
	
	<div id="cysj_div">
		<table id="cysj_tab"></table>
	</div>
	
	<div id="detail_cysj_div">
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
</body>
</html>