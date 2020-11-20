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

.new_zjbg_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.new_zjbg_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.new_zjbg_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.new_zjbg_div .xgst_span{
	margin-left: 30px;
}
.new_zjbg_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.new_zjbg_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.new_zjbg_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.new_zjbg_div .title_span{
	margin-left: 30px;
}

.edit_zjbg_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.edit_zjbg_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.edit_zjbg_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.edit_zjbg_div .xgst_span{
	margin-left: 30px;
}
.edit_zjbg_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.edit_zjbg_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.edit_zjbg_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.edit_zjbg_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var edNum=0;
var zjbgdNum=1;
var nzjbgjbsxzdNum=2;
var ezjbgjbsxzdNum=3;
$(function(){
	initEditDialog();//0

	initZJBGDialog();//1.质检报告窗口
	initNewZJBGJBSXZDialog();//2.新增质检报告窗口
	initEditZJBGJBSXZDialog();//3.编辑质检报告窗口
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	//质检报告
	var zjbgdpw=$("body").find(".panel.window").eq(zjbgdNum);
	var zjbgdws=$("body").find(".window-shadow").eq(zjbgdNum);

	//新增质检报告
	var nfhdwjbsxdpw=$("body").find(".panel.window").eq(nzjbgjbsxzdNum);
	var nfhdwjbsxdws=$("body").find(".window-shadow").eq(nzjbgjbsxzdNum);

	//修改质检报告
	var efhdwjbsxdpw=$("body").find(".panel.window").eq(ezjbgjbsxzdNum);
	var efhdwjbsxdws=$("body").find(".window-shadow").eq(ezjbgjbsxzdNum);


	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);

	ccDiv.append(zjbgdpw);
	ccDiv.append(zjbgdws);

	var nzjbgdDiv=$("#new_zjbg_dialog_div");
	nzjbgdDiv.append(nfhdwjbsxdpw);
	nzjbgdDiv.append(nfhdwjbsxdws);

	var ezjbgdDiv=$("#edit_zjbg_dialog_div");
	ezjbgdDiv.append(efhdwjbsxdpw);
	ezjbgdDiv.append(efhdwjbsxdws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:380,
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
	initEditDivZXZTCBB();
	initEditDivRKZTCBB();
	initEditDivJHYSRQDB();
	initEditDivCRKSJDB();
}

function initEditDivLXLXCBB(){
	edlxlxCBB=$("#edit_div #lxlx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"送运"},{"value":"2","text":"取运"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dd.lxlx }');
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
	edbjsjDTB.datebox("setValue",'${requestScope.dd.bjsj }');
}

function initEditDivZXZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择执行状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ssddZXZTCBB=$("#edit_div #zxzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data,
				onLoadSuccess:function(){
					$(this).combobox("setValue",'${requestScope.dd.ddztId }');
				}
			});
		}
	,"json");
}

function initEditDivRKZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择入库状态"});
	data.push({"value":"1","text":"未入库"});
	data.push({"value":"2","text":"待入库"});
	data.push({"value":"3","text":"已入库"});
	data.push({"value":"4","text":"入库异常"});
	ssddRKZTCBB=$("#edit_div #rkzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:data,
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dd.rkzt }');
		}
	});
}

function initEditDivJHYSRQDB(){
	edjhysrqDB=$("#edit_div #jhysrq_db").datebox({
        required:false,
        onSelect:function(){
        	$("#edit_div #jhysrq").val(edjhysrqDB.datebox("getValue"));
        }
	});
	edjhysrqDB.datebox("setValue",'${requestScope.dd.jhysrq }');
}

function initEditDivCRKSJDB(){
	edcrksjDB=$("#edit_div #crksj_db").datebox({
        required:false,
        onSelect:function(){
        	$("#edit_div #crksj").val(edcrksjDB.datebox("getValue"));
        }
	});
	if('${requestScope.dd.crksj }'==null||'${requestScope.dd.crksj }'=="")
		edcrksjDB.datebox('textbox').attr('placeholder', '请选择出入库时间');
	else
		edcrksjDB.datebox("setValue",'${requestScope.dd.crksj }');
}

