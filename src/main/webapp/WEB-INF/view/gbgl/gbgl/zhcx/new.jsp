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

.select_wlxx_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_wlxx_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_wlxx_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_wlxx_div .xzst_span{
	margin-left: 30px;
}
.select_wlxx_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var ndNum=0;

var glddpzdNum=1;
var sglddpzdNum=2;
var dglddpzjbsxzdNum=3;

var wlxxdNum=4;
var swlxxdNum=5;
var ewlxxjbsxzdNum=6;
var fhdwdNum=7;
var sfhdwdNum=8;
var efhdwjbsxzdNum=9;
var shdwdNum=10;
var sshdwdNum=11;
var eshdwjbsxzdNum=12;
var cycldNum=13;
var scycldNum=14;
var ecycldNum=15;
var cysjdNum=16;
var scysjdNum=17;
$(function(){
	initNewDialog();//0
	
	initGLDDPZDialog();//1.关联订单皮窗口
	initSelectGLDDPZDialog();//2.选择运输商窗口
	//initDetailGLDDPZJBSXZDialog();//3.查看关联订单皮重窗口
	
	//initWLXXDialog();//4.物料信息窗口
	//initSelectWLXXDialog();//5.选择物料信息窗口
	//initEditWLXXJBSXZDialog();//6.修改物料信息窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//新字段组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	//关联订单皮重
	var glddpzdpw=$("body").find(".panel.window").eq(glddpzdNum);
	var glddpzdws=$("body").find(".window-shadow").eq(glddpzdNum);

	//选择关联订单皮重
	var syssdpw=$("body").find(".panel.window").eq(sglddpzdNum);
	var syssdws=$("body").find(".window-shadow").eq(sglddpzdNum);

	//查看关联订单皮重
	var dglddpzjbsxzdpw=$("body").find(".panel.window").eq(dglddpzjbsxzdNum);
	var dglddpzjbsxzdws=$("body").find(".window-shadow").eq(dglddpzjbsxzdNum);

	//物料信息
	var wlxxdpw=$("body").find(".panel.window").eq(wlxxdNum);
	var wlxxdws=$("body").find(".window-shadow").eq(wlxxdNum);

	//选择物料信息
	var swlxxdpw=$("body").find(".panel.window").eq(swlxxdNum);
	var swlxxdws=$("body").find(".window-shadow").eq(swlxxdNum);

	//修改物料信息
	var ewlxxjbsxdpw=$("body").find(".panel.window").eq(ewlxxjbsxzdNum);
	var ewlxxjbsxdws=$("body").find(".window-shadow").eq(ewlxxjbsxzdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	
	ccDiv.append(glddpzdpw);
	ccDiv.append(glddpzdws);

	ccDiv.append(wlxxdpw);
	ccDiv.append(wlxxdws);

	var syssDiv=$("#select_yss_div");
	syssDiv.append(syssdpw);
	syssDiv.append(syssdws);

	var dglddpzdDiv=$("#detail_glddpz_dialog_div");
	dglddpzdDiv.append(dglddpzjbsxzdpw);
	dglddpzdDiv.append(dglddpzjbsxzdws);

	var swlxxDiv=$("#select_wlxx_div");
	swlxxDiv.append(swlxxdpw);
	swlxxDiv.append(swlxxdws);

	var ewlxxdDiv=$("#edit_wlxx_dialog_div");
	ewlxxdDiv.append(ewlxxjbsxdpw);
	ewlxxdDiv.append(ewlxxjbsxdws);
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("body","new_div"),
		height:380,
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
	for(var i=0;i<4;i++){
		$("#new_div table tr").eq(i).css("height","45px");
	}
	$("#new_div table tr").eq(4).css("height","90px");

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

	initBJSJDB();
	initLXLXCBB();
	initNewDivDDZTCBB();
	initJHYSRQDB();
}

function initBJSJDB(){
	bjsjDB=$('#bjsj_db').datebox({
		width:160,
        required:false,
        disabled:true
    });
	bjsjDB.datebox('textbox').attr('placeholder', '无需选填');
}

function initJHYSRQDB(){
	jhysrqDB=$('#jhysrq_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#jhysrq").val(jhysrqDB.datebox("getValue"));
        }
    });
	jhysrqDB.datebox('textbox').attr('placeholder', '请选择计划运输日期');
}

function initLXLXCBB(){
	lxlxCBB=$("#lxlx_cbb").combobox({
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

function initNewDivDDZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择订单状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			jbxxDDZTCBB=$("#new_div #ddzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data
			});
		}
	,"json");
}

