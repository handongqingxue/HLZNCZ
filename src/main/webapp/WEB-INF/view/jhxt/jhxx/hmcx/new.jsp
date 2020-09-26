<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<style type="text/css">
.select_sssj_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: absolute;
	z-index: 9005;
	display:none;
}
.select_sssj_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_sssj_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_sssj_div .xzst_span{
	margin-left: 30px;
}
.select_sssj_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}

.edit_sssj_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: absolute;
	z-index: 9010;
	display:none;
}
.edit_sssj_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.edit_sssj_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.edit_sssj_div .xgst_span{
	margin-left: 30px;
}
.edit_sssj_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.edit_sssj_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.edit_sssj_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var ndNum=0;
var sssjdNum=1;
var ssssjdNum=2;
var esssjdNum=3;
var ezjjsdNum=4;

var wlxxdNum=4;
var swlxxdNum=5;
var ewlxxdNum=6;
var fhdwdNum=7;
var sfhdwdNum=8;
var efhdwdNum=9;
var shdwdNum=10;
var sshdwdNum=11;
var eshdwdNum=12;
var cycldNum=13;
var scycldNum=14;
var ecycldNum=15;
var cysjdNum=16;
var scysjdNum=17;
$(function(){
	initNewDialog();//0
	
	initSSSJDialog();//1.所属司机窗口
	initSelectSSSJDialog();//2.选择所属司机窗口
	initEditSSSJDialog();//3.修改所属司机窗口
	initEditZJJSDialog();//4.修改直接角色窗口
	
	//initWLXXDialog();//4.物料信息窗口
	//initSelectWLXXDialog();//5.选择物料信息窗口
	//initEditWLXXDialog();//6.修改物料信息窗口

	//initFHDWDialog();//7.发货单位窗口
	//initSelectFHDWDialog();//8.选择发货单位窗口
	//initEditFHDWDialog();//9.修改发货单位窗口

	//initSHDWDialog();//10.收货单位窗口
	//initSelectSHDWDialog();//11.选择收货单位窗口
	//initEditSHDWDialog();//12.修改发货单位窗口
	
	//initCYCLDialog();//13.承运车辆窗口
	//initSelectCYCLDialog();//14.选择承运车辆窗口
	//initEditCYCLDialog();//15.修改承运车辆窗口

	//initCYSJDialog();//16.承运司机窗口
	//initSelectCYSJDialog();//17.选择承运司机窗口
	
	initCenterConDiv();//将不同窗体移动到主要内容区域
});

function initCenterConDiv(){
	var ccDiv=$("#center_con_div");
	ccDiv.append($("body").find(".panel.window").eq(ndNum))
	ccDiv.append($("body").find(".panel.window").eq(sssjdNum))
	//ccDiv.append($("body").find(".panel.window").eq(ssssjdNum))
	ccDiv.append($("body").find(".window-shadow").eq(ndNum))
	ccDiv.append($("body").find(".window-shadow").eq(sssjdNum))
	//ccDiv.append($("body").find(".window-shadow").eq(ssssjdNum))
	//alert($("body").find(".panel.window").length);
	//alert($("body").find(".window-shadow").length);
}

function initNewDialog(){
	$("#new_div").dialog({
		title:"新字段组",
		width:setFitWidthInParent("body","new_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkNew();
           }}
        ]
	});

	$("#new_div table").css("width",(setFitWidthInParent("body","new_div_table"))+"px");
	$("#new_div table").css("magin","-100px");
	$("#new_div table td").css("padding-left","50px");
	$("#new_div table td").css("padding-right","20px");
	$("#new_div table td").css("font-size","15px");
	$("#new_div table tr").css("height","45px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").eq(ndNum).css("color","#000");
	$(".panel.window .panel-title").eq(ndNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ndNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ndNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").eq(ndNum).css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initPRSJDB();
	initZTCBB();
	initFLCBB();
	iniKSJHSJDB();
}

function initPRSJDB(){
	prsjDB=$('#prsj_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#prsj").val(prsjDB.datebox("getValue"));
        }
    });
	prsjDB.datebox('textbox').attr('placeholder', '请选择排入时间');
}

function initZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择状态"});
	$.post(path+"main/queryHaoMaZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ztCBB=$("#zt_cbb").combobox({
				valueField:"value",
				textField:"text",
				//multiple:true,
				data:data,
				onLoadSuccess:function(){
					
				}
			});
		}
	,"json");
}

function initFLCBB(){
	flCBB=$("#fl_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择分类"},{"value":"1","text":"普通"},{"value":"2","text":"其他"}
		],
		onSelect:function(){
			$("#fl").val($(this).combobox("getValue"));
		}
	});
}

function iniKSJHSJDB(){
	ksjhsjDB=$('#ksjhsj_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#ksjhsj").val(ksjhsjDB.datebox("getValue"));
        }
    });
	ksjhsjDB.datebox('textbox').attr('placeholder', '请选择开始叫号时间');
}

