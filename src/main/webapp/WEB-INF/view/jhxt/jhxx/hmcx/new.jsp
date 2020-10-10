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
	position: fixed;
	z-index: 9016;
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
	position: fixed;
	z-index: 9010;
	display:none;
}
.edit_sssj_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	overflow-y: scroll;
	position: absolute;
	left: 0;
	right: 0;
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

.detail_sssj_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9010;
	display:none;
}
.detail_sssj_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	overflow-y: scroll;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_sssj_div .ckst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_sssj_div .ckst_span{
	margin-left: 30px;
}
.detail_sssj_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_sssj_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_sssj_div .title_span{
	margin-left: 30px;
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
	overflow-y: scroll;
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
var ndNum=0;
var sssjdNum=1;//所属司机
var ssssjdNum=2;//选择所属司机
var esssjjbxxdNum=3;//编辑所属司机的基本信息
var esssjzjjsdNum=4;//编辑所属司机的直接角色
var dsssjjbxxdNum=5;//查看所属司机的基本信息
var dsssjzjjsdNum=6;//查看所属司机的直接角色
var ssdldNum=7;//所属队列
var sssdldNum=8;//选择所属队列
var dssdljbsxzNum=9;//查看所属队列基本属性组
var dssdlshdwdNum=10;//查看所属队列收货单位

$(function(){
	initNewDialog();//0
	
	initSSSJDialog();//1.所属司机窗口
	initSelectSSSJDialog();//2.选择所属司机窗口
	
	initEditSSSJJBXXDialog();//3.修改所属司机基本信息窗口
	initEditSSSJZJJSDialog();//4.修改所属司机直接角色窗口
	
	initDetailSSSJJBXXDialog();//5.查看所属司机基本信息窗口
	initDetailSSSJZJJSDialog();//6.查看所属司机直接角色窗口
	
	initSSDLDialog();//7.所属队列窗口
	initSelectSSDLDialog();//8.选择所属队列窗口
	
	initDetailSSDLJBSXZDialog();//9.查看所属队列基本属性组窗口
	initDetailSSDLSHDWDialog();//10.查看所属队列收货单位窗口
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//新字段组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);
	
	//所属司机
	var sssjdpw=$("body").find(".panel.window").eq(sssjdNum);
	var sssjdws=$("body").find(".window-shadow").eq(sssjdNum);
	
	//选择所属司机
	var ssssjdpw=$("body").find(".panel.window").eq(ssssjdNum);
	var ssssjdws=$("body").find(".window-shadow").eq(ssssjdNum);
	
	//编辑所属司机
	var esssjdpw=$("body").find(".panel.window").eq(esssjjbxxdNum);
	var esssjdws=$("body").find(".window-shadow").eq(esssjjbxxdNum);
	var ezjjsdpw=$("body").find(".panel.window").eq(esssjzjjsdNum);
	var ezjjsdws=$("body").find(".window-shadow").eq(esssjzjjsdNum);
	
	//查看所属司机
	var dsssjdpw=$("body").find(".panel.window").eq(dsssjjbxxdNum);
	var dsssjdws=$("body").find(".window-shadow").eq(dsssjjbxxdNum);
	var dzjjsdpw=$("body").find(".panel.window").eq(dsssjzjjsdNum);
	var dzjjsdws=$("body").find(".window-shadow").eq(dsssjzjjsdNum);
	
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
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	
	ccDiv.append(sssjdpw);
	ccDiv.append(sssjdws);
	
	ccDiv.append(ssdldpw);
	ccDiv.append(ssdldws);
	
	var ssssjDiv=$("#select_sssj_div");
	ssssjDiv.append(ssssjdpw);
	ssssjDiv.append(ssssjdws);
	
	var esDiv=$("#edit_sssj_div");
	esDiv.append(esssjdpw);
	esDiv.append(esssjdws);
	
	esDiv.append(ezjjsdpw);
	esDiv.append(ezjjsdws);
	
	var dsssjDiv=$("#detail_sssj_div");
	dsssjDiv.append(dsssjdpw);
	dsssjDiv.append(dsssjdws);
	
	dsssjDiv.append(dzjjsdpw);
	dsssjDiv.append(dzjjsdws);

	var sssdlDiv=$("#select_ssdl_div");
	sssdlDiv.append(sssdldpw);
	sssdlDiv.append(sssdldws);

	var dssdlDiv=$("#detail_ssdl_div");
	dssdlDiv.append(dssdldpw);
	dssdlDiv.append(dssdldws);
	
	dssdlDiv.append(dshdwdpw);
	dssdlDiv.append(dshdwdws);
	
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
            	var str="<a onclick=\"deleteSSSJTabRow()\">删除</a>"
            		+"&nbsp;|&nbsp;<a onclick=\"editSSSJTabRow()\">编辑</a>"
            		+"&nbsp;|&nbsp;<a onclick=\"detailSSSJTabRow()\">查看</a>";
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

function deleteSSSJTabRow(){
	sssjTab.datagrid("deleteRow",0);
	loadSSSJTabData([]);
}

function editSSSJTabRow(){
	var row=sssjTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#edit_sssj_jbxx_dialog_div #id").val(row.id);
	$("#edit_sssj_jbxx_dialog_div #yhm").val(row.yhm);
	$("#edit_sssj_jbxx_dialog_div #nc").val(row.nc);
	$("#edit_sssj_jbxx_dialog_div #sm").val(row.sm);
	$("#edit_sssj_jbxx_dialog_div #ysmm").val(row.ysmm);
	$("#edit_sssj_jbxx_dialog_div #js").val(row.js);
	openEditSSSJDialog(1);
}

function detailSSSJTabRow(){
	var row=sssjTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_sssj_jbxx_dialog_div #id").text(row.id);
	$("#detail_sssj_jbxx_dialog_div #yhm").text(row.yhm);
	$("#detail_sssj_jbxx_dialog_div #nc").text(row.nc);
	$("#detail_sssj_jbxx_dialog_div #sm").text(row.sm);
	$("#detail_sssj_jbxx_dialog_div #ysmm").text(row.ysmm);
	$("#detail_sssj_jbxx_dialog_div #js").text(row.js);
	openDetailSSSJDialog(1);
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

function initEditSSSJJBXXDialog(){
	editSSSJDialog=$("#edit_sssj_jbxx_dialog_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("#edit_sssj_div","edit_sssj_jbxx_dialog_div"),
		height:331,
		top:60,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditSSSJDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editSSSJ();
           }}
        ]
	});

	$("#edit_sssj_jbxx_dialog_div table").css("width",(setFitWidthInParent("#edit_sssj_div","edit_sssj_jbxx_dialog_div"))+"px");
	$("#edit_sssj_jbxx_dialog_div table").css("magin","-100px");
	$("#edit_sssj_jbxx_dialog_div table td").css("padding-left","50px");
	$("#edit_sssj_jbxx_dialog_div table td").css("padding-right","20px");
	$("#edit_sssj_jbxx_dialog_div table td").css("font-size","15px");
	$("#edit_sssj_jbxx_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(esssjjbxxdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(esssjjbxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(esssjjbxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(esssjjbxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(esssjjbxxdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(esssjjbxxdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(esssjjbxxdNum).css("border-color","#ddd");

	$("#edit_sssj_jbxx_dialog_div #cancel_but").css("left","30%");
	$("#edit_sssj_jbxx_dialog_div #cancel_but").css("position","absolute");

	$("#edit_sssj_jbxx_dialog_div #ok_but").css("left","45%");
	$("#edit_sssj_jbxx_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditSSSJJBXXDialog(0);
	//$(".panel.window").eq(esssjjbxxdNum).css("z-index","9010");
}

function editSSSJ(){
	var id=$("#edit_sssj_jbxx_dialog_div #id").val();
	var yhm=$("#edit_sssj_jbxx_dialog_div #yhm").val();
	var bjsj=$("#edit_sssj_jbxx_dialog_div #bjsj").text();
	var rows=[{gx:"1",yhm:yhm,bjsj:bjsj,id:id}];
	loadSSSJTabData(rows);
	openEditSSSJJBXXDialog(0);
}

function openEditSSSJJBXXDialog(flag){
	if(flag==1){
		editSSSJDialog.dialog("open");
	}
	else{
		editSSSJDialog.dialog("close");
	}
}

function initEditSSSJZJJSDialog(){
	editSSSJZJJSDialog=$("#edit_sssj_zjjs_dialog_div").dialog({
		title:"直接角色",
		width:setFitWidthInParent("#edit_sssj_div","edit_sssj_zjjs_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:435,
		left:20,
	});

	$(".panel.window").eq(esssjzjjsdNum).css("width",(setFitWidthInParent("#edit_sssj_div","edit_sssj_zjjs_dialog_div"))+"px");
	$(".panel.window").eq(esssjzjjsdNum).css("margin-top","20px");
	//$(".panel.window").eq(esssjzjjsdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(esssjzjjsdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(esssjzjjsdNum).css("color","#000");
	$(".panel.window .panel-title").eq(esssjzjjsdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(esssjzjjsdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(esssjzjjsdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(esssjzjjsdNum).css("width",(setFitWidthInParent("#edit_sssj_div","edit_sssj_zjjs_dialog_div"))+"px");
	$(".window-shadow").eq(esssjzjjsdNum).css("width","1000px");
	$(".window-shadow").eq(esssjzjjsdNum).css("margin-top","20px");
	$(".window-shadow").eq(esssjzjjsdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(esssjzjjsdNum).css("border-color","#ddd");

	initEditZJJSTab();
	openEditSSSJZJJSDialog(0);
}

function initEditZJJSTab(){
	editZJJSTab=$("#edit_zjjs_tab").datagrid({
		url:path+"main/queryJueSeByIds",
		width:setFitWidthInParent("#edit_sssj_div","edit_zjjs_tab"),
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

function openEditSSSJZJJSDialog(flag){
	if(flag==1){
		editSSSJZJJSDialog.dialog("open");
	}
	else{
		editSSSJZJJSDialog.dialog("close");
	}
}

function initDetailSSSJJBXXDialog(){
	detailSSSJDialog=$("#detail_sssj_jbxx_dialog_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("#detail_sssj_div","detail_sssj_jbxx_dialog_div"),
		height:331,
		top:60,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailSSSJDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   openDetailSSSJDialog(0);
           }}
        ]
	});

	$("#detail_sssj_jbxx_dialog_div table").css("width",(setFitWidthInParent("#detail_sssj_div","detail_sssj_jbxx_dialog_div"))+"px");
	$("#detail_sssj_jbxx_dialog_div table").css("magin","-100px");
	$("#detail_sssj_jbxx_dialog_div table td").css("padding-left","50px");
	$("#detail_sssj_jbxx_dialog_div table td").css("padding-right","20px");
	$("#detail_sssj_jbxx_dialog_div table td").css("font-size","15px");
	$("#detail_sssj_jbxx_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dsssjjbxxdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dsssjjbxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dsssjjbxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dsssjjbxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dsssjjbxxdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dsssjjbxxdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(dsssjjbxxdNum).css("border-color","#ddd");

	$("#detail_sssj_jbxx_dialog_div #cancel_but").css("left","30%");
	$("#detail_sssj_jbxx_dialog_div #cancel_but").css("position","absolute");

	$("#detail_sssj_jbxx_dialog_div #ok_but").css("left","45%");
	$("#detail_sssj_jbxx_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSSSJJBXXDialog(0);
	//$(".panel.window").eq(esssjjbxxdNum).css("z-index","9010");
}


function initDetailSSDLJBSXZDialog(){
	detailSSDLDialog=$("#detail_ssdl_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_ssdl_div","detail_ssdl_jbsxz_dialog_div"),
		height:331,
		top:60,
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
	$(".window,.window .window-body").eq(dssdljbsxzNum).css("border-color","#ddd");

	$("#detail_ssdl_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_ssdl_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_ssdl_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_ssdl_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSSDLJBSXZDialog(0);
	//$(".panel.window").eq(esssjjbxxdNum).css("z-index","9010");
}

function initDetailSSSJZJJSDialog(){
	detailSSSJZJJSDialog=$("#detail_sssj_zjjs_dialog_div").dialog({
		title:"直接角色",
		width:setFitWidthInParent("#detail_sssj_div","detail_sssj_zjjs_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:435,
		left:20,
	});

	$(".panel.window").eq(dsssjzjjsdNum).css("width",(setFitWidthInParent("#detail_sssj_div","detail_sssj_zjjs_dialog_div"))+"px");
	$(".panel.window").eq(dsssjzjjsdNum).css("margin-top","20px");
	//$(".panel.window").eq(esssjzjjsdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(dsssjzjjsdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dsssjzjjsdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dsssjzjjsdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dsssjzjjsdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dsssjzjjsdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dsssjzjjsdNum).css("width",(setFitWidthInParent("#detail_sssj_div","detail_sssj_zjjs_dialog_div"))+"px");
	$(".window-shadow").eq(dsssjzjjsdNum).css("width","1000px");
	$(".window-shadow").eq(dsssjzjjsdNum).css("margin-top","20px");
	$(".window-shadow").eq(dsssjzjjsdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dsssjzjjsdNum).css("border-color","#ddd");

	initDetailSSSJZJJSTab();
	openDetailSSSJZJJSDialog(0);
}

function initDetailSSDLSHDWDialog(){
	detailSSDLSHDWDialog=$("#detail_ssdl_shdw_dialog_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:435,
		left:20,
	});

	$(".panel.window").eq(dssdlshdwdNum).css("width",(setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"))+"px");
	$(".panel.window").eq(dssdlshdwdNum).css("margin-top","20px");
	//$(".panel.window").eq(dssdlshdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(dssdlshdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssdlshdwdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssdlshdwdNum).css("width",(setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"))+"px");
	$(".window-shadow").eq(dssdlshdwdNum).css("width","1000px");
	$(".window-shadow").eq(dssdlshdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssdlshdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssdlshdwdNum).css("border-color","#ddd");

	initDetailSSDLSHDWTab();
	openDetailSSDLSHDWDialog(0);
}

function initDetailSSSJZJJSTab(){
	detailZJJSTab=$("#detail_zjjs_tab").datagrid({
		url:path+"main/queryJueSeByIds",
		width:setFitWidthInParent("#detail_sssj_div","detail_zjjs_tab"),
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

function openDetailSSSJJBXXDialog(flag){
	if(flag==1){
		detailSSSJDialog.dialog("open");
	}
	else{
		detailSSSJDialog.dialog("close");
	}
}

function openDetailSSDLJBSXZDialog(flag){
	if(flag==1){
		detailSSDLDialog.dialog("open");
	}
	else{
		detailSSDLDialog.dialog("close");
	}
}

function openDetailSSSJZJJSDialog(flag){
	if(flag==1){
		detailSSSJZJJSDialog.dialog("open");
	}
	else{
		detailSSSJZJJSDialog.dialog("close");
	}
}

function openDetailSSDLSHDWDialog(flag){
	if(flag==1){
		detailSSDLSHDWDialog.dialog("open");
	}
	else{
		detailSSDLSHDWDialog.dialog("close");
	}
}

function initSSDLDialog(){
	dialogTop+=320;//330
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
	$(".panel.window").eq(ssdldNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(ssdldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ssdldNum).css("color","#000");
	$(".panel.window .panel-title").eq(ssdldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ssdldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ssdldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ssdldNum).css("width","1000px");
	$(".window-shadow").eq(ssdldNum).css("margin-top","20px");
	$(".window-shadow").eq(ssdldNum).css("margin-left",initWindowMarginLeft());
	
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
	loadSSDLTabData([]);
}

function deleteSSDLTabRow(){
	ssdlTab.datagrid("deleteRow",0);
	loadSSDLTabData([]);
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
	case 1:
		ztStr="在用";
		break;
	case 2:
		ztStr="暂停";
		break;
	case 3:
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
	//$(".panel.window").eq(sssdldNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sssdldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sssdldNum).css("color","#000");
	$(".panel.window .panel-title").eq(sssdldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sssdldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sssdldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sssdldNum).css("width","1000px");
	$(".window-shadow").eq(sssdldNum).css("margin-top","20px");
	$(".window-shadow").eq(sssdldNum).css("margin-left",initWindowMarginLeft());
	
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






function openEditSSSJDialog(flag){
	if(flag==1){
		$("#edit_sssj_bg_div").css("display","block");
	}
	else{
		$("#edit_sssj_bg_div").css("display","none");
	}
	openEditSSSJJBXXDialog(flag);
	openEditSSSJZJJSDialog(flag);
}

function openDetailSSSJDialog(flag){
	if(flag==1){
		$("#detail_sssj_bg_div").css("display","block");
	}
	else{
		$("#detail_sssj_bg_div").css("display","none");
	}
	openDetailSSSJJBXXDialog(flag);
	openDetailSSSJZJJSDialog(flag);
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
	case "new_div_table":
	case "panel_window":
	case "sssj_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "edit_sssj_jbxx_dialog_div":
	case "detail_sssj_jbxx_dialog_div":
	case "select_sssj_dialog_div":
	case "select_ssdl_dialog_div":
	case "detail_ssdl_jbsxz_dialog_div":
		space=50;
		break;
	case "edit_sssj_zjjs_dialog_div":
	case "detail_sssj_zjjs_dialog_div":
	case "detail_ssdl_shdw_dialog_div":
		space=60;
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
		<div id="edit_sssj_jbxx_dialog_div">
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
		
		<div id="edit_sssj_zjjs_dialog_div">
			<input type="hidden" id="id"/>
			<table id="edit_zjjs_tab"></table>
		</div>
	</div>
</div>
<!-- 编辑所属司机 end -->


<!-- 查看所属司机 start -->
<div class="detail_sssj_bg_div" id="detail_sssj_bg_div">
	<div class="detail_sssj_div" id="detail_sssj_div">
		<div class="ckst_div">
			<span class="ckst_span">查看实体</span>
			<span class="close_span" onclick="openDetailSSSJDialog(0)">X</span>
		</div>
		<div class="title_div">
			<span class="title_span">号码查询-所属司机-详情</span>
		</div>
		<div id="detail_sssj_jbxx_dialog_div">
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
		
		<div id="detail_sssj_zjjs_dialog_div">
			<input type="hidden" id="id"/>
			<table id="detail_zjjs_tab"></table>
		</div>
	</div>
</div>
<!-- 查看所属司机 end -->

<!-- 选择所属队列 start -->
<div class="select_ssdl_bg_div" id="select_ssdl_bg_div">
	<div class="select_ssdl_div" id="select_ssdl_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectSSDLDialog(0)">X</span>
		</div>
		<div id="select_ssdl_dialog_div">
			<div id="select_ssdl_toolbar" style="height:32px;line-height:32px;">
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
		<div class="title_div">
			<span class="title_span">号码查询-所属队列-详情</span>
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
<!-- 查看所属队列 end -->

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