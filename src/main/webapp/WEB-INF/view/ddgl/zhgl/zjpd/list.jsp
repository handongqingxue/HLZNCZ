<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var ddglPath=path+'ddgl/';
var defaultDdztId='${requestScope.ddztId}';
$(function(){
	initSearchLB();
	initZJPDLB();
	initTab1();
});

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#toolbar #ddh").val();
			var cph=$("#toolbar #cph").val();
			tab1.datagrid("load",{ddh:ddh,cph:cph,ddztId:defaultDdztId});
		}
	});
}

function initZJPDLB(){
	$("#zjpd_but").linkbutton({
		iconCls:"icon-ok",
		onClick:function(){
			alert("未开放");
			//tongGuoByWybms();
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"直接排队-列表",
		url:ddglPath+"queryDDGLZHGLList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		queryParams:{ddztId:defaultDdztId},
		columns:[[
			{field:"ddh",title:"订单号",width:200},
            {field:"lxlx",title:"流向类型",width:200,formatter:function(value,row){
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
            {field:"ddztmc",title:"订单状态",width:200},
            {field:"yzxzl",title:"预装卸重量",width:200},
            {field:"sjzl",title:"实际重量",width:200},
            {field:"zlceb",title:"重量差额比",width:200},
            {field:"jhysrq",title:"计划运输日期",width:200},
            {field:"crksj",title:"出入库时间",width:200},
            {field:"wybm",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\""+ddglPath+"zhgl/zjpd/detail?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\""+ddglPath+"zhgl/zjpd/edit?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">修改</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:9});
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

/*
function tongGuoByWybms() {
	var rows=tab1.datagrid("getSelections");
	if (rows.length == 0) {
		$.messager.alert("提示","请选择要通过的信息！","warning");
		return false;
	}
	
	$.messager.confirm("提示","确定要通过吗？",function(r){
		if(r){
			var wybms = "";
			for (var i = 0; i < rows.length; i++) {
				wybms += "," + rows[i].wybm;
			}
			wybms=wybms.substring(1);
			
			$.ajaxSetup({async:false});
			$.post(path + "main/tongGuoDingDanShenHe",
				{wybms:wybms},
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
*/

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
			<span style="margin-left: 13px;">订单号：</span>
			<input type="text" id="ddh" placeholder="请输入订单号" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">车牌号：</span>
			<input type="text" id="cph" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
			<a id="zjpd_but">直接排队</a>
		</div>
		<table id="tab1">
		</table>
	</div>
</div>
</body>
</html>