function initSSSJDialog(){
	dialogTop+=320;//330
	yssDialog=$("#sssj_div").dialog({
		title:"所属司机",
		width:setFitWidthInParent("body","sssj_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(sssjdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(sssjdNum).css("margin-top","20px");
	$(".panel.window").eq(sssjdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sssjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sssjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sssjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sssjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sssjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sssjdNum).css("width","1000px");
	$(".window-shadow").eq(sssjdNum).css("margin-top","20px");
	$(".window-shadow").eq(sssjdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sssjdNum).css("border-color","#ddd");

	initSSSJTab();
}

function initWLXXDialog(){
	dialogTop+=320;//650
	wlxxDialog=$("#wlxx_div").dialog({
		title:"物料信息",
		width:setFitWidthInParent("body","wlxx_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
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
	dialogTop+=330;//980
	fhdwDialog=$("#fhdw_div").dialog({
		title:"发货单位",
		width:setFitWidthInParent("body","fhdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
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
	
	$(".panel-header, .panel-body").eq(10).css("border-color","#ddd");
	
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
	
	$(".panel.window").eq(13).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(13).css("margin-top","20px");
	$(".panel.window").eq(13).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(13).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(13).css("color","#000");
	$(".panel.window .panel-title").eq(13).css("font-size","15px");
	$(".panel.window .panel-title").eq(13).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(13).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(13).css("width","1000px");
	$(".window-shadow").eq(13).css("margin-top","20px");
	$(".window-shadow").eq(13).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(13).css("border-color","#ddd");

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

function initSSSJTab(){
	sssjChooseLB=$("#sssj_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectSSSJDialog(1);
		}
	});
	
	sssjTab=$("#sssj_tab").datagrid({
		toolbar:"#sssj_toolbar",
		width:setFitWidthInParent("body","sssj_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="所属司机";
					break;
				}
				return str;
			}},
            {field:"yhm",title:"用户名",width:200,align:"center"},
            {field:"nc",title:"昵称",width:200,align:"center"},
            {field:"sm",title:"实名",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"editSSSJTabRow()\">编辑</a>"
            		+"&nbsp;|&nbsp;<a onclick=\"deleteSSSJTabRow()\">删除</a>";
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
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	loadSSSJTabData([]);
}

function initWLXXTab(){
	wlxxChooseLB=$("#wlxx_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectWLXXDialog(1);
		}
	});
	
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
            	var str="<a onclick=\"editWLXXTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteWLXXTabRow()\">删除</a>";
            	//var str="<a onclick=\"deleteSSSJTabRow()\">删除</a>";
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
	loadWLXXTabData([]);
}

function initFHDWTab(){
	fhdwChooseLB=$("#fhdw_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectFHDWDialog(1);
		}
	});
	
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
            	var str="<a onclick=\"editFHDWTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteFHDWTabRow()\">删除</a>";
            	//var str="<a onclick=\"deleteSSSJTabRow()\">删除</a>";
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
	loadFHDWTabData([]);
}

function initSHDWTab(){
	shdwChooseLB=$("#shdw_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectSHDWDialog(1);
		}
	});
	
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
            	var str="<a onclick=\"editSHDWTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteSHDWTabRow()\">删除</a>";
            	//var str="<a onclick=\"deleteSHDWTabRow()\">删除</a>";
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
	loadSHDWTabData([]);
}

function initCYCLTab(){
	cyclChooseLB=$("#cycl_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectCYCLDialog(1);
		}
	});
	
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
            	//var str="<a onclick=\"editCYCLTabRow()\">编辑</a>"
            	//+"&nbsp;|&nbsp;<a onclick=\"deleteCYCLTabRow()\">删除</a>";
            	var str="<a onclick=\"deleteCYCLTabRow()\">删除</a>";
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
	loadCYCLTabData([]);
}

function initCYSJTab(){
	cysjChooseLB=$("#cysj_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectCYSJDialog(1);
		}
	});
	
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
            	//var str="<a onclick=\"editCYSJTabRow()\">编辑</a>"
            	//+"&nbsp;|&nbsp;<a onclick=\"deleteCYSJTabRow()\">删除</a>";
            	var str="<a onclick=\"deleteCYSJTabRow()\">删除</a>";
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
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	loadCYSJTabData([]);
}

