<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var gbglPath=path+'gbgl/';
var defaultGbbq='${requestScope.gbbq}';
$(function(){
	initGBSJSDTB();
	initGBSJEDTB();
	initSearchLB();
	initAddLB();
	initRemoveLB();
	initOutputLB();
	initTab1();
});

function initGBSJSDTB(){
	gbsjsDTB=$('#gbsjs_dtb').datetimebox({
        required:false
    });
}

function initGBSJEDTB(){
	gbsjeDTB=$('#gbsje_dtb').datetimebox({
        required:false
    });
}

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var cph=$("#toolbar #cph").val();
			var gbsjs=gbsjsDTB.datebox("getValue");
			var gbsje=gbsjeDTB.datebox("getValue");
			tab1.datagrid("load",{cph:cph,gbsjs:gbsjs,gbsje:gbsje});
		}
	});
}

function initAddLB(){
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=gbglPath+"gbgl/ccgb/new?fnid="+'${param.fnid}'+"&snid="+'${param.snid}';
		}
	});
}

function initRemoveLB(){
	$("#remove_but").linkbutton({
		iconCls:"icon-remove",
		onClick:function(){
			deleteByIds();
		}
	});
}

function initOutputLB(){
	$("#output_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			alert("功能未开通");
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"出厂过磅-列表",
		url:gbglPath+"queryGBGLGBGLZHCXList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		queryParams:{gbbq:defaultGbbq},
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"cph",title:"过磅车辆",width:200},
			{field:"gbzl",title:"过磅重量",width:200},
			{field:"gbbq",title:"过磅标签",width:200,formatter:function(value,row){
            	var str="";
            	if(value!=null){
	            	var valArr=value.split(',');
	            	for(var i=0;i<valArr.length;i++){
	                	switch (valArr[i]) {
	    				case "1":
	    					str+=",入厂";
	    					break;
	    				case "2":
	    					str+=",出厂";
	    					break;
	    				case "3":
	    					str+=",皮重";
	    					break;
	    				case "4":
	    					str+=",载重";
	    					break;
	    				}
	            	}
            	}
            	return str.substring(1);
            }},
            {field:"gbzt",title:"过磅状态",width:200,formatter:function(value,row){
            	var str;
            	switch (value) {
				case 1:
					str="正常";
					break;
				case 2:
					str="异常";
					break;
				}
            	return str;
            }},
            {field:"zp1",title:"照片1",width:200},
            {field:"zp2",title:"照片2",width:200},
            {field:"zp3",title:"照片3",width:200},
            {field:"gbsj",title:"过磅时间",width:200},
            {field:"id",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\""+gbglPath+"gbgl/ccgb/detail?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&id="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\""+gbglPath+"gbgl/ccgb/edit?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&id="+value+"\">修改</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gbcl:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gbcl",colspan:9});
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
			$.post(gbglPath + "deleteGuoBang",
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
<title>司机信息</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="tab1_div" style="margin-top:20px;margin-left: 308px;">
		<div id="toolbar" style="height:32px;">
			<span style="margin-left: 13px;">车牌号：</span>
			<input type="text" id="cph" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">过磅时间：</span>
			<input id="gbsjs_dtb"/>
			-
			<input id="gbsje_dtb"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
			<a id="add_but">添加</a>
			<a id="remove_but">删除</a>
			<a id="output_but">导出</a>
		</div>
		<table id="tab1">
		</table>
	</div>
</div>
</body>
</html>