function initZJBGDialog(){
	dialogTop+=410;//360
	yssDialog=$("#zjbg_div").dialog({
		title:"质检报告",
		width:setFitWidthInParent("body","zjbg_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(zjbgdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(zjbgdNum).css("margin-top","20px");
	$(".panel.window").eq(zjbgdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(zjbgdNum).css("color","#000");
	$(".panel.window .panel-title").eq(zjbgdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(zjbgdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(zjbgdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(zjbgdNum).css("width","1000px");
	$(".window-shadow").eq(zjbgdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(zjbgdNum).css("border-color","#ddd");

	initZJBGTab();
}

function initZJBGTab(){
	zjbgAddLB=$("#zjbg_div #add_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openNewZJBGDialog(1);
		}
	});
	
	zjbgTab=$("#zjbg_tab").datagrid({
		toolbar:"#zjbg_toolbar",
		width:setFitWidthInParent("body","zjbg_tab"),
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
            {field:"jl",title:"结论",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="合格";
					break;
				case "2":
					str="不合格";
					break;
				}
				return str;
			}},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"editZJBGTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteZJBGTabRow()\">删除</a>";
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
	if('${requestScope.zjbg}'==""){
		rows=[];
	}
	else{
		var jl='${requestScope.zjbg.jl}';
		var bjsj='${requestScope.zjbg.bjsj}';
		var id='${requestScope.zjbg.id}';
		rows=[{gx:"1",jl:jl,bjsj:bjsj,id:id}];
	}
	loadZJBGTabData(rows);
}

function initNewZJBGJBSXZDialog(){
	newZJBGDialog=$("#new_zjbg_jbsxz_dialog_div").dialog({
		title:"新增质检报告实体",
		width:setFitWidthInParent("#new_zjbg_div","new_zjbg_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openNewZJBGDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    newZJBG();
           }}
        ]
	});

	$("#new_zjbg_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#new_zjbg_div","new_zjbg_jbsxz_dialog_div"))+"px");
	$("#new_zjbg_jbsxz_dialog_div table").css("magin","-100px");
	$("#new_zjbg_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#new_zjbg_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#new_zjbg_jbsxz_dialog_div table td").css("font-size","15px");
	$("#new_zjbg_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(nzjbgjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(nzjbgjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(nzjbgjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(nzjbgjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(nzjbgjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(nzjbgjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#new_zjbg_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#new_zjbg_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#new_zjbg_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#new_zjbg_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initNewZJBGDivGXCBB();
	initNewZJBGDivJLCBB();
	
	openNewZJBGJBSXZDialog(0);
}

function initNewZJBGDivGXCBB(){
	nzjbgdgxCBB=$("#nZjbgGx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择关系"},{"value":"1","text":"检验报告"}]
	});
}

function initNewZJBGDivJLCBB(){
	nzjbgdjlCBB=$("#nZjbgJl_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择结论"},{"value":"1","text":"合格"},{"value":"2","text":"不合格"}]
	});
}

function initEditZJBGJBSXZDialog(){
	editZJBGDialog=$("#edit_zjbg_jbsxz_dialog_div").dialog({
		title:"修改质检报告实体",
		width:setFitWidthInParent("#new_zjbg_div","edit_zjbg_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditZJBGDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   editZJBG();
           }}
        ]
	});

	$("#edit_zjbg_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#edit_zjbg_div","edit_zjbg_jbsxz_dialog_div"))+"px");
	$("#edit_zjbg_jbsxz_dialog_div table").css("magin","-100px");
	$("#edit_zjbg_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#edit_zjbg_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#edit_zjbg_jbsxz_dialog_div table td").css("font-size","15px");
	$("#edit_zjbg_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(ezjbgjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(ezjbgjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ezjbgjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(ezjbgjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ezjbgjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ezjbgjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#edit_zjbg_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#edit_zjbg_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#edit_zjbg_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#edit_zjbg_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initEditZJBGDivGXCBB();
	initEditZJBGDivJLCBB();
	
	openEditZJBGJBSXZDialog(0);
}

