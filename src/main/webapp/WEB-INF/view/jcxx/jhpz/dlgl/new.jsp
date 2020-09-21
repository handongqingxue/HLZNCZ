<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
$(function(){
	initEditDialog();
	initSHDWDialog();
	initSelectShdwDialog();
	initEditShdwDialog();
});

function initEditDialog(){
	$("#new_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","new_div"),
		height:231,
		top:60,
		left:308,
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

	$(".panel.window").eq(0).css("margin-top","20px");
	$(".panel.window .panel-title").eq(0).css("color","#000");
	$(".panel.window .panel-title").eq(0).css("font-size","15px");
	$(".panel.window .panel-title").eq(0).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(0).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(0).css("margin-top","20px");
	$(".window,.window .window-body").eq(0).css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initJHXSCBB();
	initZTCBB();
}

function initSHDWDialog(){
	shdwDialog=$("#shdw_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("body","shdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:308
	});
	
	$(".panel.window").eq(1).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(1).css("margin-top","20px");
	$(".panel.window").eq(1).css("margin-left",initWindowMarginLeft());
	$(".panel.window .panel-title").eq(1).css("color","#000");
	$(".panel.window .panel-title").eq(1).css("font-size","15px");
	$(".panel.window .panel-title").eq(1).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(1).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	//$(".window-shadow").eq(1).css("width","1000px");
	$(".window-shadow").eq(1).css("margin-top","20px");
	$(".window-shadow").eq(1).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(1).css("border-color","#ddd");

	initSHDWTab();
}

function initSelectShdwDialog(){
	selectSHDWDialog=$("#select_shdw_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body","select_shdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectSHDWDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectSHDW();
           }}
        ]
	});
	
	$(".panel.window").eq(2).css("width","983px");
	$(".panel.window").eq(2).css("margin-top","20px");
	$(".panel.window").eq(2).css("margin-left",initWindowMarginLeft());
	$(".panel.window .panel-title").eq(2).css("color","#000");
	$(".panel.window .panel-title").eq(2).css("font-size","15px");
	$(".panel.window .panel-title").eq(2).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(2).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(2).css("width","1000px");
	$(".window-shadow").eq(2).css("margin-top","20px");
	$(".window-shadow").eq(2).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(2).css("border-color","#ddd");

	$("#select_shdw_div #cancel_but").css("left","30%");
	$("#select_shdw_div #cancel_but").css("position","absolute");
	
	$("#select_shdw_div #save_but").css("left","45%");
	$("#select_shdw_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectSHDWTab();
	openSelectSHDWDialog(0);
}

function initEditShdwDialog(){
	editSHDWDialog=$("#edit_shdw_div").dialog({
		title:"修改",
		width:setFitWidthInParent("body","edit_shdw_div"),
		height:231,
		top:160,
		left:308,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editSHDW();
           }}
        ]
	});

	$("#edit_shdw_div table").css("width",(setFitWidthInParent("body","edit_shdw_div"))+"px");
	$("#edit_shdw_div table").css("magin","-100px");
	$("#edit_shdw_div table td").css("padding-left","50px");
	$("#edit_shdw_div table td").css("padding-right","20px");
	$("#edit_shdw_div table td").css("font-size","15px");
	$("#edit_shdw_div table tr").css("height","45px");

	$(".panel.window").eq(3).css("margin-top","20px");
	$(".panel.window .panel-title").eq(3).css("color","#000");
	$(".panel.window .panel-title").eq(3).css("font-size","15px");
	$(".panel.window .panel-title").eq(3).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(3).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(3).css("margin-top","20px");
	$(".window,.window .window-body").eq(3).css("border-color","#ddd");

	$("#edit_shdw_div #ok_but").css("left","45%");
	$("#edit_shdw_div #ok_but").css("position","absolute");
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
		url:path+"main/queryShouHuoDanWeiList",
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
		selectSHDWDialog.dialog("open");
	}
	else{
		selectSHDWDialog.dialog("close");
	}
}

function openEditSHDWDialog(flag){
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
	
	$.post(path+"main/newDuiLie",
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
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
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
	
	<div id="select_shdw_div">
		<div id="select_shdw_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">单位名称：</span>
			<input type="text" id="dwmc_inp" placeholder="请输入单位名称" style="width: 120px;height: 25px;"/>
			<a id="select_shdw_search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_shdw_tab"></table>
	</div>
	
	<div id="edit_shdw_div">
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
</body>
</html>