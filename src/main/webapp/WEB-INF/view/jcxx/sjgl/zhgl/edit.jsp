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

.select_glyh_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.select_glyh_div{
	width: 1050px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
}
.select_glyh_div .xzst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.select_glyh_div .xzst_span{
	margin-left: 30px;
}
.select_glyh_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var jcxxPath=path+'jcxx/';
var xtglPath=path+'xtgl/';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var edNum=0;
var glyhdNum=1;
var sglyhdNum=2;
$(function(){
	initEditDialog();//0

	initGLYHDialog();//1.关联用户窗口
	initSelectGLYHDialog();//2.选择关联用户窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	//关联用户
	var glyhdpw=$("body").find(".panel.window").eq(glyhdNum);
	var glyhdws=$("body").find(".window-shadow").eq(glyhdNum);

	//选择关联用户
	var sglyhdpw=$("body").find(".panel.window").eq(sglyhdNum);
	var sglyhdws=$("body").find(".window-shadow").eq(sglyhdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);

	ccDiv.append(glyhdpw);
	ccDiv.append(glyhdws);

	var sglyhDiv=$("#select_glyh_div");
	sglyhDiv.append(sglyhdpw);
	sglyhDiv.append(sglyhdws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","edit_div"),
		height:330,
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
	
	initZGZYXQZDB();
	initJZYXQZDB();
	initZYZTCBB();
	initSHZTCBB();
}

function initZGZYXQZDB(){
	zgzyxqzDB=$('#zgzyxqz_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#zgzyxqz").val(zgzyxqzDB.datebox("getValue"));
        }
    });
	zgzyxqzDB.datebox('textbox').attr('placeholder', '请选择资格证有效期至');
	zgzyxqzDB.datebox("setValue",'${requestScope.sj.zgzyxqz }');
}

function initJZYXQZDB(){
	jzyxqzDB=$('#jzyxqz_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#jzyxqz").val(jzyxqzDB.datebox("getValue"));
        }
    });
	jzyxqzDB.datebox('textbox').attr('placeholder', '请选择驾证有效期至');
	jzyxqzDB.datebox("setValue",'${requestScope.sj.jzyxqz }');
}

function initZYZTCBB(){
	zyztCBB=$("#zyzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择在用状态"},{"value":"1","text":"是"},{"value":"0","text":"否"}
		],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.sj.zyzt }'=="true"?"1":"0");
		},
		onSelect:function(){
			$("#zyzt").val($(this).combobox("getValue"));
		}
	});
}

function initSHZTCBB(){
	shztCBB=$("#shzt_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择审核状态"},{"value":"1","text":"编辑中"},{"value":"2","text":"待审核"},{"value":"3","text":"审核通过"}],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.sj.shzt }');
		},
		onSelect:function(){
			$("#shzt").val($(this).combobox("getValue"));
		}
	});
}

