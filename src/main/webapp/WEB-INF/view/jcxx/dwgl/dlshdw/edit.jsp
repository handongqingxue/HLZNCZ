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

.select_ssdl_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_ssdl_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_ssdl_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_ssdl_div .xzst_span{
	margin-left: 30px;
}
.select_ssdl_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}

.detail_ssdl_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_ssdl_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_ssdl_div .ckst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_ssdl_div .ckst_span{
	margin-left: 30px;
}
.detail_ssdl_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_ssdl_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_ssdl_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_ssdl_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var edNum=0;
var ssdldNum=1;
var sssdldNum=2;//选择所属队列
var dssdljbsxzNum=3;//查看所属队列基本属性组
var dssdlshdwdNum=4;//查看所属队列收货单位
$(function(){
	initEditDialog();//0
	
	initSSDLDialog();//1.所属队列
	initSelectSSDLDialog();//2.选择所属队列窗口
	
	initDetailSSDLJBSXZDialog();//3.查看所属队列基本属性组窗口
	initDetailSSDLSHDWDialog();//4.查看所属队列收货单位窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	//所属队列
	var ssdldpw=$("body").find(".panel.window").eq(ssdldNum);
	var ssdldws=$("body").find(".window-shadow").eq(ssdldNum);

	//选择所属队列
	var sssdldpw=$("body").find(".panel.window").eq(sssdldNum);
	var sssdldws=$("body").find(".window-shadow").eq(sssdldNum);

	//查看所属队列
	var dssdldpw=$("body").find(".panel.window").eq(dssdljbsxzNum);
	var dssdldws=$("body").find(".window-shadow").eq(dssdljbsxzNum);
	var dshdwdpw=$("body").find(".panel.window").eq(dssdlshdwdNum);
	var dshdwdws=$("body").find(".window-shadow").eq(dssdlshdwdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);

	ccDiv.append(ssdldpw);
	ccDiv.append(ssdldws);

	var sssdlDiv=$("#select_ssdl_div");
	sssdlDiv.append(sssdldpw);
	sssdlDiv.append(sssdldws);

	var dssdldDiv=$("#detail_ssdl_dialog_div");
	dssdldDiv.append(dssdldpw);
	dssdldDiv.append(dssdldws);
	
	dssdldDiv.append(dshdwdpw);
	dssdldDiv.append(dshdwdws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:150,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkEdit();
           }}
        ]
	});

	$("#edit_div table").css("width",(setFitWidthInParent("body","edit_div_table"))+"px");
	$("#edit_div table").css("magin","-100px");
	$("#edit_div table td").css("padding-left","50px");
	$("#edit_div table td").css("padding-right","20px");
	$("#edit_div table td").css("font-size","15px");
	$("#edit_div table tr").css("height","45px");

	$(".panel.window").eq(edNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(edNum).css("color","#000");
	$(".panel.window .panel-title").eq(edNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(edNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(edNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(edNum).css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","45%");
	$("#edit_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initSSDLDialog(){
	dialogTop+=180;//330
	yssDialog=$("#ssdl_div").dialog({
		title:"所属队列",
		width:setFitWidthInParent("body","ssdl_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(ssdldNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(ssdldNum).css("margin-top","20px");
	$(".panel.window").eq(ssdldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ssdldNum).css("color","#000");
	$(".panel.window .panel-title").eq(ssdldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ssdldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ssdldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ssdldNum).css("width","1000px");
	$(".window-shadow").eq(ssdldNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(ssdldNum).css("border-color","#ddd");

	initSSDLTab();
}

function initSSDLTab(){
	ssdlChooseLB=$("#ssdl_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectSSDLDialog(1);
		}
	});
	
	ssdlTab=$("#ssdl_tab").datagrid({
		toolbar:"#ssdl_toolbar",
		width:setFitWidthInParent("body","ssdl_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="所在队列";
					break;
				}
				return str;
			}},
            {field:"dm",title:"代码",width:200,align:"center"},
            {field:"mc",title:"名称",width:200,align:"center"},
            {field:"jhyz",title:"叫号阈值",width:200,align:"center"},
            {field:"jhxs",title:"叫号形式",width:200,align:"center",formatter:function(value,row){
            	return (value==1?"自动":"手动")+"叫号";
            }},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"deleteSSDLTabRow()\">删除</a>"
            		+"&nbsp;|&nbsp;<a onclick=\"detailSSDLTabRow()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:6});
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
	if('${requestScope.ssdl}'==""){
		rows=[];
	}
	else{
		var dm='${requestScope.ssdl.dm}';
		var mc='${requestScope.ssdl.mc}';
		var jhyz='${requestScope.ssdl.jhyz}';
		var jhxs='${requestScope.ssdl.jhxs}';
		var zt='${requestScope.ssdl.zt}';
		var shdwId='${requestScope.ssdl.shdwId}';
		var id='${requestScope.ssdl.id}';
		rows=[{gx:"1",dm:dm,mc:mc,jhyz:jhyz,jhxs:jhxs,zt:zt,shdwId:shdwId,id:id}];
	}
	loadSSDLTabData(rows);
}

function loadSSDLTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		ssdlChooseLB.linkbutton("disable");
	else
		ssdlChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	ssdlTab.datagrid('loadData',obj);
}

function initSelectSSDLDialog(){
	selectSSDLDialog=$("#select_ssdl_dialog_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("#select_ssdl_div","select_ssdl_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectSSDLDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectSSDL();
           }}
        ]
	});
	
	$(".panel.window").eq(sssdldNum).css("width","983px");
	$(".panel.window").eq(sssdldNum).css("margin-top","20px");
	$(".panel.window").eq(sssdldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sssdldNum).css("color","#000");
	$(".panel.window .panel-title").eq(sssdldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sssdldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sssdldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sssdldNum).css("width","1000px");
	$(".window-shadow").eq(sssdldNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(sssdldNum).css("border-color","#ddd");

	$("#select_ssdl_dialog_div #cancel_but").css("left","30%");
	$("#select_ssdl_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_ssdl_dialog_div #save_but").css("left","45%");
	$("#select_ssdl_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectSSDLTab();
	openSelectSSDLDialog(0);
}

function initSelectSSDLTab(){
	ssdlZTCBB=$("#select_ssdl_toolbar #zt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择状态"},
			{"value":"1","text":"在用"},
			{"value":"2","text":"暂停"},
			{"value":"3","text":"废弃"}
		]
	});
	
	$("#select_ssdl_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var mc=$("#select_sssj_toolbar #mc_inp").val();
			var dm=$("#select_sssj_toolbar #dm_inp").val();
			var zt=ssdlZTCBB.combobox("getValue");
			selectSSSJTab.datagrid("load",{mc:mc,dm:dm,zt:zt});
		}
	});
	
	selectSSDLTab=$("#select_ssdl_tab").datagrid({
		url:path+"main/queryDuiLieList",
		toolbar:"#select_ssdl_toolbar",
		width:setFitWidthInParent("body","select_ssdl_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"mc",title:"名称",width:200,align:"center"},
			{field:"dm",title:"代码",width:200,align:"center"},
			{field:"jhxs",title:"叫号形式",width:200,align:"center",formatter:function(value,row){
				return (value==1?"自动":"手动")+"叫号";
			}},
			{field:"jhyz",title:"叫号阈值",width:200,align:"center"},
			{field:"zt",title:"状态",width:200,align:"center",formatter:function(value,row){
            	var str;
            	switch (value) {
				case 1:
					str="在用";
					break;
				case 2:
					str="暂停";
					break;
				case 3:
					str="废弃";
					break;
				}
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{mc:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"mc",colspan:5});
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

function initDetailSSDLJBSXZDialog(){
	detailSSDLDialog=$("#detail_ssdl_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_ssdl_div","detail_ssdl_jbsxz_dialog_div"),
		height:331,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailSSDLDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   openDetailSSDLDialog(0);
           }}
        ]
	});

	$("#detail_ssdl_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_ssdl_div","detail_ssdl_jbsxz_dialog_div"))+"px");
	$("#detail_ssdl_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_ssdl_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_ssdl_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_ssdl_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_ssdl_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dssdljbsxzNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dssdljbsxzNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssdljbsxzNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssdljbsxzNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssdljbsxzNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dssdljbsxzNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_ssdl_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_ssdl_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_ssdl_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_ssdl_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSSDLJBSXZDialog(0);
}

