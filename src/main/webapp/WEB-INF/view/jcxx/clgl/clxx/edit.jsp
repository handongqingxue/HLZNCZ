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
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body"),
		height:431,
		top:60,
		left:308,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkEdit();
           }}
        ]
	});

	$("#edit_div table").css("width",(setFitWidthInParent("body")-15)+"px");
	$("#edit_div table").css("magin","-100px");
	$("#edit_div table td").css("padding-left","50px");
	$("#edit_div table td").css("padding-right","20px");
	$("#edit_div table td").css("font-size","15px");
	$("#edit_div table tr").css("height","45px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").css("color","#000");
	$(".panel.window .panel-title").css("font-size","15px");
	$(".panel.window .panel-title").css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","45%");
	$("#edit_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
}

function initCLLXCBB(){
	cllxCBB=$("#cllx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"重型"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.cl.cllx }');
		},
		onSelect:function(){
			$("#cllx").val($(this).combobox("getValue"));
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
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.cl.pfjd }');
		},
		onSelect:function(){
			$("#pfjd").val($(this).combobox("getValue"));
		}
	});
}

function initZCRQDB(){
    zcrqDB=$('#zcrq_db').datebox({
        required:false,
        onSelect:function(){
        	$("#zcrq").val(zcrqDB.datebox("getValue"));
        }
    });
    zcrqDB.datebox("setValue",'${requestScope.cl.zcrq }');
}

function initSFZYCBB(){
	sfzyCBB=$("#sfzy_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择是否在用"},{"value":"1","text":"是"},{"value":"0","text":"否"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.cl.sfzy }'?1:0);
		},
		onSelect:function(){
			$("#sfzy").val($(this).combobox("getValue"));
		}
	});
}

function initCLYSLXCBB(){
	clyslxCBB=$("#clyslx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆运输类型"},{"value":"1","text":"普货运输"},{"value":"2","text":"厂内运输"},{"value":"3","text":"危化品运输"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.cl.clyslx }');
		},
		onSelect:function(){
			$("#clyslx").val($(this).combobox("getValue"));
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

function checkEdit(){
	if(checkCPH()){
		if(checkPFJD()){
			editCheLiang();
		}
	}
}

function editCheLiang(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:path+"main/editCheLiang",
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

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-340;
}
</script>
<title>修改</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../../inc/nav.jsp"%>
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.cl.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				车牌号
			</td>
			<td style="width:30%;">
				<input type="text" id="cph" name="cph" value="${requestScope.cl.cph }" placeholder="请输入车牌号" style="width: 150px;height:30px;" onfocus="focusCPH()" onblur="checkCPH()"/>
			</td>
			<td align="right" style="width:15%;">
				车主信息
			</td>
			<td style="width:30%;">
				<input type="text" id="czxx" name="czxx" value="${requestScope.cl.czxx }" placeholder="请输入车主信息" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				皮重
			</td>
			<td>
				<input type="number" id="pz" name="pz" value="${requestScope.cl.pz }" placeholder="请输入皮重" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				车辆类型
			</td>
			<td>
				<input id="cllx_cbb"/>
				<input type="hidden" id="cllx" name="cllx" value="${requestScope.cl.cllx }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				照片
			</td>
			<td>
				<input type="file" name="zp_file"/>
				<div>
					${requestScope.cl.zp }
				</div>
			</td>
			<td align="right">
				发动机号码
			</td>
			<td>
				<input type="text" id="fdjhm" value="${requestScope.cl.fdjhm }" placeholder="请输入发动机号码" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				车辆识别代号
			</td>
			<td>
				<input type="text" id="clsbdh" value="${requestScope.cl.clsbdh }" placeholder="请输入车辆识别代号" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				排放阶段
			</td>
			<td>
				<input id="pfjd_cbb"/>
				<input type="hidden" id="pfjd" name="pfjd" value="${requestScope.cl.pfjd }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				注册日期
			</td>
			<td>
				<input id="zcrq_db"/>
				<input type="hidden" id="zcrq" name="zcrq" value="${requestScope.cl.zcrq }"/>
			</td>
			<td align="right">
				是否在用
			</td>
			<td>
				<input id="sfzy_cbb"/>
				<input type="hidden" id="sfzy" name="sfzy" value="${requestScope.cl.sfzy }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				车辆运输类型
			</td>
			<td>
				<input id="clyslx_cbb"/>
				<input type="hidden" id="clyslx" name="clyslx" value="${requestScope.cl.clyslx }"/>
			</td>
			<td align="right">
				行驶证
			</td>
			<td>
				<input type="file" name="xsz_file"/>
				<div>
					${requestScope.cl.xsz }
				</div>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				随车清单
			</td>
			<td>
				<input type="file" name="scqd_file"/>
				<div>
					${requestScope.cl.scqd }
				</div>
			</td>
			<td align="right">
				排放阶段查询截图
			</td>
			<td>
				<input type="file" name="pfjdcxjt_file"/>
				<div>
					${requestScope.cl.pfjdcxjt }
				</div>
			</td>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>