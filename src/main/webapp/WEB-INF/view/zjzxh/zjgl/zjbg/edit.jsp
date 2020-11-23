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

.detail_gldd_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.detail_gldd_div{
	width: 1000px;
	height: 550px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.detail_gldd_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.detail_gldd_div .xgst_span{
	margin-left: 30px;
}
.detail_gldd_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.detail_gldd_dialog_div{
	width: 1000px;
	height: 500px;
	overflow-y: scroll;
	position: absolute;
}
.detail_gldd_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.detail_gldd_div .title_span{
	margin-left: 30px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var showZIndex=9999;
var edNum=0;
var gldddNum=1;
var dglddjbsxzdNum=2;
$(function(){
	initEditDialog();//0

	initGLDDDialog();//1.关联订单窗口
	initDetailGLDDJBSXZDialog();//2.关联订单详情窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//新字段组
	var edpw=$("body").find(".panel.window").eq(edNum);
	var edws=$("body").find(".window-shadow").eq(edNum);

	//关联订单
	var gldddpw=$("body").find(".panel.window").eq(gldddNum);
	var gldddws=$("body").find(".window-shadow").eq(gldddNum);

	//查看关联订单
	var dglddjbsxdpw=$("body").find(".panel.window").eq(dglddjbsxzdNum);
	var dglddjbsxdws=$("body").find(".window-shadow").eq(dglddjbsxzdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(edpw);
	ccDiv.append(edws);

	ccDiv.append(gldddpw);
	ccDiv.append(gldddws);

	var dgldddDiv=$("#detail_gldd_dialog_div");
	dgldddDiv.append(dglddjbsxdpw);
	dgldddDiv.append(dglddjbsxdws);
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"基本信息",
		width:setFitWidthInParent("body","edit_div"),
		height:200,
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

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").eq(edNum).css("color","#000");
	$(".panel.window .panel-title").eq(edNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(edNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","45%");
	$("#edit_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initZXZTCBB();
	initJLCBB();
}

function initZXZTCBB(){
	var data=[];
	data.push({"value":"","text":"无需输入"});
	$.post(path+"main/queryDingDanZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			zxztCBB=$("#zxzt_cbb").combobox({
				valueField:"value",
				textField:"text",
				disabled:true,
				data:data,
				onLoadSuccess:function(){
					$(this).combobox("setValue",'${requestScope.gldd.ddztId }');
				}
			});
		}
	,"json");
}

function initJLCBB(){
	jlCBB=$("#jl_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择结论"},{"value":"1","text":"合格"},{"value":"2","text":"不合格"}
		],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.zjbg.jl }');
		},
		onSelect:function(){
			$("#lxlx").val($(this).combobox("getValue"));
		}
	});
}

