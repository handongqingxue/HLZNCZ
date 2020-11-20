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
var showZIndex=9999;
var edNum=0;
$(function(){
	initEditDialog();
	
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
		height:380,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkEdit();
           }}
        ]
	});

	$("#edit_div table").css("width",(setFitWidthInParent("body","edit_div_table"))+"px");
	$("#edit_div table").css("magin","-100px");
	$("#edit_div table td").css("padding-left","50px");
	$("#edit_div table td").css("padding-right","20px");
	$("#edit_div table td").css("font-size","15px");
	$("#edit_div table tr").css("height","45px");

	$(".panel.window").eq(edNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(edNum).css("color","#000");
	$(".panel.window .panel-title").eq(edNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(edNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(edNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(edNum).css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","45%");
	$("#edit_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initEditDivLXLXCBB();
	initEditDivBJSJDTB();
	initEditDivZXZTCBB();
	initEditDivRKZTCBB();
	initEditDivJHYSRQDB();
	initEditDivCRKSJDB();
}

function initEditDivLXLXCBB(){
	edlxlxCBB=$("#edit_div #lxlx_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择车辆类型"},{"value":"1","text":"送运"},{"value":"2","text":"取运"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dd.lxlx }');
		},
		onSelect:function(){
			$("#lxlx").val($(this).combobox("getValue"));
		}
	});
}

function initEditDivBJSJDTB(){
	edbjsjDTB=$("#edit_div #bjsj_dtb").datetimebox({
        required:false,
        disabled:true,
        onSelect:function(){
        	$("#edit_div #bjsj").val(edbjsjDTB.datetimebox("getValue"));
        }
	});
	edbjsjDTB.datebox("setValue",'${requestScope.dd.bjsj }');
}

function initEditDivZXZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择执行状态"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ssddZXZTCBB=$("#edit_div #zxzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				data:data,
				onLoadSuccess:function(){
					$(this).combobox("setValue",'${requestScope.dd.ddztId }');
				}
			});
		}
	,"json");
}

function initEditDivRKZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择入库状态"});
	data.push({"value":"1","text":"未入库"});
	data.push({"value":"2","text":"待入库"});
	data.push({"value":"3","text":"已入库"});
	data.push({"value":"4","text":"入库异常"});
	ssddRKZTCBB=$("#edit_div #rkzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:data,
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dd.rkzt }');
		}
	});
}

function initEditDivJHYSRQDB(){
	edjhysrqDB=$("#edit_div #jhysrq_db").datebox({
        required:false,
        onSelect:function(){
        	$("#edit_div #jhysrq").val(edjhysrqDB.datebox("getValue"));
        }
	});
	edjhysrqDB.datebox("setValue",'${requestScope.dd.jhysrq }');
}

function initEditDivCRKSJDB(){
	edcrksjDB=$("#edit_div #crksj_db").datebox({
        required:false,
        onSelect:function(){
        	$("#edit_div #crksj").val(edcrksjDB.datebox("getValue"));
        }
	});
	if('${requestScope.dd.crksj }'==null||'${requestScope.dd.crksj }'=="")
		edcrksjDB.datebox('textbox').attr('placeholder', '请选择出入库时间');
	else
		edcrksjDB.datebox("setValue",'${requestScope.dd.crksj }');
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "edit_div":
	case "yss_div":
	case "select_yss_tab":
	case "edit_yss_div":
		space=340;
		break;
	case "edit_div_table":
	case "panel_window":
	case "yss_tab":
		space=355;
		break;
	case "select_yss_dialog_div":
	case "edit_yss_jbsxz_dialog_div":
	case "select_wlxx_dialog_div":
	case "edit_wlxx_jbsxz_dialog_div":
	case "select_fhdw_dialog_div":
	case "edit_fhdw_jbsxz_dialog_div":
	case "select_shdw_dialog_div":
	case "edit_shdw_jbsxz_dialog_div":
	case "select_cycl_dialog_div":
	case "edit_cycl_jbsxz_dialog_div":
	case "select_cysj_dialog_div":
	case "edit_fhdw_jbsxz_dialog_div":
	case "select_shdw_dialog_div":
	case "select_cycl_dialog_div":
		space=50;
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
	<div class="page_location_div">待质检-修改</div>
	
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="wybm" name="wybm" value="${requestScope.dd.wybm }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<input type="text" id="ddh" name="ddh" value="${requestScope.dd.ddh }" placeholder="请输入车牌号" disabled="disabled" style="width: 180px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				预装卸重量
			</td>
			<td style="width:30%;">
				<input type="number" id="yzxzl" name="yzxzl" value="${requestScope.dd.yzxzl }" placeholder="请输入预装卸重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				流向类型
			</td>
			<td>
				<input id="lxlx_cbb"/>
				<input type="hidden" id="lxlx" name="lxlx" value="${requestScope.dd.lxlx }"/>
			</td>
			<td align="right">
				编辑时间
			</td>
			<td>
				<input id="bjsj_dtb"/>
				<input type="hidden" id="cllx" name="cllx" value="${requestScope.cl.cllx }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				执行状态
			</td>
			<td>
				<input id="zxzt_cbb"/>
				<input type="hidden" id="zxztId" name="ddztId" value="${requestScope.dd.ddztId }"/>
			</td>
			<td align="right">
				入库状态
			</td>
			<td>
				<input id="rkzt_cbb"/>
				<input type="hidden" id="rkzt" name="rkzt" value="${requestScope.dd.rkzt }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				实际重量
			</td>
			<td>
				<input type="number" id="sjzl" value="${requestScope.dd.sjzl }" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				重量差额比
			</td>
			<td>
				<input type="number" id="zlceb" value="${requestScope.dd.zlceb }" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				计划运输日期
			</td>
			<td>
				<input id="jhysrq_db"/>
				<input type="hidden" id="jhysrq" name="jhysrq" value="${requestScope.dd.jhysrq }"/>
			</td>
			<td align="right">
				出入库时间
			</td>
			<td>
				<input id="crksj_db"/>
				<input type="hidden" id="crksj" name="crksj" value="${requestScope.dd.crksj }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				二维码
			</td>
			<td>
				<div>
					${requestScope.dd.ewm }
				</div>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>