function initEditZJBGDivGXCBB(){
	ezjbgdgxCBB=$("#eZjbgGx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择关系"},{"value":"1","text":"检验报告"}]
	});
}

function initEditZJBGDivJLCBB(){
	ezjbgdjlCBB=$("#eZjbgJl_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择结论"},{"value":"1","text":"合格"},{"value":"2","text":"不合格"}]
	});
}

function loadZJBGTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		zjbgAddLB.linkbutton("disable");
	else
		zjbgAddLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	zjbgTab.datagrid('loadData',obj);
}

function newZJBG(){
	var id=$("#new_zjbg_div #id").val();
	var jl=nzjbgdjlCBB.combobox("getValue");
	var rows=[{gx:"1",jl:jl,id:id}];
	loadZJBGTabData(rows);
	openNewZJBGDialog(0);
}

function editZJBGTabRow(){
	var row=zjbgTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	ezjbgdgxCBB.combobox("setValue",row.gx);
	ezjbgdjlCBB.combobox("setValue",row.jl);
	openEditZJBGDialog(1);
}

function editZJBG(){
	var gx=ezjbgdgxCBB.combobox("getValue");
	var jl=ezjbgdjlCBB.combobox("getValue");
	var rows=[{gx:gx,jl:jl}];
	loadZJBGTabData(rows);
	openEditZJBGDialog(0);
}

function deleteZJBGTabRow(){
	zjbgTab.datagrid("deleteRow",0);
	loadZJBGTabData([]);
}

function openNewZJBGDialog(flag){
	if(flag==1){
		$("#new_zjbg_bg_div").css("display","block");
		$("#new_zjbg_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#new_zjbg_bg_div").css("display","none");
		$("#new_zjbg_bg_div").css("z-index","9016");
	}
	openNewZJBGJBSXZDialog(flag);
}

function openNewZJBGJBSXZDialog(flag){
	if(flag==1){
		newZJBGDialog.dialog("open");
	}
	else{
		newZJBGDialog.dialog("close");
	}
}

function openEditZJBGDialog(flag){
	if(flag==1){
		$("#edit_zjbg_bg_div").css("display","block");
		$("#edit_zjbg_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#edit_zjbg_bg_div").css("display","none");
		$("#edit_zjbg_bg_div").css("z-index","9016");
	}
	openEditZJBGJBSXZDialog(flag);
}