function initDetailSSDLSHDWDialog(){
	detailSSDLSHDWDialog=$("#detail_ssdl_shdw_dialog_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:385,
		left:20,
	});

	$(".panel.window").eq(dssdlshdwdNum).css("width",(setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"))+"px");
	$(".panel.window").eq(dssdlshdwdNum).css("margin-top","20px");
	$(".panel.window").eq(dssdlshdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssdlshdwdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssdlshdwdNum).css("width",(setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"))+"px");
	$(".window-shadow").eq(dssdlshdwdNum).css("width","1000px");
	$(".window-shadow").eq(dssdlshdwdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(dssdlshdwdNum).css("border-color","#ddd");

	initDetailSSDLSHDWTab();
	openDetailSSDLSHDWDialog(0);
}

function initDetailSSDLSHDWTab(){
	detailSSDLSHDWTab=$("#detail_ssdl_shdw_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="收货单位";
					break;
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"bjsj",title:"编辑时间",width:200,align:"center"}
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
}

function deleteSSDLTabRow(){
	ssdlTab.datagrid("deleteRow",0);
	loadSSDLTabData([]);
}

function saveSelectSSDL(){
	var row=selectSSDLTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择所属队列！","warning");
		return false;
	}
	var rows=[{gx:"1",mc:row.mc,dm:row.dm,jhyz:row.jhyz,jhxs:row.jhxs,zt:row.zt,shdwId:row.shdwId,id:row.id}];
	loadSSDLTabData(rows);
	openSelectSSDLDialog(0);
}

function openSelectSSDLDialog(flag){
	if(flag==1){
		$("#select_ssdl_bg_div").css("display","block");
		selectSSDLDialog.dialog("open");
	}
	else{
		$("#select_ssdl_bg_div").css("display","none");
		selectSSDLDialog.dialog("close");
	}
}

function openDetailSSDLDialog(flag){
	if(flag==1){
		$("#detail_ssdl_bg_div").css("display","block");
	}
	else{
		$("#detail_ssdl_bg_div").css("display","none");
	}
	openDetailSSDLJBSXZDialog(flag);
	openDetailSSDLSHDWDialog(flag);
}

function openDetailSSDLJBSXZDialog(flag){
	if(flag==1){
		detailSSDLDialog.dialog("open");
	}
	else{
		detailSSDLDialog.dialog("close");
	}
}

//打开所属队列-收货单位详情窗口
function openDetailSSDLSHDWDialog(flag){
	if(flag==1){
		detailSSDLSHDWDialog.dialog("open");
	}
	else{
		detailSSDLSHDWDialog.dialog("close");
	}
}

function detailSSDLTabRow(){
	var row=ssdlTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_ssdl_jbsxz_dialog_div #id").text(row.id);
	$("#detail_ssdl_jbsxz_dialog_div #mc").text(row.mc);
	$("#detail_ssdl_jbsxz_dialog_div #dm").text(row.dm);
	$("#detail_ssdl_jbsxz_dialog_div #jhyz").text(row.jhyz);
	$("#detail_ssdl_jbsxz_dialog_div #jhxs").text((row.jhxs==1?"自动":"手动")+"叫号");
	var ztStr;
	switch (row.zt) {
	case "1":
		ztStr="在用";
		break;
	case "2":
		ztStr="暂停";
		break;
	case "3":
		ztStr="废弃";
		break;
	}
	$("#detail_ssdl_jbsxz_dialog_div #zt").text(ztStr);
	$("#detail_ssdl_shdw_dialog_div #id").val(row.shdwId);
	
	$.post(path+"main/queryShouHuoDanWeiByIds",
		{ids:row.shdwId},
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				rows[i].gx="1";
			}
			var obj = {"total":rows.length,"rows":rows};
			detailSSDLSHDWTab.datagrid('loadData',obj);
		}
	,"json");
	
	openDetailSSDLDialog(1);
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

function checkEdit(){
	if(checkDWMC()){
		editShouHuoDanWei();
	}
}

function editShouHuoDanWei(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:path+"main/editShouHuoDanWei",
		dataType: "json",
		data:formData,
		cache: false,
		processData: false,
		contentType: false,
		success: function (data){
			if(data.message=="ok"){
				alert(data.info);
				history.go(-1);
			}
			else{
				alert(data.info);
			}
		}
	});
}

