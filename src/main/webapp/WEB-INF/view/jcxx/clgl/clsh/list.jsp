<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var defaultShzt='${requestScope.shzt}';
$(function(){
	initCLLXCBB();
	initSearchLB();
	initAddLB();
	initSHTGLB();
	initTuiHuiLB();
	initTab1();
});

function initCLLXCBB(){
	cllxCBB=$("#cllx").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"重型"}]
	});
}

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var cph=$("#toolbar #cph").val();
			var cllx=cllxCBB.combobox("getValue");
			tab1.datagrid("load",{cph:cph,cllx:cllx,shzt:defaultShzt});
		}
	});
}

function initAddLB(){
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=path+"main/jcxx/clgl/clsh/new?fnid="+'${param.fnid}'+"&snid="+'${param.snid}';
		}
	});
}

//初始化审核通过按钮
function initSHTGLB(){
	$("#shtg_but").linkbutton({
		iconCls:"icon-ok",
		onClick:function(){
			shenHeByIds("sh");
		}
	});
}

function initTuiHuiLB(){
	$("#tuiHui_but").linkbutton({
		iconCls:"icon-back",
		onClick:function(){
			shenHeByIds("th");
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"车辆审核-列表",
		url:path+"main/queryCheLiangList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		queryParams:{shzt:defaultShzt},
		columns:[[
			{field:"cph",title:"车牌号",width:200},
            {field:"ppxh",title:"品牌型号",width:200},
			{field:"fdjhm",title:"发动机号码",width:200},
			{field:"clsbdh",title:"车辆识别代号",width:200},
			{field:"zcrq",title:"注册日期",width:200},
			{field:"pfjd",title:"排放阶段",width:200,formatter:function(value){
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
			{field:"fzrq",title:"发证日期",width:200},
			{field:"sfzy",title:"是否在用",width:200,formatter:function(value){
				return value?"是":"否";
			}},
			{field:"bz",title:"备注",width:200},
            {field:"id",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\"${pageContext.request.contextPath}/main/jcxx/clgl/clsh/detail?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&id="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\"${pageContext.request.contextPath}/main/jcxx/clgl/clsh/edit?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&id="+value+"\">修改</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{cph:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"cph",colspan:10});
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

function shenHeByIds(flag) {
	var tsStr;
	if(flag=="sh")
		tsStr="审核";
	else if(flag=="th")
		tsStr="退回";
	
	var rows=tab1.datagrid("getSelections");
	if (rows.length == 0) {
		$.messager.alert("提示","请选择要"+tsStr+"的信息！","warning");
		return false;
	}
	
	$.messager.confirm("提示","确定要"+tsStr+"吗？",function(r){
		if(r){
			var ids = "";
			for (var i = 0; i < rows.length; i++) {
				ids += "," + rows[i].id;
			}
			ids=ids.substring(1);
			
			$.ajaxSetup({async:false});
			$.post(path + "main/shenHeCheLiang",
				{ids:ids,flag:flag},
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
<title>车辆信息</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="tab1_div" style="margin-top:20px;margin-left: 308px;">
		<div id="toolbar" style="height:32px;">
			<span style="margin-left: 13px;">车牌号：</span>
			<input type="text" id="cph" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">车辆类型：</span>
			<input id="cllx"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
			<a id="add_but">添加</a>
			<a id="shtg_but">审核通过</a>
			<a id="tuiHui_but">退回</a>
		</div>
		<table id="tab1">
		</table>
	</div>
</div>
</body>
</html>