function initGLDDPZDialog(){
	dialogTop+=420;//230
	glddpzDialog=$("#glddpz_div").dialog({
		title:"关联订单皮重",
		width:setFitWidthInParent("body","glddpz_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(glddpzdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(glddpzdNum).css("margin-top","20px");
	$(".panel.window").eq(glddpzdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(glddpzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(glddpzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(glddpzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(glddpzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(glddpzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(glddpzdNum).css("width","1000px");
	$(".window-shadow").eq(glddpzdNum).css("margin-top","20px");
	$(".window-shadow").eq(glddpzdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(glddpzdNum).css("border-color","#ddd");

	initGLDDPZTab();
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

function initGLDDPZTab(){
	glddpzChooseLB=$("#glddpz_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectYSSDialog(1);
		}
	});
	
	glddpzTab=$("#glddpz_tab").datagrid({
		toolbar:"#glddpz_toolbar",
		width:setFitWidthInParent("body","yss_tab"),
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
	loadGLDDPZTabData([]);
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
	loadWLXXTabData([]);
}

function initSelectGLDDPZDialog(){
	selectYSSDialog=$("#select_glddpz_dialog_div").dialog({
		title:"订单列表",
		width:setFitWidthInParent("#select_glddpz_div","select_glddpz_dialog_div"),
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
	
	$(".panel.window").eq(sglddpzdNum).css("width","983px");
	$(".panel.window").eq(sglddpzdNum).css("margin-top","20px");
	$(".panel.window").eq(sglddpzdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sglddpzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sglddpzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sglddpzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sglddpzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sglddpzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sglddpzdNum).css("width","1000px");
	$(".window-shadow").eq(sglddpzdNum).css("margin-top","20px");
	$(".window-shadow").eq(sglddpzdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sglddpzdNum).css("border-color","#ddd");

	$("#select_glddpz_dialog_div #cancel_but").css("left","30%");
	$("#select_glddpz_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_glddpz_dialog_div #save_but").css("left","45%");
	$("#select_glddpz_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectYSSTab();
	openSelectYSSDialog(0);
}

function initDetailGLDDPZJBSXZDialog(){
	detailGLDDPZDialog=$("#detail_glddpz_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_glddpz_div","detail_glddpz_jbsxz_dialog_div"),
		height:231,
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

	$("#detail_yss_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_glddpz_div","detail_glddpz_jbsxz_dialog_div"))+"px");
	$("#detail_yss_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_yss_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_yss_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_yss_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_yss_jbsxz_dialog_div table tr").css("height","45px");

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

function initSelectWLXXDialog(){
	selectWLXXDialog=$("#select_wlxx_dialog_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("#select_wlxx_div","select_wlxx_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
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

	$("#select_wlxx_dialog_div #cancel_but").css("left","30%");
	$("#select_wlxx_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_wlxx_dialog_div #save_but").css("left","45%");
	$("#select_wlxx_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectWLXXTab();
	openSelectWLXXDialog(0);
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

function initSelectWLXXTab(){
	$("#select_wlxx_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var mc=$("#select_wlxx_toolbar #mc_inp").val();
			selectYSSTab.datagrid("load",{mc:mc});
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

function deleteYSSTabRow(){
	yssTab.datagrid("deleteRow",0);
	loadGLDDPZTabData([]);
}

function deleteWLXXTabRow(){
	wlxxTab.datagrid("deleteRow",0);
	loadWLXXTabData([]);
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

function openSelectWLXXDialog(flag){
	if(flag==1){
		$("#select_wlxx_bg_div").css("display","block");
		$("#select_wlxx_bg_div").css("z-index",showZIndex);
		selectWLXXDialog.dialog("open");
	}
	else{
		$("#select_wlxx_bg_div").css("display","none");
		$("#select_wlxx_bg_div").css("z-index","9016");
		selectWLXXDialog.dialog("close");
	}
}

function loadGLDDPZTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		glddpzChooseLB.linkbutton("disable");
	else
		glddpzChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	glddpzTab.datagrid('loadData',obj);
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

function checkNew(){
	if(checkJHYSRQ()){
		if(checkYZXZL()){
			if(checkLXLX()){
				if(checkYSSId()){
					if(checkWLXXId()){
						if(checkFHDWId()){
							if(checkSHDWId()){
								if(checkCYCLId()){
									if(checkCYSJId()){
										newDingDanZongHeGuanLi();
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

function newDingDanZongHeGuanLi(){
	var sjzl=$("#new_div #sjzl").val();
	var ddztId=jbxxDDZTCBB.combobox("getValue");
	var jhysrq=jhysrqDB.datebox("getValue");
	var yzxzl=$("#new_div #yzxzl").val();
	var sjzl=$("#new_div #sjzl").val();
	var lxlx=lxlxCBB.combobox("getValue");
	var yssId=yssTab.datagrid("getData").rows[0].id;
	var wlxxId=wlxxTab.datagrid("getData").rows[0].id;
	var fhdwId=fhdwTab.datagrid("getData").rows[0].id;
	var shdwId=shdwTab.datagrid("getData").rows[0].id;
	var cyclId=cyclTab.datagrid("getData").rows[0].id;
	var cysjId=cysjTab.datagrid("getData").rows[0].id;
	var bz=$("#new_div #bz").val();
	
	$.post(path+"main/newDingDanZongHeGuanLi",
		{sjzl:sjzl,ddztId:ddztId,jhysrq:jhysrq,yzxzl:yzxzl,sjzl:sjzl,lxlx:lxlx,yssId:yssId,wlxxId:wlxxId,fhdwId:fhdwId,shdwId:shdwId,cyclId:cyclId,cysjId:cysjId,bz:bz},
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

//验证计划运输日期
function checkJHYSRQ(){
	var jhysrq = jhysrqDB.datebox("getValue");
	if(jhysrq==null||jhysrq==""){
	  	alert("请选择计划运输日期");
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

//验证流向类型
function checkLXLX(){
	var lxlx=lxlxCBB.combobox("getValue");
	if(lxlx==null||lxlx==""){
	  	alert("请选择流向类型");
	  	return false;
	}
	else
		return true;
}

//验证运输商
function checkYSSId(){
	var yssTabData=yssTab.datagrid("getData");
	var total=yssTabData.total;
	var yssId=null;
	if(total>0)
		yssId=yssTabData.rows[0].id;
	
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
	case "glddpz_div":
	case "select_glddpz_tab":
	case "wlxx_div":
	case "select_wlxx_tab":
	case "edit_wlxx_div":
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
	case "glddpz_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "select_glddpz_dialog_div":
	case "detail_glddpz_jbsxz_dialog_div":
	case "select_wlxx_dialog_div":
	case "edit_wlxx_jbsxz_dialog_div":
	case "select_fhdw_dialog_div":
	case "edit_fhdw_jbsxz_dialog_div":
	case "select_shdw_dialog_div":
	case "edit_shdw_jbsxz_dialog_div":
	case "select_cycl_dialog_div":
	case "edit_cycl_jbsxz_dialog_div":
	case "select_cysj_dialog_div":
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
<title>创建</title>
</head>
<body>

<!-- 选择关联订单皮重 start -->
<div class="select_glddpz_bg_div" id="select_glddpz_bg_div">
	<div class="select_glddpz_div" id="select_glddpz_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectYSSDialog(0)">X</span>
		</div>
		<div id="select_glddpz_dialog_div">
			<div id="select_yss_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">名称：</span>
				<input type="text" id="mc_inp" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_yss_tab"></table>
		</div>
	</div>
</div>
<!-- 选择关联订单皮重 end -->

<!-- 查看关联订单皮重 start -->
<div class="detail_glddpz_bg_div" id="detail_glddpz_bg_div">
	<div class="detail_glddpz_div" id="detail_glddpz_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailGLDDPZDialog(0)">X</span>
		</div>
		<div class="detail_glddpz_dialog_div" id="detail_glddpz_dialog_div">
			<div class="title_div">
				<span class="title_span">综合管理-关联订单皮重-查看</span>
			</div>
			<div id="detail_glddpz_jbsxz_dialog_div">
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
<!--查看关联订单皮重 end -->

<!-- 选择物料信息 start -->
<div class="select_wlxx_bg_div" id="select_wlxx_bg_div">
	<div class="select_wlxx_div" id="select_wlxx_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectWLXXDialog(0)">X</span>
		</div>
		<div id="select_wlxx_dialog_div">
			<div id="select_wlxx_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">名称：</span>
				<input type="text" id="mc_inp" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_wlxx_tab"></table>
		</div>
	</div>
</div>
<!-- 选择物料信息 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">综合查询-创建</div>

	<div id="new_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<input type="text" id="ddh" name="ddh" placeholder="无需输入" disabled="disabled" style="width: 180px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				预装卸重量
			</td>
			<td style="width:30%;">
				<input type="number" id="yzxzl" name="yzxzl" placeholder="请输入预装卸重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				流向类型
			</td>
			<td style="width:30%;">
				<input id="lxlx_cbb"/>
				<input type="hidden" id="lxlx" name="lxlx"/>
			</td>
			<td align="right" style="width:15%;">
				编辑时间
			</td>
			<td style="width:30%;">
				<input id="bjsj_db"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				二维码
			</td>
			<td>
			
			</td>
			<td align="right">
				实际重量
			</td>
			<td>
				<input type="number" id="sjzl" name="sjzl" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				重量差额比
			</td>
			<td>
				<input type="number" id="zlceb" name="zlceb" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				订单状态
			</td>
			<td>
				<input id="ddzt_cbb"/>
				<input type="hidden" id="ddztId" name="ddztId"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				计划运输日期
			</td>
			<td>
				<input id="jhysrq_db"/>
				<input type="hidden" id="jhysrq" name="jhysrq"/>
			</td>
			<td align="right">
				备注
			</td>
			<td>
				<textarea id="bz" name="bz" rows="3" cols="15"></textarea>
			</td>
		  </tr>
		</table>
	</form>
	</div>

	<div id="glddpz_div">
		<div id="glddpz_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="glddpz_tab"></table>
	</div>

	<div id="wlxx_div">
		<div id="wlxx_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="wlxx_tab"></table>
	</div>
</div>
</body>
</html>