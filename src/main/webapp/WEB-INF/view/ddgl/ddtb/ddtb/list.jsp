<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var defaultZxztId='${requestScope.zxztId}';
$(function(){
	initZXZTCBB();
	initSearchLB();
	initAddLB();
	initTab1();
});

function initZXZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择执行状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			zxztCBB=$("#zxzt").combobox({
				valueField:"value",
				textField:"text",
				multiple:true,
				data:data,
				onLoadSuccess:function(){
					$(this).combobox("setValues",defaultZxztId.split(','));
				}
			});
		}
	,"json");
}

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#toolbar #ddh").val();
			var zxzt=zxztCBB.combobox("getValue");
			tab1.datagrid("load",{ddh:ddh,ddztId:zxzt});
		}
	});
}

function initAddLB(){
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=path+"main/ddgl/ddtb/ddtb/new?fnid="+'${param.fnid}'+"&snid="+'${param.snid}';
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"订单填报-列表",
		url:path+"main/queryDDGLZHGLList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		queryParams:{ddztId:defaultZxztId},
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
            {field:"jhysrq",title:"计划运输日期",width:200},
            {field:"cph",title:"车牌号",width:200},
            {field:"ddztmc",title:"订单状态",width:200},
            {field:"yzxzl",title:"预装卸重量",width:200},
            {field:"sjzl",title:"实际重量",width:200},
            {field:"wybm",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\"${pageContext.request.contextPath}/main/ddgl/ddtb/ddtb/detail?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\"${pageContext.request.contextPath}/main/ddgl/ddtb/ddtb/edit?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">修改</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:8});
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

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-340;
}
</script>
<title>订单填报</title>
</head>
<body>
<%@include file="../../../inc/nav.jsp"%>
<div id="tab1_div" style="margin-top:20px;margin-left: 308px;">
		<div id="toolbar" style="height:32px;">
			<span style="margin-left: 13px;">订单号：</span>
			<input type="text" id="ddh" placeholder="请输入订单号" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">执行状态：</span>
			<input id="zxzt"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
			<a id="add_but">添加</a>
		</div>
		<table id="tab1">
		</table>
	</div>
</body>
</html>