function openEditZJBGJBSXZDialog(flag){
	if(flag==1){
		editZJBGDialog.dialog("open");
	}
	else{
		editZJBGDialog.dialog("close");
	}
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "edit_div":
	case "zjbg_div":
	case "select_zjbg_tab":
	case "edit_zjbg_div":
		space=340;
		break;
	case "edit_div_table":
	case "panel_window":
	case "zjbg_tab":
		space=355;
		break;
	case "select_yss_dialog_div":
	case "edit_yss_jbsxz_dialog_div":
	case "select_wlxx_dialog_div":
	case "edit_wlxx_jbsxz_dialog_div":
	case "select_fhdw_dialog_div":
	case "new_zjbg_jbsxz_dialog_div":
	case "select_shdw_dialog_div":
	case "edit_shdw_jbsxz_dialog_div":
	case "select_cycl_dialog_div":
	case "edit_cycl_jbsxz_dialog_div":
	case "select_cysj_dialog_div":
	case "select_shdw_dialog_div":
	case "select_cycl_dialog_div":
		space=50;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>修改</title>
</head>
<body>

<!-- 新增质检报告 start -->
<div class="new_zjbg_bg_div" id="new_zjbg_bg_div">
	<div class="new_zjbg_div" id="new_zjbg_div">
		<div class="xgst_div">
			<span class="xgst_span">修改实体</span>
			<span class="close_span" onclick="openNewZJBGDialog(0)">X</span>
		</div>
		<div class="new_zjbg_dialog_div" id="new_zjbg_dialog_div">
			<div class="title_div">
				<span class="title_span">综合管理-发货单位-新增</span>
			</div>
			<div id="new_zjbg_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						关系
					</td>
					<td style="width:30%;">
						<input id="nZjbgGx_cbb"/>
					</td>
					<td align="right" style="width:15%;">
						结论
					</td>
					<td style="width:30%;">
						<input id="nZjbgJl_cbb"/>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 新增质检报告 end -->

<!-- 编辑质检报告 start -->
<div class="edit_zjbg_bg_div" id="edit_zjbg_bg_div">
	<div class="edit_zjbg_div" id="edit_zjbg_div">
		<div class="xgst_div">
			<span class="xgst_span">修改实体</span>
			<span class="close_span" onclick="openEditZJBGDialog(0)">X</span>
		</div>
		<div class="edit_zjbg_dialog_div" id="edit_zjbg_dialog_div">
			<div class="title_div">
				<span class="title_span">综合管理-发货单位-修改</span>
			</div>
			<div id="edit_zjbg_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						关系
					</td>
					<td style="width:30%;">
						<input id="eZjbgGx_cbb"/>
					</td>
					<td align="right" style="width:15%;">
						结论
					</td>
					<td style="width:30%;">
						<input id="eZjbgJl_cbb"/>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 编辑质检报告 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">待质检-修改</div>
	
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="wybm" name="wybm" value="${requestScope.dd.wybm }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<input type="text" id="ddh" name="ddh" value="${requestScope.dd.ddh }" placeholder="请输入车牌号" disabled="disabled" style="width: 180px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				预装卸重量
			</td>
			<td style="width:30%;">
				<input type="number" id="yzxzl" name="yzxzl" value="${requestScope.dd.yzxzl }" placeholder="请输入预装卸重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				流向类型
			</td>
			<td>
				<input id="lxlx_cbb"/>
				<input type="hidden" id="lxlx" name="lxlx" value="${requestScope.dd.lxlx }"/>
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
				执行状态
			</td>
			<td>
				<input id="zxzt_cbb"/>
				<input type="hidden" id="zxztId" name="ddztId" value="${requestScope.dd.ddztId }"/>
			</td>
			<td align="right">
				入库状态
			</td>
			<td>
				<input id="rkzt_cbb"/>
				<input type="hidden" id="rkzt" name="rkzt" value="${requestScope.dd.rkzt }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				实际重量
			</td>
			<td>
				<input type="number" id="sjzl" value="${requestScope.dd.sjzl }" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				重量差额比
			</td>
			<td>
				<input type="number" id="zlceb" value="${requestScope.dd.zlceb }" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				计划运输日期
			</td>
			<td>
				<input id="jhysrq_db"/>
				<input type="hidden" id="jhysrq" name="jhysrq" value="${requestScope.dd.jhysrq }"/>
			</td>
			<td align="right">
				出入库时间
			</td>
			<td>
				<input id="crksj_db"/>
				<input type="hidden" id="crksj" name="crksj" value="${requestScope.dd.crksj }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				二维码
			</td>
			<td>
				<div>
					${requestScope.dd.ewm }
				</div>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</form>
	</div>
	
	<div id="zjbg_div">
		<div id="zjbg_toolbar" style="height:32px;line-height:32px;">
			<a id="add_but" style="margin-left: 13px;">新增</a>
		</div>
		<table id="zjbg_tab"></table>
	</div>
</div>
</body>
</html>