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

.select_yss_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_yss_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_yss_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_yss_div .xzst_span{
	margin-left: 30px;
}
.select_yss_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}

.edit_yss_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.edit_yss_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.edit_yss_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.edit_yss_div .xgst_span{
	margin-left: 30px;
}
.edit_yss_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.edit_yss_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.edit_yss_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.edit_yss_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var tbxxdNum=0;
var ndNum=1;
var yssdNum=2;
var syssdNum=3;
var eyssjbsxzdNum=4;
var yswldNum=5;

$(function(){
	initTBXXDialog();//0
	initNewDialog();//1

	initYSSDialog();//2.运输商窗口
	initSelectYSSDialog();//3.选择运输商窗口
	initEditYSSJBSXZDialog();//4.修改运输商窗口

	initYSWLDialog();//5.运输物料
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//填报信息
	var tbxxdpw=$("body").find(".panel.window").eq(tbxxdNum);
	var tbxxdws=$("body").find(".window-shadow").eq(tbxxdNum);
	
	//新字段组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);
	
	//运输商
	var yssdpw=$("body").find(".panel.window").eq(yssdNum);
	var yssdws=$("body").find(".window-shadow").eq(yssdNum);

	//选择运输商
	var syssdpw=$("body").find(".panel.window").eq(syssdNum);
	var syssdws=$("body").find(".window-shadow").eq(syssdNum);

	//修改运输商
	var eyssjbsxdpw=$("body").find(".panel.window").eq(eyssjbsxzdNum);
	var eyssjbsxdws=$("body").find(".window-shadow").eq(eyssjbsxzdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(tbxxdpw);
	ccDiv.append(tbxxdws);

	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	
	ccDiv.append(yssdpw);
	ccDiv.append(yssdws);

	var syssDiv=$("#select_yss_div");
	syssDiv.append(syssdpw);
	syssDiv.append(syssdws);

	var eyssdDiv=$("#edit_yss_dialog_div");
	eyssdDiv.append(eyssjbsxdpw);
	eyssdDiv.append(eyssjbsxdws);
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

function initNewDialog(){
	dialogTop+=190;
	$("#new_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("body","new_div"),
		height:325,
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
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initLXLXCBB();
	initBJSJDB();
	initDDZTCBB();
}

function initLXLXCBB(){
	ndlxlxCBB=$("#new_div #lxlx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择流向类型"},{"value":"1","text":"送运"},{"value":"2","text":"取运"}
		],
		onSelect:function(){
			$("#lxlx").val($(this).combobox("getValue"));
		}
	});
}

function initBJSJDB(){
	bjsjDB=$('#bjsj_db').datebox({
		width:160,
        required:false,
        disabled:true
    });
}

function initDDZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择订单状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ssddDDZTCBB=$("#new_div #ddzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data
			});
		}
	,"json");
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
	yssChooseLB=$("#yss_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectYSSDialog(1);
		}
	});
	
	yssTab=$("#yss_tab").datagrid({
		toolbar:"#yss_toolbar",
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
            	var str="<a onclick=\"editYSSTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteYSSTabRow()\">删除</a>";
            	//var str="<a onclick=\"deleteYSSTabRow()\">删除</a>";
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
	loadYSSTabData([]);
}

function loadYSSTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		yssChooseLB.linkbutton("disable");
	else
		yssChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	yssTab.datagrid('loadData',obj);
}

