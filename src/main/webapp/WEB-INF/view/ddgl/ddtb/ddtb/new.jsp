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
var tbxxdNum=0;
var ndNum=1;

$(function(){
	initTBXXDialog();//0
	initNewDialog();//1
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//填报信息
	var tbxxdpw=$("body").find(".panel.window").eq(tbxxdNum);
	var tbxxdws=$("body").find(".window-shadow").eq(tbxxdNum);
	
	//新字段组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(tbxxdpw);
	ccDiv.append(tbxxdws);

	ccDiv.append(ndpw);
	ccDiv.append(ndws);
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

function initNewDialog(){
	dialogTop+=190;
	$("#new_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("body","new_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkNew();
           }}
        ]
	});

	$("#new_div table").css("width",(setFitWidthInParent("body","new_div_table"))+"px");
	$("#new_div table").css("magin","-100px");
	$("#new_div table td").css("padding-left","50px");
	$("#new_div table td").css("padding-right","20px");
	$("#new_div table td").css("font-size","15px");
	$("#new_div table tr").css("height","45px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").eq(ndNum).css("color","#000");
	$(".panel.window .panel-title").eq(ndNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ndNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initLXLXCBB();
	initBJSJDB();
	//iniKSJHSJDB();
}

function initLXLXCBB(){
	ndlxlxCBB=$("#new_div #lxlx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择流向类型"},{"value":"1","text":"送运"},{"value":"2","text":"取运"}
		],
		onSelect:function(){
			$("#lxlx").val($(this).combobox("getValue"));
		}
	});
}

function initBJSJDB(){
	bjsjDB=$('#bjsj_db').datebox({
		width:160,
        required:false,
        disabled:true
    });
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "tbxx_div":
	case "new_div":
	case "sssj_div":
	case "ssdl_div":
	case "select_sssj_tab":
	case "wlxx_div":
	case "select_wlxx_tab":
	case "edit_wlxx_div":
	case "fhdw_div":
	case "select_fhdw_tab":
	case "edit_fhdw_div":
	case "shdw_div":
	case "select_shdw_tab":
	case "edit_shdw_div":
	case "cycl_div":
	case "select_cycl_tab":
		space=340;
		break;
	case "tbxx_div_table":
	case "new_div_table":
	case "panel_window":
	case "sssj_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "edit_sssj_jbxx_dialog_div":
	case "detail_sssj_jbxx_dialog_div":
	case "select_sssj_dialog_div":
	case "select_ssdl_dialog_div":
	case "detail_ssdl_jbsxz_dialog_div":
	case "select_ssdd_dialog_div":
	case "detail_ssdd_jbxx_dialog_div":
		space=50;
		break;
	case "edit_sssj_zjjs_dialog_div":
	case "detail_sssj_zjjs_dialog_div":
	case "detail_ssdl_shdw_dialog_div":
	case "detail_ssdd_yss_dialog_div":
	case "detail_ssdd_wlxx_dialog_div":
	case "detail_ssdd_fhdw_dialog_div":
	case "detail_ssdd_shdw_dialog_div":
	case "detail_ssdd_cycl_dialog_div":
	case "detail_ssdd_cysj_dialog_div":
	case "detail_ssdd_jybg_dialog_div":
	case "detail_ssdd_xdzxtzh_dialog_div":
	case "detail_ssdd_cysjxtzh_dialog_div":
	case "detail_ssdd_phxx_dialog_div":
		space=60;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>创建</title>
</head>
<body>

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">订单填报-创建</div>
	
	<div id="tbxx_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				实际重量
			</td>
			<td style="width:30%;">
				<input type="text" id="sjzl" name="sjzl" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				备注
			</td>
			<td style="width:30%;">
				<textarea rows="3" cols="20" id="bz" name="bz" placeholder="请输入备注"></textarea>
			</td>
		  </tr>
		</table>
	</div>
	
	<!-- 基本信息 start -->
	<div id="new_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车牌号
			</td>
			<td style="width:30%;">
				<input type="text" id="cph" name="cph" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<input type="text" id="ddh" name="ddh" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				预装卸重量
			</td>
			<td>
				<input type="number" id="yzxzl" name="yzxzl" placeholder="请输入预装卸重量" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				流向类型
			</td>
			<td>
				<input id="lxlx_cbb"/>
				<input type="hidden" id="lxlx" name="lxlx"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				编辑时间
			</td>
			<td>
				<input id="bjsj_db"/>
			</td>
			<td align="right">
				二维码
			</td>
			<td>
				<input type="text" id="ewm" name="ewm" placeholder="请输入二维码" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				实际重量
			</td>
			<td>
				<input type="text" id="sjzl" name="sjzl" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</form>
	</div>
	<!-- 基本信息 end -->
	
</div>
</body>
</html>