function initGLYHDialog(){
	dialogTop+=360;//230
	glyhDialog=$("#glyh_div").dialog({
		title:"关联用户",
		width:setFitWidthInParent("body","glyh_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(glyhdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(glyhdNum).css("margin-top","20px");
	$(".panel.window").eq(glyhdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(glyhdNum).css("color","#000");
	$(".panel.window .panel-title").eq(glyhdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(glyhdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(glyhdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(glyhdNum).css("width","1000px");
	$(".window-shadow").eq(glyhdNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(glyhdNum).css("border-color","#ddd");

	initGLYHTab();
}

function initGLYHTab(){
	glyhChooseLB=$("#glyh_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectGLYHDialog(1);
		}
	});
	
	glyhTab=$("#glyh_tab").datagrid({
		toolbar:"#glyh_toolbar",
		width:setFitWidthInParent("body","glyh_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="关联用户";
					break;
				}
				return str;
			}},
            {field:"sm",title:"实名",width:200,align:"center"},
            {field:"zt",title:"状态",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (parseInt(value)) {
				case 1:
					str="新增";
					break;
				case 2:
					str="正常使用";
					break;
				case 3:
					str="废弃";
					break;
				case 4:
					str="有误";
					break;
				}
				return str;
			}},
            {field:"tx",title:"头像",width:200,align:"center"},
            {field:"nc",title:"昵称",width:200,align:"center"},
            {field:"yhm",title:"用户名",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"deleteGLYHTabRow()\">删除</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:7});
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
	if('${requestScope.glyh}'==""){
		rows=[];
	}
	else{
		var sm='${requestScope.glyh.sm}';
		var zt='${requestScope.glyh.zt}';
		var tx='${requestScope.glyh.tx}';
		var nc='${requestScope.glyh.nc}';
		var yhm='${requestScope.glyh.yhm}';
		var id='${requestScope.glyh.id}';
		rows=[{gx:"1",sm:sm,zt:zt,tx:tx,nc:nc,yhm:yhm,id:id}];
	}
	loadGLYHTabData(rows);
}

function initSelectGLYHDialog(){
	selectGLYHDialog=$("#select_glyh_dialog_div").dialog({
		title:"关联用户列表",
		width:setFitWidthInParent("#select_glyh_div","select_glyh_dialog_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:400,
		top:160,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openSelectGLYHDialog(0);
           }},
           {text:"保存",id:"save_but",iconCls:"icon-save",handler:function(){
        	   	saveSelectGLYH();
           }}
        ]
	});
	
	$(".panel.window").eq(sglyhdNum).css("width","983px");
	$(".panel.window").eq(sglyhdNum).css("margin-top","20px");
	$(".panel.window").eq(sglyhdNum).css("margin-left","25px");
	$(".panel.window").eq(sglyhdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sglyhdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sglyhdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sglyhdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sglyhdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sglyhdNum).css("width","1000px");
	$(".window-shadow").eq(sglyhdNum).css("margin-top","20px");
	$(".window-shadow").eq(sglyhdNum).css("margin-left","25px");
	
	$(".window,.window .window-body").eq(sglyhdNum).css("border-color","#ddd");

	$("#select_glyh_dialog_div #cancel_but").css("left","30%");
	$("#select_glyh_dialog_div #cancel_but").css("position","absolute");
	
	$("#select_glyh_dialog_div #save_but").css("left","45%");
	$("#select_glyh_dialog_div #save_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	
	initSelectGLYHTab();
	openSelectGLYHDialog(0);
}

function initSelectGLYHTab(){
	$("#select_glyh_toolbar #search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var mc=$("#select_glyh_toolbar #mc_inp").val();
			selectGLYHTab.datagrid("load",{mc:mc});
		}
	});
	
	selectGLYHTab=$("#select_glyh_tab").datagrid({
		url:xtglPath+"queryYongHuList",
		toolbar:"#select_glyh_toolbar",
		width:setFitWidthInParent("body","select_glyh_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		//queryParams:{accountId:'${sessionScope.user.id}'},
		columns:[[
			{field:"yhm",title:"用户名",width:200,align:"center"},
			{field:"nc",title:"昵称",width:200,align:"center"},
			{field:"sm",title:"实名",width:200,align:"center"},
			{field:"zt",title:"状态",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case 1:
					str="新增";
					break;
				case 2:
					str="正常使用";
					break;
				case 3:
					str="废弃";
					break;
				case 4:
					str="有误";
					break;
				}
				return str;
			}}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{yhm:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"yhm",colspan:4});
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

function loadGLYHTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		glyhChooseLB.linkbutton("disable");
	else
		glyhChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	glyhTab.datagrid('loadData',obj);
}

function saveSelectGLYH(){
	var row=selectGLYHTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要删除的信息！","warning");
		return false;
	}
	var rows=[{gx:"1",sm:row.sm,zt:row.zt,tx:row.tx,nc:row.nc,yhm:row.yhm,id:row.id}];
	loadGLYHTabData(rows);
	openSelectGLYHDialog(0);
}

function deleteGLYHTabRow(){
	glyhTab.datagrid("deleteRow",0);
	loadGLYHTabData([]);
}

function openSelectGLYHDialog(flag){
	if(flag==1){
		$("#select_glyh_bg_div").css("display","block");
		$("#select_glyh_bg_div").css("z-index",showZIndex);
		selectGLYHDialog.dialog("open");
	}
	else{
		$("#select_glyh_bg_div").css("display","none");
		$("#select_glyh_bg_div").css("z-index","9016");
		selectGLYHDialog.dialog("close");
	}
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
	if(checkXM()){
		if(checkSFZ()){
			if(checkSHZT()){
				if(checkZYZT()){
					editSiJi();
				}
			}
		}
	}
}

function editSiJi(){
	var glyhId=glyhTab.datagrid("getData").rows[0].id;
	$("#edit_div #glyhId").val(glyhId);
	
	var formData = new FormData($("#form1")[0]);
	$.ajax({
		type:"post",
		url:jcxxPath+"editSiJi",
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

function focusXM(){
	var xm = $("#xm").val();
	if(xm=="姓名不能为空"){
		$("#xm").val("");
		$("#xm").css("color", "#555555");
	}
}

//验证姓名
function checkXM(){
	var xm = $("#xm").val();
	if(xm==null||xm==""||xm=="姓名不能为空"){
		$("#xm").css("color","#E15748");
    	$("#xm").val("姓名不能为空");
    	return false;
	}
	else
		return true;
}

function focusSFZ(){
	var sfz = $("#sfz").val();
	if(sfz=="身份证不能为空"){
		$("#sfz").val("");
		$("#sfz").css("color", "#555555");
	}
}

//验证身份证
function checkSFZ(){
	var sfz = $("#sfz").val();
	if(sfz==null||sfz==""||sfz=="身份证不能为空"){
		$("#sfz").css("color","#E15748");
    	$("#sfz").val("身份证不能为空");
    	return false;
	}
	else
		return true;
}

//验证审核状态
function checkSHZT(){
	var shzt=shztCBB.combobox("getValue");
	if(shzt==null||shzt==""){
	  	alert("请选择审核状态");
	  	return false;
	}
	else
		return true;
}

//验证在用状态
function checkZYZT(){
	var zyzt=zyztCBB.combobox("getValue");
	if(zyzt==null||zyzt==""){
	  	alert("请选择在用状态");
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

<!-- 选择关联用户 start -->
<div class="select_glyh_bg_div" id="select_glyh_bg_div">
	<div class="select_glyh_div" id="select_glyh_div">
		<div class="xzst_div">
			<span class="xzst_span">选择实体</span>
			<span class="close_span" onclick="openSelectGLYHDialog(0)">X</span>
		</div>
		<div id="select_glyh_dialog_div">
			<div id="select_glyh_toolbar" style="height:32px;line-height:32px;">
				<span style="margin-left: 13px;">名称：</span>
				<input type="text" id="mc_inp" placeholder="请输入名称" style="width: 120px;height: 25px;"/>
				<a id="search_but" style="margin-left: 13px;">查询</a>
			</div>
			<table id="select_glyh_tab"></table>
		</div>
	</div>
</div>
<!-- 选择关联用户 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">综合管理-修改</div>
	
	<div id="edit_div">
	<form id="form1" name="form1" method="post" onsubmit="return checkEdit();" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${requestScope.sj.id }"/>
		<input type="hidden" id="glyhId" name="glyhId" value="${requestScope.sj.glyhId }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				姓名
			</td>
			<td style="width:30%;">
				<input type="text" id="xm" name="xm" value="${requestScope.sj.xm }" placeholder="请输入姓名" style="width: 150px;height:30px;" onfocus="focusXM()" onblur="checkXM()"/>
			</td>
			<td align="right" style="width:15%;">
				手机号
			</td>
			<td style="width:30%;">
				<input type="text" id="sjh" name="sjh" value="${requestScope.sj.sjh }" placeholder="请输入手机号" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				照片
			</td>
			<td>
				<input type="file" name="zp_file"/>
				<div>
					${requestScope.sj.zp }
				</div>
			</td>
			<td align="right">
				身份证
			</td>
			<td>
				<input type="text" id="sfz" name="sfz" value="${requestScope.sj.sfz }" placeholder="请输入身份证" style="width: 150px;height:30px;" onfocus="focusSFZ()" onblur="checkSFZ()"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				资格证有效期至
			</td>
			<td>
				<input id="zgzyxqz_db"/>
				<input type="hidden" id="zgzyxqz" name="zgzyxqz"/>
			</td>
			<td align="right">
				驾证有效期至
			</td>
			<td>
				<input id="jzyxqz_db"/>
				<input type="hidden" id="jzyxqz" name="jzyxqz" value="${requestScope.sj.jzyxqz }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				资格证书
			</td>
			<td>
				<input type="file" name="jz_file"/>
				<div>
					${requestScope.sj.zgzs }
				</div>
			</td>
			<td align="right">
				驾证
			</td>
			<td>
				<input type="file" name="jz_file"/>
				<div>
					${requestScope.sj.jz }
				</div>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				在用状态
			</td>
			<td>
				<input id="zyzt_cbb"/>
				<input type="hidden" id="zyzt" name="zyzt" value="${requestScope.sj.zyzt }"/>
			</td>
			<td align="right">
				审核状态
			</td>
			<td>
				<input id="shzt_cbb"/>
				<input type="hidden" id="shzt" name="shzt" value="${requestScope.sj.shzt }"/>
			</td>
		  </tr>
		</table>
	</form>
	</div>
	
	<div id="glyh_div">
		<div id="glyh_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="glyh_tab"></table>
	</div>
</div>
</body>
</html>