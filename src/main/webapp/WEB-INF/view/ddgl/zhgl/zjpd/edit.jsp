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

.edit_wlxx_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.edit_wlxx_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.edit_wlxx_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.edit_wlxx_div .xgst_span{
	margin-left: 30px;
}
.edit_wlxx_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.edit_wlxx_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.edit_wlxx_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.edit_wlxx_div .title_span{
	margin-left: 30px;
}

.select_fhdw_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_fhdw_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_fhdw_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_fhdw_div .xzst_span{
	margin-left: 30px;
}
.select_fhdw_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}

.edit_fhdw_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.edit_fhdw_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.edit_fhdw_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.edit_fhdw_div .xgst_span{
	margin-left: 30px;
}
.edit_fhdw_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.edit_fhdw_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.edit_fhdw_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.edit_fhdw_div .title_span{
	margin-left: 30px;
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

.select_cycl_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_cycl_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_cycl_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_cycl_div .xzst_span{
	margin-left: 30px;
}
.select_cycl_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}

.select_cysj_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_cysj_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_cysj_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_cysj_div .xzst_span{
	margin-left: 30px;
}
.select_cysj_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var ddglPath=path+'ddgl/';
var jcxxPath=path+'jcxx/';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var edNum=0;
var yssdNum=1;
var syssdNum=2;
var eyssjbsxzdNum=3;
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
	initEditDialog();
	
	initYSSDialog();//1.运输商窗口
	initSelectYSSDialog();//2.选择运输商窗口
	initEditYSSJBSXZDialog();//3.修改运输商窗口

	initWLXXDialog();//4.物料信息窗口
	initSelectWLXXDialog();//5.选择物料信息窗口
	initEditWLXXJBSXZDialog();//6.修改物料信息窗口
	
	initFHDWDialog();//7.发货单位窗口
	initSelectFHDWDialog();//8.选择发货单位窗口
	initEditFHDWJBSXZDialog();//9.修改发货单位窗口
	
	initSHDWDialog();//10.收货单位窗口
	initSelectSHDWDialog();//11.选择收货单位窗口
	initEditSHDWJBSXZDialog();//12.修改收货单位窗口

	initCYCLDialog();//13.承运车辆窗口
	initSelectCYCLDialog();//14.选择承运车辆窗口
	initEditCYCLDialog();//15.修改承运车辆窗口

	initCYSJDialog();//16.承运司机窗口
	initSelectCYSJDialog();//17.选择承运司机窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	//运输商
	var yssdpw=$("body").find(".panel.window").eq(yssdNum);
	var yssdws=$("body").find(".window-shadow").eq(yssdNum);

	//选择运输商
	var syssdpw=$("body").find(".panel.window").eq(syssdNum);
	var syssdws=$("body").find(".window-shadow").eq(syssdNum);

	//修改运输商
	var eyssjbsxdpw=$("body").find(".panel.window").eq(eyssjbsxzdNum);
	var eyssjbsxdws=$("body").find(".window-shadow").eq(eyssjbsxzdNum);

	//物料信息
	var wlxxdpw=$("body").find(".panel.window").eq(wlxxdNum);
	var wlxxdws=$("body").find(".window-shadow").eq(wlxxdNum);

	//选择物料信息
	var swlxxdpw=$("body").find(".panel.window").eq(swlxxdNum);
	var swlxxdws=$("body").find(".window-shadow").eq(swlxxdNum);

	//修改物料信息
	var ewlxxjbsxdpw=$("body").find(".panel.window").eq(ewlxxjbsxzdNum);
	var ewlxxjbsxdws=$("body").find(".window-shadow").eq(ewlxxjbsxzdNum);

	//发货单位
	var fhdwdpw=$("body").find(".panel.window").eq(fhdwdNum);
	var fhdwdws=$("body").find(".window-shadow").eq(fhdwdNum);

	//选择发货单位
	var sfhdwdpw=$("body").find(".panel.window").eq(sfhdwdNum);
	var sfhdwdws=$("body").find(".window-shadow").eq(sfhdwdNum);

	//修改发货单位
	var efhdwjbsxdpw=$("body").find(".panel.window").eq(efhdwjbsxzdNum);
	var efhdwjbsxdws=$("body").find(".window-shadow").eq(efhdwjbsxzdNum);

	//收货单位
	var shdwdpw=$("body").find(".panel.window").eq(shdwdNum);
	var shdwdws=$("body").find(".window-shadow").eq(shdwdNum);

	//选择收货单位
	var sshdwdpw=$("body").find(".panel.window").eq(sshdwdNum);
	var sshdwdws=$("body").find(".window-shadow").eq(sshdwdNum);

	//修改收货单位
	var eshdwjbsxdpw=$("body").find(".panel.window").eq(eshdwjbsxzdNum);
	var eshdwjbsxdws=$("body").find(".window-shadow").eq(eshdwjbsxzdNum);

	//承运车辆
	var cycldpw=$("body").find(".panel.window").eq(cycldNum);
	var cycldws=$("body").find(".window-shadow").eq(cycldNum);

	//选择承运车辆
	var scycldpw=$("body").find(".panel.window").eq(scycldNum);
	var scycldws=$("body").find(".window-shadow").eq(scycldNum);
	
	//承运司机
	var cysjdpw=$("body").find(".panel.window").eq(cysjdNum);
	var cysjdws=$("body").find(".window-shadow").eq(cysjdNum);

	//选择承运司机
	var scysjdpw=$("body").find(".panel.window").eq(scysjdNum);
	var scysjdws=$("body").find(".window-shadow").eq(scysjdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);

	ccDiv.append(yssdpw);
	ccDiv.append(yssdws);

	ccDiv.append(wlxxdpw);
	ccDiv.append(wlxxdws);

	ccDiv.append(fhdwdpw);
	ccDiv.append(fhdwdws);

	ccDiv.append(shdwdpw);
	ccDiv.append(shdwdws);

	ccDiv.append(cycldpw);
	ccDiv.append(cycldws);

	ccDiv.append(cysjdpw);
	ccDiv.append(cysjdws);

	var syssDiv=$("#select_yss_div");
	syssDiv.append(syssdpw);
	syssDiv.append(syssdws);

	var eyssdDiv=$("#edit_yss_dialog_div");
	eyssdDiv.append(eyssjbsxdpw);
	eyssdDiv.append(eyssjbsxdws);

	var swlxxDiv=$("#select_wlxx_div");
	swlxxDiv.append(swlxxdpw);
	swlxxDiv.append(swlxxdws);

	var ewlxxdDiv=$("#edit_wlxx_dialog_div");
	ewlxxdDiv.append(ewlxxjbsxdpw);
	ewlxxdDiv.append(ewlxxjbsxdws);

	var sfhdwDiv=$("#select_fhdw_div");
	sfhdwDiv.append(sfhdwdpw);
	sfhdwDiv.append(sfhdwdws);

	var efhdwdDiv=$("#edit_fhdw_dialog_div");
	efhdwdDiv.append(efhdwjbsxdpw);
	efhdwdDiv.append(efhdwjbsxdws);

	var sshdwDiv=$("#select_shdw_div");
	sshdwDiv.append(sshdwdpw);
	sshdwDiv.append(sshdwdws);

	var eshdwdDiv=$("#edit_shdw_dialog_div");
	eshdwdDiv.append(eshdwjbsxdpw);
	eshdwdDiv.append(eshdwjbsxdws);

	var scyclDiv=$("#select_cycl_div");
	scyclDiv.append(scycldpw);
	scyclDiv.append(scycldws);

	var scysjDiv=$("#select_cysj_div");
	scysjDiv.append(scysjdpw);
	scysjDiv.append(scysjdws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:325,
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

	initEditDivLXLXCBB();
	initEditDivBJSJDTB();
	initEditDivDDZTCBB();
	initEditDivJHYSRQDB();
}

