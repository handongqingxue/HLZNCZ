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

.select_gbcl_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_gbcl_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_gbcl_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_gbcl_div .xzst_span{
	margin-left: 30px;
}
.select_gbcl_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}

.select_glddpz_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_glddpz_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_glddpz_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_glddpz_div .xzst_span{
	margin-left: 30px;
}
.select_glddpz_div .close_span{
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

.select_glddmz_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_glddmz_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_glddmz_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_glddmz_div .xzst_span{
	margin-left: 30px;
}
.select_glddmz_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
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
var ndNum=0;
var sgbcldNum=1;

var glddpzdNum=2;
var sglddpzdNum=3;
var dglddpzjbsxzdNum=4;

var glddmzdNum=5;
var sglddmzdNum=6;
var dglddmzjbsxzdNum=7;

$(function(){
	initNewDialog();//0
	
	initGLDDPZDialog();//2.关联订单皮重窗口
	initSelectGLDDPZDialog();//3.选择关联订单皮重窗口
	initDetailGLDDPZJBSXZDialog();//4.查看关联订单皮重窗口

	initGLDDMZDialog();//5.关联订单毛重窗口
	initSelectGLDDMZDialog();//6.选择关联订单毛重窗口
	initDetailGLDDMZJBSXZDialog();//7.查看关联订单毛重窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//新字段组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	//选择过磅车辆
	var sgbcldpw=$("body").find(".panel.window").eq(sgbcldNum);
	var sgbcldws=$("body").find(".window-shadow").eq(sgbcldNum);

	//关联订单皮重
	var glddpzdpw=$("body").find(".panel.window").eq(glddpzdNum);
	var glddpzdws=$("body").find(".window-shadow").eq(glddpzdNum);

	//选择关联订单皮重
	var sglddpzdpw=$("body").find(".panel.window").eq(sglddpzdNum);
	var sglddpzdws=$("body").find(".window-shadow").eq(sglddpzdNum);

	//查看关联订单皮重
	var dglddpzjbsxzdpw=$("body").find(".panel.window").eq(dglddpzjbsxzdNum);
	var dglddpzjbsxzdws=$("body").find(".window-shadow").eq(dglddpzjbsxzdNum);

	//关联订单毛重
	var glddmzdpw=$("body").find(".panel.window").eq(glddmzdNum);
	var glddmzdws=$("body").find(".window-shadow").eq(glddmzdNum);

	//选择关联订单毛重
	var sglddmzdpw=$("body").find(".panel.window").eq(sglddmzdNum);
	var sglddmzdws=$("body").find(".window-shadow").eq(sglddmzdNum);

	//查看关联订单毛重
	var dglddmzjbsxzdpw=$("body").find(".panel.window").eq(dglddmzjbsxzdNum);
	var dglddmzjbsxzdws=$("body").find(".window-shadow").eq(dglddmzjbsxzdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	
	ccDiv.append(glddpzdpw);
	ccDiv.append(glddpzdws);

	ccDiv.append(glddmzdpw);
	ccDiv.append(glddmzdws);

	var sgbclDiv=$("#select_gbcl_div");
	sgbclDiv.append(sgbcldpw);
	sgbclDiv.append(sgbcldws);

	var sglddpzDiv=$("#select_glddpz_div");
	sglddpzDiv.append(sglddpzdpw);
	sglddpzDiv.append(sglddpzdws);

	var dglddpzdDiv=$("#detail_glddpz_dialog_div");
	dglddpzdDiv.append(dglddpzjbsxzdpw);
	dglddpzdDiv.append(dglddpzjbsxzdws);

	var sglddmzDiv=$("#select_glddmz_div");
	sglddmzDiv.append(sglddmzdpw);
	sglddmzDiv.append(sglddmzdws);

	var dglddmzdDiv=$("#detail_glddmz_dialog_div");
	dglddmzdDiv.append(dglddmzjbsxzdpw);
	dglddmzdDiv.append(dglddmzjbsxzdws);
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"基本信息",
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

	initSelectGbclDialog();//1
	
	initGBBQCBB();
	initGBZTCBB();
	initGBSJDTB();
}

function initSelectGbclDialog(){
	gbclDialog=$("#select_gbcl_dialog_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("#select_gbcl_div","select_gbcl_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectGBCLDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveGBCL();
           }}
        ]
	});
	
	$(".panel.window").eq(sgbcldNum).css("width","983px");
	$(".panel.window").eq(sgbcldNum).css("margin-top","20px");
	//$(".panel.window").eq(sgbcldNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sgbcldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sgbcldNum).css("color","#000");
	$(".panel.window .panel-title").eq(sgbcldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sgbcldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sgbcldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sgbcldNum).css("width","1000px");
	$(".window-shadow").eq(sgbcldNum).css("margin-top","20px");
	//$(".window-shadow").eq(sgbcldNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sgbcldNum).css("border-color","#ddd");

	$("#select_gbcl_dialog_div #cancel_but").css("left","30%");
	$("#select_gbcl_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_gbcl_dialog_div #save_but").css("left","45%");
	$("#select_gbcl_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initGBCLTab();
	openSelectGBCLDialog(0);
}