function initSelectSSSJDialog(){
	selectSSSJDialog=$("#select_sssj_dialog_div").dialog({
		title:"所属司机列表",
		width:setFitWidthInParent("#select_sssj_div","select_sssj_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectSSSJDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectSSSJ();
           }}
        ]
	});
	
	$(".panel.window").eq(ssssjdNum).css("width","983px");
	$(".panel.window").eq(ssssjdNum).css("margin-top","20px");
	//$(".panel.window").eq(ssssjdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(ssssjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ssssjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(ssssjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ssssjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ssssjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ssssjdNum).css("width","1000px");
	$(".window-shadow").eq(ssssjdNum).css("margin-top","20px");
	$(".window-shadow").eq(ssssjdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(ssssjdNum).css("border-color","#ddd");

	$("#select_sssj_dialog_div #cancel_but").css("left","30%");
	$("#select_sssj_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_sssj_dialog_div #save_but").css("left","45%");
	$("#select_sssj_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectSSSJTab();
	openSelectSSSJDialog(0);
}

function initSelectWLXXDialog(){
	selectWLXXDialog=$("#select_wlxx_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectWLXXDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectWLXX();
           }}
        ]
	});
	
	$(".panel.window").eq(swlxxdNum).css("width","983px");
	$(".panel.window").eq(swlxxdNum).css("margin-top","20px");
	$(".panel.window").eq(swlxxdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(swlxxdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(swlxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(swlxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(swlxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(swlxxdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(swlxxdNum).css("width","1000px");
	$(".window-shadow").eq(swlxxdNum).css("margin-top","20px");
	$(".window-shadow").eq(swlxxdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(swlxxdNum).css("border-color","#ddd");

	$("#select_wlxx_div #cancel_but").css("left","30%");
	$("#select_wlxx_div #cancel_but").css("position","absolute");
	
	$("#select_wlxx_div #save_but").css("left","45%");
	$("#select_wlxx_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectWLXXTab();
	openSelectWLXXDialog(0);
}

function initSelectFHDWDialog(){
	selectFHDWDialog=$("#select_fhdw_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectFHDWDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectFHDW();
           }}
        ]
	});
	
	$(".panel.window").eq(sfhdwdNum).css("width","983px");
	$(".panel.window").eq(sfhdwdNum).css("margin-top","20px");
	$(".panel.window").eq(sfhdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sfhdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sfhdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sfhdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sfhdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sfhdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sfhdwdNum).css("width","1000px");
	$(".window-shadow").eq(sfhdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(sfhdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sfhdwdNum).css("border-color","#ddd");

	$("#select_fhdw_div #cancel_but").css("left","30%");
	$("#select_fhdw_div #cancel_but").css("position","absolute");
	
	$("#select_fhdw_div #save_but").css("left","45%");
	$("#select_fhdw_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectFHDWTab();
	openSelectFHDWDialog(0);
}

function initSelectSHDWDialog(){
	selectSHDWDialog=$("#select_shdw_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectSHDWDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectSHDW();
           }}
        ]
	});
	
	$(".panel.window").eq(sshdwdNum).css("width","983px");
	$(".panel.window").eq(sshdwdNum).css("margin-top","20px");
	$(".panel.window").eq(sshdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sshdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sshdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sshdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sshdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sshdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sshdwdNum).css("width","1000px");
	$(".window-shadow").eq(sshdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(sshdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sshdwdNum).css("border-color","#ddd");

	$("#select_shdw_div #cancel_but").css("left","30%");
	$("#select_shdw_div #cancel_but").css("position","absolute");
	
	$("#select_shdw_div #save_but").css("left","45%");
	$("#select_shdw_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectSHDWTab();
	openSelectSHDWDialog(0);
}

function initSelectCYCLDialog(){
	selectCYCLDialog=$("#select_cycl_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectCYCLDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectCYCL();
           }}
        ]
	});
	
	$(".panel.window").eq(scycldNum).css("width","983px");
	$(".panel.window").eq(scycldNum).css("margin-top","20px");
	$(".panel.window").eq(scycldNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(scycldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(scycldNum).css("color","#000");
	$(".panel.window .panel-title").eq(scycldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(scycldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(scycldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(scycldNum).css("width","1000px");
	$(".window-shadow").eq(scycldNum).css("margin-top","20px");
	$(".window-shadow").eq(scycldNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(scycldNum).css("border-color","#ddd");

	$("#select_cycl_div #cancel_but").css("left","30%");
	$("#select_cycl_div #cancel_but").css("position","absolute");
	
	$("#select_cycl_div #save_but").css("left","45%");
	$("#select_cycl_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectCYCLTab();
	openSelectCYCLDialog(0);
}

function initSelectCYSJDialog(){
	selectCYSJDialog=$("#select_cysj_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectCYSJDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectCYSJ();
           }}
        ]
	});
	
	$(".panel.window").eq(scysjdNum).css("width","983px");
	$(".panel.window").eq(scysjdNum).css("margin-top","20px");
	$(".panel.window").eq(scysjdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(scysjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(scysjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(scysjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(scysjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(scysjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(scysjdNum).css("width","1000px");
	$(".window-shadow").eq(scysjdNum).css("margin-top","20px");
	$(".window-shadow").eq(scysjdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(scysjdNum).css("border-color","#ddd");

	$("#select_cysj_div #cancel_but").css("left","30%");
	$("#select_cysj_div #cancel_but").css("position","absolute");
	
	$("#select_cysj_div #save_but").css("left","45%");
	$("#select_cysj_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectCYSJTab();
	openSelectCYSJDialog(0);
}

function initSelectSSSJTab(){
	sssjZTCBB=$("#select_sssj_toolbar #zt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择状态"},
			{"value":"1","text":"新增"},
			{"value":"2","text":"正常使用"},
			{"value":"3","text":"废弃"},
			{"value":"4","text":"有误"}
		]
	});
	
	$("#select_sssj_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var yhm=$("#select_sssj_toolbar #yhm_inp").val();
			var zt=sssjZTCBB.combobox("getValue");
			selectSSSJTab.datagrid("load",{yhm:yhm,zt:zt});
		}
	});
	
	selectSSSJTab=$("#select_sssj_tab").datagrid({
		url:path+"main/queryYongHuList",
		toolbar:"#select_sssj_toolbar",
		width:setFitWidthInParent("body","select_sssj_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"yhm",title:"用户名",width:200,align:"center"},
			{field:"nc",title:"昵称",width:200,align:"center"},
			{field:"sm",title:"实名",width:200,align:"center"},
			{field:"zt",title:"状态",width:200,align:"center",formatter:function(value,row){
            	var str;
            	switch (value) {
				case 1:
					str="新增";
					break;
				case 2:
					str="正常使用";
					break;
				case 3:
					str="废弃";
					break;
				case 4:
					str="有误";
					break;
				}
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{yhm:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"yhm",colspan:4});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
}

function initSelectWLXXTab(){
	$("#select_wlxx_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var mc=$("#select_wlxx_toolbar #mc_inp").val();
			selectSSSJTab.datagrid("load",{mc:mc});
		}
	});
	
	selectWLXXTab=$("#select_wlxx_tab").datagrid({
		url:path+"main/queryWuZiList",
		toolbar:"#select_wlxx_toolbar",
		width:setFitWidthInParent("body","select_wlxx_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"mc",title:"名称",width:200,align:"center"},
			{field:"wzlx",title:"物资类型",width:200,align:"center"},
			{field:"bjsj",title:"编辑时间",width:200,align:"center"}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{mc:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"mc",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
}

function initSelectFHDWTab(){
	$("#select_fhdw_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var dwmc=$("#select_fhdw_toolbar #dwmc_inp").val();
			selectFHDWTab.datagrid("load",{dwmc:dwmc});
		}
	});
	
	selectFHDWTab=$("#select_fhdw_tab").datagrid({
		url:path+"main/queryFaHuoDanWeiList",
		toolbar:"#select_fhdw_toolbar",
		width:setFitWidthInParent("body","select_fhdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"bjsj",title:"编辑时间",width:200,align:"center"}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{dwmc:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"dwmc",colspan:2});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
}

function initSelectSHDWTab(){
	$("#select_shdw_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var dwmc=$("#select_shdw_toolbar #dwmc_inp").val();
			selectSHDWTab.datagrid("load",{dwmc:dwmc});
		}
	});
	
	selectSHDWTab=$("#select_shdw_tab").datagrid({
		url:path+"main/queryShouHuoDanWeiList",
		toolbar:"#select_shdw_toolbar",
		width:setFitWidthInParent("body","select_shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"bjsj",title:"编辑时间",width:200,align:"center"}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{dwmc:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"dwmc",colspan:2});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
}

function initSelectCYCLTab(){
	cllxCBB=$("#cllx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"重型"}]
	});
	
	$("#select_cycl_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var cph=$("#select_cycl_toolbar #cph_inp").val();
			var cllx=cllxCBB.combobox("getValue");
			selectCYCLTab.datagrid("load",{cph:cph,cllx:cllx});
		}
	});
	
	selectCYCLTab=$("#select_cycl_tab").datagrid({
		url:path+"main/queryCheLiangList",
		toolbar:"#select_cycl_toolbar",
		width:setFitWidthInParent("body","select_cycl_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"cph",title:"车牌号",width:200,align:"center"},
            {field:"ppxh",title:"品牌型号",width:200,align:"center"},
			{field:"fdjhm",title:"发动机号码",width:200,align:"center"},
			{field:"clsbdm",title:"车辆识别代号",width:200,align:"center"},
			{field:"zcrq",title:"注册日期",width:200,align:"center"},
			{field:"pfjd",title:"排放阶段",width:200,align:"center",formatter:function(value){
				var str;
				switch (value) {
				case 1:
					str="国五燃油";
					break;
				case 2:
					str="国五燃气";
					break;
				case 3:
					str="国六燃油";
					break;
				case 4:
					str="国六燃气";
					break;
				case 5:
					str="电动";
					break;
				}
				return str;
			}},
			{field:"fzrq",title:"发证日期",width:200,align:"center"},
			{field:"sfzy",title:"是否在用",width:200,align:"center",formatter:function(value){
				return value?"是":"否";
			}},
			{field:"bz",title:"备注",width:200}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{cph:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"cph",colspan:9});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
}

function initSelectCYSJTab(){
	zyztCBB=$("#zyzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择在用状态"},{"value":"1","text":"是"},{"value":"0","text":"否"}]
	});
	
	$("#select_cysj_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var xm=$("#select_cysj_toolbar #xm_inp").val();
			var sfz=$("#select_cysj_toolbar #sfz_inp").val();
			var zyzt=zyztCBB.combobox("getValue");
			selectCYSJTab.datagrid("load",{xm:xm,sfz:sfz,zyzt:zyzt});
		}
	});
	
	selectCYSJTab=$("#select_cysj_tab").datagrid({
		url:path+"main/querySiJiList",
		toolbar:"#select_cysj_toolbar",
		width:setFitWidthInParent("body","select_cysj_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"xm",title:"姓名",width:200,align:"center"},
            {field:"sjh",title:"手机号",width:200,align:"center"},
			{field:"sfz",title:"身份证",width:200,align:"center"}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{xm:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"xm",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
}

function initEditZJJSTab(){
	editZJJSTab=$("#edit_zjjs_tab").datagrid({
		url:path+"main/queryJueSeByIds",
		width:setFitWidthInParent("body","edit_zjjs_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="拥有角色";
					break;
				}
            	return str;
			}},
			{field:"mc",title:"名称",width:200,align:"center"},
			{field:"zt",title:"状态",width:200,align:"center",formatter:function(value,row){
            	var str;
            	switch (value) {
				case 1:
					str="新增";
					break;
				case 2:
					str="正常使用";
					break;
				case 3:
					str="废弃";
					break;
				case 4:
					str="有误";
					break;
				}
            	return str;
            }},
			{field:"ms",title:"描述",width:200,align:"center"}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:4});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
}

function initEditSSSJDialog(){
	editSSSJDialog=$("#edit_sssj_dialog_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("#edit_sssj_div","edit_sssj_dialog_div"),
		height:331,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditSSSJDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editSSSJ();
           }}
        ]
	});

	$("#edit_sssj_dialog_div table").css("width",(setFitWidthInParent("#edit_sssj_div","edit_sssj_dialog_div"))+"px");
	$("#edit_sssj_dialog_div table").css("magin","-100px");
	$("#edit_sssj_dialog_div table td").css("padding-left","50px");
	$("#edit_sssj_dialog_div table td").css("padding-right","20px");
	$("#edit_sssj_dialog_div table td").css("font-size","15px");
	$("#edit_sssj_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(esssjdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(esssjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(esssjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(esssjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(esssjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(esssjdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(esssjdNum).css("border-color","#ddd");

	$("#edit_sssj_dialog_div #cancel_but").css("left","30%");
	$("#edit_sssj_dialog_div #cancel_but").css("position","absolute");

	$("#edit_sssj_dialog_div #ok_but").css("left","45%");
	$("#edit_sssj_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditSSSJDialog(0);
	//$(".panel.window").eq(esssjdNum).css("z-index","9010");
}

function initEditZJJSDialog(){
	editZJJSDialog=$("#edit_zjjs_dialog_div").dialog({
		title:"直接角色",
		width:setFitWidthInParent("#edit_sssj_div","edit_zjjs_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:260
	});
	
	$(".panel.window").eq(ezjjsdNum).css("width","983px");
	$(".panel.window").eq(ezjjsdNum).css("margin-top","20px");
	//$(".panel.window").eq(ezjjsdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(ezjjsdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ezjjsdNum).css("color","#000");
	$(".panel.window .panel-title").eq(ezjjsdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ezjjsdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ezjjsdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ezjjsdNum).css("width","1000px");
	$(".window-shadow").eq(ezjjsdNum).css("margin-top","20px");
	$(".window-shadow").eq(ezjjsdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(ezjjsdNum).css("border-color","#ddd");

	initEditZJJSTab();
	//openEditZJJSDialog(0);
}

function initEditWLXXDialog(){
	editWLXXDialog=$("#edit_wlxx_div").dialog({
		title:"修改物料信息实体",
		width:setFitWidthInParent("body","edit_wlxx_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditWLXXDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editWLXX();
           }}
        ]
	});

	$("#edit_wlxx_div table").css("width",(setFitWidthInParent("body","edit_wlxx_div"))+"px");
	$("#edit_wlxx_div table").css("magin","-100px");
	$("#edit_wlxx_div table td").css("padding-left","50px");
	$("#edit_wlxx_div table td").css("padding-right","20px");
	$("#edit_wlxx_div table td").css("font-size","15px");
	$("#edit_wlxx_div table tr").css("height","45px");

	$(".panel.window").eq(6).css("margin-top","20px");
	$(".panel.window").eq(6).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(6).css("color","#000");
	$(".panel.window .panel-title").eq(6).css("font-size","15px");
	$(".panel.window .panel-title").eq(6).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(6).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(6).css("margin-top","20px");
	$(".window,.window .window-body").eq(6).css("border-color","#ddd");

	$("#edit_wlxx_div #cancel_but").css("left","30%");
	$("#edit_wlxx_div #cancel_but").css("position","absolute");

	$("#edit_wlxx_div #ok_but").css("left","45%");
	$("#edit_wlxx_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditWLXXDialog(0);
}

function initEditFHDWDialog(){
	editFHDWDialog=$("#edit_fhdw_div").dialog({
		title:"修改发货单位实体",
		width:setFitWidthInParent("body","edit_fhdw_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditFHDWDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editFHDW();
           }}
        ]
	});

	$("#edit_fhdw_div table").css("width",(setFitWidthInParent("body","edit_fhdw_div"))+"px");
	$("#edit_fhdw_div table").css("magin","-100px");
	$("#edit_fhdw_div table td").css("padding-left","50px");
	$("#edit_fhdw_div table td").css("padding-right","20px");
	$("#edit_fhdw_div table td").css("font-size","15px");
	$("#edit_fhdw_div table tr").css("height","45px");

	$(".panel.window").eq(efhdwdNum).css("margin-top","20px");
	$(".panel.window").eq(efhdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(efhdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(efhdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(efhdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(efhdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(efhdwdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(efhdwdNum).css("border-color","#ddd");

	$("#edit_fhdw_div #cancel_but").css("left","30%");
	$("#edit_fhdw_div #cancel_but").css("position","absolute");

	$("#edit_fhdw_div #ok_but").css("left","45%");
	$("#edit_fhdw_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditFHDWDialog(0);
}

function initEditSHDWDialog(){
	editSHDWDialog=$("#edit_shdw_div").dialog({
		title:"修改收货单位实体",
		width:setFitWidthInParent("body","edit_shdw_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditSHDWDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editSHDW();
           }}
        ]
	});

	$("#edit_shdw_div table").css("width",(setFitWidthInParent("body","edit_shdw_div"))+"px");
	$("#edit_shdw_div table").css("magin","-100px");
	$("#edit_shdw_div table td").css("padding-left","50px");
	$("#edit_shdw_div table td").css("padding-right","20px");
	$("#edit_shdw_div table td").css("font-size","15px");
	$("#edit_shdw_div table tr").css("height","45px");

	$(".panel.window").eq(eshdwdNum).css("margin-top","20px");
	$(".panel.window").eq(eshdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(eshdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(eshdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(eshdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(eshdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(eshdwdNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(eshdwdNum).css("border-color","#ddd");

	$("#edit_shdw_div #cancel_but").css("left","30%");
	$("#edit_shdw_div #cancel_but").css("position","absolute");

	$("#edit_shdw_div #ok_but").css("left","45%");
	$("#edit_shdw_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditSHDWDialog(0);
}

function initEditCYCLDialog(){
	editCYCLDialog=$("#edit_cycl_div").dialog({
		title:"修改承运车辆实体",
		width:setFitWidthInParent("body","edit_cycl_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditCYCLDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editCYCL();
           }}
        ]
	});

	$("#edit_cycl_div table").css("width",(setFitWidthInParent("body","edit_shdw_div"))+"px");
	$("#edit_cycl_div table").css("magin","-100px");
	$("#edit_cycl_div table td").css("padding-left","50px");
	$("#edit_cycl_div table td").css("padding-right","20px");
	$("#edit_cycl_div table td").css("font-size","15px");
	$("#edit_cycl_div table tr").css("height","45px");

	$(".panel.window").eq(ecycldNum).css("margin-top","20px");
	$(".panel.window").eq(ecycldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ecycldNum).css("color","#000");
	$(".panel.window .panel-title").eq(ecycldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ecycldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ecycldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ecycldNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ecycldNum).css("border-color","#ddd");

	$("#edit_cycl_div #cancel_but").css("left","30%");
	$("#edit_cycl_div #cancel_but").css("position","absolute");

	$("#edit_cycl_div #ok_but").css("left","45%");
	$("#edit_cycl_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditCYCLDialog(0);
}

function editSSSJ(){
	var id=$("#edit_sssj_dialog_div #id").val();
	var yhm=$("#edit_sssj_dialog_div #yhm").val();
	var bjsj=$("#edit_sssj_dialog_div #bjsj").text();
	var rows=[{gx:"1",yhm:yhm,bjsj:bjsj,id:id}];
	loadSSSJTabData(rows);
	openEditSSSJDialog(0);
}

function editWLXX(){
	var id=$("#edit_wlxx_div #id").val();
	var mc=$("#edit_wlxx_div #mc").val();
	var bjsj=$("#edit_wlxx_div #bjsj").text();
	var rows=[{gx:"1",mc:mc,bjsj:bjsj,id:id}];
	loadWLXXTabData(rows);
	openEditWLXXDialog(0);
}

function editFHDW(){
	var id=$("#edit_fhdw_div #id").val();
	var dwmc=$("#edit_fhdw_div #dwmc").val();
	var bjsj=$("#edit_fhdw_div #bjsj").text();
	var rows=[{gx:"1",dwmc:dwmc,bjsj:bjsj,id:id}];
	loadFHDWTabData(rows);
	openEditFHDWDialog(0);
}

function editSHDW(){
	var id=$("#edit_shdw_div #id").val();
	var dwmc=$("#edit_shdw_div #dwmc").val();
	var bjsj=$("#edit_shdw_div #bjsj").text();
	var rows=[{gx:"1",dwmc:dwmc,bjsj:bjsj,id:id}];
	loadSHDWTabData(rows);
	openEditSHDWDialog(0);
}

function editCYCL(){
	var id=$("#edit_cycl_div #id").val();
	var cph=$("#edit_cycl_div #cph").val();
	var rows=[{gx:"1",cph:cph,id:id}];
	loadCYCLTabData(rows);
	openEditCYCLDialog(0);
}

function editSSSJTabRow(){
	var row=sssjTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#edit_sssj_dialog_div #id").val(row.id);
	$("#edit_sssj_dialog_div #yhm").val(row.yhm);
	$("#edit_sssj_dialog_div #nc").val(row.nc);
	$("#edit_sssj_dialog_div #sm").val(row.sm);
	$("#edit_sssj_dialog_div #ysmm").val(row.ysmm);
	$("#edit_sssj_dialog_div #js").val(row.js);
	openEditSSSJDialog(1);
}

function editWLXXTabRow(){
	var row=wlxxTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#edit_wlxx_div #id").val(row.id);
	$("#edit_wlxx_div #mc").val(row.mc);
	$("#edit_wlxx_div #bjsj").text(row.bjsj);
	openEditWLXXDialog(1);
}

function editFHDWTabRow(){
	var row=fhdwTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#edit_fhdw_div #id").val(row.id);
	$("#edit_fhdw_div #dwmc").val(row.dwmc);
	$("#edit_fhdw_div #bjsj").text(row.bjsj);
	openEditFHDWDialog(1);
}

function editSHDWTabRow(){
	var row=shdwTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#edit_shdw_div #id").val(row.id);
	$("#edit_shdw_div #dwmc").val(row.dwmc);
	$("#edit_shdw_div #bjsj").text(row.bjsj);
	openEditSHDWDialog(1);
}

function deleteSSSJTabRow(){
	sssjTab.datagrid("deleteRow",0);
	loadSSSJTabData([]);
}

function deleteWLXXTabRow(){
	wlxxTab.datagrid("deleteRow",0);
	loadWLXXTabData([]);
}

function deleteFHDWTabRow(){
	fhdwTab.datagrid("deleteRow",0);
	loadFHDWTabData([]);
}

function deleteSHDWTabRow(){
	shdwTab.datagrid("deleteRow",0);
	loadSHDWTabData([]);
}

function deleteCYCLTabRow(){
	cyclTab.datagrid("deleteRow",0);
	loadCYCLTabData([]);
}

function deleteCYSJTabRow(){
	cysjTab.datagrid("deleteRow",0);
	loadCYSJTabData([]);
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

function openSelectSSSJDialog(flag){
	if(flag==1){
		$("#select_sssj_bg_div").css("display","block");
		selectSSSJDialog.dialog("open");
	}
	else{
		$("#select_sssj_bg_div").css("display","none");
		selectSSSJDialog.dialog("close");
	}
}

function openSelectWLXXDialog(flag){
	if(flag==1){
		selectWLXXDialog.dialog("open");
	}
	else{
		selectWLXXDialog.dialog("close");
	}
}

function openSelectFHDWDialog(flag){
	if(flag==1){
		selectFHDWDialog.dialog("open");
	}
	else{
		selectFHDWDialog.dialog("close");
	}
}

function openSelectSHDWDialog(flag){
	if(flag==1){
		selectSHDWDialog.dialog("open");
	}
	else{
		selectSHDWDialog.dialog("close");
	}
}

function openSelectCYCLDialog(flag){
	if(flag==1){
		selectCYCLDialog.dialog("open");
	}
	else{
		selectCYCLDialog.dialog("close");
	}
}

function openSelectCYSJDialog(flag){
	if(flag==1){
		selectCYSJDialog.dialog("open");
	}
	else{
		selectCYSJDialog.dialog("close");
	}
}

function openEditSSSJDialog(flag){
	if(flag==1){
		$("#edit_sssj_bg_div").css("display","block");
		editSSSJDialog.dialog("open");
	}
	else{
		$("#edit_sssj_bg_div").css("display","none");
		editSSSJDialog.dialog("close");
	}
}

function openEditWLXXDialog(flag){
	if(flag==1){
		editWLXXDialog.dialog("open");
	}
	else{
		editWLXXDialog.dialog("close");
	}
}

function openEditFHDWDialog(flag){
	if(flag==1){
		editFHDWDialog.dialog("open");
	}
	else{
		editFHDWDialog.dialog("close");
	}
}

function openEditSHDWDialog(flag){
	if(flag==1){
		editSHDWDialog.dialog("open");
	}
	else{
		editSHDWDialog.dialog("close");
	}
}

function openEditCYCLDialog(flag){
	if(flag==1){
		editCYCLDialog.dialog("open");
	}
	else{
		editCYCLDialog.dialog("close");
	}
}

function openEditZJJSDialog(flag){
	if(flag==1){
		editZJJSDialog.dialog("open");
	}
	else{
		editZJJSDialog.dialog("close");
	}
}

function saveSelectSSSJ(){
	var row=selectSSSJTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择所属司机！","warning");
		return false;
	}
	var rows=[{gx:"1",yhm:row.yhm,nc:row.nc,sm:row.sm,ysmm:row.ysmm,js:row.js,id:row.id}];
	loadSSSJTabData(rows);
	openSelectSSSJDialog(0);
}

function saveSelectWLXX(){
	var row=selectWLXXTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",mc:row.mc,bjsj:row.bjsj,id:row.id}];
	loadWLXXTabData(rows);
	openSelectWLXXDialog(0);
}

function saveSelectFHDW(){
	var row=selectFHDWTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",dwmc:row.dwmc,bjsj:row.bjsj,id:row.id}];
	loadFHDWTabData(rows);
	openSelectFHDWDialog(0);
}

function saveSelectSHDW(){
	var row=selectSHDWTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",dwmc:row.dwmc,bjsj:row.bjsj,id:row.id}];
	loadSHDWTabData(rows);
	openSelectSHDWDialog(0);
}

function saveSelectCYCL(){
	var row=selectCYCLTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",cph:row.cph,id:row.id}];
	loadCYCLTabData(rows);
	openSelectCYCLDialog(0);
}

function saveSelectCYSJ(){
	var row=selectCYSJTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",xm:row.xm,sjh:row.sjh,sfz:row.sfz,id:row.id}];
	loadCYSJTabData(rows);
	openSelectCYSJDialog(0);
}

function loadSSSJTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		sssjChooseLB.linkbutton("disable");
	else
		sssjChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	sssjTab.datagrid('loadData',obj);
}

function loadWLXXTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		wlxxChooseLB.linkbutton("disable");
	else
		wlxxChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	wlxxTab.datagrid('loadData',obj);
}

function loadFHDWTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		fhdwChooseLB.linkbutton("disable");
	else
		fhdwChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	fhdwTab.datagrid('loadData',obj);
}

function loadSHDWTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		shdwChooseLB.linkbutton("disable");
	else
		shdwChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	shdwTab.datagrid('loadData',obj);
}

function loadCYCLTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		cyclChooseLB.linkbutton("disable");
	else
		cyclChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	cyclTab.datagrid('loadData',obj);
}

function loadCYSJTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		cysjChooseLB.linkbutton("disable");
	else
		cysjChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	cysjTab.datagrid('loadData',obj);
}

function checkNew(){
	if(checkPRSJ()){
		if(checkYZXZL()){
			if(checkFL()){
				if(checkYSSId()){
					if(checkWLXXId()){
						if(checkFHDWId()){
							if(checkSHDWId()){
								if(checkCYCLId()){
									if(checkCYSJId()){
										newWoYaoXiaDan();
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

function newWoYaoXiaDan(){
	var prsj=prsjDB.datebox("getValue");
	var yzxzl=$("#new_div #yzxzl").val();
	var fl=flCBB.combobox("getValue");
	var yssId=sssjTab.datagrid("getData").rows[0].id;
	var wlxxId=wlxxTab.datagrid("getData").rows[0].id;
	var fhdwId=fhdwTab.datagrid("getData").rows[0].id;
	var shdwId=shdwTab.datagrid("getData").rows[0].id;
	var cyclId=cyclTab.datagrid("getData").rows[0].id;
	var cysjId=cysjTab.datagrid("getData").rows[0].id;
	
	$.post(path+"main/newWoYaoXiaDan",
		{prsj:prsj,yzxzl:yzxzl,fl:fl,yssId:yssId,wlxxId:wlxxId,fhdwId:fhdwId,shdwId:shdwId,cyclId:cyclId,cysjId:cysjId},
		function(data){
			if(data.message=="ok"){
				alert(data.info);
				history.go(-1);
			}
			else{
				alert(data.info);
			}
		}
	,"json");
}

//验证排入时间
function checkPRSJ(){
	var prsj = prsjDB.datebox("getValue");
	if(prsj==null||prsj==""){
	  	alert("请选择排入时间");
	  	return false;
	}
	else
		return true;
}

//验证预装卸重量
function checkYZXZL(){
	var yzxzl = $("#new_div #yzxzl").val();
	if(yzxzl==null||yzxzl==""){
	  	alert("请输入预装卸重量");
	  	return false;
	}
	else
		return true;
}

//验证分类
function checkFL(){
	var fl=flCBB.combobox("getValue");
	if(fl==null||fl==""){
	  	alert("请选择分类");
	  	return false;
	}
	else
		return true;
}

//验证运输商
function checkYSSId(){
	var sssjTabData=sssjTab.datagrid("getData");
	var total=sssjTabData.total;
	var yssId=null;
	if(total>0)
		yssId=sssjTabData.rows[0].id;
	
	if(yssId==null){
		alert("请选择运输商");
	  	return false;
	}
	else
		return true;
}

//验证物料信息
function checkWLXXId(){
	var wlxxTabData=wlxxTab.datagrid("getData");
	var total=wlxxTabData.total;
	var wlxxId=null;
	if(total>0)
		wlxxId=wlxxTabData.rows[0].id;
	
	if(wlxxId==null){
		alert("请选择物料信息");
	  	return false;
	}
	else
		return true;
}

//验证发货单位
function checkFHDWId(){
	var fhdwTabData=fhdwTab.datagrid("getData");
	var total=fhdwTabData.total;
	var fhdwId=null;
	if(total>0)
		fhdwId=fhdwTabData.rows[0].id;
	
	if(fhdwId==null){
		alert("请选择发货单位");
	  	return false;
	}
	else
		return true;
}

//验证收货单位
function checkSHDWId(){
	var shdwTabData=shdwTab.datagrid("getData");
	var total=shdwTabData.total;
	var shdwId=null;
	if(total>0)
		shdwId=shdwTabData.rows[0].id;
	
	if(shdwId==null){
		alert("请选择收货单位");
	  	return false;
	}
	else
		return true;
}

//验证承运车辆
function checkCYCLId(){
	var cyclTabData=cyclTab.datagrid("getData");
	var total=cyclTabData.total;
	var cyclId=null;
	if(total>0)
		cyclId=cyclTabData.rows[0].id;
	
	if(cyclId==null){
		alert("请选择承运车辆");
	  	return false;
	}
	else
		return true;
}

//验证承运司机
function checkCYSJId(){
	var cysjTabData=cysjTab.datagrid("getData");
	var total=cysjTabData.total;
	var cysjId=null;
	if(total>0)
		cysjId=cysjTabData.rows[0].id;
	
	if(cysjId==null){
		alert("请选择承运司机");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "new_div":
	case "sssj_div":
	case "select_sssj_tab":
	case "wlxx_div":
	case "select_wlxx_tab":
	case "edit_wlxx_div":
	case "fhdw_div":
	case "select_fhdw_tab":
	case "edit_fhdw_div":
	case "shdw_div":
	case "select_shdw_tab":
	case "edit_shdw_div":
	case "cycl_div":
	case "select_cycl_tab":
		space=340;
		break;
	case "new_div_table":
	case "panel_window":
	case "sssj_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "edit_sssj_dialog_div":
	case "select_sssj_dialog_div":
	case "edit_zjjs_dialog_div":
		space=50;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}

function initWindowMarginLeft(){
	var editDivWidth=$("#sssj_div").css("width");
	editDivWidth=editDivWidth.substring(0,editDivWidth.length-2);
	var pwWidth=$(".panel.window").css("width");
	pwWidth=pwWidth.substring(0,pwWidth.length-2);
	return ((editDivWidth-pwWidth)/2)+"px";
}
</script>
<title>创建</title>
</head>
<body>

<!-- 选择所属司机 start -->
<div class="select_sssj_bg_div" id="select_sssj_bg_div">
	<div class="select_sssj_div" id="select_sssj_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectSSSJDialog(0)">X</span>
		</div>
		<div id="select_sssj_dialog_div">
			<div id="select_sssj_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">用户名：</span>
				<input type="text" id="yhm_inp" placeholder="请输入用户名" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">状态：</span>
				<input id="zt_cbb"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_sssj_tab"></table>
		</div>
	</div>
</div>
<!-- 选择所属司机 end -->

<!-- 编辑所属司机 start -->
<div class="edit_sssj_bg_div" id="edit_sssj_bg_div">
	<div class="edit_sssj_div" id="edit_sssj_div">
		<div class="xgst_div">
			<span class="xgst_span">修改实体</span>
			<span class="close_span" onclick="openEditSSSJDialog(0)">X</span>
		</div>
		<div class="title_div">
			<span class="title_span">号码查询-所属司机-修改</span>
		</div>
		<div id="edit_sssj_dialog_div">
			<input type="hidden" id="id"/>
			<table>
			  <tr style="border-bottom: #CAD9EA solid 1px;">
				<td align="right" style="width:15%;">
					用户名
				</td>
				<td style="width:30%;">
					<input type="text" id="yhm" placeholder="请输入用户名" style="width: 150px;height:30px;"/>
				</td>
				<td align="right" style="width:15%;">
					昵称
				</td>
				<td style="width:30%;">
					<input type="text" id="nc" placeholder="请输入昵称" style="width: 150px;height:30px;"/>
				</td>
			  </tr>
			  <tr style="border-bottom: #CAD9EA solid 1px;">
				<td align="right">
					头像
				</td>
				<td>
					
				</td>
				<td align="right">
					实名
				</td>
				<td>
					<input type="text" id="sm" placeholder="请输入实名" style="width: 150px;height:30px;"/>
				</td>
			  </tr>
			  <tr style="border-bottom: #CAD9EA solid 1px;">
				<td align="right">
					状态
				</td>
				<td>
					
				</td>
				<td align="right">
					原始密码
				</td>
				<td>
					<input type="text" id="ysmm" placeholder="请输入原始密码" style="width: 150px;height:30px;"/>
				</td>
			  </tr>
			  <tr style="border-bottom: #CAD9EA solid 1px;">
				<td align="right">
					简述
				</td>
				<td>
					<input type="text" id="js" placeholder="请输入简述" style="width: 150px;height:30px;"/>
				</td>
				<td align="right">
				</td>
				<td>
				</td>
			  </tr>
			</table>
		</div>
		
		<div id="edit_zjjs_dialog_div">
			<input type="hidden" id="id"/>
			<table id="edit_zjjs_tab"></table>
		</div>
	</div>
</div>
<!-- 编辑所属司机 end -->

<%@include file="../../../inc/nav.jsp"%>
<div id="center_con_div" style="margin-left:288px;width: 100%;height: 90vh;overflow-y: scroll;position: absolute;">
	<!-- 新字段组 start -->
	<div id="new_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				号码
			</td>
			<td style="width:30%;">
				<input type="text" id="hm" name="hm" placeholder="请输入号码" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				排入时间
			</td>
			<td style="width:30%;">
				<input id="prsj_db"/>
				<input type="hidden" id="prsj" name="prsj"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				排队号
			</td>
			<td>
				<input type="number" id="yzxzl" name="yzxzl" placeholder="请输入排队号" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				状态
			</td>
			<td>
				<input id="zt_cbb"/>
				<input type="hidden" id="ztId" name="ztId"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				分类
			</td>
			<td>
				<input id="fl_cbb"/>
				<input type="hidden" id="fl" name="fl"/>
			</td>
			<td align="right">
				二维码
			</td>
			<td>
				<input type="text" id="ewm" name="ewm" placeholder="请输入二维码" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				开始叫号时间
			</td>
			<td>
				<input id="ksjhsj_db"/>
				<input type="hidden" id="ksjhsj" name="ksjhsj"/>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</form>
	</div>
	<!-- 新字段组 end -->
	
	<!-- 所属司机 start -->
	<div id="sssj_div">
		<div id="sssj_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="sssj_tab"></table>
	</div>
	<!-- 所属司机 end -->
	
	
	
	<!-- 
	<div id="wlxx_div">
		<div id="wlxx_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="wlxx_tab"></table>
	</div>
	
	<div id="select_wlxx_div">
		<div id="select_wlxx_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">名称：</span>
			<input type="text" id="mc_inp" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_wlxx_tab"></table>
	</div>
	
	<div id="edit_wlxx_div">
		<input type="hidden" id="id"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				名称
			</td>
			<td style="width:30%;">
				<input type="text" id="mc" placeholder="请输入名称" style="width: 150px;height:30px;"/>
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
	 -->

	<!-- 	
	<div id="fhdw_div">
		<div id="fhdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="fhdw_tab"></table>
	</div>
	
	<div id="select_fhdw_div">
		<div id="select_fhdw_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">单位名称：</span>
			<input type="text" id="dwmc_inp" placeholder="请输入单位名称" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_fhdw_tab"></table>
	</div>
	
	<div id="edit_fhdw_div">
		<input type="hidden" id="id"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				单位名称
			</td>
			<td style="width:30%;">
				<input type="text" id="dwmc" placeholder="请输入单位名称" style="width: 150px;height:30px;"/>
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
	 -->
	
	<!-- 
	<div id="shdw_div">
		<div id="shdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="shdw_tab"></table>
	</div>
	
	<div id="select_shdw_div">
		<div id="select_shdw_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">单位名称：</span>
			<input type="text" id="dwmc_inp" placeholder="请输入单位名称" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_shdw_tab"></table>
	</div>
	
	<div id="edit_shdw_div">
		<input type="hidden" id="id"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				单位名称
			</td>
			<td style="width:30%;">
				<input type="text" id="dwmc" placeholder="请输入单位名称" style="width: 150px;height:30px;"/>
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
	 -->
	
	<!-- 
	<div id="cycl_div">
		<div id="cycl_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="cycl_tab"></table>
	</div>
	
	<div id="select_cycl_div">
		<div id="select_cycl_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">车牌号：</span>
			<input type="text" id="cph_inp" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">车辆类型：</span>
			<input id="cllx_cbb"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_cycl_tab"></table>
	</div>
	
	<div id="edit_cycl_div">
		<input type="hidden" id="id"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				单位名称
			</td>
			<td style="width:30%;">
				<input type="text" id="dwmc" placeholder="请输入单位名称" style="width: 150px;height:30px;"/>
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
	 -->
	
	<!-- 
	<div id="cysj_div">
		<div id="cysj_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="cysj_tab"></table>
	</div>
	
	<div id="select_cysj_div">
		<div id="select_cysj_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">姓名：</span>
			<input type="text" id="xm_inp" placeholder="请输入姓名" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">身份证号：</span>
			<input type="text" id="sfz_inp" placeholder="请输入身份证" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">在用状态：</span>
			<input id="zyzt_cbb"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_cysj_tab"></table>
	</div>
	 -->
</div>
</body>
</html>