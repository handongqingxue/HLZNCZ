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

.detail_shdw_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_shdw_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_shdw_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_shdw_div .xgst_span{
	margin-left: 30px;
}
.detail_shdw_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_shdw_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_shdw_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_shdw_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var ddNum=0;
var shdwdNum=1;
var dshdwjbsxzdNum=2;
$(function(){
	initDetailDialog();//0
	
	initSHDWDialog();//1.收货单位窗口
	initDetailSHDWJBSXZDialog();//2.收货单位详情窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	//收货单位
	var shdwdpw=$("body").find(".panel.window").eq(shdwdNum);
	var shdwdws=$("body").find(".window-shadow").eq(shdwdNum);
	
	//查看收货单位
	var dshdwjbsxdpw=$("body").find(".panel.window").eq(dshdwjbsxzdNum);
	var dshdwjbsxdws=$("body").find(".window-shadow").eq(dshdwjbsxzdNum);
	
	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);

	ccDiv.append(shdwdpw);
	ccDiv.append(shdwdws);

	var dshdwdDiv=$("#detail_shdw_dialog_div");
	dshdwdDiv.append(dshdwjbsxdpw);
	dshdwdDiv.append(dshdwjbsxdws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:195,
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
	$(".window,.window .window-body").eq(ddNum).css("border-color","#ddd");
}

function initSHDWDialog(){
	dialogTop+=230;//920
	shdwDialog=$("#shdw_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("body","shdw_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(shdwdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(shdwdNum).css("margin-top","20px");
	//$(".panel.window").eq(shdwdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(shdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(shdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(shdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(shdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(shdwdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(shdwdNum).css("width","1000px");
	$(".window-shadow").eq(shdwdNum).css("margin-top","20px");
	//$(".window-shadow").eq(shdwdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(shdwdNum).css("border-color","#ddd");

	initSHDWTab();
}

function initSHDWTab(){
	shdwTab=$("#shdw_tab").datagrid({
		toolbar:"#shdw_toolbar",
		width:setFitWidthInParent("body","shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="收货单位";
					break;
				}
				return str;
			}},
            {field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showSHDWDetail()\">查看</a>";
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
	var rows;
	if('${requestScope.shdw}'==""){
		rows=[];
	}
	else{
		var dwmc='${requestScope.shdw.dwmc}';
		var bjsj='${requestScope.shdw.bjsj}';
		var id='${requestScope.shdw.id}';
		rows=[{gx:"1",dwmc:dwmc,bjsj:bjsj,id:id}];
	}
	loadSHDWTabData(rows);
}

function loadSHDWTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	shdwTab.datagrid('loadData',obj);
}

function initDetailSHDWJBSXZDialog(){
	detailSHDWDialog=$("#detail_shdw_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_shdw_div","detail_shdw_jbsxz_dialog_div"),
		height:231,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailSHDWDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailSHDWDialog(0);
           }}
        ]
	});

	$("#detail_shdw_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_shdw_div","detail_shdw_jbsxz_dialog_div"))+"px");
	$("#detail_shdw_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_shdw_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_shdw_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_shdw_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_shdw_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dshdwjbsxzdNum).css("margin-top","40px");
	$(".panel.window").eq(dshdwjbsxzdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dshdwjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dshdwjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dshdwjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dshdwjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_shdw_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_shdw_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_shdw_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_shdw_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSHDWDialog(0);
}

function openDetailSHDWDialog(flag){
	if(flag==1){
		$("#detail_shdw_bg_div").css("display","block");
		$("#detail_shdw_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_shdw_bg_div").css("display","none");
		$("#detail_shdw_bg_div").css("z-index","9016");
	}
	openDetailSHDWJBSXZDialog(flag);
}

function openDetailSHDWJBSXZDialog(flag){
	if(flag==1){
		detailSHDWDialog.dialog("open");
	}
	else{
		detailSHDWDialog.dialog("close");
	}
}

function showSHDWDetail(){
	var row=shdwTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_shdw_div #id").val(row.id);
	$("#detail_shdw_div #dwmc").text(row.dwmc);
	$("#detail_shdw_div #bjsj").text(row.bjsj);
	openDetailSHDWDialog(1);
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "detail_div":
	case "shdw_div":
	case "detail_shdw_div":
		space=340;
		break;
	case "detail_div_table":
	case "panel_window":
	case "shdw_tab":
		space=355;
		break;
	case "detail_shdw_jbsxz_dialog_div":
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

<!-- 查看收货单位 start -->
<div class="detail_shdw_bg_div" id="detail_shdw_bg_div">
	<div class="detail_shdw_div" id="detail_shdw_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailSHDWDialog(0)">X</span>
		</div>
		<div class="detail_shdw_dialog_div" id="detail_shdw_dialog_div">
			<div class="title_div">
				<span class="title_span">综合管理-收货单位-查看</span>
			</div>
			<div id="detail_shdw_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						单位名称
					</td>
					<td style="width:30%;">
						<span id="dwmc"></span>
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
<!-- 查看收货单位 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">队列管理-详情</div>
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.dl.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				名称
			</td>
			<td style="width:30%;">
				<span>${requestScope.dl.mc }</span>
			</td>
			<td align="right" style="width:15%;">
				代码
			</td>
			<td style="width:30%;">
				<span>${requestScope.dl.dm }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				叫号阈值
			</td>
			<td>
				<span>${requestScope.dl.jhyz }</span>
			</td>
			<td align="right">
				叫号形式
			</td>
			<td>
				<span>
				<c:if test="${requestScope.dl.jhxs eq 1 }">
					自动叫号
				</c:if>
				<c:if test="${requestScope.dl.jhxs eq 2 }">
					手动叫号
				</c:if>
				</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				状态
			</td>
			<td>
				<span>
				<c:if test="${requestScope.dl.zt eq 1 }">
					在用
				</c:if>
				<c:if test="${requestScope.dl.zt eq 2 }">
					暂停
				</c:if>
				<c:if test="${requestScope.dl.zt eq 3 }">
					废弃
				</c:if>
				</span>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</div>
	
	<div id="shdw_div">
		<table id="shdw_tab"></table>
	</div>
</div>
</body>
</html>