function initGBCLTab(){
	initGBCLCLLXCBB();
	initGBCLSFZYCBB();
	initGBCLSHZTCBB();
	initGBCLSearchLB();
	
	gbclTab=$("#gbcl_tab").datagrid({
		url:path+"main/queryCheLiangList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body","select_gbcl_div"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"cph",title:"车牌号",width:200},
            {field:"ppxh",title:"品牌型号",width:200},
			{field:"fdjhm",title:"发动机号码",width:200},
			{field:"clsbdm",title:"车辆识别代号",width:200},
			{field:"zcrq",title:"注册日期",width:200},
			{field:"pfjd",title:"排放阶段",width:200,formatter:function(value){
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
			{field:"fzrq",title:"发证日期",width:200},
			{field:"sfzy",title:"是否在用",width:200,formatter:function(value){
				return value?"是":"否";
			}},
			{field:"bz",title:"备注",width:200},
			{field:"shzt",title:"状态",width:200,formatter:function(value){
				var str;
				switch (value) {
				case 1:
					str="待审核";
					break;
				case 2:
					str="审核通过";
					break;
				case 3:
					str="编辑中";
					break;
				}
				return str;
			}}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{cph:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"cph",colspan:10});
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
			//reSizeCol();
		}
	});
}

function initGBBQCBB(){
	gbclGbbqCBB=$("#gbclGbbq_cbb").combobox({
		valueField:"value",
		textField:"text",
		multiple:true,
		data:[{"value":"1","text":"入厂"},{"value":"2","text":"出厂"},{"value":"3","text":"皮重"},{"value":"4","text":"载重"}],
		onSelect:function(){
			$("#new_div #gbbq").val($(this).combobox("getValue"));
		}
	});
}

function initGBZTCBB(){
	gbztCBB=$("#gbzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择过磅状态"},{"value":"1","text":"正常"},{"value":"2","text":"异常"}],
		onSelect:function(){
			$("#new_div #gbzt").val($(this).combobox("getValue"));
		}
	});
}

function initGBSJDTB(){
	gbsjDTB=$('#gbsj_dtb').datetimebox({
		width:160,
        required:false,
        onChange:function(){
        	$("#gbsj").val(gbsjDTB.datetimebox("getValue"));
        }
    });
	gbsjDTB.datetimebox('textbox').attr('placeholder', '请选择过磅时间');
}