function initEditDivLXLXCBB(){
	edlxlxCBB=$("#edit_div #lxlx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"送运"},{"value":"2","text":"取运"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.zjpd.lxlx }');
		},
		onSelect:function(){
			$("#lxlx").val($(this).combobox("getValue"));
		}
	});
}

function initEditDivBJSJDTB(){
	edbjsjDTB=$("#edit_div #bjsj_dtb").datetimebox({
        required:false,
        disabled:true,
        onSelect:function(){
        	$("#edit_div #bjsj").val(edbjsjDTB.datetimebox("getValue"));
        }
	});
	edbjsjDTB.datebox("setValue",'${requestScope.zjpd.bjsj }');
}

function initEditDivDDZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择订单状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ssddDDZTCBB=$("#edit_div #ddzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data,
				onLoadSuccess:function(){
					$(this).combobox("setValue",'${requestScope.zjpd.ddztId }');
				}
			});
		}
	,"json");
}

function initEditDivJHYSRQDB(){
	edjhysrqDB=$("#edit_div #jhysrq_db").datebox({
        required:false,
        disabled:true,
        onSelect:function(){
        	$("#edit_div #jhysrq").val(edjhysrqDB.datebox("getValue"));
        }
	});
	edjhysrqDB.datebox("setValue",'${requestScope.zjpd.jhysrq }');
}

