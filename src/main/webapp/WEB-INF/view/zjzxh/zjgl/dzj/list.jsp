<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var defaultDdztId='${requestScope.ddztId}';
$(function(){
	initSearchLB();
	initZJTGLB();
	initOutputLB();
	initTab1();
});

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#toolbar #ddh").val();
			var cph=$("#toolbar #cph").val();
			tab1.datagrid("load",{ddh:ddh,cph:cph});
		}
	});
}

function initZJTGLB(){
	$("#zjtg_but").linkbutton({
		iconCls:"icon-ok",
		onClick:function(){
			//tongGuoByWybms();
		}
	});
}

function initOutputLB(){
	$("#output_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			if(checkIfPaid())
				location.href=path+"merchant/main/goBatchAddModule?trade=spzs&moduleType="+moduleType;
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"待质检-列表",
		url:path+"main/queryDDGLZHGLList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		queryParams:{ddztId:defaultDdztId},
		columns:[[
			{field:"ddh",title:"订单号",width:200},
			{field:"cph",title:"车牌号",width:200},
			{field:"yssmc",title:"运输商",width:200},
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
            {field:"yzxzl",title:"预装卸重量",width:200},
            {field:"jhysrq",title:"计划运输日期",width:200},
            {field:"ddztmc",title:"订单状态",width:200},
            {field:"wybm",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\"${pageContext.request.contextPath}/main/ddgl/zhgl/ddsh/detail?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\"${pageContext.request.contextPath}/main/zjzxh/zjgl/dzj/edit?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">修改</a>";
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
			<a id="zjtg_but">质检通过</a>
			<a id="output_but">导出</a>
		</div>
		<table id="tab1">
		</table>
	</div>
</div>
</body>
</html>