<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<style type="text/css">
.center_con_div{
	width: 100%;
	height: 90vh;
	margin-left:288px;
	overflow-y: scroll;
	position: absolute;
}
.page_location_div{
	height: 50px;
	line-height: 50px;
	margin-left: 20px;
	font-size: 18px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var ddNum=0;
var zjbgdNum=1;
$(function(){
	initDetailDialog();//0
	
	initZJBGDialog();//1.质检报告窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	//质检报告
	var zjbgdpw=$("body").find(".panel.window").eq(zjbgdNum);
	var zjbgdws=$("body").find(".window-shadow").eq(zjbgdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);

	ccDiv.append(zjbgdpw);
	ccDiv.append(zjbgdws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:380,
		top:dialogTop,
		left:dialogLeft
	});

	$("#detail_div table").css("width",(setFitWidthInParent("body","detail_div_table"))+"px");
	$("#detail_div table").css("magin","-100px");
	$("#detail_div table td").css("padding-left","50px");
	$("#detail_div table td").css("padding-right","20px");
	$("#detail_div table td").css("font-size","15px");
	$("#detail_div table tr").css("height","45px");

	$(".panel.window").eq(ddNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(ddNum).css("color","#000");
	$(".panel.window .panel-title").eq(ddNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ddNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ddNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ddNum).css("border-color","#ddd");

	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initZJBGDialog(){
	dialogTop+=410;//360
	yssDialog=$("#zjbg_div").dialog({
		title:"质检报告",
		width:setFitWidthInParent("body","zjbg_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(zjbgdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(zjbgdNum).css("margin-top","20px");
	$(".panel.window").eq(zjbgdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(zjbgdNum).css("color","#000");
	$(".panel.window .panel-title").eq(zjbgdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(zjbgdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(zjbgdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(zjbgdNum).css("width","1000px");
	$(".window-shadow").eq(zjbgdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(zjbgdNum).css("border-color","#ddd");

	initZJBGTab();
}

function initZJBGTab(){
	zjbgTab=$("#zjbg_tab").datagrid({
		width:setFitWidthInParent("body","zjbg_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="检验报告";
					break;
				}
				return str;
			}},
            {field:"jl",title:"结论",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="合格";
					break;
				case "2":
					str="不合格";
					break;
				}
				return str;
			}},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:3});
				data.total=0;
			}
			
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");

			//reSizeCol();
		}
	});
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	var rows;
	if('${requestScope.zjbg}'==""){
		rows=[];
	}
	else{
		var jl='${requestScope.zjbg.jl}';
		var bjsj='${requestScope.zjbg.bjsj}';
		var id='${requestScope.zjbg.id}';
		rows=[{gx:"1",jl:jl,bjsj:bjsj,id:id}];
	}
	loadZJBGTabData(rows);
}

function loadZJBGTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	zjbgTab.datagrid('loadData',obj);
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "detail_div":
	case "zjbg_div":
		space=340;
		break;
	case "detail_div_table":
	case "panel_window":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>详情</title>
</head>
<body>

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">待质检-详情</div>
	
	<div id="detail_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.ddh }</span>
			</td>
			<td align="right" style="width:15%;">
				预装卸重量
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.yzxzl }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				流向类型
			</td>
			<td>
				<span>
					<c:if test="${requestScope.dd.lxlx eq 1 }">送运</c:if>
					<c:if test="${requestScope.dd.lxlx eq 2 }">取运</c:if>
				</span>
			</td>
			<td align="right">
				编辑时间
			</td>
			<td>
				<span>${requestScope.dd.bjsj }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				执行状态
			</td>
			<td>
				<span>${requestScope.dd.ddztmc }</span>
			</td>
			<td align="right">
				入库状态
			</td>
			<td>
				<span>
					<c:if test="${requestScope.dd.rkzt eq 1 }">未入库</c:if>
					<c:if test="${requestScope.dd.rkzt eq 2 }">待入库</c:if>
					<c:if test="${requestScope.dd.rkzt eq 3 }">已入库</c:if>
					<c:if test="${requestScope.dd.rkzt eq 4 }">入库异常</c:if>
				</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				实际重量
			</td>
			<td>
				<span>${requestScope.dd.sjzl }</span>
			</td>
			<td align="right">
				重量差额比
			</td>
			<td>
				<span>${requestScope.dd.zlceb }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				计划运输日期
			</td>
			<td>
				<span>${requestScope.dd.jhysrq }</span>
			</td>
			<td align="right">
				出入库时间
			</td>
			<td>
				<span>${requestScope.dd.crksj }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				二维码
			</td>
			<td>
				<span>${requestScope.dd.ewm }</span>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</div>
	
	<div id="zjbg_div">
		<table id="zjbg_tab"></table>
	</div>
</div>
</body>
</html>