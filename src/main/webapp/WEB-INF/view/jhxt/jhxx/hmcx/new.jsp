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
.edit_sssj_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
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
.detail_sssj_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
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

.select_ssdd_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9024;
	display:none;
}
.select_ssdd_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_ssdd_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_ssdd_div .xzst_span{
	margin-left: 30px;
}
.select_ssdd_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}

.detail_ssdd_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9024;
	display:none;
}
.detail_ssdd_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_ssdd_div .ckst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_ssdd_div .ckst_span{
	margin-left: 30px;
}
.detail_ssdd_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_ssdd_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_ssdd_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_ssdd_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var jhxtPath=path+'jhxt/';
var xtglPath=path+'xtgl/';
var jcxxPath=path+'jcxx/';
var ddglPath=path+'ddgl/';
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

var ssdddNum=11;//所属订单
var sssdddNum=12;//选择所属订单

var dssddjbxxNum=13;//查看所属订单基本信息
var dssddyssdNum=14;//查看所属订单运输商
var dssddwlxxdNum=15;//查看所属订单物料信息
var dssddfhdwdNum=16;//查看所属订单发货单位
var dssddshdwdNum=17;//查看所属订单收货单位
var dssddcycldNum=18;//查看所属订单承运车辆
var dssddcysjdNum=19;//查看所属订单承运司机
var dssddjybgdNum=20;//查看所属订单检验报告
var dssddxdzxtzhdNum=21;//查看所属订单下单者系统账户
var dssddcysjxtzhdNum=22;//查看所属订单承运司机系统账户
var dssddphxxdNum=23;//查看所属订单排号信息

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

	initSSDDDialog();//11.所属订单窗口
	initSelectSSDDDialog();//12.选择所属订单窗口
	
	initDetailSSDDJBXXDialog();//13.查看所属订单基本信息窗口
	initDetailSSDDYSSDialog();//14.查看所属订单运输商窗口
	initDetailSSDDWLXXDialog();//15.查看所属订单物料信息窗口
	initDetailSSDDFHDWDialog();//16.查看所属订单发货单位窗口
	initDetailSSDDSHDWDialog();//17.查看所属订单收货单位窗口
	initDetailSSDDCYCLDialog();//18.查看所属订单承运车辆窗口
	initDetailSSDDCYSJDialog();//19.查看所属订单承运司机窗口
	initDetailSSDDJYBGDialog();//20.查看所属订单检验报告窗口
	initDetailSSDDXDZXTZHDialog();//21.查看所属订单下单者系统账户窗口
	initDetailSSDDCYSJXTZHDialog();//22.查看所属订单承运司机系统账户窗口
	initDetailSSDDPHXXDialog();//23.查看所属订单排号信息窗口
	
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

	//所属订单
	var ssdddpw=$("body").find(".panel.window").eq(ssdddNum);
	var ssdddws=$("body").find(".window-shadow").eq(ssdddNum);

	//选择所属订单
	var sssdddpw=$("body").find(".panel.window").eq(sssdddNum);
	var sssdddws=$("body").find(".window-shadow").eq(sssdddNum);

	//查看所属订单
	var dssdddpw=$("body").find(".panel.window").eq(dssddjbxxNum);
	var dssdddws=$("body").find(".window-shadow").eq(dssddjbxxNum);
	var dssddyssdpw=$("body").find(".panel.window").eq(dssddyssdNum);
	var dssddyssdws=$("body").find(".window-shadow").eq(dssddyssdNum);
	var dssddwlxxdpw=$("body").find(".panel.window").eq(dssddwlxxdNum);
	var dssddwlxxdws=$("body").find(".window-shadow").eq(dssddwlxxdNum);
	var dssddfhdwdpw=$("body").find(".panel.window").eq(dssddfhdwdNum);
	var dssddfhdwdws=$("body").find(".window-shadow").eq(dssddfhdwdNum);
	var dssddshdwdpw=$("body").find(".panel.window").eq(dssddshdwdNum);//收货单位
	var dssddshdwdws=$("body").find(".window-shadow").eq(dssddshdwdNum);//收货单位
	var dssddcycldpw=$("body").find(".panel.window").eq(dssddcycldNum);//承运车辆
	var dssddcycldws=$("body").find(".window-shadow").eq(dssddcycldNum);//承运车辆
	var dssddcysjdpw=$("body").find(".panel.window").eq(dssddcysjdNum);//承运司机
	var dssddcysjdws=$("body").find(".window-shadow").eq(dssddcysjdNum);//承运司机
	var dssddjybgdpw=$("body").find(".panel.window").eq(dssddjybgdNum);//检验报告
	var dssddjybgdws=$("body").find(".window-shadow").eq(dssddjybgdNum);//检验报告
	var dssddxdzxtzhdpw=$("body").find(".panel.window").eq(dssddxdzxtzhdNum);//下单者系统账户
	var dssddxdzxtzhdws=$("body").find(".window-shadow").eq(dssddxdzxtzhdNum);//下单者系统账户
	var dssddcysjxtzhdpw=$("body").find(".panel.window").eq(dssddcysjxtzhdNum);//承运司机系统账户
	var dssddcysjxtzhdws=$("body").find(".window-shadow").eq(dssddcysjxtzhdNum);//承运司机系统账户
	var dssddphxxdpw=$("body").find(".panel.window").eq(dssddphxxdNum);//排号信息
	var dssddphxxdws=$("body").find(".window-shadow").eq(dssddphxxdNum);//排号信息

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	
	ccDiv.append(sssjdpw);
	ccDiv.append(sssjdws);
	
	ccDiv.append(ssdldpw);
	ccDiv.append(ssdldws);

	ccDiv.append(ssdddpw);
	ccDiv.append(ssdddws);
	
	var ssssjDiv=$("#select_sssj_div");
	ssssjDiv.append(ssssjdpw);
	ssssjDiv.append(ssssjdws);
	
	var esdDiv=$("#edit_sssj_dialog_div");
	esdDiv.append(esssjdpw);
	esdDiv.append(esssjdws);
	
	esdDiv.append(ezjjsdpw);
	esdDiv.append(ezjjsdws);
	
	var dsssjdDiv=$("#detail_sssj_dialog_div");
	dsssjdDiv.append(dsssjdpw);
	dsssjdDiv.append(dsssjdws);
	
	dsssjdDiv.append(dzjjsdpw);
	dsssjdDiv.append(dzjjsdws);

	var sssdlDiv=$("#select_ssdl_div");
	sssdlDiv.append(sssdldpw);
	sssdlDiv.append(sssdldws);

	var dssdldDiv=$("#detail_ssdl_dialog_div");
	dssdldDiv.append(dssdldpw);
	dssdldDiv.append(dssdldws);
	
	dssdldDiv.append(dshdwdpw);
	dssdldDiv.append(dshdwdws);

	var sssddDiv=$("#select_ssdd_div");
	sssddDiv.append(sssdddpw);
	sssddDiv.append(sssdddws);
	
	var dssdddDiv=$("#detail_ssdd_dialog_div");
	dssdddDiv.append(dssdddpw);
	dssdddDiv.append(dssdddws);

	dssdddDiv.append(dssddyssdpw);
	dssdddDiv.append(dssddyssdws);
	
	dssdddDiv.append(dssddwlxxdpw);
	dssdddDiv.append(dssddwlxxdws);
	
	dssdddDiv.append(dssddfhdwdpw);
	dssdddDiv.append(dssddfhdwdws);

	dssdddDiv.append(dssddshdwdpw);
	dssdddDiv.append(dssddshdwdws);

	dssdddDiv.append(dssddcycldpw);
	dssdddDiv.append(dssddcycldws);

	dssdddDiv.append(dssddcysjdpw);
	dssdddDiv.append(dssddcysjdws);

	dssdddDiv.append(dssddjybgdpw);
	dssdddDiv.append(dssddjybgdws);

	dssdddDiv.append(dssddxdzxtzhdpw);
	dssdddDiv.append(dssddxdzxtzhdws);

	dssdddDiv.append(dssddcysjxtzhdpw);
	dssdddDiv.append(dssddcysjxtzhdws);

	dssdddDiv.append(dssddphxxdpw);
	dssdddDiv.append(dssddphxxdws);
	
}

