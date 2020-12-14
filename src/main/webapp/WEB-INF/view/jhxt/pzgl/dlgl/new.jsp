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
.select_shdw_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_shdw_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_shdw_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_shdw_div .xzst_span{
	margin-left: 30px;
}
.select_shdw_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}

.edit_shdw_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.edit_shdw_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.edit_shdw_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.edit_shdw_div .xgst_span{
	margin-left: 30px;
}
.edit_shdw_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.edit_shdw_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.edit_shdw_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.edit_shdw_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var jcxxPath=path+'jcxx/';
var jhxtPath=path+'jhxt/';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var ndNum=0;
var shdwdNum=1;
var sshdwdNum=2;
var eshdwjbsxzdNum=3;
$(function(){
	initNewDialog();
	initSHDWDialog();
	initSelectShdwDialog();
	initEditShdwJBSXZDialog();

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	//收货单位
	var shdwdpw=$("body").find(".panel.window").eq(shdwdNum);
	var shdwdws=$("body").find(".window-shadow").eq(shdwdNum);

	//选择收货单位
	var sshdwdpw=$("body").find(".panel.window").eq(sshdwdNum);
	var sshdwdws=$("body").find(".window-shadow").eq(sshdwdNum);

	//修改收货单位
	var eshdwjbsxzdpw=$("body").find(".panel.window").eq(eshdwjbsxzdNum);
	var eshdwjbsxzdws=$("body").find(".window-shadow").eq(eshdwjbsxzdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);

	ccDiv.append(shdwdpw);
	ccDiv.append(shdwdws);

	var sshdwdDiv=$("#select_shdw_div");
	sshdwdDiv.append(sshdwdpw);
	sshdwdDiv.append(sshdwdws);
	
	var eshdwdDiv=$("#edit_shdw_dialog_div");
	eshdwdDiv.append(eshdwjbsxzdpw);
	eshdwdDiv.append(eshdwjbsxzdws);
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","new_div"),
		height:231,
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

	$(".panel.window").eq(ndNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(ndNum).css("color","#000");
	$(".panel.window .panel-title").eq(ndNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ndNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ndNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ndNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ndNum).css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initJHXSCBB();
	initZTCBB();
}

function initSHDWDialog(){
	dialogTop+=260;//270
	shdwDialog=$("#shdw_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("body","shdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(shdwdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(shdwdNum).css("margin-top","20px");
	$(".panel.window").eq(shdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window .panel-title").eq(shdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(shdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(shdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(shdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	//$(".window-shadow").eq(shdwdNum).css("width","1000px");
	$(".window-shadow").eq(shdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(shdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(shdwdNum).css("border-color","#ddd");

	initSHDWTab();
}

function initSelectShdwDialog(){
	selectSHDWDialog=$("#select_shdw_dialog_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("#select_shdw_div","select_shdw_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
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
	$(".panel.window .panel-title").eq(sshdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sshdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sshdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sshdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sshdwdNum).css("width","1000px");
	$(".window-shadow").eq(sshdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(sshdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#select_shdw_dialog_div #cancel_but").css("left","30%");
	$("#select_shdw_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_shdw_dialog_div #save_but").css("left","45%");
	$("#select_shdw_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectSHDWTab();
	openSelectSHDWDialog(0);
}

function initEditShdwJBSXZDialog(){
	editSHDWDialog=$("#edit_shdw_jbsxz_dialog_div").dialog({
		title:"修改",
		width:setFitWidthInParent("#edit_shdw_div","edit_shdw_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editSHDW();
           }}
        ]
	});

	$("#edit_shdw_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#edit_shdw_div","edit_shdw_jbsxz_dialog_div"))+"px");
	$("#edit_shdw_jbsxz_dialog_div table").css("magin","-100px");
	$("#edit_shdw_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#edit_shdw_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#edit_shdw_jbsxz_dialog_div table td").css("font-size","15px");
	$("#edit_shdw_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(eshdwjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(eshdwjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(eshdwjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(eshdwjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(eshdwjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(eshdwjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#edit_shdw_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#edit_shdw_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	initEditSHDWGXCBB();
	openEditSHDWDialog(0);
}

function initEditSHDWGXCBB(){
	editSHDWGXCBB=$("#edit_shdw_gx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"1","text":"收货单位"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",1);
		}
	});
}

function initSHDWTab(){
	$("#choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectSHDWDialog(1);
		}
	});
	
	shdwTab=$("#shdw_tab").datagrid({
		//url:path+"main/queryWuZiLeiXingList",
		toolbar:"#shdw_toolbar",
		width:setFitWidthInParent("body","shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"gx",title:"关系",width:200,formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="收货单位";
					break;
				}
				return str;
			}},
            {field:"dwmc",title:"单位名称",width:200},
			{field:"bjsj",title:"编辑时间",width:200},
			{field:"id",title:"操作",width:200,formatter:function(value,row){
            	var str="<a onclick=\"editSHDWTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteSHDWTabRow()\">删除</a>";
            	return str;
            }}
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

			$(".datagrid-header td .datagrid-cell").each(function(){
				$(this).find("span").eq(0).css("margin-left","11px");
			});
			$(".datagrid-body td .datagrid-cell").each(function(){
				var html=$(this).html();
				$(this).html("<span style=\"margin-left:11px;\">"+html+"</span>");
			});
			reSizeCol();
		}
	});
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	loadSHDWTabData([]);
}

