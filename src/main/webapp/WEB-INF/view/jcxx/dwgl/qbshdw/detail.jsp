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

.detail_ssdl_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_ssdl_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_ssdl_div .ckst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_ssdl_div .ckst_span{
	margin-left: 30px;
}
.detail_ssdl_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_ssdl_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.detail_ssdl_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_ssdl_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var ddNum=0;
var ssdldNum=1;
var dssdljbsxzNum=2;//查看所属队列基本属性组
var dssdlshdwdNum=3;//查看所属队列收货单位
$(function(){
	initDetailDialog();//0
	
	initSSDLDialog();//1.所属队列
	
	initDetailSSDLJBSXZDialog();//2.查看所属队列基本属性组窗口
	initDetailSSDLSHDWDialog();//3.查看所属队列收货单位窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	//所属队列
	var ssdldpw=$("body").find(".panel.window").eq(ssdldNum);
	var ssdldws=$("body").find(".window-shadow").eq(ssdldNum);

	//查看所属队列
	var dssdldpw=$("body").find(".panel.window").eq(dssdljbsxzNum);
	var dssdldws=$("body").find(".window-shadow").eq(dssdljbsxzNum);
	var dshdwdpw=$("body").find(".panel.window").eq(dssdlshdwdNum);
	var dshdwdws=$("body").find(".window-shadow").eq(dssdlshdwdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);

	ccDiv.append(ssdldpw);
	ccDiv.append(ssdldws);

	var dssdldDiv=$("#detail_ssdl_dialog_div");
	dssdldDiv.append(dssdldpw);
	dssdldDiv.append(dssdldws);
	
	dssdldDiv.append(dshdwdpw);
	dssdldDiv.append(dshdwdws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:150,
		top:dialogTop,
		left:dialogLeft
	});

	$("#detail_div table").css("width",(setFitWidthInParent("body","detail_div_table"))+"px");
	$("#detail_div table").css("magin","-100px");
	$("#detail_div table td").css("padding-left","50px");
	$("#detail_div table td").css("padding-right","20px");
	$("#detail_div table td").css("font-size","15px");
	$("#detail_div table tr").css("height","45px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").css("color","#000");
	$(".panel.window .panel-title").css("font-size","15px");
	$(".panel.window .panel-title").css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");
}

function initSSDLDialog(){
	dialogTop+=180;//330
	yssDialog=$("#ssdl_div").dialog({
		title:"所属队列",
		width:setFitWidthInParent("body","ssdl_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(ssdldNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(ssdldNum).css("margin-top","20px");
	$(".panel.window").eq(ssdldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(ssdldNum).css("color","#000");
	$(".panel.window .panel-title").eq(ssdldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ssdldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(ssdldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ssdldNum).css("width","1000px");
	$(".window-shadow").eq(ssdldNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(ssdldNum).css("border-color","#ddd");

	initSSDLTab();
}

function initSSDLTab(){
	ssdlTab=$("#ssdl_tab").datagrid({
		width:setFitWidthInParent("body","ssdl_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="所在队列";
					break;
				}
				return str;
			}},
            {field:"dm",title:"代码",width:200,align:"center"},
            {field:"mc",title:"名称",width:200,align:"center"},
            {field:"jhyz",title:"叫号阈值",width:200,align:"center"},
            {field:"jhxs",title:"叫号形式",width:200,align:"center",formatter:function(value,row){
            	return (value==1?"自动":"手动")+"叫号";
            }},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"detailSSDLTabRow()\">查看</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:6});
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
	if('${requestScope.ssdl}'==""){
		rows=[];
	}
	else{
		var dm='${requestScope.ssdl.dm}';
		var mc='${requestScope.ssdl.mc}';
		var jhyz='${requestScope.ssdl.jhyz}';
		var jhxs='${requestScope.ssdl.jhxs}';
		var zt='${requestScope.ssdl.zt}';
		var shdwId='${requestScope.ssdl.shdwId}';
		var id='${requestScope.ssdl.id}';
		rows=[{gx:"1",dm:dm,mc:mc,jhyz:jhyz,jhxs:jhxs,zt:zt,shdwId:shdwId,id:id}];
	}
	loadSSDLTabData(rows);
}

function loadSSDLTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	ssdlTab.datagrid('loadData',obj);
}

function initDetailSSDLJBSXZDialog(){
	detailSSDLDialog=$("#detail_ssdl_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_ssdl_div","detail_ssdl_jbsxz_dialog_div"),
		height:331,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailSSDLDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailSSDLDialog(0);
           }}
        ]
	});

	$("#detail_ssdl_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_ssdl_div","detail_ssdl_jbsxz_dialog_div"))+"px");
	$("#detail_ssdl_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_ssdl_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_ssdl_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_ssdl_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_ssdl_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dssdljbsxzNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dssdljbsxzNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssdljbsxzNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssdljbsxzNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dssdljbsxzNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_ssdl_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_ssdl_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_ssdl_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_ssdl_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailSSDLJBSXZDialog(0);
}

