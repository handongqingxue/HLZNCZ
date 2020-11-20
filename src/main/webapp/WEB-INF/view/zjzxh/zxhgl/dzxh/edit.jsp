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
var cycldNum=1;
var cysjdNum=2;
var xdyhdNum=3;
var sjyhdNum=4;
$(function(){
	initEditDialog();
	
	initCYCLDialog();//1.承运车辆窗口
	
	initCYSJDialog();//2.承运司机窗口

	initXDYHDialog();//3.下单用户窗口

	initSJYHDialog();//4.司机用户窗口
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	//承运车辆
	var cycldpw=$("body").find(".panel.window").eq(cycldNum);
	var cycldws=$("body").find(".window-shadow").eq(cycldNum);

	//承运司机
	var cysjdpw=$("body").find(".panel.window").eq(cysjdNum);
	var cysjdws=$("body").find(".window-shadow").eq(cysjdNum);

	//下单用户
	var xdyhdpw=$("body").find(".panel.window").eq(xdyhdNum);
	var xdyhdws=$("body").find(".window-shadow").eq(xdyhdNum);

	//司机用户
	var sjyhdpw=$("body").find(".panel.window").eq(sjyhdNum);
	var sjyhdws=$("body").find(".window-shadow").eq(sjyhdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);

	ccDiv.append(cycldpw);
	ccDiv.append(cycldws);

	ccDiv.append(cysjdpw);
	ccDiv.append(cysjdws);

	ccDiv.append(xdyhdpw);
	ccDiv.append(xdyhdws);

	ccDiv.append(sjyhdpw);
	ccDiv.append(sjyhdws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:325,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"已完成装卸",id:"ok_but",iconCls:"icon-save",handler:function(){
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

	$("#edit_div #ok_but").css("left","40%");
	$("#edit_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initEditDivLXLXCBB();
	initEditDivBJSJDTB();
	initEditDivZXZTCBB();
	initEditDivJHYSRQDB();
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
			dzxhDDZTCBB=$("#edit_div #zxzt_cbb").combobox({
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

function initEditDivJHYSRQDB(){
	edjhysrqDB=$("#edit_div #jhysrq_db").datebox({
        required:false,
        onSelect:function(){
        	$("#edit_div #jhysrq").val(edjhysrqDB.datebox("getValue"));
        }
	});
	edjhysrqDB.datebox("setValue",'${requestScope.dd.jhysrq }');
}

function initCYCLDialog(){
	dialogTop+=355;//1150
	cyclDialog=$("#cycl_div").dialog({
		title:"承运车辆",
		width:setFitWidthInParent("body","cycl_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(cycldNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(cycldNum).css("margin-top","20px");
	$(".panel.window").eq(cycldNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(cycldNum).css("color","#000");
	$(".panel.window .panel-title").eq(cycldNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(cycldNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(cycldNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(cycldNum).css("width","1000px");
	$(".window-shadow").eq(cycldNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(cycldNum).css("border-color","#ddd");

	initCYCLTab();
}

function initCYCLTab(){
	cyclTab=$("#cycl_tab").datagrid({
		toolbar:"#cycl_toolbar",
		width:setFitWidthInParent("body","cycl_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="货运车辆";
					break;
				}
				return str;
			}},
            {field:"cph",title:"车牌号",width:200,align:"center"},
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
	var rows;
	if('${requestScope.cycl}'==""){
		rows=[];
	}
	else{
		var cph='${requestScope.cycl.cph}';
		var id='${requestScope.cycl.id}';
		rows=[{gx:"1",cph:cph,id:id}];
	}
	loadCYCLTabData(rows);
}

function initCYSJDialog(){
	dialogTop+=230;//1380
	cysjDialog=$("#cysj_div").dialog({
		title:"承运司机",
		width:setFitWidthInParent("body","cysj_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(cysjdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(cysjdNum).css("margin-top","20px");
	$(".panel.window").eq(cysjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(cysjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(cysjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(cysjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(cysjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(cysjdNum).css("width","1000px");
	$(".window-shadow").eq(cysjdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(cysjdNum).css("border-color","#ddd");

	initCYSJTab();
}

function initCYSJTab(){
	cysjTab=$("#cysj_tab").datagrid({
		toolbar:"#cysj_toolbar",
		width:setFitWidthInParent("body","cysj_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="货运司机";
					break;
				}
				return str;
			}},
            {field:"xm",title:"姓名",width:200,align:"center"},
            {field:"sjh",title:"手机号",width:200,align:"center"},
            {field:"sfz",title:"身份证",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:5});
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
	if('${requestScope.cysj}'==""){
		rows=[];
	}
	else{
		var xm='${requestScope.cysj.xm}';
		var sjh='${requestScope.cysj.sjh}';
		var sfz='${requestScope.cysj.sfz}';
		var id='${requestScope.cysj.id}';
		rows=[{gx:"1",xm:xm,sjh:sjh,sfz:sfz,id:id}];
	}
	loadCYSJTabData(rows);
}

function initXDYHDialog(){
	dialogTop+=230;//1380
	xdyhDialog=$("#xdyh_div").dialog({
		title:"下单用户",
		width:setFitWidthInParent("body","xdyh_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(xdyhdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(xdyhdNum).css("margin-top","20px");
	$(".panel.window").eq(xdyhdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(xdyhdNum).css("color","#000");
	$(".panel.window .panel-title").eq(xdyhdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(xdyhdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(xdyhdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(xdyhdNum).css("width","1000px");
	$(".window-shadow").eq(xdyhdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(xdyhdNum).css("border-color","#ddd");

	initXDYHTab();
}

function initXDYHTab(){
	xdyhTab=$("#xdyh_tab").datagrid({
		width:setFitWidthInParent("body","xdyh_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="下单用户";
					break;
				}
				return str;
			}},
            {field:"sm",title:"实名",width:200,align:"center"},
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
	var rows;
	if('${requestScope.xdyh}'==""){
		rows=[];
	}
	else{
		var sm='${requestScope.xdyh.sm}';
		var id='${requestScope.xdyh.id}';
		rows=[{gx:"1",sm:sm,id:id}];
	}
	loadXDYHTabData(rows);
}

function initSJYHDialog(){
	dialogTop+=230;//1380
	xdyhDialog=$("#sjyh_div").dialog({
		title:"司机用户",
		width:setFitWidthInParent("body","sjyh_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(sjyhdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(sjyhdNum).css("margin-top","20px");
	$(".panel.window").eq(sjyhdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sjyhdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sjyhdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sjyhdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sjyhdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sjyhdNum).css("width","1000px");
	$(".window-shadow").eq(sjyhdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(sjyhdNum).css("border-color","#ddd");

	initSJYHTab();
}

function initSJYHTab(){
	sjyhTab=$("#sjyh_tab").datagrid({
		width:setFitWidthInParent("body","sjyh_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="订单司机用户";
					break;
				}
				return str;
			}},
            {field:"sm",title:"实名",width:200,align:"center"},
            {field:"yhm",title:"用户名",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:4});
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
	if('${requestScope.sjyh}'==""){
		rows=[];
	}
	else{
		var sm='${requestScope.sjyh.sm}';
		var yhm='${requestScope.sjyh.yhm}';
		var id='${requestScope.sjyh.id}';
		rows=[{gx:"1",sm:sm,yhm:yhm,id:id}];
	}
	loadSJYHTabData(rows);
}

function loadCYCLTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	cyclTab.datagrid('loadData',obj);
}

function loadCYSJTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	cysjTab.datagrid('loadData',obj);
}

function loadXDYHTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	xdyhTab.datagrid('loadData',obj);
}

function loadSJYHTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	sjyhTab.datagrid('loadData',obj);
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
	<div class="page_location_div">待装卸货-修改</div>

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
				<input type="hidden" id="ddztId" name="ddztId" value="${requestScope.dd.ddztId }"/>
			</td>
			<td align="right">
				实际重量
			</td>
			<td>
				<input type="number" id="sjzl" value="${requestScope.dd.sjzl }" placeholder="请输入实际重量" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				重量差额比
			</td>
			<td>
				<input type="number" id="zlceb" value="${requestScope.dd.zlceb }" placeholder="无需输入" disabled="disabled" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				计划运输日期
			</td>
			<td>
				<input id="jhysrq_db"/>
				<input type="hidden" id="jhysrq" name="jhysrq" value="${requestScope.dd.jhysrq }"/>
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
	
	<div id="cycl_div">
		<table id="cycl_tab"></table>
	</div>
	
	<div id="cysj_div">
		<table id="cysj_tab"></table>
	</div>
	
	<div id="xdyh_div">
		<table id="xdyh_tab"></table>
	</div>
	
	<div id="sjyh_div">
		<table id="sjyh_tab"></table>
	</div>
</div>
</body>
</html>