function initYSSDialog(){
	dialogTop+=350;//360
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
	//$(".panel.window").eq(yssdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(yssdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(yssdNum).css("color","#000");
	$(".panel.window .panel-title").eq(yssdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(yssdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(yssdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(yssdNum).css("width","1000px");
	$(".window-shadow").eq(yssdNum).css("margin-top","20px");
	//$(".window-shadow").eq(yssdNum).css("margin-left",initWindowMarginLeft());
	
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

function loadYSSTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		yssChooseLB.linkbutton("disable");
	else
		yssChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	yssTab.datagrid('loadData',obj);
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

function initSelectYSSDialog(){
	selectYSSDialog=$("#select_yss_dialog_div").dialog({
		title:"选择实体",
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
	$(".panel.window").eq(syssdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(syssdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(syssdNum).css("color","#000");
	$(".panel.window .panel-title").eq(syssdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(syssdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(syssdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(syssdNum).css("width","1000px");
	$(".window-shadow").eq(syssdNum).css("margin-top","20px");
	$(".window-shadow").eq(syssdNum).css("margin-left",initWindowMarginLeft());
	
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
		url:jcxxPath+"queryYunShuShangList",
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

function initSelectWLXXTab(){
	$("#select_wlxx_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var mc=$("#select_wlxx_toolbar #mc_inp").val();
			selectYSSTab.datagrid("load",{mc:mc});
		}
	});
	
	selectWLXXTab=$("#select_wlxx_tab").datagrid({
		url:jcxxPath+"queryWuZiList",
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

function initEditWLXXJBSXZDialog(){
	editWLXXDialog=$("#edit_wlxx_jbsxz_dialog_div").dialog({
		title:"修改物料信息实体",
		width:setFitWidthInParent("#edit_wlxx_div","edit_wlxx_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditWLXXDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editWLXX();
           }}
        ]
	});

	$("#edit_wlxx_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#edit_wlxx_div","edit_wlxx_jbsxz_dialog_div"))+"px");
	$("#edit_wlxx_jbsxz_dialog_div table").css("magin","-100px");
	$("#edit_wlxx_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#edit_wlxx_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#edit_wlxx_jbsxz_dialog_div table td").css("font-size","15px");
	$("#edit_wlxx_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(ewlxxjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(ewlxxjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ewlxxjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(ewlxxjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ewlxxjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ewlxxjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ewlxxjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(ewlxxjbsxzdNum).css("border-color","#ddd");

	$("#edit_wlxx_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#edit_wlxx_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#edit_wlxx_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#edit_wlxx_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditWLXXJBSXZDialog(0);
}

function initFHDWDialog(){
	dialogTop+=230;//690
	fhdwDialog=$("#fhdw_div").dialog({
		title:"发货单位",
		width:setFitWidthInParent("body","fhdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
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

function initSelectFHDWDialog(){
	selectFHDWDialog=$("#select_fhdw_dialog_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("#select_fhdw_div","select_fhdw_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
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

	$("#select_fhdw_dialog_div #cancel_but").css("left","30%");
	$("#select_fhdw_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_fhdw_dialog_div #save_but").css("left","45%");
	$("#select_fhdw_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectFHDWTab();
	openSelectFHDWDialog(0);
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
		url:jcxxPath+"queryFaHuoDanWeiList",
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

function initEditFHDWJBSXZDialog(){
	editFHDWDialog=$("#edit_fhdw_jbsxz_dialog_div").dialog({
		title:"修改发货单位实体",
		width:setFitWidthInParent("#edit_fhdw_div","edit_fhdw_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditFHDWDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editFHDW();
           }}
        ]
	});

	$("#edit_fhdw_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#edit_fhdw_div","edit_fhdw_jbsxz_dialog_div"))+"px");
	$("#edit_fhdw_jbsxz_dialog_div table").css("magin","-100px");
	$("#edit_fhdw_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#edit_fhdw_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#edit_fhdw_jbsxz_dialog_div table td").css("font-size","15px");
	$("#edit_fhdw_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(efhdwjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(efhdwjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(efhdwjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(efhdwjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(efhdwjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(efhdwjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(efhdwjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(efhdwjbsxzdNum).css("border-color","#ddd");

	$("#edit_fhdw_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#edit_fhdw_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#edit_fhdw_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#edit_fhdw_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditFHDWJBSXZDialog(0);
}

function initSHDWDialog(){
	dialogTop+=230;//920
	shdwDialog=$("#shdw_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("body","shdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
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

function initSelectSHDWDialog(){
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

	$("#select_shdw_dialog_div #cancel_but").css("left","30%");
	$("#select_shdw_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_shdw_dialog_div #save_but").css("left","45%");
	$("#select_shdw_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectSHDWTab();
	openSelectSHDWDialog(0);
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
		url:jcxxPath+"queryShouHuoDanWeiList",
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

function initEditSHDWJBSXZDialog(){
	editSHDWDialog=$("#edit_shdw_jbsxz_dialog_div").dialog({
		title:"修改收货单位实体",
		width:setFitWidthInParent("#edit_shdw_div","edit_shdw_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditSHDWDialog(0);
           }},
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
	$(".panel.window").eq(eshdwjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(eshdwjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(eshdwjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(eshdwjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(eshdwjbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(eshdwjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").eq(eshdwjbsxzdNum).css("border-color","#ddd");

	$("#edit_shdw_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#edit_shdw_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#edit_shdw_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#edit_shdw_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditSHDWJBSXZDialog(0);
}

function initCYCLDialog(){
	dialogTop+=230;//1150
	cyclDialog=$("#cycl_div").dialog({
		title:"承运车辆",
		width:setFitWidthInParent("body","cycl_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
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
	var rows;
	if('${requestScope.cycl}'==""){
		rows=[];
	}
	else{
		var cph='${requestScope.cycl.cph}';
		var id='${requestScope.cycl.id}';
		rows=[{gx:"1",cph:cph,id:id}];
	}
	loadCYCLTabData(rows);
}

function initSelectCYCLDialog(){
	selectCYCLDialog=$("#select_cycl_dialog_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("#select_cycl_div","select_cycl_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
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

	$("#select_cycl_dialog_div #cancel_but").css("left","30%");
	$("#select_cycl_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_cycl_dialog_div #save_but").css("left","45%");
	$("#select_cycl_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectCYCLTab();
	openSelectCYCLDialog(0);
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
		url:jcxxPath+"queryCheLiangList",
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
			{field:"bz",title:"备注",width:200,align:"center"}
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

function initCYSJDialog(){
	dialogTop+=230;//1380
	cysjDialog=$("#cysj_div").dialog({
		title:"承运司机",
		width:setFitWidthInParent("body","cysj_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
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
	var rows;
	if('${requestScope.cysj}'==""){
		rows=[];
	}
	else{
		var xm='${requestScope.cysj.xm}';
		var sjh='${requestScope.cysj.sjh}';
		var sfz='${requestScope.cysj.sfz}';
		var id='${requestScope.cysj.id}';
		rows=[{gx:"1",xm:xm,sjh:sjh,sfz:sfz,id:id}];
	}
	loadCYSJTabData(rows);
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

function initSelectCYSJDialog(){
	selectCYSJDialog=$("#select_cysj_dialog_div").dialog({
		title:"承运司机列表",
		width:setFitWidthInParent("#select_cysj_div","select_cysj_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
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

	$("#select_cysj_dialog_div #cancel_but").css("left","30%");
	$("#select_cysj_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_cysj_dialog_div #save_but").css("left","45%");
	$("#select_cysj_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectCYSJTab();
	openSelectCYSJDialog(0);
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
		url:jcxxPath+"querySiJiList",
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

function openSelectFHDWDialog(flag){
	if(flag==1){
		$("#select_fhdw_bg_div").css("display","block");
		$("#select_fhdw_bg_div").css("z-index",showZIndex);
		selectFHDWDialog.dialog("open");
	}
	else{
		$("#select_fhdw_bg_div").css("display","none");
		$("#select_fhdw_bg_div").css("z-index","9010");
		selectFHDWDialog.dialog("close");
	}
}

function openSelectSHDWDialog(flag){
	if(flag==1){
		$("#select_shdw_bg_div").css("display","block");
		$("#select_shdw_bg_div").css("z-index",showZIndex);
		selectSHDWDialog.dialog("open");
	}
	else{
		$("#select_shdw_bg_div").css("display","none");
		$("#select_shdw_bg_div").css("z-index","9010");
		selectSHDWDialog.dialog("close");
	}
}

function openSelectCYCLDialog(flag){
	if(flag==1){
		$("#select_cycl_bg_div").css("display","block");
		$("#select_cycl_bg_div").css("z-index",showZIndex);
		selectCYCLDialog.dialog("open");
	}
	else{
		$("#select_cycl_bg_div").css("display","none");
		$("#select_cycl_bg_div").css("z-index","9010");
		selectCYCLDialog.dialog("close");
	}
}

function openSelectCYSJDialog(flag){
	if(flag==1){
		$("#select_cysj_bg_div").css("display","block");
		$("#select_cysj_bg_div").css("z-index",showZIndex);
		selectCYSJDialog.dialog("open");
	}
	else{
		$("#select_cysj_bg_div").css("display","none");
		$("#select_cysj_bg_div").css("z-index","9010");
		selectCYSJDialog.dialog("close");
	}
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

function openEditWLXXDialog(flag){
	if(flag==1){
		$("#edit_wlxx_bg_div").css("display","block");
	}
	else{
		$("#edit_wlxx_bg_div").css("display","none");
	}
	openEditWLXXJBSXZDialog(flag);
}

function openEditWLXXJBSXZDialog(flag){
	if(flag==1){
		editWLXXDialog.dialog("open");
	}
	else{
		editWLXXDialog.dialog("close");
	}
}

function openEditFHDWDialog(flag){
	if(flag==1){
		$("#edit_fhdw_bg_div").css("display","block");
		$("#edit_fhdw_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#edit_fhdw_bg_div").css("display","none");
		$("#edit_fhdw_bg_div").css("z-index","9016");
	}
	openEditFHDWJBSXZDialog(flag);
}

function openEditFHDWJBSXZDialog(flag){
	if(flag==1){
		editFHDWDialog.dialog("open");
	}
	else{
		editFHDWDialog.dialog("close");
	}
}

function openEditSHDWDialog(flag){
	if(flag==1){
		$("#edit_shdw_bg_div").css("display","block");
		$("#edit_shdw_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#edit_shdw_bg_div").css("display","none");
		$("#edit_shdw_bg_div").css("z-index","9016");
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

function openEditCYCLDialog(flag){
	if(flag==1){
		editCYCLDialog.dialog("open");
	}
	else{
		editCYCLDialog.dialog("close");
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

function deleteYSSTabRow(){
	yssTab.datagrid("deleteRow",0);
	loadYSSTabData([]);
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

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "edit_div":
	case "yss_div":
	case "select_yss_tab":
	case "edit_yss_div":
		space=340;
		break;
	case "edit_div_table":
	case "panel_window":
	case "yss_tab":
		space=355;
		break;
	case "select_yss_dialog_div":
	case "edit_yss_jbsxz_dialog_div":
	case "select_wlxx_dialog_div":
	case "edit_wlxx_jbsxz_dialog_div":
	case "select_fhdw_dialog_div":
	case "edit_fhdw_jbsxz_dialog_div":
	case "select_shdw_dialog_div":
	case "edit_shdw_jbsxz_dialog_div":
	case "select_cycl_dialog_div":
	case "edit_cycl_jbsxz_dialog_div":
	case "select_cysj_dialog_div":
	case "edit_fhdw_jbsxz_dialog_div":
	case "select_shdw_dialog_div":
	case "select_cycl_dialog_div":
		space=50;
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
<title>修改</title>
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
				<span class="title_span">直接排队-运输商-修改</span>
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

<!-- 编辑物料信息 start -->
<div class="edit_wlxx_bg_div" id="edit_wlxx_bg_div">
	<div class="edit_wlxx_div" id="edit_wlxx_div">
		<div class="xgst_div">
			<span class="xgst_span">修改实体</span>
			<span class="close_span" onclick="openEditWLXXDialog(0)">X</span>
		</div>
		<div class="edit_wlxx_dialog_div" id="edit_wlxx_dialog_div">
			<div class="title_div">
				<span class="title_span">直接排队-物料信息-修改</span>
			</div>
			<div id="edit_wlxx_jbsxz_dialog_div">
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
<!-- 编辑物料信息 end -->

<!-- 选择发货单位 start -->
<div class="select_fhdw_bg_div" id="select_fhdw_bg_div">
	<div class="select_fhdw_div" id="select_fhdw_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectFHDWDialog(0)">X</span>
		</div>
		<div id="select_fhdw_dialog_div">
			<div id="select_fhdw_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">单位名称：</span>
				<input type="text" id="dwmc_inp" placeholder="请输入单位名称" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_fhdw_tab"></table>
		</div>
	</div>
</div>
<!-- 选择发货单位 end -->

<!-- 编辑发货单位 start -->
<div class="edit_fhdw_bg_div" id="edit_fhdw_bg_div">
	<div class="edit_fhdw_div" id="edit_fhdw_div">
		<div class="xgst_div">
			<span class="xgst_span">修改实体</span>
			<span class="close_span" onclick="openEditFHDWDialog(0)">X</span>
		</div>
		<div class="edit_fhdw_dialog_div" id="edit_fhdw_dialog_div">
			<div class="title_div">
				<span class="title_span">直接排队-发货单位-修改</span>
			</div>
			<div id="edit_fhdw_jbsxz_dialog_div">
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
		</div>
	</div>
</div>
<!-- 编辑发货单位 end -->

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
				<a id="search_but" style="margin-left: 13px;">查询</a>
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
				<span class="title_span">直接排队-收货单位-修改</span>
			</div>
			<div id="edit_shdw_jbsxz_dialog_div">
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
		</div>
	</div>
</div>
<!-- 编辑收货单位end -->
	
<!-- 选择承运车辆 start -->
<div class="select_cycl_bg_div" id="select_cycl_bg_div">
	<div class="select_cycl_div" id="select_cycl_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectCYCLDialog(0)">X</span>
		</div>
		<div id="select_cycl_dialog_div">
			<div id="select_cycl_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">车牌号：</span>
				<input type="text" id="cph_inp" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">车辆类型：</span>
				<input id="cllx_cbb"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_cycl_tab"></table>
		</div>
	</div>
</div>
<!-- 选择承运车辆 end -->
	
<!-- 选择承运司机 start -->
<div class="select_cysj_bg_div" id="select_cysj_bg_div">
	<div class="select_cysj_div" id="select_cysj_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectCYSJDialog(0)">X</span>
		</div>
		<div id="select_cysj_dialog_div">
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
	</div>
</div>
<!-- 选择承运司机end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">直接排队-修改</div>

	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="wybm" name="wybm" value="${requestScope.zjpd.wybm }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<input type="text" id="ddh" name="ddh" value="${requestScope.zjpd.ddh }" placeholder="请输入车牌号" disabled="disabled" style="width: 180px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				预装卸重量
			</td>
			<td style="width:30%;">
				<input type="number" id="yzxzl" name="yzxzl" value="${requestScope.zjpd.yzxzl }" placeholder="请输入预装卸重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				流向类型
			</td>
			<td>
				<input id="lxlx_cbb"/>
				<input type="hidden" id="lxlx" name="lxlx" value="${requestScope.zjpd.lxlx }"/>
			</td>
			<td align="right">
				编辑时间
			</td>
			<td>
				<input id="bjsj_dtb"/>
				<input type="hidden" id="cllx" name="cllx" value="${requestScope.cl.cllx }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				二维码
			</td>
			<td>
				<div>
					${requestScope.zjpd.ewm }
				</div>
			</td>
			<td align="right">
				实际重量
			</td>
			<td>
				<input type="number" id="sjzl" value="${requestScope.zjpd.sjzl }" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				重量差额比
			</td>
			<td>
				<input type="number" id="zlceb" value="${requestScope.zjpd.zlceb }" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				订单状态
			</td>
			<td>
				<input id="ddzt_cbb"/>
				<input type="hidden" id="ddztId" name="ddztId" value="${requestScope.zjpd.ddztId }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				计划运输日期
			</td>
			<td>
				<input id="jhysrq_db"/>
				<input type="hidden" id="jhysrq" name="jhysrq" value="${requestScope.zjpd.jhysrq }"/>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</form>
	</div>
	
	<div id="yss_div">
		<div id="yss_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="yss_tab"></table>
	</div>
	
	<div id="wlxx_div">
		<div id="wlxx_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="wlxx_tab"></table>
	</div>
	
	<div id="fhdw_div">
		<div id="fhdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="fhdw_tab"></table>
	</div>
	
	<div id="shdw_div">
		<div id="shdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="shdw_tab"></table>
	</div>
	
	<div id="cycl_div">
		<div id="cycl_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="cycl_tab"></table>
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
	
	<div id="cysj_div">
		<div id="cysj_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="cysj_tab"></table>
	</div>
</div>
</body>
</html>