function focusDWMC(){
	var dwmc = $("#dwmc").val();
	if(dwmc=="单位名称不能为空"){
		$("#dwmc").val("");
		$("#dwmc").css("color", "#555555");
	}
}

//验证单位名称
function checkDWMC(){
	var dwmc = $("#dwmc").val();
	if(dwmc==null||dwmc==""||dwmc=="单位名称不能为空"){
		$("#dwmc").css("color","#E15748");
    	$("#dwmc").val("单位名称不能为空");
    	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "edit_div":
		space=340;
		break;
	case "edit_div_table":
	case "panel_window":
		space=355;
		break;
	case "select_ssdl_dialog_div":
	case "detail_ssdl_jbsxz_dialog_div":
		space=50;
		break;
	case "detail_ssdl_shdw_dialog_div":
		space=60;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>修改</title>
</head>
<body>

<!-- 选择所属队列 start -->
<div class="select_ssdl_bg_div" id="select_ssdl_bg_div">
	<div class="select_ssdl_div" id="select_ssdl_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectSSDLDialog(0)">X</span>
		</div>
		<div id="select_ssdl_dialog_div">
			<div id="select_ssdl_toolbar" style="height:32px;">
				<span style="margin-left: 13px;">名称：</span>
				<input type="text" id="mc_inp" placeholder="名称" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">代码：</span>
				<input type="text" id="dm_inp" placeholder="代码" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">状态：</span>
				<input id="zt_cbb"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_ssdl_tab"></table>
		</div>
	</div>
</div>
<!-- 选择所属队列 end -->

<!-- 查看所属队列 start -->
<div class="detail_ssdl_bg_div" id="detail_ssdl_bg_div">
	<div class="detail_ssdl_div" id="detail_ssdl_div">
		<div class="ckst_div">
			<span class="ckst_span">查看实体</span>
			<span class="close_span" onclick="openDetailSSDLDialog(0)">X</span>
		</div>
		<div class="detail_ssdl_dialog_div" id="detail_ssdl_dialog_div">
			<div class="title_div">
				<span class="title_span">队列收货单位-所属队列-详情</span>
			</div>
			<div id="detail_ssdl_jbsxz_dialog_div">
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
						代码
					</td>
					<td style="width:30%;">
						<span id="dm"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						叫号阈值
					</td>
					<td>
						<span id="jhyz"></span>
					</td>
					<td align="right">
						叫号形式
					</td>
					<td>
						<span id="jhxs"></span>
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
					</td>
					<td>
					</td>
				  </tr>
				</table>
			</div>
			
			<div id="detail_ssdl_shdw_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdl_shdw_tab"></table>
			</div>
		</div>
	</div>
</div>
<!-- 查看所属队列 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">队列收货单位-修改</div>
	
	<!-- 基本属性组start -->
	<div id="edit_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.shdw.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				单位名称
			</td>
			<td style="width:30%;">
				<input type="text" id="dwmc" name="dwmc" value="${requestScope.shdw.dwmc }" placeholder="请输入单位名称" style="width: 150px;height:30px;" onfocus="focusDWMC()" onblur="checkDWMC()"/>
			</td>
			<td align="right" style="width:15%;">
				编辑时间
			</td>
			<td style="width:30%;">
				${requestScope.shdw.bjsj }
			</td>
		  </tr>
		</table>
	</form>
	</div>
	<!-- 基本属性组end -->
	
	<!-- 所属队列 start -->
	<div id="ssdl_div">
		<div id="ssdl_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="ssdl_tab"></table>
	</div>
	<!-- 所属队列 end -->
</div>
</body>
</html>