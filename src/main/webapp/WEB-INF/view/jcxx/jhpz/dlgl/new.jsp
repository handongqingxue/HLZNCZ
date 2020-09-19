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
	wzlxDialog=$("#shdw_div").dialog({
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

function initSHDWTab(){
	$("#choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			
		}
	});
	
	shdwTab=$("#shdw_tab").datagrid({
		//url:path+"main/queryWuZiLeiXingList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body","shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"gx",title:"关系",width:200},
            {field:"dwmc",title:"单位名称",width:200},
			{field:"bjsj",title:"编辑时间",width:200},
			{field:"id",title:"操作",width:200}
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
	var obj = {"total":0,"rows":[]};
	shdwTab.datagrid('loadData',obj);
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

function openWZLXDialog(flag){
	if(flag==1){
		wzlxDialog.dialog("open");
	}
	else{
		wzlxDialog.dialog("close");
	}
}

function saveWZLX(){
	var row=shdwTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	$("#new_div #wzlx_hid").val(row.id);
	$("#new_div #wzlxmc_span").text(row.mc);
	openWZLXDialog(0);
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
	
	$.post(path+"main/newWuZi",
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
	case "shdw_div":
		space=340;
		break;
	case "new_div_table":
	case "panel_window":
	case "shdw_tab":
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
				<input type="text" id="jhyz" placeholder="请输入叫号阈值" style="width: 150px;height:30px;" onfocus="focusYHYZ()" onblur="checkYHYZ()"/>
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
		<div id="toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="shdw_tab"></table>
	</div>
</div>
</body>
</html>