function initSelectYSSDialog(){
	selectYSSDialog=$("#select_yss_dialog_div").dialog({
		title:"运输商列表",
		width:setFitWidthInParent("#select_yss_div","select_yss_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectYSSDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectYSS();
           }}
        ]
	});
	
	$(".panel.window").eq(syssdNum).css("width","983px");
	$(".panel.window").eq(syssdNum).css("margin-top","20px");
	$(".panel.window").eq(syssdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(syssdNum).css("color","#000");
	$(".panel.window .panel-title").eq(syssdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(syssdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(syssdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(syssdNum).css("width","1000px");
	$(".window-shadow").eq(syssdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(syssdNum).css("border-color","#ddd");

	$("#select_yss_dialog_div #cancel_but").css("left","30%");
	$("#select_yss_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_yss_dialog_div #save_but").css("left","45%");
	$("#select_yss_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectYSSTab();
	openSelectYSSDialog(0);
}

function initSelectYSSTab(){
	$("#select_yss_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var mc=$("#select_yss_toolbar #mc_inp").val();
			selectYSSTab.datagrid("load",{mc:mc});
		}
	});
	
	selectYSSTab=$("#select_yss_tab").datagrid({
		url:path+"main/queryYunShuShangList",
		toolbar:"#select_yss_toolbar",
		width:setFitWidthInParent("body","select_yss_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"mc",title:"名称",width:200,align:"center"},
			{field:"bjsj",title:"编辑时间",width:200,align:"center"}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{mc:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"mc",colspan:2});
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

function initEditYSSJBSXZDialog(){
	editYSSDialog=$("#edit_yss_jbsxz_dialog_div").dialog({
		title:"修改运输商实体",
		width:setFitWidthInParent("#edit_yss_div","edit_yss_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditYSSDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editYSS();
           }}
        ]
	});

	$("#edit_yss_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#edit_yss_div","edit_yss_jbsxz_dialog_div"))+"px");
	$("#edit_yss_jbsxz_dialog_div table").css("magin","-100px");
	$("#edit_yss_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#edit_yss_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#edit_yss_jbsxz_dialog_div table td").css("font-size","15px");
	$("#edit_yss_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(eyssjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(eyssjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(eyssjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(eyssjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(eyssjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(eyssjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#edit_yss_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#edit_yss_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#edit_yss_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#edit_yss_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditYSSJBSXZDialog(0);
}

function initYSWLDialog(){
	dialogTop+=350;//230
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
	yswlChooseLB=$("#yswl_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectYSWLDialog(1);
		}
	});
	
	yswlTab=$("#yswl_tab").datagrid({
		toolbar:"#yswl_toolbar",
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
            	var str="<a onclick=\"editYSSTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteYSSTabRow()\">删除</a>";
            	//var str="<a onclick=\"deleteYSSTabRow()\">删除</a>";
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
	loadYSWLTabData([]);
}

function loadYSWLTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		yswlChooseLB.linkbutton("disable");
	else
		yswlChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	yswlTab.datagrid('loadData',obj);
}

function openSelectYSSDialog(flag){
	if(flag==1){
		$("#select_yss_bg_div").css("display","block");
		$("#select_yss_bg_div").css("z-index",showZIndex);
		selectYSSDialog.dialog("open");
	}
	else{
		$("#select_yss_bg_div").css("display","none");
		$("#select_yss_bg_div").css("z-index","9016");
		selectYSSDialog.dialog("close");
	}
}

function saveSelectYSS(){
	var row=selectYSSTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",mc:row.mc,bjsj:row.bjsj,id:row.id}];
	loadYSSTabData(rows);
	openSelectYSSDialog(0);
}

function deleteYSSTabRow(){
	yssTab.datagrid("deleteRow",0);
	loadYSSTabData([]);
}

function openEditYSSDialog(flag){
	if(flag==1){
		$("#edit_yss_bg_div").css("display","block");
	}
	else{
		$("#edit_yss_bg_div").css("display","none");
	}
	openEditYSSJBSXZDialog(flag);
}

function openEditYSSJBSXZDialog(flag){
	if(flag==1){
		editYSSDialog.dialog("open");
	}
	else{
		editYSSDialog.dialog("close");
	}
}

function editYSS(){
	var id=$("#edit_yss_div #id").val();
	var mc=$("#edit_yss_div #mc").val();
	var bjsj=$("#edit_yss_div #bjsj").text();
	var rows=[{gx:"1",mc:mc,bjsj:bjsj,id:id}];
	loadYSSTabData(rows);
	openEditYSSDialog(0);
}

function editYSSTabRow(){
	var row=yssTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#edit_yss_div #id").val(row.id);
	$("#edit_yss_div #mc").val(row.mc);
	$("#edit_yss_div #bjsj").text(row.bjsj);
	openEditYSSDialog(1);
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "tbxx_div":
	case "new_div":
	case "sssj_div":
	case "ssdl_div":
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
	case "tbxx_div_table":
	case "new_div_table":
	case "panel_window":
	case "sssj_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "select_yss_dialog_div":
	case "edit_yss_jbsxz_dialog_div":
		space=50;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>创建</title>
</head>
<body>

<!-- 选择运输商 start -->
<div class="select_yss_bg_div" id="select_yss_bg_div">
	<div class="select_yss_div" id="select_yss_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectYSSDialog(0)">X</span>
		</div>
		<div id="select_yss_dialog_div">
			<div id="select_yss_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">名称：</span>
				<input type="text" id="mc_inp" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_yss_tab"></table>
		</div>
	</div>
</div>
<!-- 选择运输商 end -->

<!-- 编辑运输商 start -->
<div class="edit_yss_bg_div" id="edit_yss_bg_div">
	<div class="edit_yss_div" id="edit_yss_div">
		<div class="xgst_div">
			<span class="xgst_span">修改实体</span>
			<span class="close_span" onclick="openEditYSSDialog(0)">X</span>
		</div>
		<div class="edit_yss_dialog_div" id="edit_yss_dialog_div">
			<div class="title_div">
				<span class="title_span">订单填报-运输商-修改</span>
			</div>
			<div id="edit_yss_jbsxz_dialog_div">
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
		</div>
	</div>
</div>
<!-- 编辑运输商 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">订单填报-创建</div>
	
	<div id="tbxx_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				实际重量
			</td>
			<td style="width:30%;">
				<input type="text" id="sjzl" name="sjzl" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				备注
			</td>
			<td style="width:30%;">
				<textarea rows="3" cols="20" id="bz" name="bz" placeholder="请输入备注"></textarea>
			</td>
		  </tr>
		</table>
	</div>
	
	<!-- 基本信息 start -->
	<div id="new_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车牌号
			</td>
			<td style="width:30%;">
				<input type="text" id="cph" name="cph" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<input type="text" id="ddh" name="ddh" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				预装卸重量
			</td>
			<td>
				<input type="number" id="yzxzl" name="yzxzl" placeholder="请输入预装卸重量" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				流向类型
			</td>
			<td>
				<input id="lxlx_cbb"/>
				<input type="hidden" id="lxlx" name="lxlx"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				编辑时间
			</td>
			<td>
				<input id="bjsj_db"/>
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
				实际重量
			</td>
			<td>
				<input type="text" id="sjzl" name="sjzl" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				重量差额比
			</td>
			<td>
				<input type="text" id="zlceb" name="zlceb" disabled="disabled" placeholder="无需输入" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				订单状态
			</td>
			<td>
				<input id="ddzt_cbb"/>
				<input type="hidden" id="ddzt" name="ddzt"/>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</form>
	</div>
	<!-- 基本信息 end -->
	
	<div id="yss_div">
		<div id="yss_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="yss_tab"></table>
	</div>
	
	<div id="yswl_div">
		<div id="yswl_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="yswl_tab"></table>
	</div>
</div>
</body>
</html>