function editSHDWTabRow(){
	var row=shdwTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#edit_shdw_div #id").val(row.id);
	$("#edit_shdw_div #bjsj").val(row.bjsj);
	$("#edit_shdw_div #dwmc").val(row.dwmc);
	openEditSHDWDialog(1);
}

function deleteSHDWTabRow(){
	shdwTab.datagrid("deleteRow",0);
	loadSHDWTabData([]);
}

function initJHXSCBB(){
	jhxsCBB=$("#jhxs_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择叫号形式"},
			{"value":"1","text":"自动叫号"},
			{"value":"2","text":"手动叫号"}
		],
		onSelect:function(){
			$("#jhxs").val($(this).combobox("getValue"));
		}
	});
}

function initZTCBB(){
	ztCBB=$("#zt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择状态"},
			{"value":"1","text":"在用"},
			{"value":"2","text":"暂停"},
			{"value":"3","text":"废弃"}
		],
		onSelect:function(){
			$("#zt").val($(this).combobox("getValue"));
		}
	});
}

function initSelectSHDWTab(){
	$("#select_shdw_search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var dwmc=$("#select_shdw_toolbar #dwmc_inp").val();
			selectSHDWTab.datagrid("load",{dwmc:dwmc});
		}
	});
	
	selectSHDWTab=$("#select_shdw_tab").datagrid({
		url:jcxxPath+"queryShouHuoDanWeiList",
		toolbar:"#select_shdw_toolbar",
		width:setFitWidthInParent("#select_shdw_div","select_shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"dwmc",title:"单位名称",width:200}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{dwmc:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"dwmc",colspan:1});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			$(".datagrid-header td .datagrid-cell").each(function(){
				$(this).find("span").eq(0).css("margin-left","11px");
			});
			$(".datagrid-body td .datagrid-cell").each(function(){
				var html=$(this).html();
				$(this).html("<span style=\"margin-left:11px;\">"+html+"</span>");
			});
			reSizeCol();
		}
	});
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

function openSelectSHDWDialog(flag){
	if(flag==1){
		$("#select_shdw_bg_div").css("display","block");
		$("#select_shdw_bg_div").css("z-index",showZIndex);
		selectSHDWDialog.dialog("open");
	}
	else{
		$("#select_shdw_bg_div").css("display","none");
		$("#select_shdw_bg_div").css("z-index","9016");
		selectSHDWDialog.dialog("close");
	}
}