function initGLDDPZDialog(){
	dialogTop+=340;//230
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

function initGLDDPZTab(){
	glddpzChooseLB=$("#glddpz_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectGLDDPZDialog(1);
		}
	});
	
	glddpzTab=$("#glddpz_tab").datagrid({
		toolbar:"#glddpz_toolbar",
		width:setFitWidthInParent("body","glddpz_tab"),
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
            {field:"sjzl",title:"实际重量",width:200,align:"center"},
            {field:"zlceb",title:"重量差额比",width:200,align:"center"},
            {field:"lxlx",title:"流向类型",width:200,align:"center",formatter:function(value,row){
            	var str;
				switch (value) {
				case 1:
					str="送运";
					break;
				case 2:
					str="取运";
					break;
				}
				return str;
            }},
            {field:"yzxzl",title:"预装卸重量",width:200,align:"center"},
            {field:"ddzt",title:"订单状态",width:200,align:"center"},
			{field:"wybm",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showGLDDPZDetail()\">查看</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteGLDDPZTabRow()\">删除</a>";
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
	loadGLDDPZTabData([]);
}

function initSelectGLDDPZDialog(){
	selectGLDDPZDialog=$("#select_glddpz_dialog_div").dialog({
		title:"订单列表",
		width:setFitWidthInParent("#select_glddpz_div","select_glddpz_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectGLDDPZDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectGLDDPZ();
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
	
	initSelectGLDDPZTab();
	openSelectGLDDPZDialog(0);
}

function initSelectGLDDPZTab(){
	$("#select_glddpz_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#select_glddpz_toolbar #ddh_inp").val();
			var cph=$("#select_glddpz_toolbar #cph_inp").val();
			var zxztId=sglddpzZxztCBB.combobox("getValue");
			selectGLDDPZTab.datagrid("load",{ddh:ddh,ddztId:zxztId,cph:cph});
		}
	});
	
	selectGLDDPZTab=$("#select_glddpz_tab").datagrid({
		url:path+"main/queryDDGLZHGLList",
		toolbar:"#select_glddpz_toolbar",
		width:setFitWidthInParent("body","select_glddpz_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"ddh",title:"订单号",width:200,align:"center"},
			{field:"cph",title:"车牌号",width:200,align:"center"},
			{field:"lxlx",title:"流向类型",width:200,align:"center",formatter:function(value){
				var str;
				switch (value) {
				case 1:
					str="送运";
					break;
				case 2:
					str="取运";
					break;
				}
				return str;
			}},
			{field:"yzxzl",title:"预装卸重量",width:200,align:"center"},
			{field:"ddztmc",title:"状态",width:200,align:"center"}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:5});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	initSGLDDPZZXZTCBB();
}

function initSGLDDPZZXZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择执行状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			sglddpzZxztCBB=$("#select_glddpz_toolbar #zxzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				multiple:true,
				data:data
			});
		}
	,"json");
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
		width:setFitWidthInParent("body","glddmz_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(glddmzdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(glddmzdNum).css("margin-top","20px");
	$(".panel.window").eq(glddmzdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(glddmzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(glddmzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(glddmzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(glddmzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(glddmzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(glddmzdNum).css("width","1000px");
	$(".window-shadow").eq(glddmzdNum).css("margin-top","20px");
	$(".window-shadow").eq(glddmzdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(glddmzdNum).css("border-color","#ddd");

	initGLDDMZTab();
}

function initGLDDMZTab(){
	glddmzChooseLB=$("#glddmz_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectGLDDMZDialog(1);
		}
	});
	
	glddmzTab=$("#glddmz_tab").datagrid({
		toolbar:"#glddmz_toolbar",
		width:setFitWidthInParent("body","glddmz_tab"),
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
            {field:"sjzl",title:"实际重量",width:200,align:"center"},
            {field:"zlceb",title:"重量差额比",width:200,align:"center"},
            {field:"lxlx",title:"流向类型",width:200,align:"center",formatter:function(value,row){
            	var str;
				switch (value) {
				case 1:
					str="送运";
					break;
				case 2:
					str="取运";
					break;
				}
				return str;
            }},
            {field:"yzxzl",title:"预装卸重量",width:200,align:"center"},
            {field:"ddzt",title:"订单状态",width:200,align:"center"},
			{field:"wybm",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showGLDDMZDetail()\">查看</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteGLDDMZTabRow()\">删除</a>";
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
	loadGLDDMZTabData([]);
}

function initSelectGLDDMZDialog(){
	selectGLDDMZDialog=$("#select_glddmz_dialog_div").dialog({
		title:"订单列表",
		width:setFitWidthInParent("#select_glddmz_div","select_glddmz_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectGLDDMZDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectGLDDMZ();
           }}
        ]
	});
	
	$(".panel.window").eq(sglddmzdNum).css("width","983px");
	$(".panel.window").eq(sglddmzdNum).css("margin-top","20px");
	$(".panel.window").eq(sglddmzdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sglddmzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sglddmzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sglddmzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sglddmzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sglddmzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sglddmzdNum).css("width","1000px");
	$(".window-shadow").eq(sglddmzdNum).css("margin-top","20px");
	$(".window-shadow").eq(sglddmzdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sglddmzdNum).css("border-color","#ddd");

	$("#select_glddmz_dialog_div #cancel_but").css("left","30%");
	$("#select_glddmz_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_glddmz_dialog_div #save_but").css("left","45%");
	$("#select_glddmz_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectGLDDMZTab();
	openSelectGLDDMZDialog(0);
}

function initSelectGLDDMZTab(){
	$("#select_glddmz_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#select_glddmz_toolbar #ddh_inp").val();
			var cph=$("#select_glddmz_toolbar #cph_inp").val();
			var zxztId=sglddmzZxztCBB.combobox("getValue");
			selectGLDDMZTab.datagrid("load",{ddh:ddh,ddztId:zxztId,cph:cph});
		}
	});
	
	selectGLDDMZTab=$("#select_glddmz_tab").datagrid({
		url:path+"main/queryDDGLZHGLList",
		toolbar:"#select_glddmz_toolbar",
		width:setFitWidthInParent("body","select_glddmz_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"ddh",title:"订单号",width:200,align:"center"},
			{field:"cph",title:"车牌号",width:200,align:"center"},
			{field:"lxlx",title:"流向类型",width:200,align:"center",formatter:function(value){
				var str;
				switch (value) {
				case 1:
					str="送运";
					break;
				case 2:
					str="取运";
					break;
				}
				return str;
			}},
			{field:"yzxzl",title:"预装卸重量",width:200,align:"center"},
			{field:"ddztmc",title:"状态",width:200,align:"center"}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:5});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	initSGLDDMZZXZTCBB();
}

function initSGLDDMZZXZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择执行状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			sglddmzZxztCBB=$("#select_glddmz_toolbar #zxzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				multiple:true,
				data:data
			});
		}
	,"json");
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

function initGBCLCLLXCBB(){
	gbclCllxCBB=$("#gbclCllx").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"重型"}]
	});
}

