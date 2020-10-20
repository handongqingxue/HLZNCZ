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

.detail_yss_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_yss_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_yss_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_yss_div .xgst_span{
	margin-left: 30px;
}
.detail_yss_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_yss_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_yss_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_yss_div .title_span{
	margin-left: 30px;
}

</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var tbxxdNum=0;
var ddNum=1;
var yssdNum=2;
var dyssjbsxzdNum=3;
$(function(){
	initTBXXDialog();//0
	initDetailDialog();//1
	
	initYSSDialog();//2.运输商窗口
	initDetailYSSJBSXZDialog();//3.运输商详情窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//填报信息
	var tbxxdpw=$("body").find(".panel.window").eq(tbxxdNum);
	var tbxxdws=$("body").find(".window-shadow").eq(tbxxdNum);

	//新字段组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	//运输商
	var yssdpw=$("body").find(".panel.window").eq(yssdNum);
	var yssdws=$("body").find(".window-shadow").eq(yssdNum);

	//查看运输商
	var dyssjbsxdpw=$("body").find(".panel.window").eq(dyssjbsxzdNum);
	var dyssjbsxdws=$("body").find(".window-shadow").eq(dyssjbsxzdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(tbxxdpw);
	ccDiv.append(tbxxdws);
	
	ccDiv.append(ddpw);
	ccDiv.append(ddws);

	ccDiv.append(yssdpw);
	ccDiv.append(yssdws);

	var dyssdDiv=$("#detail_yss_dialog_div");
	dyssdDiv.append(dyssjbsxdpw);
	dyssdDiv.append(dyssjbsxdws);
}

function initTBXXDialog(){
	dialogTop+=20;
	$("#tbxx_div").dialog({
		title:"填报信息",
		width:setFitWidthInParent("body","tbxx_div"),
		height:160,
		top:dialogTop,
		left:dialogLeft
	});

	$("#tbxx_div table").css("width",(setFitWidthInParent("body","tbxx_div_table"))+"px");
	$("#tbxx_div table").css("magin","-100px");
	$("#tbxx_div table td").css("padding-left","50px");
	$("#tbxx_div table td").css("padding-right","20px");
	$("#tbxx_div table td").css("font-size","15px");
	$("#tbxx_div table tr").eq(0).css("height","100px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").eq(tbxxdNum).css("color","#000");
	$(".panel.window .panel-title").eq(tbxxdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(tbxxdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(tbxxdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");
}

function initDetailDialog(){
	dialogTop+=190;
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:325,
		top:dialogTop,
		left:dialogLeft,
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
	$(".window,.window .window-body").css("border-color","#ddd");
}

function initYSSDialog(){
	dialogTop+=350;//230
	yssDialog=$("#yss_div").dialog({
		title:"运输商",
		width:setFitWidthInParent("body","yss_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(yssdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(yssdNum).css("margin-top","20px");
	$(".panel.window").eq(yssdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(yssdNum).css("color","#000");
	$(".panel.window .panel-title").eq(yssdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(yssdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(yssdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(yssdNum).css("width","1000px");
	$(".window-shadow").eq(yssdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(yssdNum).css("border-color","#ddd");

	initYSSTab();
}

function initYSSTab(){
	yssTab=$("#yss_tab").datagrid({
		width:setFitWidthInParent("body","yss_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="关系运输商";
					break;
				}
				return str;
			}},
            {field:"mc",title:"名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showYSSDetail()\">查看</a>";
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
	if('${requestScope.yss}'==""){
		rows=[];
	}
	else{
		var mc='${requestScope.yss.mc}';
		var bjsj='${requestScope.yss.bjsj}';
		var id='${requestScope.yss.id}';
		rows=[{gx:"1",mc:mc,bjsj:bjsj,id:id}];
	}
	loadYSSTabData(rows);
}

function loadYSSTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	yssTab.datagrid('loadData',obj);
}

function initDetailYSSJBSXZDialog(){
	detailYSSDialog=$("#detail_yss_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_yss_div","detail_yss_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailYSSDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailYSSDialog(0);
           }}
        ]
	});

	$("#detail_yss_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_yss_div","detail_yss_jbsxz_dialog_div"))+"px");
	$("#detail_yss_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_yss_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_yss_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_yss_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_yss_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dyssjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dyssjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dyssjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dyssjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dyssjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_yss_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_yss_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_yss_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_yss_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailYSSDialog(0);
}

function openDetailYSSDialog(flag){
	if(flag==1){
		$("#detail_yss_bg_div").css("display","block");
		$("#detail_yss_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_yss_bg_div").css("display","none");
		$("#detail_yss_bg_div").css("z-index","9016");
	}
	openDetailYSSJBSXZDialog(flag);
}

function openDetailYSSJBSXZDialog(flag){
	if(flag==1){
		detailYSSDialog.dialog("open");
	}
	else{
		detailYSSDialog.dialog("close");
	}
}

function showYSSDetail(){
	var row=yssTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_yss_div #id").val(row.id);
	$("#detail_yss_div #mc").text(row.mc);
	$("#detail_yss_div #bjsj").text(row.bjsj);
	openDetailYSSDialog(1);
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "tbxx_div":
	case "detail_div":
	case "sssj_div":
	case "ssdl_div":
	case "select_sssj_tab":
	case "wlxx_div":
	case "select_wlxx_tab":
	case "detail_wlxx_div":
	case "fhdw_div":
	case "select_fhdw_tab":
	case "detail_fhdw_div":
	case "shdw_div":
	case "select_shdw_tab":
	case "detail_shdw_div":
	case "cycl_div":
	case "select_cycl_tab":
		space=340;
		break;
	case "tbxx_div_table":
	case "edit_div_table":
	case "panel_window":
	case "sssj_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "select_yss_dialog_div":
	case "detail_yss_jbsxz_dialog_div":
	case "select_yswl_dialog_div":
	case "detail_yswl_jbsxz_dialog_div":
	case "select_fhdw_dialog_div":
	case "detail_fhdw_jbsxz_dialog_div":
	case "select_shdw_dialog_div":
	case "detail_shdw_jbsxz_dialog_div":
	case "select_cycl_dialog_div":
	case "detail_cycl_jbsxz_dialog_div":
	case "select_cysj_dialog_div":
		space=50;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>详情</title>
</head>
<body>

<!-- 查看运输商 start -->
<div class="detail_yss_bg_div" id="detail_yss_bg_div">
	<div class="detail_yss_div" id="detail_yss_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailYSSDialog(0)">X</span>
		</div>
		<div class="detail_yss_dialog_div" id="detail_yss_dialog_div">
			<div class="title_div">
				<span class="title_span">订单填报-运输商-查看</span>
			</div>
			<div id="detail_yss_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						名称
					</td>
					<td style="width:30%;">
						<span id="mc"></span>
					</td>
					<td align="right" style="width:15%;">
						编辑时间
					</td>
					<td style="width:30%;">
						<span id="bjsj"></span>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!--查看运输商 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">订单填报-修改</div>
	
	<div id="tbxx_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				实际重量
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.sjzl }</span>
			</td>
			<td align="right" style="width:15%;">
				备注
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.bz }</span>
			</td>
		  </tr>
		</table>
	</div>
	
	<!-- 基本信息 start -->
	<div id="detail_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车牌号
			</td>
			<td style="width:30%;">
				<span>${requestScope.cycl.cph }</span>
			</td>
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<span>${requestScope.dd.ddh }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				预装卸重量
			</td>
			<td>
				<span>${requestScope.dd.yzxzl }</span>
			</td>
			<td align="right">
				流向类型
			</td>
			<td>
				<span>
				<c:if test="${requestScope.dd.lxlx eq 1 }">
					送运
				</c:if>
				<c:if test="${requestScope.dd.lxlx eq 2 }">
					取运
				</c:if>
				</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				编辑时间
			</td>
			<td>
				<span>${requestScope.dd.bjsj }</span>
			</td>
			<td align="right">
				二维码
			</td>
			<td>
				<span>${requestScope.dd.ewm }</span>
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
				订单状态
			</td>
			<td>
				<span>${requestScope.dd.ddztmc }</span>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</div>
	<!-- 基本信息 end -->
	
	<div id="yss_div">
		<div id="yss_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="yss_tab"></table>
	</div>
	
	<!-- 
	<div id="yswl_div">
		<div id="yswl_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="yswl_tab"></table>
	</div>
	
	<div id="fhdw_div">
		<div id="fhdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="fhdw_tab"></table>
	</div>
	
	<div id="shdw_div">
		<div id="shdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="shdw_tab"></table>
	</div>
	
	<div id="cycl_div">
		<div id="cycl_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="cycl_tab"></table>
	</div>
	
	<div id="cysj_div">
		<div id="cysj_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="cysj_tab"></table>
	</div>
	 -->
</div>
</body>
</html>