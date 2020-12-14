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
$(function(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var xm=$("#toolbar #xm").val();
			var sfz=$("#toolbar #sfz").val();
			tab1.datagrid("load",{xm:xm,sfz:sfz});
		}
	});

	tab1=$("#tab1").datagrid({
		title:"信息查询-列表",
		url:jcxxPath+"querySiJiList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"xm",title:"姓名",width:200},
            {field:"sjh",title:"手机号",width:200},
			{field:"sfz",title:"身份证",width:200},
			{field:"jzyxqz",title:"驾证有效期至",width:200},
			{field:"zgzyxqz",title:"资格证有效期至",width:200},
            {field:"id",title:"操作",width:150,formatter:function(value,row){
            	return "";
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{xm:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"xm",colspan:6});
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

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-340;
}
</script>
<title>司机信息</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="tab1_div" style="margin-top:20px;margin-left: 308px;">
		<div id="toolbar" style="height:32px;">
			<span style="margin-left: 13px;">姓名：</span>
			<input type="text" id="xm" placeholder="请输入姓名" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">身份证：</span>
			<input type="text" id="sfz" placeholder="请输入身份证" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="tab1">
		</table>
	</div>
</div>
</body>
</html>