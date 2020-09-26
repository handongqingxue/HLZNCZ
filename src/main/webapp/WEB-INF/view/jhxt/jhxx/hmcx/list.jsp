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
	initZTCBB();
	initSearchLB();
	initDeleteLB();
	initAddLB();
	initOutputLB();
	initZXJHLB();
	initZXGHLB();
	initTab1();
});

function initZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择状态"});
	$.post(path+"main/queryHaoMaZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ztCBB=$("#zt").combobox({
				valueField:"value",
				textField:"text",
				//multiple:true,
				data:data,
				onLoadSuccess:function(){
					$(this).combobox("setValue",defaultZxztId);
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

function initDeleteLB(){
	$("#delete_but").linkbutton({
		iconCls:"icon-cut",
		onClick:function(){
			
		}
	});
}

function initAddLB(){
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=path+"main/jhxt/jhxx/hmcx/new?fnid="+'${param.fnid}'+"&snid="+'${param.snid}';
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

function initZXJHLB(){
	$("#zxjh_but").linkbutton({
		iconCls:"icon-ok",
		onClick:function(){
			tongGuoByWybms();
		}
	});
}

function initZXGHLB(){
	$("#zxgh_but").linkbutton({
		iconCls:"icon-back",
		onClick:function(){
			tuiHuiByWybms();
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"号码查询-列表",
		url:path+"main/queryHaoMaList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		queryParams:{ddztId:defaultZxztId},
		columns:[[
			{field:"hm",title:"号码",width:200},
            {field:"pdh",title:"排队号",width:200},
            {field:"prsj",title:"排入时间",width:200},
            {field:"fl",title:"分类",width:200,formatter:function(value,row){
            	var str;
            	switch (value) {
				case 1:
					str="普通";
					break;
				case 2:
					str="其他";
					break;
				}
            	return str;
            }},
            {field:"ddztmc",title:"状态",width:200},
            {field:"ddztmc",title:"叫号次数",width:200},
            {field:"wybm",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\"${pageContext.request.contextPath}/main/ddgl/wddd/wyxd/detail?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\"${pageContext.request.contextPath}/main/ddgl/wddd/wyxd/edit?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">修改</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{hm:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"hm",colspan:7});
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

function tuiHuiByWybms() {
	var rows=tab1.datagrid("getSelections");
	if (rows.length == 0) {
		$.messager.alert("提示","请选择要退回的信息！","warning");
		return false;
	}
	
	$.messager.confirm("提示","确定要退回吗？",function(r){
		if(r){
			var wybms = "";
			for (var i = 0; i < rows.length; i++) {
				wybms += "," + rows[i].wybm;
			}
			wybms=wybms.substring(1);
			
			$.ajaxSetup({async:false});
			$.post(path + "main/tuiHuiDingDanShenHe",
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
		<div id="toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">号码：</span>
			<input type="text" id="hm" placeholder="号码" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">排队号：</span>
			<input type="text" id="pdh" placeholder="排队号" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">状态：</span>
			<input id="zt"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
			<a id="delete_but">删除</a>
			<a id="add_but">添加</a>
			<a id="output_but">导出</a>
			<a id="zxjh_but">执行叫号</a>
			<a id="zxgh_but">执行过号</a>
		</div>
		<table id="tab1">
		</table>
	</div>
</div>
</body>
</html>