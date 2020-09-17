<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../inc/js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
$(function(){
	initEditDialog();
	initCLLXCBB();
	initPFJDCBB();
	initZCRQDB();
	initSFZYCBB();
	initCLYSLXCBB();
});

function initEditDialog(){
	$("#new_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body"),
		height:431,
		top:60,
		left:308,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkNew();
           }}
        ]
	});

	$("#new_div table").css("width",(setFitWidthInParent("body")-15)+"px");
	$("#new_div table").css("magin","-100px");
	$("#new_div table td").css("padding-left","50px");
	$("#new_div table td").css("padding-right","20px");
	$("#new_div table td").css("font-size","15px");
	$("#new_div table tr").css("height","45px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").css("color","#000");
	$(".panel.window .panel-title").css("font-size","15px");
	$(".panel.window .panel-title").css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initCLLXCBB(){
	$("#cllx").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"重型"}]
	});
}

function initPFJDCBB(){
	$("#pfjd").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择排放阶段"},
			{"value":"1","text":"国五燃油"},
			{"value":"2","text":"国五燃气"},
			{"value":"3","text":"国六燃油"},
			{"value":"4","text":"国六燃气"},
			{"value":"5","text":"电动"}
		]
	});
}

function initZCRQDB(){
    $('#zcrq').datebox({
        required:false
    });
}

function initSFZYCBB(){
	$("#sfzy").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择是否在用"},{"value":"1","text":"是"},{"value":"0","text":"否"}]
	});
}

function initCLYSLXCBB(){
	$("#clyslx").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆运输类型"},{"value":"1","text":"普货运输"},{"value":"2","text":"厂内运输"},{"value":"3","text":"危化品运输"}]
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

function checkNew(){
	if(checkMC()){
		if(checkWZLXId()){
			newWuZi();
		}
	}
}

function newWuZi(){
	var mc=$("#new_div #mc").val();
	var wzlxId=$("#new_div #wzlx_hid").val();
	
	$.post(path+"main/newWuZi",
		{mc:mc,wzlxId:wzlxId},
		function(data){
			if(data.message=="ok"){
				alert(data.info);
				history.go(-1);
			}
			else{
				alert(data.info);
			}
		}
	,"json");
}

function focusMC(){
	var mc = $("#mc").val();
	if(mc=="名称不能为空"){
		$("#mc").val("");
		$("#mc").css("color", "#555555");
	}
}

//验证名称
function checkMC(){
	var mc = $("#mc").val();
	if(mc==null||mc==""||mc=="名称不能为空"){
		$("#mc").css("color","#E15748");
    	$("#mc").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

//验证物资类型
function checkWZLXId(){
	var wzlxId = $("#wzlx_hid").val();
	if(wzlxId==null||wzlxId==""){
	  	alert("请选择物资类型");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-340;
}

function setFitHeightInParent(o){
	var height=$(o).css("height");
	return height.substring(0,height.length-2)-98;
}
</script>
<title>创建</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="new_div">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车牌号
			</td>
			<td style="width:30%;">
				<input type="text" id="cph" placeholder="请输入车牌号" style="width: 150px;height:30px;" onfocus="focusMC()" onblur="checkMC()"/>
			</td>
			<td align="right" style="width:15%;">
				车主信息
			</td>
			<td style="width:30%;">
				<input type="text" id="czxx" placeholder="请输入车主信息" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				皮重
			</td>
			<td>
				<input type="text" id="pz" placeholder="请输入皮重" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				车辆类型
			</td>
			<td>
				<input id="cllx"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				照片
			</td>
			<td style="width:30%;">
			</td>
			<td align="right" style="width:15%;">
				发动机号码
			</td>
			<td style="width:30%;">
				<input type="text" id="czxx" placeholder="请输入发动机号码" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车辆识别代号
			</td>
			<td style="width:30%;">
				<input type="text" id="clsbdh" placeholder="请输入车辆识别代号" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				排放阶段
			</td>
			<td style="width:30%;">
				<input id="pfjd"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				注册日期
			</td>
			<td style="width:30%;">
				<input id="zcrq"/>
			</td>
			<td align="right" style="width:15%;">
				是否在用
			</td>
			<td style="width:30%;">
				<input id="sfzy"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车辆运输类型
			</td>
			<td style="width:30%;">
				<input id="clyslx"/>
			</td>
			<td align="right" style="width:15%;">
				行驶证
			</td>
			<td style="width:30%;">
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				随车清单
			</td>
			<td style="width:30%;">
			</td>
			<td align="right" style="width:15%;">
				排放阶段查询截图
			</td>
			<td style="width:30%;">
			</td>
		  </tr>
		</table>
	</div>
</div>
</body>
</html>