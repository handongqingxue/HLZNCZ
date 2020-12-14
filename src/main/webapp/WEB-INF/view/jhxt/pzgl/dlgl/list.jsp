<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var jcxxPath=path+'jcxx/';
var jhxtPath=path+'jhxt/';
$(function(){
	ztCBB=$("#zt").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择状态"},{"value":"1","text":"在用"},{"value":"2","text":"暂停"},{"value":"3","text":"废弃"}]
	});
	
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var mc=$("#toolbar #mc").val();
			var dm=$("#toolbar #dm").val();
			var zt=ztCBB.combobox("getValue");
			tab1.datagrid("load",{mc:mc,dm:dm,zt:zt});
		}
	});
	
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=jhxtPath+"pzgl/dlgl/new?fnid="+'${param.fnid}'+"&snid="+'${param.snid}';
		}
	});
	
	$("#output_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			if(checkIfPaid())
				location.href=path+"merchant/main/goBatchAddModule?trade=spzs&moduleType="+moduleType;
		}
	});
	
	$("#remove_but").linkbutton({
		iconCls:"icon-remove",
		onClick:function(){
			deleteByIds();
		}
	});

	tab1=$("#tab1").datagrid({
		title:"队列管理-列表",
		url:jcxxPath+"queryDuiLieList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"mc",title:"名称",width:200},
            {field:"dm",title:"代码",width:200},
			{field:"jhxs",title:"叫号形式证",width:200,formatter:function(value,row){
				var str;
				switch (value) {
				case 1:
					str="自动叫号";
					break;
				case 2:
					str="手动叫号";
					break;
				}
				return str;
			}},
			{field:"jhyz",title:"叫号阈值",width:200},
			{field:"zt",title:"状态",width:200,formatter:function(value,row){
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
			}},
            {field:"id",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\""+jhxtPath+"pzgl/dlgl/detail?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&id="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\""+jhxtPath+"pzgl/dlgl/edit?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&id="+value+"\">修改</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{mc:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"mc",colspan:6});
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
});

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

function deleteByIds() {
	var rows=tab1.datagrid("getSelections");
	if (rows.length == 0) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	
	$.messager.confirm("提示","确定要删除吗？",function(r){
		if(r){
			var ids = "";
			for (var i = 0; i < rows.length; i++) {
				ids += "," + rows[i].id;
			}
			ids=ids.substring(1);
			
			$.ajaxSetup({async:false});
			$.post(path + "main/deleteSiJi",
				{ids:ids},
				function(result){
					if(result.status==1){
						alert(result.msg);
						location.href = location.href;
					}
					else{
						alert(result.msg);
					}
				}
			,"json");
			
		}
	});
}

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-340;
}
</script>
<title>队列管理</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="tab1_div" style="margin-top:20px;margin-left: 308px;">
		<div id="toolbar" style="height:32px;">
			<span style="margin-left: 13px;">名称：</span>
			<input type="text" id="mc" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">代码：</span>
			<input type="text" id="dm" placeholder="请输入代码" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">状态：</span>
			<input id="zt"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
			<a id="add_but">添加</a>
			<a id="output_but">导出</a>
			<a id="remove_but">删除</a>
		</div>
		<table id="tab1">
		</table>
	</div>
</div>
</body>
</html>