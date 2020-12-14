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
var jcxxPath=path+'jcxx/';
var dialogTop=10;
var dialogLeft=20;
var ndNum=0;
$(function(){
	initNewDialog();
	initZCRQDB();
	initPFJDCBB();
	initCLYSLXCBB();
	initFZRQDB();
	initCLLXCBB();
	initSFZYCBB();
	initXXZTCBB();
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
}

function initNewDialog(){
	dialogTop+=20;
	$("#new_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","new_div"),
		height:550,
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
	for(var i=0;i<8;i++){
		$("#new_div table tr").eq(i).css("height","45px");
	}
	$("#new_div table tr").eq(8).css("height","90px");

	$(".panel.window").eq(ndNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(ndNum).css("color","#000");
	$(".panel.window .panel-title").eq(ndNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ndNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ndNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ndNum).css("border-color","#ddd");

	$("#new_div #ok_but").css("left","45%");
	$("#new_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initZCRQDB(){
    zcrqDB=$('#zcrq_db').datebox({
        required:false,
        onSelect:function(){
        	$("#zcrq").val(zcrqDB.datebox("getValue"));
        }
    });
}

function initPFJDCBB(){
	pfjdCBB=$("#pfjd_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择排放阶段"},
			{"value":"1","text":"国五燃油"},
			{"value":"2","text":"国五燃气"},
			{"value":"3","text":"国六燃油"},
			{"value":"4","text":"国六燃气"},
			{"value":"5","text":"电动"}
		],
		onSelect:function(){
			$("#pfjd").val($(this).combobox("getValue"));
		}
	});
}

function initCLYSLXCBB(){
	clyslxCBB=$("#clyslx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆运输类型"},{"value":"1","text":"普货运输"},{"value":"2","text":"厂内运输"},{"value":"3","text":"危化品运输"}],
		onSelect:function(){
			$("#clyslx").val($(this).combobox("getValue"));
		}
	});
}

function initFZRQDB(){
    fzrqDB=$('#fzrq_db').datebox({
        required:false,
        onSelect:function(){
        	$("#fzrq").val(fzrqDB.datebox("getValue"));
        }
    });
}

function initCLLXCBB(){
	cllxCBB=$("#cllx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"重型"}],
		onSelect:function(){
			$("#cllx").val($(this).combobox("getValue"));
		}
	});
}

function initSFZYCBB(){
	sfzyCBB=$("#sfzy_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择是否在用"},{"value":"1","text":"是"},{"value":"0","text":"否"}],
		onSelect:function(){
			$("#sfzy").val($(this).combobox("getValue"));
		}
	});
}

function initXXZTCBB(){
	xxztCBB=$("#xxzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择信息状态"},{"value":"1","text":"待审核"},{"value":"2","text":"审核通过"},{"value":"3","text":"编辑中"}],
		onSelect:function(){
			$("#xxzt").val($(this).combobox("getValue"));
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

function checkNew(){
	if(checkCPH()){
		if(checkPFJD()){
			newCheLiang();
		}
	}
}

function newCheLiang(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:jcxxPath+"newCheLiang",
		dataType: "json",
		data:formData,
		cache: false,
		processData: false,
		contentType: false,
		success: function (data){
			if(data.message=="ok"){
				alert(data.info);
				history.go(-1);
			}
			else{
				alert(data.info);
			}
		}
	});
}

function focusCPH(){
	var cph = $("#cph").val();
	if(cph=="车牌号不能为空"){
		$("#cph").val("");
		$("#cph").css("color", "#555555");
	}
}

//验证车牌号
function checkCPH(){
	var mc = $("#cph").val();
	if(mc==null||mc==""||mc=="车牌号不能为空"){
		$("#cph").css("color","#E15748");
    	$("#cph").val("车牌号不能为空");
    	return false;
	}
	else
		return true;
}

//验证排放阶段
function checkPFJD(){
	var pfjd=pfjdCBB.combobox("getValue");
	if(pfjd==null||pfjd==""){
	  	alert("请选择排放阶段");
	  	return false;
	}
	else
		return true;
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "new_div":
		space=340;
		break;
	case "new_div_table":
	case "panel_window":
		space=355;
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
	<div class="page_location_div">车辆查询-创建</div>
	
	<div id="new_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车牌号
			</td>
			<td style="width:30%;">
				<input type="text" id="cph" name="cph" placeholder="请输入车牌号" style="width: 150px;height:30px;" onfocus="focusCPH()" onblur="checkCPH()"/>
			</td>
			<td align="right" style="width:15%;">
				发动机号码
			</td>
			<td style="width:30%;">
				<input type="text" id="fdjhm" placeholder="请输入发动机号码" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				车辆识别代号
			</td>
			<td>
				<input type="text" id="clsbdh" name="clsbdh" placeholder="请输入车辆识别代号" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				注册日期
			</td>
			<td>
				<input id="zcrq_db"/>
				<input type="hidden" id="zcrq" name="zcrq"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				排放阶段
			</td>
			<td style="width:30%;">
				<input id="pfjd_cbb"/>
				<input type="hidden" id="pfjd" name="pfjd"/>
			</td>
			<td align="right" style="width:15%;">
				车辆运输类型
			</td>
			<td style="width:30%;">
				<input id="clyslx_cbb"/>
				<input type="hidden" id="clyslx" name="clyslx"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				品牌型号
			</td>
			<td style="width:30%;">
				<input type="text" id="ppxh" name="ppxh" placeholder="请输入品牌型号" style="width: 150px;height:30px;" onfocus="focusPPXH()" onblur="checkPPXH()"/>
			</td>
			<td align="right" style="width:15%;">
				车主信息
			</td>
			<td style="width:30%;">
				<input type="text" id="czxx" name="czxx" placeholder="请输入车主信息" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				发证日期
			</td>
			<td style="width:30%;">
				<input id="fzrq_db"/>
				<input type="hidden" id="fzrq" name="fzrq"/>
			</td>
			<td align="right" style="width:15%;">
				皮重
			</td>
			<td style="width:30%;">
				<input type="number" id="pz" name="pz" placeholder="请输入皮重" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车辆类型
			</td>
			<td style="width:30%;">
				<input id="cllx_cbb"/>
				<input type="hidden" id="cllx" name="cllx"/>
			</td>
			<td align="right" style="width:15%;">
				照片
			</td>
			<td style="width:30%;">
				<input type="file" name="zp_file"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				行驶证
			</td>
			<td style="width:30%;">
				<input type="file" name="xsz_file"/>
			</td>
			<td align="right" style="width:15%;">
				随车清单
			</td>
			<td style="width:30%;">
				<input type="file" name="scqd_file"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				排放阶段查询截图
			</td>
			<td style="width:30%;">
				<input type="file" name="pfjdcxjt_file"/>
			</td>
			<td align="right" style="width:15%;">
				是否在用
			</td>
			<td style="width:30%;">
				<input id="sfzy_cbb"/>
				<input type="hidden" id="sfzy" name="sfzy"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				信息状态
			</td>
			<td style="width:30%;">
				<input id="xxzt_cbb"/>
				<input type="hidden" id="xxzt" name="xxzt"/>
			</td>
			<td align="right" style="width:15%;">
				备注
			</td>
			<td style="width:30%;">
				<textarea rows="3" cols="15" placeholder="请输入备注"></textarea>
			</td>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>