function initNewDialog(){
	dialogTop+=20;
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
	initNewDivZTCBB();
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

function initNewDivZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择状态"});
	$.post(path+"main/queryHaoMaZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ztCBB=$("#new_div #zt_cbb").combobox({
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
		url:xtglPath+"queryYongHuList",
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
		top:10,
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
		top:385,
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
		top:10,
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

function initDetailSSSJZJJSDialog(){
	detailSSSJZJJSDialog=$("#detail_sssj_zjjs_dialog_div").dialog({
		title:"直接角色",
		width:setFitWidthInParent("#detail_sssj_div","detail_sssj_zjjs_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:385,
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
				default:
					str=value;
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

function openDetailSSSJJBXXDialog(flag){
	if(flag==1){
		detailSSSJDialog.dialog("open");
	}
	else{
		detailSSSJDialog.dialog("close");
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
		url:jcxxPath+"queryDuiLieList",
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

function openDetailSSDLJBSXZDialog(flag){
	if(flag==1){
		detailSSDLDialog.dialog("open");
	}
	else{
		detailSSDLDialog.dialog("close");
	}
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

//打开所属队列-收货单位详情窗口
function openDetailSSDLSHDWDialog(flag){
	if(flag==1){
		detailSSDLSHDWDialog.dialog("open");
	}
	else{
		detailSSDLSHDWDialog.dialog("close");
	}
}

function initSSDDDialog(){
	dialogTop+=320;//330
	yssDialog=$("#ssdd_div").dialog({
		title:"所属订单",
		width:setFitWidthInParent("body","ssdd_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(ssdddNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(ssdddNum).css("margin-top","20px");
	$(".panel.window").eq(ssdddNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(ssdddNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ssdddNum).css("color","#000");
	$(".panel.window .panel-title").eq(ssdddNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ssdddNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ssdddNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ssdddNum).css("width","1000px");
	$(".window-shadow").eq(ssdddNum).css("margin-top","20px");
	$(".window-shadow").eq(ssdddNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(ssdddNum).css("border-color","#ddd");

	initSSDDTab();
}

function initSSDDTab(){
	ssddChooseLB=$("#ssdd_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectSSDDDialog(1);
		}
	});
	
	ssddTab=$("#ssdd_tab").datagrid({
		toolbar:"#ssdd_toolbar",
		width:setFitWidthInParent("body","ssdd_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="关联订单";
					break;
				}
				return str;
			}},
            {field:"ddh",title:"订单号",width:200,align:"center"},
            {field:"cph",title:"车牌号",width:200,align:"center"},
            {field:"ddztmc",title:"订单状态",width:200,align:"center"},
			{field:"wybm",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"deleteSSDDTabRow()\">删除</a>"
            		+"&nbsp;|&nbsp;<a onclick=\"detailSSDDTabRow()\">查看</a>";
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
	loadSSDDTabData([]);
}

function loadSSDDTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		ssddChooseLB.linkbutton("disable");
	else
		ssddChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	ssddTab.datagrid('loadData',obj);
}

function initSelectSSDDDialog(){
	selectSSDDDialog=$("#select_ssdd_dialog_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("#select_ssdd_div","select_ssdd_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectSSDDDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectSSDD();
           }}
        ]
	});
	
	$(".panel.window").eq(sssdddNum).css("width","983px");
	$(".panel.window").eq(sssdddNum).css("margin-top","20px");
	//$(".panel.window").eq(sssdldNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sssdddNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sssdddNum).css("color","#000");
	$(".panel.window .panel-title").eq(sssdddNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sssdddNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sssdddNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sssdddNum).css("width","1000px");
	$(".window-shadow").eq(sssdddNum).css("margin-top","20px");
	$(".window-shadow").eq(sssdddNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sssdddNum).css("border-color","#ddd");

	$("#select_ssdd_dialog_div #cancel_but").css("left","30%");
	$("#select_ssdd_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_ssdd_dialog_div #save_but").css("left","45%");
	$("#select_ssdd_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectSSDDTab();
	openSelectSSDDDialog(0);
}

function initSelectSSDDTab(){
	initSSDDDDZTCBB();
	initSSDDJCSJSDTB();
	initSSDDJCSJEDTB();
	initSSDDJHYSRQDTB();
	
	$("#select_ssdd_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#select_ssdd_toolbar #ddh_inp").val();
			var ddzt=ssddDDZTCBB.combobox("getValue");
			var cph=$("#select_ssdd_toolbar #cph_inp").val();
			var jcsjs=jcsjsDTB.datetimebox("getValue");
			var jcsje=jcsjeDTB.datetimebox("getValue");
			var jhysrq=jhysrqDB.datebox("getValue");
			var yss=$("#select_ssdd_toolbar #yss_inp").val();
			selectSSDDTab.datagrid("load",{ddh:ddh,ddztId:ddzt,cph:cph,jcsjs:jcsjs,jcsje:jcsje,jhysrq:jhysrq,yss:yss});
		}
	});
	
	selectSSDDTab=$("#select_ssdd_tab").datagrid({
		url:ddglPath+"queryDDGLZHGLList",
		toolbar:"#select_ssdd_toolbar",
		width:setFitWidthInParent("body","select_ssdd_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"ddh",title:"订单号",width:200,align:"center"},
			{field:"cph",title:"车牌号",width:200,align:"center"},
			{field:"yssmc",title:"运输商",width:200,align:"center"},
			{field:"lxlx",title:"流向类型",width:200,align:"center",formatter:function(value,row){
				return value==1?"送运":"送运";
			}},
			{field:"jhysrq",title:"计划运输日期",width:200,align:"center"},
			{field:"ddztmc",title:"订单状态",width:200,align:"center"},
			{field:"yzxzl",title:"预装卸重量",width:200,align:"center"},
			{field:"sjzl",title:"实际重量",width:200,align:"center"},
			{field:"zlceb",title:"重量差额比",width:200,align:"center"},
			{field:"crksj",title:"出入库时间",width:200,align:"center"},
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:10});
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

function initSSDDDDZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择订单状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ssddDDZTCBB=$("#select_ssdd_toolbar #ddzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data
			});
		}
	,"json");
}

function initSSDDJCSJSDTB(){
	jcsjsDTB=$('#select_ssdd_toolbar #jcsjs_dtb').datetimebox({
        required:false
    });
}

function initSSDDJCSJEDTB(){
	jcsjeDTB=$('#select_ssdd_toolbar #jcsje_dtb').datetimebox({
        required:false
    });
}

function initSSDDJHYSRQDTB(){
	jhysrqDB=$('#select_ssdd_toolbar #jhysrq_db').datebox({
        required:false
    });
}

function openSelectSSDDDialog(flag){
	if(flag==1){
		$("#select_ssdd_bg_div").css("display","block");
		selectSSDDDialog.dialog("open");
	}
	else{
		$("#select_ssdd_bg_div").css("display","none");
		selectSSDDDialog.dialog("close");
	}
}

function initDetailSSDDJBXXDialog(){
	detailSSDDDialog=$("#detail_ssdd_jbxx_dialog_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_jbxx_dialog_div"),
		height:331,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailSSDDDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   openDetailSSDDDialog(0);
           }}
        ]
	});

	$("#detail_ssdd_jbxx_dialog_div table").css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_jbxx_dialog_div"))+"px");
	$("#detail_ssdd_jbxx_dialog_div table").css("magin","-100px");
	$("#detail_ssdd_jbxx_dialog_div table td").css("padding-left","50px");
	$("#detail_ssdd_jbxx_dialog_div table td").css("padding-right","20px");
	$("#detail_ssdd_jbxx_dialog_div table td").css("font-size","15px");
	$("#detail_ssdd_jbxx_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dssddjbxxNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dssddjbxxNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddjbxxNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddjbxxNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddjbxxNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddjbxxNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(dssddjbxxNum).css("border-color","#ddd");

	$("#detail_ssdd_jbxx_dialog_div #cancel_but").css("left","30%");
	$("#detail_ssdd_jbxx_dialog_div #cancel_but").css("position","absolute");

	$("#detail_ssdd_jbxx_dialog_div #ok_but").css("left","45%");
	$("#detail_ssdd_jbxx_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSSDDJBXXDialog(0);
	//$(".panel.window").eq(esssjjbxxdNum).css("z-index","9010");
}

function openDetailSSDDJBXXDialog(flag){
	if(flag==1){
		detailSSDDDialog.dialog("open");
	}
	else{
		detailSSDDDialog.dialog("close");
	}
}

function initDetailSSDDYSSDialog(){
	detailSSDDYSSDialog=$("#detail_ssdd_yss_dialog_div").dialog({
		title:"运输商",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_yss_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:385,
		left:20,
	});

	$(".panel.window").eq(dssddyssdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_yss_dialog_div"))+"px");
	$(".panel.window").eq(dssddyssdNum).css("margin-top","20px");
	//$(".panel.window").eq(dssddyssdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(dssddyssdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddyssdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddyssdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddyssdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddyssdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddyssdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_yss_dialog_div"))+"px");
	$(".window-shadow").eq(dssddyssdNum).css("width","1000px");
	$(".window-shadow").eq(dssddyssdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddyssdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddyssdNum).css("border-color","#ddd");

	initDetailSSDDYSSTab();
	openDetailSSDDYSSDialog(0);
}

function initDetailSSDDYSSTab(){
	detailSSDDYSSTab=$("#detail_ssdd_yss_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_yss_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="关联运输商";
					break;
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"mc",title:"名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDYSSDialog(flag){
	if(flag==1){
		detailSSDDYSSDialog.dialog("open");
	}
	else{
		detailSSDDYSSDialog.dialog("close");
	}
}

function initDetailSSDDWLXXDialog(){
	detailSSDDWLXXDialog=$("#detail_ssdd_wlxx_dialog_div").dialog({
		title:"物料信息",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_wlxx_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:605,
		left:20,
	});

	$(".panel.window").eq(dssddwlxxdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_wlxx_dialog_div"))+"px");
	$(".panel.window").eq(dssddwlxxdNum).css("margin-top","20px");
	//$(".panel.window").eq(dssddwlxxdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(dssddwlxxdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddwlxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddwlxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddwlxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddwlxxdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddwlxxdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_wlxx_dialog_div"))+"px");
	$(".window-shadow").eq(dssddwlxxdNum).css("width","1000px");
	$(".window-shadow").eq(dssddwlxxdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddwlxxdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddwlxxdNum).css("border-color","#ddd");

	initDetailSSDDWLXXTab();
	openDetailSSDDWLXXDialog(0);
}

function initDetailSSDDWLXXTab(){
	detailSSDDWLXXTab=$("#detail_ssdd_wlxx_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_wlxx_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="运输物资";
					break;
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"mc",title:"名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDWLXXDialog(flag){
	if(flag==1){
		detailSSDDWLXXDialog.dialog("open");
	}
	else{
		detailSSDDWLXXDialog.dialog("close");
	}
}

function initDetailSSDDFHDWDialog(){
	detailSSDDFHDWDialog=$("#detail_ssdd_fhdw_dialog_div").dialog({
		title:"发货单位",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_fhdw_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:835,
		left:20,
	});

	$(".panel.window").eq(dssddfhdwdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_fhdw_dialog_div"))+"px");
	$(".panel.window").eq(dssddfhdwdNum).css("margin-top","20px");
	//$(".panel.window").eq(dssddfhdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(dssddfhdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddfhdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddfhdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddfhdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddfhdwdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddfhdwdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_fhdw_dialog_div"))+"px");
	$(".window-shadow").eq(dssddfhdwdNum).css("width","1000px");
	$(".window-shadow").eq(dssddfhdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddfhdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddfhdwdNum).css("border-color","#ddd");

	initDetailSSDDFHDWTab();
	openDetailSSDDFHDWDialog(0);
}

function initDetailSSDDFHDWTab(){
	detailSSDDFHDWTab=$("#detail_ssdd_fhdw_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_fhdw_tab"),
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
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDFHDWDialog(flag){
	if(flag==1){
		detailSSDDFHDWDialog.dialog("open");
	}
	else{
		detailSSDDFHDWDialog.dialog("close");
	}
}

function initDetailSSDDSHDWDialog(){
	detailSSDDSHDWDialog=$("#detail_ssdd_shdw_dialog_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_shdw_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:1065,
		left:20,
	});

	$(".panel.window").eq(dssddshdwdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_shdw_dialog_div"))+"px");
	$(".panel.window").eq(dssddshdwdNum).css("margin-top","20px");
	//$(".panel.window").eq(dssddfhdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(dssddshdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddshdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddshdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddshdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddshdwdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddshdwdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_shdw_dialog_div"))+"px");
	$(".window-shadow").eq(dssddshdwdNum).css("width","1000px");
	$(".window-shadow").eq(dssddshdwdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddshdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddshdwdNum).css("border-color","#ddd");

	initDetailSSDDSHDWTab();
	openDetailSSDDSHDWDialog(0);
}

function initDetailSSDDSHDWTab(){
	detailSSDDSHDWTab=$("#detail_ssdd_shdw_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_shdw_tab"),
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
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDSHDWDialog(flag){
	if(flag==1){
		detailSSDDSHDWDialog.dialog("open");
	}
	else{
		detailSSDDSHDWDialog.dialog("close");
	}
}

function initDetailSSDDCYCLDialog(){
	detailSSDDCYCLDialog=$("#detail_ssdd_cycl_dialog_div").dialog({
		title:"承运车辆",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cycl_dialog_div"),
		height:200,
		top:1295,
		left:20,
	});

	$(".panel.window").eq(dssddcycldNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cycl_dialog_div"))+"px");
	$(".panel.window").eq(dssddcycldNum).css("margin-top","20px");
	//$(".panel.window").eq(dssddcycldNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(dssddcycldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddcycldNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddcycldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddcycldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddcycldNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddcycldNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cycl_dialog_div"))+"px");
	$(".window-shadow").eq(dssddcycldNum).css("width","1000px");
	$(".window-shadow").eq(dssddcycldNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddcycldNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddcycldNum).css("border-color","#ddd");

	initDetailSSDDCYCLTab();
	openDetailSSDDCYCLDialog(0);
}

function initDetailSSDDCYCLTab(){
	detailSSDDCYCLTab=$("#detail_ssdd_cycl_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cycl_tab"),
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
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"cph",title:"车牌号",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDCYCLDialog(flag){
	if(flag==1){
		detailSSDDCYCLDialog.dialog("open");
	}
	else{
		detailSSDDCYCLDialog.dialog("close");
	}
}

function initDetailSSDDCYSJDialog(){
	detailSSDDCYSJDialog=$("#detail_ssdd_cysj_dialog_div").dialog({
		title:"承运司机",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysj_dialog_div"),
		height:200,
		top:1525,
		left:20,
	});

	$(".panel.window").eq(dssddcysjdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysj_dialog_div"))+"px");
	$(".panel.window").eq(dssddcysjdNum).css("margin-top","20px");
	//$(".panel.window").eq(dssddcysjdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(dssddcysjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddcysjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddcysjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddcysjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddcysjdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddcysjdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysj_dialog_div"))+"px");
	$(".window-shadow").eq(dssddcysjdNum).css("width","1000px");
	$(".window-shadow").eq(dssddcysjdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddcysjdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddcycldNum).css("border-color","#ddd");

	initDetailSSDDCYSJTab();
	openDetailSSDDCYSJDialog(0);
}

function initDetailSSDDCYSJTab(){
	detailSSDDCYSJTab=$("#detail_ssdd_cysj_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysj_tab"),
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
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"xm",title:"姓名",width:200,align:"center"},
			{field:"sjh",title:"手机号",width:200,align:"center"},
			{field:"sfz",title:"身份证号",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDCYSJDialog(flag){
	if(flag==1){
		detailSSDDCYSJDialog.dialog("open");
	}
	else{
		detailSSDDCYSJDialog.dialog("close");
	}
}

function initDetailSSDDJYBGDialog(){
	detailSSDDJYBGDialog=$("#detail_ssdd_jybg_dialog_div").dialog({
		title:"检验报告",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_jybg_dialog_div"),
		height:200,
		top:1755,
		left:20,
	});

	$(".panel.window").eq(dssddjybgdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_jybg_dialog_div"))+"px");
	$(".panel.window").eq(dssddjybgdNum).css("margin-top","20px");
	$(".panel.window").eq(dssddjybgdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddjybgdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddjybgdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddjybgdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddjybgdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddjybgdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_jybg_dialog_div"))+"px");
	$(".window-shadow").eq(dssddjybgdNum).css("width","1000px");
	$(".window-shadow").eq(dssddjybgdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddjybgdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddjybgdNum).css("border-color","#ddd");

	initDetailSSDDJYBGTab();
	openDetailSSDDJYBGDialog(0);
}

function initDetailSSDDJYBGTab(){
	detailSSDDJYBGTab=$("#detail_ssdd_jybg_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysj_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="检验报告";
					break;
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"jl",title:"结论",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDJYBGDialog(flag){
	if(flag==1){
		detailSSDDJYBGDialog.dialog("open");
	}
	else{
		detailSSDDJYBGDialog.dialog("close");
	}
}

function initDetailSSDDXDZXTZHDialog(){
	detailSSDDXDZXTZHDialog=$("#detail_ssdd_xdzxtzh_dialog_div").dialog({
		title:"下单者系统账户",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_xdzxtzh_dialog_div"),
		height:200,
		top:1985,
		left:20,
	});

	$(".panel.window").eq(dssddxdzxtzhdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_xdzxtzh_dialog_div"))+"px");
	$(".panel.window").eq(dssddxdzxtzhdNum).css("margin-top","20px");
	$(".panel.window").eq(dssddxdzxtzhdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddxdzxtzhdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddxdzxtzhdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddxdzxtzhdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddxdzxtzhdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddxdzxtzhdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_xdzxtzh_dialog_div"))+"px");
	$(".window-shadow").eq(dssddxdzxtzhdNum).css("width","1000px");
	$(".window-shadow").eq(dssddxdzxtzhdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddxdzxtzhdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddxdzxtzhdNum).css("border-color","#ddd");

	initDetailSSDDXDZXTZHTab();
	openDetailSSDDXDZXTZHDialog(0);
}

function initDetailSSDDXDZXTZHTab(){
	detailSSDDXDZXTZHTab=$("#detail_ssdd_xdzxtzh_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_xdzxtzh_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="下单用户";
					break;
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"sm",title:"实名",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDXDZXTZHDialog(flag){
	if(flag==1){
		detailSSDDXDZXTZHDialog.dialog("open");
	}
	else{
		detailSSDDXDZXTZHDialog.dialog("close");
	}
}

function initDetailSSDDCYSJXTZHDialog(){
	detailSSDDCYSJXTZHDialog=$("#detail_ssdd_cysjxtzh_dialog_div").dialog({
		title:"承运司机系统账户",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysjxtzh_dialog_div"),
		height:200,
		top:2215,
		left:20,
	});

	$(".panel.window").eq(dssddcysjxtzhdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysjxtzh_dialog_div"))+"px");
	$(".panel.window").eq(dssddcysjxtzhdNum).css("margin-top","20px");
	$(".panel.window").eq(dssddcysjxtzhdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddcysjxtzhdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddcysjxtzhdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddcysjxtzhdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddcysjxtzhdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddcysjxtzhdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysjxtzh_dialog_div"))+"px");
	$(".window-shadow").eq(dssddcysjxtzhdNum).css("width","1000px");
	$(".window-shadow").eq(dssddcysjxtzhdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddcysjxtzhdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddcysjxtzhdNum).css("border-color","#ddd");

	initDetailSSDDCYSJXTZHTab();
	openDetailSSDDCYSJXTZHDialog(0);
}

function initDetailSSDDCYSJXTZHTab(){
	detailSSDDCYSJXTZHTab=$("#detail_ssdd_cysjxtzh_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_cysjxtzh_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="承运司机";
					break;
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"sm",title:"实名",width:200,align:"center"},
			{field:"yhm",title:"用户名",width:200,align:"center"},
			{field:"js",title:"简述",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
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
}

function openDetailSSDDCYSJXTZHDialog(flag){
	if(flag==1){
		detailSSDDCYSJXTZHDialog.dialog("open");
	}
	else{
		detailSSDDCYSJXTZHDialog.dialog("close");
	}
}

function initDetailSSDDPHXXDialog(){
	detailSSDDPHXXDialog=$("#detail_ssdd_phxx_dialog_div").dialog({
		title:"排号信息",
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_phxx_dialog_div"),
		height:200,
		top:2445,
		left:20,
	});

	$(".panel.window").eq(dssddphxxdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_phxx_dialog_div"))+"px");
	$(".panel.window").eq(dssddphxxdNum).css("margin-top","20px");
	$(".panel.window").eq(dssddphxxdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssddphxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssddphxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssddphxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssddphxxdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssddphxxdNum).css("width",(setFitWidthInParent("#detail_ssdd_div","detail_ssdd_phxx_dialog_div"))+"px");
	$(".window-shadow").eq(dssddphxxdNum).css("width","1000px");
	$(".window-shadow").eq(dssddphxxdNum).css("margin-top","20px");
	$(".window-shadow").eq(dssddphxxdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(dssddphxxdNum).css("border-color","#ddd");

	initDetailSSDDPHXXTab();
	openDetailSSDDPHXXDialog(0);
}

function initDetailSSDDPHXXTab(){
	detailSSDDPHXXTab=$("#detail_ssdd_phxx_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdd_div","detail_ssdd_phxx_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="关联排号";
					break;
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"bm",title:"编码",width:200,align:"center"},
			{field:"pdh",title:"排队号",width:200,align:"center"},
			{field:"prsj",title:"排入时间",width:200,align:"center"},
			{field:"ksjhsj",title:"开始叫号时间",width:200,align:"center"},
			{field:"zt",title:"状态",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
				return "";
			}}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:7});
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

function openDetailSSDDPHXXDialog(flag){
	if(flag==1){
		detailSSDDPHXXDialog.dialog("open");
	}
	else{
		detailSSDDPHXXDialog.dialog("close");
	}
}

function deleteSSDLTabRow(){
	ssdlTab.datagrid("deleteRow",0);
	loadSSDLTabData([]);
}

function deleteSSDDTabRow(){
	ssddTab.datagrid("deleteRow",0);
	loadSSDDTabData([]);
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

function detailSSDDTabRow(){
	var row=ssddTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_ssdd_jbxx_dialog_div #wybm").text(row.wybm);
	$("#detail_ssdd_jbxx_dialog_div #ddh").text(row.ddh);
	$("#detail_ssdd_jbxx_dialog_div #yzxzl").text(row.yzxzl);
	$("#detail_ssdd_jbxx_dialog_div #lxlx").text(row.lxlx==1?"送运":"取运");
	$("#detail_ssdd_jbxx_dialog_div #bjsj").text(row.bjsj);
	
	$("#detail_ssdd_yss_dialog_div #id").val(row.yssId);
	
	$.post(jcxxPath+"selectYunShuShangById",
		{id:row.yssId},
		function(result){
			var yss=result.yss;
			yss.gx="1";
			var rows=[];
			rows[0]=yss;
			var obj = {"total":rows.length,"rows":rows};
			detailSSDDYSSTab.datagrid('loadData',obj);
		}
	,"json");

	$.post(jcxxPath+"selectWuZiById",
		{id:row.wlxxId},
		function(result){
			var wz=result.wz;
			wz.gx="1";
			var rows=[];
			rows[0]=wz;
			var obj = {"total":rows.length,"rows":rows};
			detailSSDDWLXXTab.datagrid('loadData',obj);
		}
	,"json");

	$.post(jcxxPath+"selectFaHuoDanWeiById",
		{id:row.fhdwId},
		function(result){
			var fhdw=result.fhdw;
			fhdw.gx="1";
			var rows=[];
			rows[0]=fhdw;
			var obj = {"total":rows.length,"rows":rows};
			detailSSDDFHDWTab.datagrid('loadData',obj);
		}
	,"json");

	$.post(jcxxPath+"selectShouHuoDanWeiById",
		{id:row.shdwId},
		function(result){
			var shdw=result.shdw;
			shdw.gx="1";
			var rows=[];
			rows[0]=shdw;
			var obj = {"total":rows.length,"rows":rows};
			detailSSDDSHDWTab.datagrid('loadData',obj);
		}
	,"json");

	//承运车辆
	$.post(jcxxPath+"selectCheLiangById",
		{id:row.cyclId},
		function(result){
			var cl=result.cl;
			cl.gx="1";
			var rows=[];
			rows[0]=cl;
			var obj = {"total":rows.length,"rows":rows};
			detailSSDDCYCLTab.datagrid('loadData',obj);
		}
	,"json");

	//承运司机
	$.post(jcxxPath+"selectSiJiById",
		{id:row.cysjId},
		function(result){
			var sj=result.sj;
			sj.gx="1";
			var rows=[];
			rows[0]=sj;
			var obj = {"total":rows.length,"rows":rows};
			detailSSDDCYSJTab.datagrid('loadData',obj);
		}
	,"json");
	
	//检验报告（接口未写）
	var jybgrows=[];
	var obj = {"total":0,"rows":jybgrows};
	detailSSDDJYBGTab.datagrid('loadData',obj);
	
	//下单者系统账户
	var xdzxtzhrow={gx:"1",sm:"默认用户"};
	var xdzxtzhrows=[];
	xdzxtzhrows[0]=xdzxtzhrow;
	var obj = {"total":xdzxtzhrows.length,"rows":xdzxtzhrows};
	detailSSDDXDZXTZHTab.datagrid('loadData',obj);

	//承运司机系统账户（接口未写）
	var xdzxtzhrows=[];
	var obj = {"total":0,"rows":xdzxtzhrows};
	detailSSDDCYSJXTZHTab.datagrid('loadData',obj);

	//排号信息（接口未写）
	var phxxrows=[];
	var obj = {"total":0,"rows":phxxrows};
	detailSSDDPHXXTab.datagrid('loadData',obj);
	
	openDetailSSDDDialog(1);
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

function openDetailSSDDDialog(flag){
	if(flag==1){
		$("#detail_ssdd_bg_div").css("display","block");
	}
	else{
		$("#detail_ssdd_bg_div").css("display","none");
	}
	openDetailSSDDJBXXDialog(flag);
	openDetailSSDDYSSDialog(flag);
	openDetailSSDDWLXXDialog(flag);
	openDetailSSDDFHDWDialog(flag);
	openDetailSSDDSHDWDialog(flag);
	openDetailSSDDCYCLDialog(flag);
	openDetailSSDDCYSJDialog(flag);
	openDetailSSDDJYBGDialog(flag);
	openDetailSSDDXDZXTZHDialog(flag);//下单者系统账户
	openDetailSSDDCYSJXTZHDialog(flag);//承运司机系统账户
	openDetailSSDDPHXXDialog(flag);//排号信息
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

function saveSelectSSDD(){
	var row=selectSSDDTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择所属订单！","warning");
		return false;
	}
	var rows=[{gx:"1",ddh:row.ddh,cph:row.cph,ddztmc:row.ddztmc,yssId:row.yssId,wlxxId:row.wlxxId,fhdwId:row.fhdwId,shdwId:row.shdwId,cyclId:row.cyclId,cysjId:row.cysjId,wybm:row.wybm}];
	loadSSDDTabData(rows);
	openSelectSSDDDialog(0);
}

function checkNew(){
	if(checkPRSJ()){
		if(checkPdh()){
			if(checkZT()){
				if(checkFL()){
					if(checkKSJHSJ()){
						if(checkSSSJId()){
							if(checkSSDLId()){
								if(checkSSDDBm()){
									newHaoMaChaXun();
								}
							}
						}
					}
				}
			}
		}
	}
}

function newHaoMaChaXun(){
	var hm=$("#new_div #hm").val();
	var prsj=prsjDB.datebox("getValue");
	var pdh=$("#new_div #pdh").val();
	var ztId=ztCBB.combobox("getValue");
	var fl=flCBB.combobox("getValue");
	var ewm=$("#new_div #ewm").val();
	var ksjhsj=ksjhsjDB.datebox("getValue");
	var sssjId=sssjTab.datagrid("getData").rows[0].id;
	var ssdlId=ssdlTab.datagrid("getData").rows[0].id;
	var ssddBm=ssddTab.datagrid("getData").rows[0].wybm;
	
	$.post(jhxtPath+"newHaoMaChaXun",
		{hm:hm,prsj:prsj,pdh:pdh,ztId:ztId,fl:fl,ewm:ewm,ksjhsj:ksjhsj,sssjId:sssjId,ssdlId:ssdlId,ssddBm:ssddBm},
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

//验证排队号
function checkPdh(){
	var pdh = $("#new_div #pdh").val();
	if(pdh==null||pdh==""){
	  	alert("请输入排队号");
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

//验证开始叫号时间
function checkKSJHSJ(){
	var ksjhsj = ksjhsjDB.datebox("getValue");
	if(ksjhsj==null||ksjhsj==""){
	  	alert("请选择开始叫号时间");
	  	return false;
	}
	else
		return true;
}

//验证所属司机
function checkSSSJId(){
	var sssjTabData=sssjTab.datagrid("getData");
	var total=sssjTabData.total;
	var sssjId=null;
	if(total>0)
		sssjId=sssjTabData.rows[0].id;
	
	if(sssjId==null){
		alert("请选择所属司机");
	  	return false;
	}
	else
		return true;
}

//验证所属队列
function checkSSDLId(){
	var ssdlTabData=ssdlTab.datagrid("getData");
	var total=ssdlTabData.total;
	var ssdlId=null;
	if(total>0)
		ssdlId=ssdlTabData.rows[0].id;
	
	if(ssdlId==null){
		alert("请选择所属队列");
	  	return false;
	}
	else
		return true;
}

//验证所属订单
function checkSSDDBm(){
	var ssddTabData=ssddTab.datagrid("getData");
	var total=ssddTabData.total;
	var ssddBm=null;
	if(total>0)
		ssddBm=ssddTabData.rows[0].wybm;
	
	if(ssddBm==null){
		alert("请选择所属订单");
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
	case "select_ssdd_dialog_div":
	case "detail_ssdd_jbxx_dialog_div":
		space=50;
		break;
	case "edit_sssj_zjjs_dialog_div":
	case "detail_sssj_zjjs_dialog_div":
	case "detail_ssdl_shdw_dialog_div":
	case "detail_ssdd_yss_dialog_div":
	case "detail_ssdd_wlxx_dialog_div":
	case "detail_ssdd_fhdw_dialog_div":
	case "detail_ssdd_shdw_dialog_div":
	case "detail_ssdd_cycl_dialog_div":
	case "detail_ssdd_cysj_dialog_div":
	case "detail_ssdd_jybg_dialog_div":
	case "detail_ssdd_xdzxtzh_dialog_div":
	case "detail_ssdd_cysjxtzh_dialog_div":
	case "detail_ssdd_phxx_dialog_div":
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
		<div class="edit_sssj_dialog_div" id="edit_sssj_dialog_div">
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
</div>
<!-- 编辑所属司机 end -->


<!-- 查看所属司机 start -->
<div class="detail_sssj_bg_div" id="detail_sssj_bg_div">
	<div class="detail_sssj_div" id="detail_sssj_div">
		<div class="ckst_div">
			<span class="ckst_span">查看实体</span>
			<span class="close_span" onclick="openDetailSSSJDialog(0)">X</span>
		</div>
		<div class="detail_sssj_dialog_div" id="detail_sssj_dialog_div">
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
		<div class="detail_ssdl_dialog_div" id="detail_ssdl_dialog_div">
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
</div>
<!-- 查看所属队列 end -->

<!-- 选择所属订单 start -->
<div class="select_ssdd_bg_div" id="select_ssdd_bg_div">
	<div class="select_ssdd_div" id="select_ssdd_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectSSDDDialog(0)">X</span>
		</div>
		<div id="select_ssdd_dialog_div">
			<div id="select_ssdd_toolbar" style="height:96px;">
				<div style="height:32px;">
					<span style="margin-left: 13px;">订单号：</span>
					<input type="text" id="ddh_inp" placeholder="请输入订单号" style="width: 120px;height: 25px;"/>
					<span style="margin-left: 13px;">订单状态：</span>
					<input id="ddzt_cbb"/>
					<span style="margin-left: 13px;">车牌号：</span>
					<input type="text" id="cph_inp" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
				</div>
				<div style="height:32px;">
					<span style="margin-left: 13px;">进场时间：</span>
					<input id="jcsjs_dtb"/>
					-
					<input id="jcsje_dtb"/>
				</div>
				<div style="height:32px;">
					<span style="margin-left: 13px;">计划运输日期：</span>
					<input id="jhysrq_db"/>
					<span style="margin-left: 13px;">运输商：</span>
					<input type="text" id="yss_inp" placeholder="请输入运输商" style="width: 120px;height: 25px;"/>
					<a id="search_but" style="margin-left: 13px;">查询</a>
				</div>
			</div>
			<table id="select_ssdd_tab"></table>
		</div>
	</div>
</div>
<!-- 选择所属订单 end -->

<!-- 查看所属订单 start -->
<div class="detail_ssdd_bg_div" id="detail_ssdd_bg_div">
	<div class="detail_ssdd_div" id="detail_ssdd_div">
		<div class="ckst_div">
			<span class="ckst_span">查看实体</span>
			<span class="close_span" onclick="openDetailSSDDDialog(0)">X</span>
		</div>
		<div class="detail_ssdd_dialog_div" id="detail_ssdd_dialog_div">
			<div class="title_div">
				<span class="title_span">号码查询-所属订单-详情</span>
			</div>
			<div id="detail_ssdd_jbxx_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:20%;">
						订单号
					</td>
					<td style="width:25%;">
						<span id="ddh"></span>
					</td>
					<td align="right" style="width:20%;">
						预装卸重量
					</td>
					<td style="width:25%;">
						<span id="yzxzl"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						流向类型
					</td>
					<td>
						<span id="lxlx"></span>
					</td>
					<td align="right">
						编辑时间
					</td>
					<td>
						<span id="bjsj"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						二维码
					</td>
					<td>
						<span id="ewm"></span>
					</td>
					<td align="right">
						实际重量
					</td>
					<td>
						<span id="sjzl"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						重量差额比
					</td>
					<td>
						<span id="zlceb"></span>
					</td>
					<td align="right">
						订单状态
					</td>
					<td>
						<span id="ddzt"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						计划运输日期
					</td>
					<td>
						<span id="jhysrq"></span>
					</td>
					<td align="right">
					</td>
					<td>
					</td>
				  </tr>
				</table>
			</div>
			
			<div id="detail_ssdd_yss_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_yss_tab"></table>
			</div>
			
			<div id="detail_ssdd_wlxx_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_wlxx_tab"></table>
			</div>
			
			<div id="detail_ssdd_fhdw_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_fhdw_tab"></table>
			</div>
			
			<div id="detail_ssdd_shdw_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_shdw_tab"></table>
			</div>
			
			<div id="detail_ssdd_cycl_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_cycl_tab"></table>
			</div>
			
			<div id="detail_ssdd_cysj_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_cysj_tab"></table>
			</div>
			
			<div id="detail_ssdd_jybg_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_jybg_tab"></table>
			</div>
			
			<div id="detail_ssdd_xdzxtzh_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_xdzxtzh_tab"></table>
			</div>
			
			<div id="detail_ssdd_cysjxtzh_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_cysjxtzh_tab"></table>
			</div>
			
			<div id="detail_ssdd_phxx_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdd_phxx_tab"></table>
			</div>
		</div>
	</div>
</div>
<!-- 查看所属订单 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">号码查询-详情</div>
	
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
				<input type="number" id="pdh" name="pdh" placeholder="请输入排队号" style="width: 150px;height:30px;"/>
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
	
	<!-- 所属订单 start -->
	<div id="ssdd_div">
		<div id="ssdd_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="ssdd_tab"></table>
	</div>
	<!-- 所属订单 end -->
	
</div>
</body>
</html>