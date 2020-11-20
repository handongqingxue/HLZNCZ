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
var ddNum=0;
var glyhdNum=1;
var sglyhdNum=2;
$(function(){
	initDetailDialog();//0

	initGLYHDialog();//1.关联用户窗口
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	//关联用户
	var glyhdpw=$("body").find(".panel.window").eq(glyhdNum);
	var glyhdws=$("body").find(".window-shadow").eq(glyhdNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);

	ccDiv.append(glyhdpw);
	ccDiv.append(glyhdws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body","detail_div"),
		height:330,
		top:dialogTop,
		left:dialogLeft,
	});

	$("#detail_div table").css("width",(setFitWidthInParent("body","detail_div_table"))+"px");
	$("#detail_div table").css("magin","-100px");
	$("#detail_div table td").css("padding-left","50px");
	$("#detail_div table td").css("padding-right","20px");
	$("#detail_div table td").css("font-size","15px");
	$("#detail_div table tr").css("height","45px");

	$(".panel.window").eq(ddNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(ddNum).css("color","#000");
	$(".panel.window .panel-title").eq(ddNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ddNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ddNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ddNum).css("border-color","#ddd");
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
	glyhTab=$("#glyh_tab").datagrid({
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
				switch (value) {
				case "1":
					str="新增";
					break;
				case "2":
					str="正常使用";
					break;
				case "3":
					str="废弃";
					break;
				case "4":
					str="有误";
					break;
				}
				return str;
			}},
            {field:"tx",title:"头像",width:200,align:"center"},
            {field:"nc",title:"昵称",width:200,align:"center"},
            {field:"yhm",title:"用户名",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="";
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

function loadGLYHTabData(rows){
	var rowsLength=rows.length;
	var obj = {"total":rowsLength,"rows":rows};
	glyhTab.datagrid('loadData',obj);
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "detail_div":
		space=340;
		break;
	case "detail_div_table":
	case "panel_window":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
<title>详情</title>
</head>
<body>
<%@include file="../../../inc/nav.jsp"%>
<div class="center_con_div" id="center_con_div">
	<div class="page_location_div">综合管理-详情</div>
	
	<div id="detail_div">
		<input type="hidden" id="id" name="id" value="${requestScope.sj.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				姓名
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.xm }</span>
			</td>
			<td align="right" style="width:15%;">
				手机号
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.sjh }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				照片
			</td>
			<td>
				<span>${requestScope.sj.zp }</span>
			</td>
			<td align="right">
				身份证
			</td>
			<td>
				<span>${requestScope.sj.sfz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				资格证有效期至
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.zgzyxqz }</span>
			</td>
			<td align="right" style="width:15%;">
				驾证有效期至
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.jzyxqz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				资格证书
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.zgzs }</span>
			</td>
			<td align="right" style="width:15%;">
				驾证
			</td>
			<td style="width:30%;">
				<span>${requestScope.sj.jz }</span>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				在用状态
			</td>
			<td style="width:30%;">
				<span>
				<c:choose>
					<c:when test="${requestScope.sj.zyzt }">
						是
					</c:when>
					<c:otherwise>
						否
					</c:otherwise>
				</c:choose>
				</span>
			</td>
			<td align="right" style="width:15%;">
				审核状态
			</td>
			<td style="width:30%;">
				<span>
				<c:if test="${requestScope.sj.shzt eq 1 }">
					编辑中
				</c:if>
				<c:if test="${requestScope.sj.shzt eq 2 }">
					待审核
				</c:if>
				<c:if test="${requestScope.sj.shzt eq 3 }">
					审核通过
				</c:if>
				</span>
			</td>
		  </tr>
		</table>
	</div>
	
	<div id="glyh_div">
		<table id="glyh_tab"></table>
	</div>
</div>
</body>
</html>