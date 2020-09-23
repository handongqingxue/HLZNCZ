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
	initNewDialog();//0
	
	initYSSDialog();//1.运输商窗口
	initSelectYSSDialog();//2.选择运输商窗口
	initEditYSSDialog();//3.修改运输商窗口
	
	initWLXXDialog();//4.物料信息窗口
	initSelectWLXXDialog();//5.选择物料信息窗口
	initEditWLXXDialog();//6.修改物料信息窗口

	initFHDWDialog();//7.发货单位窗口
	initSelectFHDWDialog();//8.选择发货单位窗口
	initEditFHDWDialog();//9.修改发货单位窗口

	initSHDWDialog();//10.收货单位窗口
	initSelectSHDWDialog();//11.选择收货单位窗口
	initEditSHDWDialog();//12.修改发货单位窗口
});

function initNewDialog(){
	$("#new_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("body","new_div"),
		height:200,
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

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").eq(0).css("color","#000");
	$(".panel.window .panel-title").eq(0).css("font-size","15px");
	$(".panel.window .panel-title").eq(0).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(0).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").eq(0).css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initJHYSRQDB();
	initLXLXCBB();
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

function initYSSDialog(){
	yssDialog=$("#yss_div").dialog({
		title:"运输商",
		width:setFitWidthInParent("body","yss_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
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
	$(".window-shadow").eq(1).css("width","1000px");
	$(".window-shadow").eq(1).css("margin-top","20px");
	$(".window-shadow").eq(1).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(1).css("border-color","#ddd");

	initYSSTab();
}

function initWLXXDialog(){
	wlxxDialog=$("#wlxx_div").dialog({
		title:"物料信息",
		width:setFitWidthInParent("body","wlxx_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:650,
		left:308
	});
	
	$(".panel.window").eq(4).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(4).css("margin-top","20px");
	$(".panel.window").eq(4).css("margin-left",initWindowMarginLeft());
	$(".panel.window .panel-title").eq(4).css("color","#000");
	$(".panel.window .panel-title").eq(4).css("font-size","15px");
	$(".panel.window .panel-title").eq(4).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(4).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(4).css("width","1000px");
	$(".window-shadow").eq(4).css("margin-top","20px");
	$(".window-shadow").eq(4).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(4).css("border-color","#ddd");

	initWLXXTab();
}

function initFHDWDialog(){
	fhdwDialog=$("#fhdw_div").dialog({
		title:"发货单位",
		width:setFitWidthInParent("body","fhdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:1000,
		left:308
	});
	
	$(".panel.window").eq(7).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(7).css("margin-top","20px");
	$(".panel.window").eq(7).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(7).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(7).css("color","#000");
	$(".panel.window .panel-title").eq(7).css("font-size","15px");
	$(".panel.window .panel-title").eq(7).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(7).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(7).css("width","1000px");
	$(".window-shadow").eq(7).css("margin-top","20px");
	$(".window-shadow").eq(7).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(7).css("border-color","#ddd");

	initFHDWTab();
}

function initSHDWDialog(){
	shdwDialog=$("#shdw_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("body","shdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:1350,
		left:308
	});
	
	$(".panel.window").eq(10).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(10).css("margin-top","20px");
	$(".panel.window").eq(10).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(10).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(10).css("color","#000");
	$(".panel.window .panel-title").eq(10).css("font-size","15px");
	$(".panel.window .panel-title").eq(10).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(10).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(10).css("width","1000px");
	$(".window-shadow").eq(10).css("margin-top","20px");
	$(".window-shadow").eq(10).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(10).css("border-color","#ddd");

	initSHDWTab();
}

function initYSSTab(){
	$("#yss_div #choose_but").linkbutton({
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
			{field:"gx",title:"关系",width:200,formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="关系运输商";
					break;
				}
				return str;
			}},
            {field:"mc",title:"名称",width:200},
			{field:"id",title:"操作",width:200,formatter:function(value,row){
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
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	loadYSSTabData([]);
}

function initWLXXTab(){
	$("#wlxx_div #choose_but").linkbutton({
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
			{field:"gx",title:"关系",width:200,formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="运输物资";
					break;
				}
				return str;
			}},
            {field:"mc",title:"名称",width:200},
			{field:"id",title:"操作",width:200,formatter:function(value,row){
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
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	loadWLXXTabData([]);
}

function initFHDWTab(){
	$("#fhdw_div #choose_but").linkbutton({
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
			{field:"gx",title:"关系",width:200,formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="发货单位";
					break;
				}
				return str;
			}},
            {field:"dwmc",title:"单位名称",width:200},
			{field:"id",title:"操作",width:200,formatter:function(value,row){
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
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	loadFHDWTabData([]);
}

function initSHDWTab(){
	$("#shdw_div #choose_but").linkbutton({
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
			{field:"id",title:"操作",width:200,formatter:function(value,row){
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
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	loadSHDWTabData([]);
}

function initSelectYSSDialog(){
	selectYSSDialog=$("#select_yss_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectYSSDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectYSS();
           }}
        ]
	});
	
	$(".panel.window").eq(2).css("width","983px");
	$(".panel.window").eq(2).css("margin-top","20px");
	$(".panel.window").eq(2).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(2).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(2).css("color","#000");
	$(".panel.window .panel-title").eq(2).css("font-size","15px");
	$(".panel.window .panel-title").eq(2).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(2).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(2).css("width","1000px");
	$(".window-shadow").eq(2).css("margin-top","20px");
	$(".window-shadow").eq(2).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(2).css("border-color","#ddd");

	$("#select_yss_div #cancel_but").css("left","30%");
	$("#select_yss_div #cancel_but").css("position","absolute");
	
	$("#select_yss_div #save_but").css("left","45%");
	$("#select_yss_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectYSSTab();
	openSelectYSSDialog(0);
}

function initSelectWLXXDialog(){
	selectWLXXDialog=$("#select_wlxx_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectWLXXDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectWLXX();
           }}
        ]
	});
	
	$(".panel.window").eq(5).css("width","983px");
	$(".panel.window").eq(5).css("margin-top","20px");
	$(".panel.window").eq(5).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(5).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(5).css("color","#000");
	$(".panel.window .panel-title").eq(5).css("font-size","15px");
	$(".panel.window .panel-title").eq(5).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(5).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(5).css("width","1000px");
	$(".window-shadow").eq(5).css("margin-top","20px");
	$(".window-shadow").eq(5).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(5).css("border-color","#ddd");

	$("#select_wlxx_div #cancel_but").css("left","30%");
	$("#select_wlxx_div #cancel_but").css("position","absolute");
	
	$("#select_wlxx_div #save_but").css("left","45%");
	$("#select_wlxx_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectWLXXTab();
	openSelectWLXXDialog(0);
}

function initSelectFHDWDialog(){
	selectFHDWDialog=$("#select_fhdw_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:300,
		left:400,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectFHDWDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectFHDW();
           }}
        ]
	});
	
	$(".panel.window").eq(8).css("width","983px");
	$(".panel.window").eq(8).css("margin-top","20px");
	$(".panel.window").eq(8).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(8).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(8).css("color","#000");
	$(".panel.window .panel-title").eq(8).css("font-size","15px");
	$(".panel.window .panel-title").eq(8).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(8).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(8).css("width","1000px");
	$(".window-shadow").eq(8).css("margin-top","20px");
	$(".window-shadow").eq(8).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(8).css("border-color","#ddd");

	$("#select_fhdw_div #cancel_but").css("left","30%");
	$("#select_fhdw_div #cancel_but").css("position","absolute");
	
	$("#select_fhdw_div #save_but").css("left","45%");
	$("#select_fhdw_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectFHDWTab();
	openSelectFHDWDialog(0);
}

function initSelectSHDWDialog(){
	selectSHDWDialog=$("#select_shdw_div").dialog({
		title:"选择实体",
		width:setFitWidthInParent("body"),
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
	
	$(".panel.window").eq(11).css("width","983px");
	$(".panel.window").eq(11).css("margin-top","20px");
	$(".panel.window").eq(11).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(11).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(11).css("color","#000");
	$(".panel.window .panel-title").eq(11).css("font-size","15px");
	$(".panel.window .panel-title").eq(11).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(11).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(11).css("width","1000px");
	$(".window-shadow").eq(11).css("margin-top","20px");
	$(".window-shadow").eq(11).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(11).css("border-color","#ddd");

	$("#select_shdw_div #cancel_but").css("left","30%");
	$("#select_shdw_div #cancel_but").css("position","absolute");
	
	$("#select_shdw_div #save_but").css("left","45%");
	$("#select_shdw_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectSHDWTab();
	openSelectSHDWDialog(0);
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
			{field:"mc",title:"名称",width:200},
			{field:"bjsj",title:"编辑时间",width:200}
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
			{field:"mc",title:"名称",width:200},
			{field:"wzlx",title:"物资类型",width:200},
			{field:"bjsj",title:"编辑时间",width:200}
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
			//reSizeCol();
		}
	});
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
		url:path+"main/queryFaHuoDanWeiList",
		toolbar:"#select_fhdw_toolbar",
		width:setFitWidthInParent("body","select_fhdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"dwmc",title:"单位名称",width:200},
			{field:"bjsj",title:"编辑时间",width:200}
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

function initSelectSHDWTab(){
	$("#select_shdw_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var dwmc=$("#select_shdw_toolbar #dwmc_inp").val();
			selectSHDWTab.datagrid("load",{dwmc:dwmc});
		}
	});
	
	selectSHDWTab=$("#select_shdw_tab").datagrid({
		url:path+"main/queryShouHuoDanWeiList",
		toolbar:"#select_shdw_toolbar",
		width:setFitWidthInParent("body","select_shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"dwmc",title:"单位名称",width:200},
			{field:"bjsj",title:"编辑时间",width:200}
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

function initEditYSSDialog(){
	editYSSDialog=$("#edit_yss_div").dialog({
		title:"修改运输商实体",
		width:setFitWidthInParent("body","edit_yss_div"),
		height:231,
		top:160,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditYSSDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editYSS();
           }}
        ]
	});

	$("#edit_yss_div table").css("width",(setFitWidthInParent("body","edit_yss_div"))+"px");
	$("#edit_yss_div table").css("magin","-100px");
	$("#edit_yss_div table td").css("padding-left","50px");
	$("#edit_yss_div table td").css("padding-right","20px");
	$("#edit_yss_div table td").css("font-size","15px");
	$("#edit_yss_div table tr").css("height","45px");

	$(".panel.window").eq(3).css("margin-top","20px");
	$(".panel.window .panel-title").eq(3).css("color","#000");
	$(".panel.window .panel-title").eq(3).css("font-size","15px");
	$(".panel.window .panel-title").eq(3).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(3).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(3).css("margin-top","20px");
	$(".window,.window .window-body").eq(3).css("border-color","#ddd");

	$("#edit_yss_div #cancel_but").css("left","30%");
	$("#edit_yss_div #cancel_but").css("position","absolute");

	$("#edit_yss_div #ok_but").css("left","45%");
	$("#edit_yss_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditYSSDialog(0);
}

function initEditWLXXDialog(){
	editWLXXDialog=$("#edit_wlxx_div").dialog({
		title:"修改物料信息实体",
		width:setFitWidthInParent("body","edit_wlxx_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditWLXXDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editWLXX();
           }}
        ]
	});

	$("#edit_wlxx_div table").css("width",(setFitWidthInParent("body","edit_wlxx_div"))+"px");
	$("#edit_wlxx_div table").css("magin","-100px");
	$("#edit_wlxx_div table td").css("padding-left","50px");
	$("#edit_wlxx_div table td").css("padding-right","20px");
	$("#edit_wlxx_div table td").css("font-size","15px");
	$("#edit_wlxx_div table tr").css("height","45px");

	$(".panel.window").eq(6).css("margin-top","20px");
	$(".panel.window").eq(6).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(6).css("color","#000");
	$(".panel.window .panel-title").eq(6).css("font-size","15px");
	$(".panel.window .panel-title").eq(6).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(6).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(6).css("margin-top","20px");
	$(".window,.window .window-body").eq(6).css("border-color","#ddd");

	$("#edit_wlxx_div #cancel_but").css("left","30%");
	$("#edit_wlxx_div #cancel_but").css("position","absolute");

	$("#edit_wlxx_div #ok_but").css("left","45%");
	$("#edit_wlxx_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditWLXXDialog(0);
}

function initEditFHDWDialog(){
	editFHDWDialog=$("#edit_fhdw_div").dialog({
		title:"修改发货单位实体",
		width:setFitWidthInParent("body","edit_fhdw_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditFHDWDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    editFHDW();
           }}
        ]
	});

	$("#edit_fhdw_div table").css("width",(setFitWidthInParent("body","edit_fhdw_div"))+"px");
	$("#edit_fhdw_div table").css("magin","-100px");
	$("#edit_fhdw_div table td").css("padding-left","50px");
	$("#edit_fhdw_div table td").css("padding-right","20px");
	$("#edit_fhdw_div table td").css("font-size","15px");
	$("#edit_fhdw_div table tr").css("height","45px");

	$(".panel.window").eq(9).css("margin-top","20px");
	$(".panel.window").eq(9).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(9).css("color","#000");
	$(".panel.window .panel-title").eq(9).css("font-size","15px");
	$(".panel.window .panel-title").eq(9).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(9).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(9).css("margin-top","20px");
	$(".window,.window .window-body").eq(9).css("border-color","#ddd");

	$("#edit_fhdw_div #cancel_but").css("left","30%");
	$("#edit_fhdw_div #cancel_but").css("position","absolute");

	$("#edit_fhdw_div #ok_but").css("left","45%");
	$("#edit_fhdw_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditFHDWDialog(0);
}

function initEditSHDWDialog(){
	editSHDWDialog=$("#edit_shdw_div").dialog({
		title:"修改收货单位实体",
		width:setFitWidthInParent("body","edit_shdw_div"),
		height:231,
		top:200,
		left:308,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openEditSHDWDialog(0);
           }},
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

	$(".panel.window").eq(12).css("margin-top","20px");
	$(".panel.window").eq(12).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(12).css("color","#000");
	$(".panel.window .panel-title").eq(12).css("font-size","15px");
	$(".panel.window .panel-title").eq(12).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(12).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(12).css("margin-top","20px");
	$(".window,.window .window-body").eq(12).css("border-color","#ddd");

	$("#edit_shdw_div #cancel_but").css("left","30%");
	$("#edit_shdw_div #cancel_but").css("position","absolute");

	$("#edit_shdw_div #ok_but").css("left","45%");
	$("#edit_shdw_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openEditSHDWDialog(0);
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
		selectYSSDialog.dialog("open");
	}
	else{
		selectYSSDialog.dialog("close");
	}
}

function openSelectWLXXDialog(flag){
	if(flag==1){
		selectWLXXDialog.dialog("open");
	}
	else{
		selectWLXXDialog.dialog("close");
	}
}

function openSelectFHDWDialog(flag){
	if(flag==1){
		selectFHDWDialog.dialog("open");
	}
	else{
		selectFHDWDialog.dialog("close");
	}
}

function openSelectSHDWDialog(flag){
	if(flag==1){
		selectSHDWDialog.dialog("open");
	}
	else{
		selectSHDWDialog.dialog("close");
	}
}

function openEditYSSDialog(flag){
	if(flag==1){
		editYSSDialog.dialog("open");
	}
	else{
		editYSSDialog.dialog("close");
	}
}

function openEditWLXXDialog(flag){
	if(flag==1){
		editWLXXDialog.dialog("open");
	}
	else{
		editWLXXDialog.dialog("close");
	}
}

function openEditFHDWDialog(flag){
	if(flag==1){
		editFHDWDialog.dialog("open");
	}
	else{
		editFHDWDialog.dialog("close");
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

function loadYSSTabData(rows){
	var obj = {"total":rows.length,"rows":rows};
	yssTab.datagrid('loadData',obj);
}

function loadWLXXTabData(rows){
	var obj = {"total":rows.length,"rows":rows};
	wlxxTab.datagrid('loadData',obj);
}

function loadFHDWTabData(rows){
	var obj = {"total":rows.length,"rows":rows};
	fhdwTab.datagrid('loadData',obj);
}

function loadSHDWTabData(rows){
	var obj = {"total":rows.length,"rows":rows};
	shdwTab.datagrid('loadData',obj);
}

function checkNew(){
	if(checkYZXZL()){
		if(checkYSSId()){
			newWoYaoXiaDan();
		}
	}
}

function newWoYaoXiaDan(){
	var dwmc=$("#new_div #dwmc").val();
	var yssTabData=yssTab.datagrid("getData");
	var total=yssTabData.total;
	var yssId=0;
	if(total>0)
		yssId=yssTabData.rows[0].id;
	
	$.post(path+"main/newWoYaoXiaDan",
		{dwmc:dwmc,yssId:yssId},
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

//验证预装卸重量
function checkYZXZL(){
	var dwmc = $("#new_div #dwmc").val();
	if(zyzt==null||zyzt==""){
	  	alert("请输入预装卸重量");
	  	return false;
	}
	else
		return true;
}

//验证运输商
function checkYSSId(){
	var yssTabData=yssTab.datagrid("getData");
	var total=yssTabData.total;
	var ssdlId=0;
	if(total>0)
		ssdlId=yssTabData.rows[0].id;
	
	if(ssdlId==0){
		alert("请选择运输商");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "new_div":
	case "yss_div":
	case "select_yss_tab":
	case "edit_yss_div":
	case "wlxx_div":
	case "select_wlxx_tab":
	case "edit_wlxx_div":
	case "fhdw_div":
	case "select_fhdw_tab":
	case "edit_fhdw_div":
	case "shdw_div":
		space=340;
		break;
	case "new_div_table":
	case "panel_window":
	case "yss_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
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
<title>创建</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="new_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				计划运输日期
			</td>
			<td style="width:30%;">
				<input id="jhysrq_db"/>
				<input type="hidden" id="jhysrq" name="jhysrq"/>
			</td>
			<td align="right" style="width:15%;">
				预装卸重量
			</td>
			<td style="width:30%;">
				<input type="number" id="yzxzl" name="yzxzl" placeholder="请输入预装卸重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				流向类型
			</td>
			<td>
				<input id="lxlx_cbb"/>
				<input type="hidden" id="lxlx" name="lxlx"/>
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
	
	<div id="select_yss_div">
		<div id="select_yss_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">名称：</span>
			<input type="text" id="mc_inp" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_yss_tab"></table>
	</div>
	
	<div id="edit_yss_div">
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
	
	<div id="wlxx_div">
		<div id="wlxx_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="wlxx_tab"></table>
	</div>
	
	<div id="select_wlxx_div">
		<div id="select_wlxx_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">名称：</span>
			<input type="text" id="mc_inp" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_wlxx_tab"></table>
	</div>
	
	<div id="edit_wlxx_div">
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
	
	<div id="fhdw_div">
		<div id="fhdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="fhdw_tab"></table>
	</div>
	
	<div id="select_fhdw_div">
		<div id="select_fhdw_toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">单位名称：</span>
			<input type="text" id="dwmc_inp" placeholder="请输入单位名称" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_fhdw_tab"></table>
	</div>
	
	<div id="edit_fhdw_div">
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
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="select_shdw_tab"></table>
	</div>
	
	<div id="edit_shdw_div">
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
</body>
</html>