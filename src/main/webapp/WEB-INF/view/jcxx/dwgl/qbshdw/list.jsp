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
			var dwmc=$("#toolbar #dwmc").val();
			tab1.datagrid("load",{dwmc:dwmc});
		}
	});
	
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=jcxxPath+"dwgl/qbshdw/new?fnid="+'${param.fnid}'+"&snid="+'${param.snid}';
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
		title:"全部收货单位-列表",
		url:jcxxPath+"queryShouHuoDanWeiList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"dwmc",title:"单位名称",width:200},
            {field:"bjsj",title:"编辑时间",width:200},
            {field:"id",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\""+jcxxPath+"dwgl/qbshdw/detail?fnid="+'${param.fnid}'+"&id="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\""+jcxxPath+"dwgl/qbshdw/edit?fnid="+'${param.fnid}'+"&id="+value+"\">修改</a>";
            	return str;
            	//return "<a>未开放</a>";
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{dwmc:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"dwmc",colspan:3});
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
			$.post(jcxxPath + "deleteShouHuoDanWei",
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
<title>收货单位</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="tab1_div" style="margin-top:20px;margin-left: 308px;">
		<div id="toolbar" style="height:32px;line-height:32px;">
			<span style="margin-left: 13px;">单位名称：</span>
			<input type="text" id="dwmc" placeholder="请输入单位名称" style="width: 120px;height: 25px;"/>
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