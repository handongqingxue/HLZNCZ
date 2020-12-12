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
.select_wzlx_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_wzlx_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_wzlx_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_wzlx_div .xzst_span{
	margin-left: 30px;
}
.select_wzlx_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var jcxxPath=path+'jcxx/';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var ndNum=0;
var swzlxdNum=1;
$(function(){
	initNewDialog();
	initSelectWzlxDialog();

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	var swzlxdpw=$("body").find(".panel.window").eq(swzlxdNum);
	var swzlxdws=$("body").find(".window-shadow").eq(swzlxdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);

	var swzlxDiv=$("#select_wzlx_div");
	swzlxDiv.append(swzlxdpw);
	swzlxDiv.append(swzlxdws);
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","new_div"),
		height:251,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkNew();
           }}
        ]
	});

	$("#new_div table").css("width",(setFitWidthInParent("body")-15)+"px");
	$("#new_div table").css("magin","-100px");
	$("#new_div table td").css("padding-left","50px");
	$("#new_div table td").css("padding-right","20px");
	$("#new_div table td").css("font-size","15px");
	$("#new_div table tr").eq(0).css("height","90px");
	$("#new_div table tr").eq(1).css("height","45px");

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
}

function initSelectWzlxDialog(){
	wzlxDialog=$("#select_wzlx_dialog_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("#select_wzlx_div","select_wzlx_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectWZLXDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveWZLX();
           }}
        ]
	});
	
	$(".panel.window").eq(swzlxdNum).css("width","983px");
	$(".panel.window").eq(swzlxdNum).css("margin-top","20px");
	//$(".panel.window").eq(swzlxdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(swzlxdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(swzlxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(swzlxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(swzlxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(swzlxdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(swzlxdNum).css("width","1000px");
	$(".window-shadow").eq(swzlxdNum).css("margin-top","20px");
	//$(".window-shadow").eq(swzlxdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(swzlxdNum).css("border-color","#ddd");

	$("#select_wzlx_dialog_div #cancel_but").css("left","30%");
	$("#select_wzlx_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_wzlx_dialog_div #save_but").css("left","45%");
	$("#select_wzlx_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initWZLXTab();
	openSelectWZLXDialog(0);
}

function initWZLXTab(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var mc=$("#mc_inp").val();
			wzlxTab.datagrid("load",{mc:mc});
		}
	});
	
	wzlxTab=$("#wzlx_tab").datagrid({
		url:jcxxPath+"queryWuZiLeiXingList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("#select_wzlx_div"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"mc",title:"名称",width:200},
            {field:"bz",title:"备注",width:200},
			{field:"px",title:"排序",width:200}
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

function openSelectWZLXDialog(flag){
	if(flag==1){
		$("#select_wzlx_bg_div").css("display","block");
		$("#select_wzlx_bg_div").css("z-index",showZIndex);
		wzlxDialog.dialog("open");
	}
	else{
		$("#select_wzlx_bg_div").css("display","none");
		$("#select_wzlx_bg_div").css("z-index","9016");
		wzlxDialog.dialog("close");
	}
}

function saveWZLX(){
	var row=wzlxTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	$("#new_div #wzlx_hid").val(row.id);
	$("#new_div #wzlxmc_span").text(row.mc);
	openSelectWZLXDialog(0);
}

function checkNew(){
	if(checkMC()){
		if(checkWZLXId()){
			newWuZi();
		}
	}
}

function newWuZi(){
	var mc=$("#new_div #mc").val();
	var wzlxId=$("#new_div #wzlx_hid").val();
	
	$.post(jcxxPath+"newWuZi",
		{mc:mc,wzlxId:wzlxId},
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
	var mc = $("#mc").val();
	if(mc=="名称不能为空"){
		$("#mc").val("");
		$("#mc").css("color", "#555555");
	}
}

//验证名称
function checkMC(){
	var mc = $("#mc").val();
	if(mc==null||mc==""||mc=="名称不能为空"){
		$("#mc").css("color","#E15748");
    	$("#mc").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

//验证物资类型
function checkWZLXId(){
	var wzlxId = $("#wzlx_hid").val();
	if(wzlxId==null||wzlxId==""){
	  	alert("请选择物资类型");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "new_div":
		space=340;
		break;
	case "new_div_table":
	case "panel_window":
	case "wzlx_tab":
		space=355;
		break;
	case "select_wzlx_dialog_div":
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
	var editDivWidth=$("#select_wzlx_div").css("width");
	editDivWidth=editDivWidth.substring(0,editDivWidth.length-2);
	var pwWidth=$(".panel.window").css("width");
	pwWidth=pwWidth.substring(0,pwWidth.length-2);
	return ((editDivWidth-pwWidth)/2)+"px";
}
</script>
<title>创建</title>
</head>
<body>
	
<!-- 选择物资类型 start -->
<div class="select_wzlx_bg_div" id="select_wzlx_bg_div">
	<div class="select_wzlx_div" id="select_wzlx_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectWZLXDialog(0)">X</span>
		</div>
		<div id="select_wzlx_dialog_div">
			<div id="toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">名称：</span>
				<input type="text" id="mc_inp" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="wzlx_tab"></table>
		</div>
	</div>
</div>
<!-- 选择物资类型 end -->
	
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">物资管理-创建</div>
	
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
				物资类型
			</td>
			<td style="width:30%;">
				<input type="hidden" id="wzlx_hid"/>
				<span id="wzlxmc_span" style="cursor: pointer;" onclick="openSelectWZLXDialog(1)">请选择物资类型</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				编辑时间
			</td>
			<td>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</div>
</div>
</body>
</html>