function initGBCLSFZYCBB(){
	gbclSfzyCBB=$("#gbclSfzy").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择是否在用"},{"value":"1","text":"是"},{"value":"0","text":"否"}]
	});
}

function initGBCLSHZTCBB(){
	gbclShztCBB=$("#gbclShzt").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择审核状态"},{"value":"1","text":"待审核 "},{"value":"2","text":"审核通过"},{"value":"3","text":"编辑中"}]
	});
}

function initGBCLSearchLB(){
	$("#gbclSearch_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var cph=$("#select_gbcl_div #toolbar #cph").val();
			var cllx=gbclCllxCBB.combobox("getValue");
			var sfzy=gbclSfzyCBB.combobox("getValue");
			var shzt=gbclShztCBB.combobox("getValue");
			var bz=$("#select_gbcl_div #toolbar #bz").val();
			gbclTab.datagrid("load",{cph:cph,cllx:cllx,sfzy:sfzy,shzt:shzt,bz:bz});
		}
	});
}

function loadGLDDMZTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		glddmzChooseLB.linkbutton("disable");
	else
		glddmzChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	glddmzTab.datagrid('loadData',obj);
}

function deleteGLDDPZTabRow(){
	glddpzTab.datagrid("deleteRow",0);
	loadGLDDPZTabData([]);
}