function openEditSHDWDialog(flag){
	if(flag==1){
		$("#edit_shdw_bg_div").css("display","block");
	}
	else{
		$("#edit_shdw_bg_div").css("display","none");
	}
	openEditSHDWJBSXZDialog(flag);
}

function openEditSHDWJBSXZDialog(flag){
	if(flag==1){
		editSHDWDialog.dialog("open");
	}
	else{
		editSHDWDialog.dialog("close");
	}
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

function loadSHDWTabData(rows){
	var obj = {"total":rows.length,"rows":rows};
	shdwTab.datagrid('loadData',obj);
}

function editSHDW(){
	var id=$("#edit_shdw_div #id").val();
	var gx=editSHDWGXCBB.combobox("getValue");
	var dwmc=$("#edit_shdw_div #dwmc").val();
	var bjsj=$("#edit_shdw_div #bjsj").val();
	
	var rows=[{gx:gx,dwmc:dwmc,bjsj:bjsj,id:id}];
	loadSHDWTabData(rows);
	openEditSHDWDialog(0);
}

function checkNew(){
	if(checkMC()){
		if(checkDM()){
			if(checkJHYZ()){
				if(checkJHXS()){
					if(checkZT()){
						if(checkSHDWId()){
							newDuiLie();
						}
					}
				}
			}
		}
	}
}

function newDuiLie(){
	var mc=$("#new_div #mc").val();
	var dm=$("#new_div #dm").val();
	var jhyz=$("#new_div #jhyz").val();
	var jhxs=jhxsCBB.combobox("getValue");
	var zt=ztCBB.combobox("getValue");
	var shdwTabData=shdwTab.datagrid("getData");
	var total=shdwTabData.total;
	var shdwId=0;
	if(total>0)
		shdwId=shdwTabData.rows[0].id;
	
	$.post(jcxxPath+"newDuiLie",
		{mc:mc,dm:dm,jhyz:jhyz,jhxs:jhxs,zt:zt,shdwId:shdwId},
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

function focusMC(){
	var mc = $("#new_div #mc").val();
	if(mc=="名称不能为空"){
		$("#new_div #mc").val("");
		$("#new_div #mc").css("color", "#555555");
	}
}

//验证名称
function checkMC(){
	var mc = $("#new_div #mc").val();
	if(mc==null||mc==""||mc=="名称不能为空"){
		$("#new_div #mc").css("color","#E15748");
    	$("#new_div #mc").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

function focusDM(){
	var dm = $("#new_div #dm").val();
	if(dm=="代码不能为空"){
		$("#new_div #dm").val("");
		$("#new_div #dm").css("color", "#555555");
	}
}

//验证代码
function checkDM(){
	var dm = $("#new_div #dm").val();
	if(mc==null||mc==""||mc=="代码不能为空"){
		$("#new_div #dm").css("color","#E15748");
    	$("#new_div #dm").val("代码不能为空");
    	return false;
	}
	else
		return true;
}

//验证叫号阈值
function checkJHYZ(){
	var jhyz = $("#new_div #jhyz").val();
	if(jhyz==null||jhyz==""){
	  	alert("请选择叫号阈值");
	  	return false;
	}
	else
		return true;
}

//验证叫号形式
function checkJHXS(){
	var jhxs=jhxsCBB.combobox("getValue");
	if(jhxs==null||jhxs==""){
	  	alert("请选择叫号形式");
	  	return false;
	}
	else
		return true;
}

//验证状态
function checkZT(){
	var zt=ztCBB.combobox("getValue");
	if(zt==null||zt==""){
	  	alert("请选择状态");
	  	return false;
	}
	else
		return true;
}

//验证收货单位
function checkSHDWId(){
	var shdwTabData=shdwTab.datagrid("getData");
	var total=shdwTabData.total;
	var shdwId=0;
	if(total>0)
		shdwId=shdwTabData.rows[0].id;
	
	if(shdwId==0){
		alert("请选择收货单位");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "new_div":
	case "shdw_div":
	case "select_shdw_tab":
	case "edit_shdw_div":
		space=340;
		break;
	case "new_div_table":
	case "panel_window":
	case "shdw_tab":
	case "select_shdw_div":
	case "edit_shdw_div":
		space=355;
		break;
	case "select_shdw_dialog_div":
	case "edit_shdw_jbsxz_dialog_div":
		space=50;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}

function setFitHeightInParent(o){
	var height=$(o).css("height");
	return height.substring(0,height.length-2)-98;
}

function initWindowMarginLeft(){
	var editDivWidth=$("#shdw_div").css("width");
	editDivWidth=editDivWidth.substring(0,editDivWidth.length-2);
	var pwWidth=$(".panel.window").css("width");
	pwWidth=pwWidth.substring(0,pwWidth.length-2);
	return ((editDivWidth-pwWidth)/2)+"px";
}
</script>
<title>创建</title>
</head>
<body>
	
<!-- 选择收货单位 start -->
<div class="select_shdw_bg_div" id="select_shdw_bg_div">
	<div class="select_shdw_div" id="select_shdw_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectSHDWDialog(0)">X</span>
		</div>
		<div id="select_shdw_dialog_div">
			<div id="select_shdw_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">单位名称：</span>
				<input type="text" id="dwmc_inp" placeholder="请输入单位名称" style="width: 120px;height: 25px;"/>
				<a id="select_shdw_search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_shdw_tab"></table>
		</div>
	</div>
</div>
<!-- 选择收货单位 end -->
	
<!-- 编辑收货单位 start -->
<div class="edit_shdw_bg_div" id="edit_shdw_bg_div">
	<div class="edit_shdw_div" id="edit_shdw_div">
		<div class="xgst_div">
			<span class="xgst_span">修改实体</span>
			<span class="close_span" onclick="openEditSHDWDialog(0)">X</span>
		</div>
		<div class="edit_shdw_dialog_div" id="edit_shdw_dialog_div">
			<div class="title_div">
				<span class="title_span">队列管理-收货单位-修改</span>
			</div>
			<div id="edit_shdw_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<input type="hidden" id="bjsj"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						关系
					</td>
					<td style="width:30%;">
						<input id="edit_shdw_gx_cbb"/>
					</td>
					<td align="right" style="width:15%;">
						单位名称
					</td>
					<td style="width:30%;">
						<input type="text" id="dwmc" placeholder="请输入单位名称" style="width: 150px;height:30px;"/>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 编辑收货单位 end -->
	
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">队列管理-创建</div>
	
	<div id="new_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				名称
			</td>
			<td style="width:30%;">
				<input type="text" id="mc" placeholder="请输入名称" style="width: 150px;height:30px;" onfocus="focusMC()" onblur="checkMC()"/>
			</td>
			<td align="right" style="width:15%;">
				代码
			</td>
			<td style="width:30%;">
				<input type="text" id="dm" placeholder="请输入代码" style="width: 150px;height:30px;" onfocus="focusDM()" onblur="checkDM()"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				叫号阈值
			</td>
			<td style="width:30%;">
				<input type="number" id="jhyz" placeholder="请输入叫号阈值" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				叫号形式
			</td>
			<td style="width:30%;">
				<input id="jhxs_cbb"/>
				<input type="hidden" id="jhxs" name="jhxs"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				状态
			</td>
			<td style="width:30%;">
				<input id="zt_cbb"/>
				<input type="hidden" id="zt" name="zt"/>
			</td>
			<td align="right" style="width:15%;">
			</td>
			<td style="width:30%;">
			</td>
		  </tr>
		</table>
	</div>
	
	<div id="shdw_div">
		<div id="shdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="shdw_tab"></table>
	</div>
</div>
</body>
</html>