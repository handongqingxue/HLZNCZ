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
$(function(){
	initDDZTCBB();
	initJCSJSDTB();
	initJCSJEDTB();
	initJHYSRQDTB();
	initSearchLB();
	initAddLB();
	initOutputLB();
	initTab1();
});

function initDDZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择订单状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ddztCBB=$("#ddzt").combobox({
				valueField:"value",
				textField:"text",
				//multiple:true,
				data:data
			});
		}
	,"json");
}

function initJCSJSDTB(){
	jcsjsDTB=$('#jcsjs_dtb').datetimebox({
        required:false
    });
}

function initJCSJEDTB(){
	jcsjeDTB=$('#jcsje_dtb').datetimebox({
        required:false
    });
}

function initJHYSRQDTB(){
	jhysrqDB=$('#jhysrq_db').datebox({
        required:false
    });
}

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var ddh=$("#toolbar #ddh").val();
			var ddzt=ddztCBB.combobox("getValue");
			var cph=$("#toolbar #cph").val();
			var jhysrq=jhysrqDB.datebox("getValue");
			var yss=$("#toolbar #yss").val();
			var wzmc=$("#toolbar #wzmc").val();
			var fhdwmc=$("#toolbar #fhdwmc").val();
			var shdwmc=$("#toolbar #shdwmc").val();
			var sjxm=$("#toolbar #sjxm").val();
			var sjsfz=$("#toolbar #sjsfz").val();
			tab1.datagrid("load",{ddh:ddh,ddztId:ddzt,cph:cph,jhysrq:jhysrq,yss:yss,wzmc:wzmc,fhdwmc:fhdwmc,shdwmc:shdwmc,sjxm:sjxm,sjsfz:sjsfz});
		}
	});
}

function initAddLB(){
	$("#add_but").linkbutton({
		iconCls:"icon-add",
		onClick:function(){
			location.href=ddglPath+"zhgl/zhgl/new?fnid="+'${param.fnid}'+"&snid="+'${param.snid}';
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
		title:"综合管理-列表",
		url:ddglPath+"queryDDGLZHGLList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"ddh",title:"订单号",width:200},
			{field:"wlmc",title:"物资名称",width:200},
			{field:"cph",title:"车牌号",width:200},
			{field:"yssmc",title:"运输商",width:200},
			{field:"fhdwmc",title:"发货单位",width:200},
			{field:"shdwmc",title:"收货单位",width:200},
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
            {field:"ddztmc",title:"订单状态",width:200},
            {field:"yzxzl",title:"预装卸重量",width:200},
            {field:"sjzl",title:"实际重量",width:200},
            {field:"zlceb",title:"重量差额比",width:200},
            {field:"crksj",title:"出入库时间",width:200},
            {field:"wybm",title:"操作",width:150,formatter:function(value,row){
            	var str="<a href=\""+ddglPath+"zhgl/zhgl/detail?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">详情</a>"
            	+"&nbsp;|&nbsp;<a href=\""+ddglPath+"zhgl/zhgl/edit?fnid="+'${param.fnid}'+"&snid="+'${param.snid}'+"&wybm="+value+"\">修改</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{ddh:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"ddh",colspan:14});
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
<title>司机信息</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="tab1_div" style="margin-top:20px;margin-left: 308px;">
		<div id="toolbar" style="height:96px;">
			<div style="height:32px;">
				<span style="margin-left: 13px;">订单号：</span>
				<input type="text" id="ddh" placeholder="请输入订单号" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">订单状态：</span>
				<input id="ddzt"/>
				<span style="margin-left: 13px;">车牌号：</span>
				<input type="text" id="cph" placeholder="请输入车牌号" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">进场时间：</span>
				<input id="jcsjs_dtb"/>
				-
				<input id="jcsje_dtb"/>
			</div>
			<div style="height:32px;">
				<span style="margin-left: 13px;">计划运输日期：</span>
				<input id="jhysrq_db"/>
				<span style="margin-left: 13px;">运输商：</span>
				<input type="text" id="yss" placeholder="请输入运输商" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">物资名称：</span>
				<input type="text" id="wzmc" placeholder="请输入物资名称" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">发货单位：</span>
				<input type="text" id="fhdwmc" placeholder="请输入发货单位" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">收货单位：</span>
				<input type="text" id="shdwmc" placeholder="请输入收货单位" style="width: 120px;height: 25px;"/>
			</div>
			<div style="height:32px;">
				<span style="margin-left: 13px;">司机姓名：</span>
				<input type="text" id="sjxm" placeholder="请输入司机姓名" style="width: 120px;height: 25px;"/>
				<span style="margin-left: 13px;">司机身份证：</span>
				<input type="text" id="sjsfz" placeholder="请输入司机身份证" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
				<a id="add_but">添加</a>
				<a id="output_but">导出</a>
			</div>
		</div>
		<table id="tab1">
		</table>
	</div>
</div>
</body>
</html>