function initDetailSSDLSHDWDialog(){
	detailSSDLSHDWDialog=$("#detail_ssdl_shdw_dialog_div").dialog({
		title:"收货单位",
		width:setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:385,
		left:20,
	});

	$(".panel.window").eq(dssdlshdwdNum).css("width",(setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"))+"px");
	$(".panel.window").eq(dssdlshdwdNum).css("margin-top","20px");
	$(".panel.window").eq(dssdlshdwdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dssdlshdwdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dssdlshdwdNum).css("border-color","#ddd");

	//以下的是表格下面的面板
	$(".window-shadow").eq(dssdlshdwdNum).css("width",(setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_dialog_div"))+"px");
	$(".window-shadow").eq(dssdlshdwdNum).css("width","1000px");
	$(".window-shadow").eq(dssdlshdwdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(dssdlshdwdNum).css("border-color","#ddd");

	initDetailSSDLSHDWTab();
	openDetailSSDLSHDWDialog(0);
}

function initDetailSSDLSHDWTab(){
	detailSSDLSHDWTab=$("#detail_ssdl_shdw_tab").datagrid({
		width:setFitWidthInParent("#detail_ssdl_div","detail_ssdl_shdw_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
            	switch (value) {
				case "1":
					str="收货单位";
					break;
				default:
					str=value;
					break;
				}
            	return str;
			}},
			{field:"dwmc",title:"单位名称",width:200,align:"center"},
			{field:"bjsj",title:"编辑时间",width:200,align:"center"}
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
}

function detailSSDLTabRow(){
	var row=ssdlTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_ssdl_jbsxz_dialog_div #id").text(row.id);
	$("#detail_ssdl_jbsxz_dialog_div #mc").text(row.mc);
	$("#detail_ssdl_jbsxz_dialog_div #dm").text(row.dm);
	$("#detail_ssdl_jbsxz_dialog_div #jhyz").text(row.jhyz);
	$("#detail_ssdl_jbsxz_dialog_div #jhxs").text((row.jhxs==1?"自动":"手动")+"叫号");
	var ztStr;
	switch (row.zt) {
	case "1":
		ztStr="在用";
		break;
	case "2":
		ztStr="暂停";
		break;
	case "3":
		ztStr="废弃";
		break;
	}
	$("#detail_ssdl_jbsxz_dialog_div #zt").text(ztStr);
	$("#detail_ssdl_shdw_dialog_div #id").val(row.shdwId);
	
	$.post(path+"main/queryShouHuoDanWeiByIds",
		{ids:row.shdwId},
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				rows[i].gx="1";
			}
			var obj = {"total":rows.length,"rows":rows};
			detailSSDLSHDWTab.datagrid('loadData',obj);
		}
	,"json");
	
	openDetailSSDLDialog(1);
}

function openDetailSSDLDialog(flag){
	if(flag==1){
		$("#detail_ssdl_bg_div").css("display","block");
	}
	else{
		$("#detail_ssdl_bg_div").css("display","none");
	}
	openDetailSSDLJBSXZDialog(flag);
	openDetailSSDLSHDWDialog(flag);
}

function openDetailSSDLJBSXZDialog(flag){
	if(flag==1){
		detailSSDLDialog.dialog("open");
	}
	else{
		detailSSDLDialog.dialog("close");
	}
}

//打开所属队列-收货单位详情窗口
function openDetailSSDLSHDWDialog(flag){
	if(flag==1){
		detailSSDLSHDWDialog.dialog("open");
	}
	else{
		detailSSDLSHDWDialog.dialog("close");
	}
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "detail_div":
		space=340;
		break;
	case "detail_div_table":
	case "panel_window":
		space=355;
		break;
	case "detail_ssdl_jbsxz_dialog_div":
		space=50;
		break;
	case "detail_ssdl_shdw_dialog_div":
		space=60;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>详情</title>
</head>
<body>

<!-- 查看所属队列 start -->
<div class="detail_ssdl_bg_div" id="detail_ssdl_bg_div">
	<div class="detail_ssdl_div" id="detail_ssdl_div">
		<div class="ckst_div">
			<span class="ckst_span">查看实体</span>
			<span class="close_span" onclick="openDetailSSDLDialog(0)">X</span>
		</div>
		<div class="detail_ssdl_dialog_div" id="detail_ssdl_dialog_div">
			<div class="title_div">
				<span class="title_span">全部收货单位-所属队列-详情</span>
			</div>
			<div id="detail_ssdl_jbsxz_dialog_div">
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
						代码
					</td>
					<td style="width:30%;">
						<span id="dm"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						叫号阈值
					</td>
					<td>
						<span id="jhyz"></span>
					</td>
					<td align="right">
						叫号形式
					</td>
					<td>
						<span id="jhxs"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right">
						状态
					</td>
					<td>
						<span id="zt"></span>
					</td>
					<td align="right">
					</td>
					<td>
					</td>
				  </tr>
				</table>
			</div>
			
			<div id="detail_ssdl_shdw_dialog_div">
				<input type="hidden" id="id"/>
				<table id="detail_ssdl_shdw_tab"></table>
			</div>
		</div>
	</div>
</div>
<!-- 查看所属队列 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">全部收货单位-详情</div>
	
	<!-- 基本属性组start -->
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.shdw.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				单位名称
			</td>
			<td style="width:30%;">
				<span>${requestScope.shdw.dwmc }</span>
			</td>
			<td align="right" style="width:15%;">
				编辑时间
			</td>
			<td style="width:30%;">
				<span>${requestScope.shdw.bjsj }</span>
			</td>
		  </tr>
		</table>
	</div>
	<!-- 基本属性组end -->
	
	<!-- 所属队列 start -->
	<div id="ssdl_div">
		<table id="ssdl_tab"></table>
	</div>
	<!-- 所属队列 end -->
</div>
</body>
</html>