function initGLDDDialog(){
	dialogTop+=230;//230
	glddDialog=$("#gldd_div").dialog({
		title:"关联订单",
		width:setFitWidthInParent("body","gldd_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:200,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(gldddNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(gldddNum).css("margin-top","20px");
	$(".panel.window").eq(gldddNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(gldddNum).css("color","#000");
	$(".panel.window .panel-title").eq(gldddNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(gldddNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(gldddNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(gldddNum).css("width","1000px");
	$(".window-shadow").eq(gldddNum).css("margin-top","20px");
	
	$(".window,.window .window-body").eq(gldddNum).css("border-color","#ddd");

	initGLDDTab();
}

function initGLDDTab(){
	glddTab=$("#gldd_tab").datagrid({
		width:setFitWidthInParent("body","gldd_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="关联订单";
					break;
				}
				return str;
			}},
            {field:"cph",title:"车牌号",width:200,align:"center"},
            {field:"yzxzl",title:"预装卸重量",width:200,align:"center"},
            {field:"lxlx",title:"流向类型",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="送运";
					break;
				case "2":
					str="取运";
					break;
				}
				return str;
			}},
            {field:"zlceb",title:"重量差额比",width:200,align:"center"},
            {field:"zxztmc",title:"执行状态",width:200,align:"center"},
            {field:"bjsj",title:"编辑时间",width:200,align:"center"},
			{field:"wybm",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"showGLDDDetail()\">详情</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{gx:"<div style=\"text-align:center;\">暂无数据<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"gx",colspan:8});
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
	if('${requestScope.gldd}'==""){
		rows=[];
	}
	else{
		var ddh='${requestScope.gldd.ddh}';
		var cph='${requestScope.gldd.cph}';
		var yzxzl='${requestScope.gldd.yzxzl}';
		var lxlx='${requestScope.gldd.lxlx}';
		var sjzl='${requestScope.gldd.sjzl}';
		var zlceb='${requestScope.gldd.zlceb}';
		var zxztmc='${requestScope.gldd.ddztmc}';
		var bjsj='${requestScope.gldd.bjsj}';
		var jhysrq='${requestScope.gldd.jhysrq}';
		var crksj='${requestScope.gldd.crksj}';
		var ewm='${requestScope.gldd.ewm}';
		var wybm='${requestScope.gldd.wybm}';
		rows=[{gx:"1",ddh:ddh,cph:cph,yzxzl:yzxzl,lxlx:lxlx,sjzl:sjzl,zlceb:zlceb,zxztmc:zxztmc,bjsj:bjsj,jhysrq:jhysrq,crksj:crksj,ewm:ewm,wybm:wybm}];
	}
	loadGLDDTabData(rows);
}

function initDetailGLDDJBSXZDialog(){
	detailYSSDialog=$("#detail_gldd_jbsxz_dialog_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("#detail_gldd_div","detail_gldd_jbsxz_dialog_div"),
		height:410,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDetailGLDDDialog(0);
           }},
           {text:"确定",id:"ok_but",iconCls:"icon-ok",handler:function(){
        	   openDetailGLDDDialog(0);
           }}
        ]
	});

	$("#detail_gldd_jbsxz_dialog_div table").css("width",(setFitWidthInParent("#detail_gldd_div","detail_gldd_jbsxz_dialog_div"))+"px");
	$("#detail_gldd_jbsxz_dialog_div table").css("magin","-100px");
	$("#detail_gldd_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#detail_gldd_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#detail_gldd_jbsxz_dialog_div table td").css("font-size","15px");
	$("#detail_gldd_jbsxz_dialog_div table tr").css("height","45px");

	$(".panel.window").eq(dglddjbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dglddjbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dglddjbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dglddjbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dglddjbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#detail_gldd_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#detail_gldd_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#detail_gldd_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#detail_gldd_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDetailGLDDDialog(0);
}

function loadGLDDTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	glddTab.datagrid('loadData',obj);
}

function showGLDDDetail(){
	var row=glddTab.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要编辑的信息！","warning");
		return false;
	}
	$("#detail_gldd_div #wybm").val(row.wybm);
	$("#detail_gldd_div #ddh").text(row.ddh);
	$("#detail_gldd_div #yzxzl").text(row.yzxzl);
	var lxlxStr;
	switch (row.lxlx) {
	case "1":
		lxlxStr="送运";
		break;
	case "2":
		lxlxStr="取运";
		break;
	}
	$("#detail_gldd_div #lxlx").text(lxlxStr);
	$("#detail_gldd_div #bjsj").text(row.bjsj);
	$("#detail_gldd_div #zxzt").text(row.zxztmc);
	$("#detail_gldd_div #rkzt").text(row.rkzt);
	$("#detail_gldd_div #sjzl").text(row.sjzl);
	$("#detail_gldd_div #zlceb").text(row.zlceb);
	$("#detail_gldd_div #jhysrq").text(row.jhysrq);
	$("#detail_gldd_div #crksj").text(row.crksj);
	$("#detail_gldd_div #ewm").text(row.ewm);
	openDetailGLDDDialog(1);
}

function openDetailGLDDDialog(flag){
	if(flag==1){
		$("#detail_gldd_bg_div").css("display","block");
		$("#detail_gldd_bg_div").css("z-index",showZIndex);
	}
	else{
		$("#detail_gldd_bg_div").css("display","none");
		$("#detail_gldd_bg_div").css("z-index","9016");
	}
	openDetailGLDDJBSXZDialog(flag);
}

function openDetailGLDDJBSXZDialog(flag){
	if(flag==1){
		detailYSSDialog.dialog("open");
	}
	else{
		detailYSSDialog.dialog("close");
	}
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "edit_div":
	case "gldd_div":
	case "select_gldd_tab":
		space=340;
		break;
	case "edit_div_table":
	case "panel_window":
	case "gldd_tab":
	case "panel_window":
		space=355;
		break;
	case "select_gldd_dialog_div":
	case "detail_gldd_jbsxz_dialog_div":
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

<!-- 查看关联订单 start -->
<div class="detail_gldd_bg_div" id="detail_gldd_bg_div">
	<div class="detail_gldd_div" id="detail_gldd_div">
		<div class="xgst_div">
			<span class="xgst_span">查看实体</span>
			<span class="close_span" onclick="openDetailGLDDDialog(0)">X</span>
		</div>
		<div class="detail_gldd_dialog_div" id="detail_gldd_dialog_div">
			<div class="title_div">
				<span class="title_span">质检报告-关联订单-查看</span>
			</div>
			<div id="detail_gldd_jbsxz_dialog_div">
				<input type="hidden" id="wybm"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						订单号
					</td>
					<td style="width:30%;">
						<span id="ddh"></span>
					</td>
					<td align="right" style="width:15%;">
						预装卸重量
					</td>
					<td style="width:30%;">
						<span id="yzxzl"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						流向类型
					</td>
					<td style="width:30%;">
						<span id="lxlx"></span>
					</td>
					<td align="right" style="width:15%;">
						编辑时间
					</td>
					<td style="width:30%;">
						<span id="bjsj"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						执行状态
					</td>
					<td style="width:30%;">
						<span id="zxzt"></span>
					</td>
					<td align="right" style="width:15%;">
						入库状态
					</td>
					<td style="width:30%;">
						<span id="rkzt"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						实际重量
					</td>
					<td style="width:30%;">
						<span id="sjzl"></span>
					</td>
					<td align="right" style="width:15%;">
						重量差额比
					</td>
					<td style="width:30%;">
						<span id="zlceb"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						计划运输日期
					</td>
					<td style="width:30%;">
						<span id="jhysrq"></span>
					</td>
					<td align="right" style="width:15%;">
						出入库时间
					</td>
					<td style="width:30%;">
						<span id="crksj"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						二维码
					</td>
					<td style="width:30%;">
						<span id="ewm"></span>
					</td>
					<td align="right" style="width:15%;">
						
					</td>
					<td style="width:30%;">
						
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!--查看关联订单 end -->

<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">质检报告-修改</div>

	<div id="edit_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				订单号
			</td>
			<td style="width:30%;">
				<input type="text" id="ddh" placeholder="无需输入" disabled="disabled" style="width: 180px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				执行状态
			</td>
			<td style="width:30%;">
				<input id="zxzt_cbb"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				结论
			</td>
			<td style="width:30%;">
				<input id="jl_cbb"/>
				<input type="hidden" id="lxlx" name="lxlx"/>
			</td>
			<td align="right" style="width:15%;">
			
			</td>
			<td style="width:30%;">
			
			</td>
		  </tr>
	    </table>
	 </form>
	 </div>
	 
	<div id="gldd_div">
		<table id="gldd_tab"></table>
	</div>
</div>
</body>
</html>