function deleteGLDDMZTabRow(){
	glddmzTab.datagrid("deleteRow",0);
	loadGLDDMZTabData([]);
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

function openSelectGLDDPZDialog(flag){
	if(flag==1){
		$("#select_glddpz_bg_div").css("display","block");
		$("#select_glddpz_bg_div").css("z-index",showZIndex);
		selectGLDDPZDialog.dialog("open");
	}
	else{
		$("#select_glddpz_bg_div").css("display","none");
		$("#select_glddpz_bg_div").css("z-index","9016");
		selectGLDDPZDialog.dialog("close");
	}
}

function openSelectGLDDMZDialog(flag){
	if(flag==1){
		$("#select_glddmz_bg_div").css("display","block");
		$("#select_glddmz_bg_div").css("z-index",showZIndex);
		selectGLDDMZDialog.dialog("open");
	}
	else{
		$("#select_glddmz_bg_div").css("display","none");
		$("#select_glddmz_bg_div").css("z-index","9016");
		selectGLDDMZDialog.dialog("close");
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

function checkNew(){
	if(checkGBZL()){
		if(checkGBZT()){
			if(checkGBSJ()){
				if(checkGLDDPZBm()){
					if(checkGLDDMZBm()){
						newZongHeChaXun();
					}
				}
			}
		}
	}
}

//验证过磅重量
function checkGBZL(){
	var gbzl = $("#new_div #gbzl").val();
	if(gbzl==null||gbzl==""){
	  	alert("请输入过磅重量");
	  	return false;
	}
	else
		return true;
}

//验证过磅状态
function checkGBZT(){
	var gbzt=gbztCBB.combobox("getValue");
	if(gbzt==null||gbzt==""){
	  	alert("请选择过磅状态");
	  	return false;
	}
	else
		return true;
}

//验证过磅时间
function checkGBSJ(){
	var gbsj = gbsjDTB.datebox("getValue");
	if(gbsj==null||gbsj==""){
	  	alert("请选择过磅时间");
	  	return false;
	}
	else
		return true;
}

//验证关联订单皮重
function checkGLDDPZBm(){
	var glddpzTabData=glddpzTab.datagrid("getData");
	var total=glddpzTabData.total;
	var pzddbm=null;
	if(total>0)
		pzddbm=glddpzTabData.rows[0].wybm;

	if(pzddbm==null){
		alert("请选择关联订单皮重");
	  	return false;
	}
	else
		return true;
}

//验证关联订单毛重
function checkGLDDMZBm(){
	var glddmzTabData=glddmzTab.datagrid("getData");
	var total=glddmzTabData.total;
	var mzddbm=null;
	if(total>0)
		mzddbm=glddmzTabData.rows[0].wybm;
	
	if(mzddbm==null){
		alert("请选择关联订单毛重");
	  	return false;
	}
	else
		return true;
}

function newZongHeChaXun(){
	var pzddbm=glddpzTab.datagrid("getData").rows[0].wybm;
	$("#new_div #pzddbm").val(pzddbm);
	var mzddbm=glddmzTab.datagrid("getData").rows[0].wybm;
	$("#new_div #mzddbm").val(mzddbm);
	
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:path+"main/newGuoBang",
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

function openSelectGBCLDialog(flag){
	if(flag==1){
		$("#select_gbcl_bg_div").css("display","block");
		$("#select_gbcl_bg_div").css("z-index",showZIndex);
		gbclDialog.dialog("open");
	}
	else{
		$("#select_gbcl_bg_div").css("display","none");
		$("#select_gbcl_bg_div").css("z-index","9016");
		gbclDialog.dialog("close");
	}
}

function saveGBCL(){
	var row=gbclTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要保存的信息！","warning");
		return false;
	}
	$("#new_div #gbcl_hid").val(row.id);
	$("#new_div #gbclmc_span").text(row.cph);
	openSelectGBCLDialog(0);
}

function saveSelectGLDDPZ(){
	var row=selectGLDDPZTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要保存的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",ddh:row.ddh,sjzl:row.sjzl,zlceb:row.zlceb,lxlx:row.lxlx,yzxzl:row.yzxzl,ddzt:row.ddztmc,wybm:row.wybm}];
	loadGLDDPZTabData(rows);
	openSelectGLDDPZDialog(0);
}

function saveSelectGLDDMZ(){
	var row=selectGLDDMZTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要保存的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",ddh:row.ddh,sjzl:row.sjzl,zlceb:row.zlceb,lxlx:row.lxlx,yzxzl:row.yzxzl,ddzt:row.ddztmc,wybm:row.wybm}];
	loadGLDDMZTabData(rows);
	openSelectGLDDMZDialog(0);
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
		case 1:
			lxlxStr="送运";
			break;
		case 2:
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

function openDetailGLDDPZDialog(flag){
	if(flag==1){
		$("#detail_glddpz_bg_div").css("display","block");
	}
	else{
		$("#detail_glddpz_bg_div").css("display","none");
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
		case 1:
			lxlxStr="送运";
			break;
		case 2:
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
	case "new_div":
	case "detail_glddpz_div":
	case "detail_glddmz_div":
		space=340;
		break;
	case "glddpz_div":
	case "glddmz_div":
		space=320;
		break;
	case "select_glddpz_tab":
	case "select_glddmz_tab":
		space=860;
		break;
	case "new_div_table":
	case "panel_window":
	case "glddpz_tab":
	case "glddmz_tab":
		space=355;
		break;
	case "select_gbcl_dialog_div":
	case "select_glddpz_dialog_div":
	case "detail_glddpz_jbsxz_dialog_div":
	case "select_glddmz_dialog_div":
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
<title>创建</title>
</head>
<body>

<!-- 选择过磅车辆 start -->
<div class="select_gbcl_bg_div" id="select_gbcl_bg_div">
	<div class="select_gbcl_div" id="select_gbcl_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectGBCLDialog(0)">X</span>
		</div>
		<div id="select_gbcl_dialog_div">
			<div id="toolbar" style="height:32px;">
				<span style="margin-left: 13px;">车牌号：</span>
				<input type="text" id="cph" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">车辆类型：</span>
				<input id="gbclCllx"/>
				<span style="margin-left: 13px;">是否在用：</span>
				<input id="gbclSfzy"/>
				<span style="margin-left: 13px;">审核状态：</span>
				<input id="gbclShzt"/>
				<span style="margin-left: 13px;">备注：</span>
				<input type="text" id="bz" placeholder="请输入备注" style="width: 120px;height: 25px;"/>
				<a id="gbclSearch_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="gbcl_tab"></table>
		</div>
	</div>
</div>
<!-- 选择过磅车辆 end -->

<!-- 选择关联订单皮重 start -->
<div class="select_glddpz_bg_div" id="select_glddpz_bg_div">
	<div class="select_glddpz_div" id="select_glddpz_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectGLDDPZDialog(0)">X</span>
		</div>
		<div id="select_glddpz_dialog_div">
			<div id="select_glddpz_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">订单号：</span>
				<input type="text" id="ddh_inp" placeholder="请输入订单号" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">执行状态：</span>
				<input  id="zxzt_cbb" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">车牌号：</span>
				<input type="text" id="cph_inp" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_glddpz_tab"></table>
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
				<span class="title_span">载重过磅-关联订单皮重-查看</span>
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

<!-- 选择关联订单毛重 start -->
<div class="select_glddmz_bg_div" id="select_glddmz_bg_div">
	<div class="select_glddmz_div" id="select_glddmz_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectGLDDMZDialog(0)">X</span>
		</div>
		<div id="select_glddmz_dialog_div">
			<div id="select_glddmz_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">订单号：</span>
				<input type="text" id="ddh_inp" placeholder="请输入订单号" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">执行状态：</span>
				<input  id="zxzt_cbb" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">车牌号：</span>
				<input type="text" id="cph_inp" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_glddmz_tab"></table>
		</div>
	</div>
</div>
<!-- 选择关联订单毛重 end -->

<!-- 查看关联订单毛重 start -->
<div class="detail_glddmz_bg_div" id="detail_glddmz_bg_div">
	<div class="detail_glddmz_div" id="detail_glddmz_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailGLDDMZDialog(0)">X</span>
		</div>
		<div class="detail_glddmz_dialog_div" id="detail_glddmz_dialog_div">
			<div class="title_div">
				<span class="title_span">载重过磅-关联订单毛重-查看</span>
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
	<div class="page_location_div">载重过磅-创建</div>

	<div id="new_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" id="pzddbm" name="pzddbm"/>
		<input type="hidden" id="mzddbm" name="mzddbm"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				过磅车辆
			</td>
			<td style="width:30%;">
				<input type="hidden" id="gbcl_hid" name="gbclId"/>
				<span id="gbclmc_span" style="cursor: pointer;" onclick="openSelectGBCLDialog(1)">请选择过磅车辆</span>
			</td>
			<td align="right" style="width:15%;">
				过磅重量
			</td>
			<td style="width:30%;">
				<input type="number" id="gbzl" name="gbzl" placeholder="请输入过磅重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				过磅标签
			</td>
			<td style="width:30%;">
				<input id="gbclGbbq_cbb"/>
				<input type="hidden" id="gbbq" name="gbbq"/>
			</td>
			<td align="right" style="width:15%;">
				过磅状态
			</td>
			<td style="width:30%;">
				<input id="gbzt_cbb"/>
				<input type="hidden" id="gbzt" name="gbzt"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				过磅时间
			</td>
			<td style="width:30%;">
				<input id="gbsj_dtb"/>
				<input type="hidden" id="gbsj" name="gbsj"/>
			</td>
			<td align="right" style="width:15%;">
				照片1
			</td>
			<td style="width:30%;">
				<input type="file" name="zp1_file"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				照片2
			</td>
			<td>
				<input type="file" name="zp2_file"/>
			</td>
			<td align="right">
				照片3
			</td>
			<td>
				<input type="file" name="zp3_file"/>
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
	
	<div id="glddmz_div">
		<div id="glddmz_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="glddmz_tab"></table>
	</div>

</div>
</body>
</html>