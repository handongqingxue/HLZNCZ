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
var edNum=0;
var shdwdNum=1;
$(function(){
	initEditDialog();//0
	
	initSHDWDialog();//1.收货单位窗口
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	//收货单位
	var shdwdpw=$("body").find(".panel.window").eq(shdwdNum);
	var shdwdws=$("body").find(".window-shadow").eq(shdwdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);

	ccDiv.append(shdwdpw);
	ccDiv.append(shdwdws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:236,
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
	
	initEditDivJHXSCBB();
	initEditDivZTCBB();
}

function initEditDivJHXSCBB(){
	edjhxsCBB=$("#edit_div #jhxs_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择叫号形式"},{"value":"1","text":"自动叫号"},{"value":"2","text":"手动叫号"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dl.jhxs }');
		},
		onSelect:function(){
			$("#jhxs").val($(this).combobox("getValue"));
		}
	});
}

function initEditDivZTCBB(){
	edztCBB=$("#edit_div #zt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择状态"},{"value":"1","text":"在用"},{"value":"2","text":"暂停"},{"value":"3","text":"废弃"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.dl.zt }');
		},
		onSelect:function(){
			$("#zt").val($(this).combobox("getValue"));
		}
	});
}

function initSHDWDialog(){
	dialogTop+=260;
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
	shdwChooseLB=$("#shdw_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectSHDWDialog(1);
		}
	});
	
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
            {field:"bjsj",title:"编辑时间",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"editSHDWTabRow()\">编辑</a>"
            	+"&nbsp;|&nbsp;<a onclick=\"deleteSHDWTabRow()\">删除</a>";
            	//var str="<a onclick=\"deleteSHDWTabRow()\">删除</a>";
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
	if(rowsLength>0)
		shdwChooseLB.linkbutton("disable");
	else
		shdwChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	shdwTab.datagrid('loadData',obj);
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
	if(checkMC()){
		if(checkDM()){
			editCangKu();
		}
	}
}

function editCangKu(){
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:path+"main/editCangKu",
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

function focusMC(){
	var mc = $("#edit_div #mc").val();
	if(mc=="名称不能为空"){
		$("#edit_div #mc").val("");
		$("#edit_div #mc").css("color", "#555555");
	}
}

//验证名称
function checkMC(){
	var mc = $("#edit_div #mc").val();
	if(mc==null||mc==""||mc=="名称不能为空"){
		$("#edit_div #mc").css("color","#E15748");
    	$("#edit_div #mc").val("名称不能为空");
    	return false;
	}
	else
		return true;
}

function focusDM(){
	var dm = $("#edit_div #dm").val();
	if(wz=="代码不能为空"){
		$("#edit_div #dm").val("");
		$("#edit_div #dm").css("color", "#555555");
	}
}

//验证代码
function checkDM(){
	var dm = $("#edit_div #dm").val();
	if(dm==null||dm==""||dm=="代码不能为空"){
		$("#edit_div #dm").css("color","#E15748");
    	$("#edit_div #dm").val("代码不能为空");
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

function initWindowMarginLeft(){
	var editDivWidth=$("#yss_div").css("width");
	editDivWidth=editDivWidth.substring(0,editDivWidth.length-2);
	var pwWidth=$(".panel.window").css("width");
	pwWidth=pwWidth.substring(0,pwWidth.length-2);
	return ((editDivWidth-pwWidth)/2)+"px";
}
</script>
<title>修改</title>
</head>
<body>
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">队列管理-修改</div>
	
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.dl.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				名称
			</td>
			<td style="width:30%;">
				<input type="text" id="mc" name="mc" value="${requestScope.dl.mc }" placeholder="请输入名称" style="width: 150px;height:30px;" onfocus="focusMC()" onblur="checkMC()"/>
			</td>
			<td align="right" style="width:15%;">
				代码
			</td>
			<td style="width:30%;">
				<input type="text" id="dm" name="dm" value="${requestScope.dl.dm }" placeholder="请输入代码" style="width: 150px;height:30px;" onfocus="focusDM()" onblur="checkDM()"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				叫号阈值
			</td>
			<td>
				<input type="number" id="jhyz" name="jhyz" value="${requestScope.dl.jhyz }" placeholder="请输入叫号阈值" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				叫号形式
			</td>
			<td>
				<input id="jhxs_cbb"/>
				<input type="hidden" id="jhxs" name="jhxs" value="${requestScope.dl.jhxs }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				状态
			</td>
			<td>
				<input id="zt_cbb"/>
				<input type="hidden" id="zt" name="zt" value="${requestScope.dl.zt }"/>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</form>
	</div>
	
	<div id="shdw_div">
		<div id="shdw_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="shdw_tab"></table>
	</div>
</div>
</body>
</html>