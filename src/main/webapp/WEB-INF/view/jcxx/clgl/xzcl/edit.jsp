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
.bi_tian_xiang{
	color: #f00;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var edNum=0;
$(function(){
	initEditDialog();
	initZCRQDB();
	initPFJDCBB();
	initCLYSLXCBB();
	initFZRQDB();
	initCLLXCBB();
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:550,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkEdit("bc");
           }},
           {text:"提请审核",id:"tqsh_but",iconCls:"icon-save",handler:function(){
       	   		checkEdit("tqsh");
          }}
        ]
	});

	$("#edit_div table").css("width",(setFitWidthInParent("body","edit_div_table"))+"px");
	$("#edit_div table").css("magin","-100px");
	$("#edit_div table td").css("padding-left","50px");
	$("#edit_div table td").css("padding-right","20px");
	$("#edit_div table td").css("font-size","15px");
	for(var i=0;i<7;i++){
		$("#edit_div table tr").eq(i).css("height","45px");
	}
	$("#edit_div table tr").eq(7).css("height","90px");

	$(".panel.window").eq(edNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(edNum).css("color","#000");
	$(".panel.window .panel-title").eq(edNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(edNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(edNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(edNum).css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","30%");
	$("#edit_div #ok_but").css("position","absolute");
	
	$("#edit_div #tqsh_but").css("left","45%");
	$("#edit_div #tqsh_but").css("position","absolute");
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
    zcrqDB.datebox("setValue",'${requestScope.cl.zcrq }');
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

function initFZRQDB(){
    fzrqDB=$('#fzrq_db').datebox({
        required:false,
        onSelect:function(){
        	$("#fzrq").val(fzrqDB.datebox("getValue"));
        }
    });
    fzrqDB.datebox("setValue",'${requestScope.cl.fzrq }');
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

function checkEdit(flag){
	if(checkCPH()){
		if(checkPFJD()){
			editCheLiang(flag);
		}
	}
}

function editCheLiang(flag){
	if(flag=="bc"){
		$("#edit_div #shzt").val(3);
	}
	else if(flag=="tqsh"){
		$("#edit_div #shzt").val(1);
	}
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

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "edit_div":
		space=340;
		break;
	case "edit_div_table":
	case "panel_window":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>修改</title>
</head>
<body>
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">新增车辆-修改</div>
	
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.cl.id }"/>
		<input type="hidden" id="sfzy" name="sfzy"/>
		<input type="hidden" id="shzt" name="shzt"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				<span class="bi_tian_xiang">*</span>
				车牌号
			</td>
			<td style="width:30%;">
				<input type="text" id="cph" name="cph" value="${requestScope.cl.cph }" placeholder="请输入车牌号" style="width: 150px;height:30px;" onfocus="focusCPH()" onblur="checkCPH()"/>
			</td>
			<td align="right" style="width:15%;">
				<span class="bi_tian_xiang">*</span>
				发动机号码
			</td>
			<td style="width:30%;">
				<input type="text" id="fdjhm" value="${requestScope.cl.fdjhm }" placeholder="请输入发动机号码" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				车辆识别代号
			</td>
			<td>
				<input type="text" id="clsbdh" value="${requestScope.cl.clsbdh }" placeholder="请输入车辆识别代号" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				注册日期
			</td>
			<td>
				<input id="zcrq_db"/>
				<input type="hidden" id="zcrq" name="zcrq" value="${requestScope.cl.zcrq }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				排放阶段
			</td>
			<td>
				<input id="pfjd_cbb"/>
				<input type="hidden" id="pfjd" name="pfjd" value="${requestScope.cl.pfjd }"/>
			</td>
			<td align="right">
				车辆运输类型
			</td>
			<td>
				<input id="clyslx_cbb"/>
				<input type="hidden" id="clyslx" name="clyslx" value="${requestScope.cl.clyslx }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				品牌型号
			</td>
			<td>
				<input type="text" id="ppxh" name="ppxh" value="${requestScope.cl.ppxh }" placeholder="请输入品牌型号" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				车主信息
			</td>
			<td>
				<input type="text" id="czxx" name="czxx" value="${requestScope.cl.czxx }" placeholder="请输入车主信息" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				发证日期
			</td>
			<td>
				<input id="fzrq_db"/>
				<input type="hidden" id="fzrq" name="fzrq" value="${requestScope.cl.fzrq }"/>
			</td>
			<td align="right">
				皮重
			</td>
			<td>
				<input type="number" id="pz" name="pz" value="${requestScope.cl.pz }" placeholder="请输入皮重" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				车辆类型
			</td>
			<td>
				<input id="cllx_cbb"/>
				<input type="hidden" id="cllx" name="cllx" value="${requestScope.cl.cllx }"/>
			</td>
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				照片
			</td>
			<td>
				<input type="file" name="zp_file"/>
				<div>
					${requestScope.cl.zp }
				</div>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				行驶证
			</td>
			<td>
				<input type="file" name="xsz_file"/>
				<div>
					${requestScope.cl.xsz }
				</div>
			</td>
			<td align="right">
				随车清单
			</td>
			<td>
				<input type="file" name="scqd_file"/>
				<div>
					${requestScope.cl.scqd }
				</div>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				<span class="bi_tian_xiang">*</span>
				排放阶段查询截图
			</td>
			<td>
				<input type="file" name="pfjdcxjt_file"/>
				<div>
					${requestScope.cl.pfjdcxjt }
				</div>
			</td>
			<td align="right">
				备注
			</td>
			<td>
				<textarea rows="3" cols="15" placeholder="请输入备注">${requestScope.cl.bz }</textarea>
			</td>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>