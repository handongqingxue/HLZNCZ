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
var jhxtPath=path+'jhxt/';
var xtglPath=path+'xtgl/';
var jcxxPath=path+'jcxx/';
var ddglPath=path+'ddgl/';
var dialogTop=10;
var dialogLeft=20;
var ndNum=0;
var sssjdNum=1;//所属司机
$(function(){
	initEditDialog();//0
	
	initSSSJDialog();//1.所属司机窗口
	
	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//新字段组
	var ndpw=$("body").find(".panel.window").eq(ndNum);
	var ndws=$("body").find(".window-shadow").eq(ndNum);
	
	//所属司机
	var sssjdpw=$("body").find(".panel.window").eq(sssjdNum);
	var sssjdws=$("body").find(".window-shadow").eq(sssjdNum);
	
	//选择所属司机
	//var ssssjdpw=$("body").find(".panel.window").eq(ssssjdNum);
	//var ssssjdws=$("body").find(".window-shadow").eq(ssssjdNum);
	
	//编辑所属司机
	//var esssjdpw=$("body").find(".panel.window").eq(esssjjbxxdNum);
	//var esssjdws=$("body").find(".window-shadow").eq(esssjjbxxdNum);
	//var ezjjsdpw=$("body").find(".panel.window").eq(esssjzjjsdNum);
	//var ezjjsdws=$("body").find(".window-shadow").eq(esssjzjjsdNum);
	
	//查看所属司机
	//var dsssjdpw=$("body").find(".panel.window").eq(dsssjjbxxdNum);
	//var dsssjdws=$("body").find(".window-shadow").eq(dsssjjbxxdNum);
	//var dzjjsdpw=$("body").find(".panel.window").eq(dsssjzjjsdNum);
	//var dzjjsdws=$("body").find(".window-shadow").eq(dsssjzjjsdNum);
	
	//所属队列
	//var ssdldpw=$("body").find(".panel.window").eq(ssdldNum);
	//var ssdldws=$("body").find(".window-shadow").eq(ssdldNum);
	
	//选择所属队列
	//var sssdldpw=$("body").find(".panel.window").eq(sssdldNum);
	//var sssdldws=$("body").find(".window-shadow").eq(sssdldNum);

	//查看所属队列
	//var dssdldpw=$("body").find(".panel.window").eq(dssdljbsxzNum);
	//var dssdldws=$("body").find(".window-shadow").eq(dssdljbsxzNum);
	//var dshdwdpw=$("body").find(".panel.window").eq(dssdlshdwdNum);
	//var dshdwdws=$("body").find(".window-shadow").eq(dssdlshdwdNum);

	//所属订单
	//var ssdddpw=$("body").find(".panel.window").eq(ssdddNum);
	//var ssdddws=$("body").find(".window-shadow").eq(ssdddNum);

	//选择所属订单
	//var sssdddpw=$("body").find(".panel.window").eq(sssdddNum);
	//var sssdddws=$("body").find(".window-shadow").eq(sssdddNum);

	//查看所属订单
	/*
	var dssdddpw=$("body").find(".panel.window").eq(dssddjbxxNum);
	var dssdddws=$("body").find(".window-shadow").eq(dssddjbxxNum);
	var dssddyssdpw=$("body").find(".panel.window").eq(dssddyssdNum);
	var dssddyssdws=$("body").find(".window-shadow").eq(dssddyssdNum);
	var dssddwlxxdpw=$("body").find(".panel.window").eq(dssddwlxxdNum);
	var dssddwlxxdws=$("body").find(".window-shadow").eq(dssddwlxxdNum);
	var dssddfhdwdpw=$("body").find(".panel.window").eq(dssddfhdwdNum);
	var dssddfhdwdws=$("body").find(".window-shadow").eq(dssddfhdwdNum);
	var dssddshdwdpw=$("body").find(".panel.window").eq(dssddshdwdNum);//收货单位
	var dssddshdwdws=$("body").find(".window-shadow").eq(dssddshdwdNum);//收货单位
	var dssddcycldpw=$("body").find(".panel.window").eq(dssddcycldNum);//承运车辆
	var dssddcycldws=$("body").find(".window-shadow").eq(dssddcycldNum);//承运车辆
	var dssddcysjdpw=$("body").find(".panel.window").eq(dssddcysjdNum);//承运司机
	var dssddcysjdws=$("body").find(".window-shadow").eq(dssddcysjdNum);//承运司机
	var dssddjybgdpw=$("body").find(".panel.window").eq(dssddjybgdNum);//检验报告
	var dssddjybgdws=$("body").find(".window-shadow").eq(dssddjybgdNum);//检验报告
	var dssddxdzxtzhdpw=$("body").find(".panel.window").eq(dssddxdzxtzhdNum);//下单者系统账户
	var dssddxdzxtzhdws=$("body").find(".window-shadow").eq(dssddxdzxtzhdNum);//下单者系统账户
	var dssddcysjxtzhdpw=$("body").find(".panel.window").eq(dssddcysjxtzhdNum);//承运司机系统账户
	var dssddcysjxtzhdws=$("body").find(".window-shadow").eq(dssddcysjxtzhdNum);//承运司机系统账户
	var dssddphxxdpw=$("body").find(".panel.window").eq(dssddphxxdNum);//排号信息
	var dssddphxxdws=$("body").find(".window-shadow").eq(dssddphxxdNum);//排号信息
	*/

	var ccDiv=$("#center_con_div");
	ccDiv.append(ndpw);
	ccDiv.append(ndws);
	
	ccDiv.append(sssjdpw);
	ccDiv.append(sssjdws);
	
	//ccDiv.append(ssdldpw);
	//ccDiv.append(ssdldws);

	//ccDiv.append(ssdddpw);
	//ccDiv.append(ssdddws);
	
	/*
	var ssssjDiv=$("#select_sssj_div");
	ssssjDiv.append(ssssjdpw);
	ssssjDiv.append(ssssjdws);
	
	var esdDiv=$("#edit_sssj_dialog_div");
	esdDiv.append(esssjdpw);
	esdDiv.append(esssjdws);
	
	esdDiv.append(ezjjsdpw);
	esdDiv.append(ezjjsdws);
	
	var dsssjdDiv=$("#detail_sssj_dialog_div");
	dsssjdDiv.append(dsssjdpw);
	dsssjdDiv.append(dsssjdws);
	
	dsssjdDiv.append(dzjjsdpw);
	dsssjdDiv.append(dzjjsdws);

	var sssdlDiv=$("#select_ssdl_div");
	sssdlDiv.append(sssdldpw);
	sssdlDiv.append(sssdldws);

	var dssdldDiv=$("#detail_ssdl_dialog_div");
	dssdldDiv.append(dssdldpw);
	dssdldDiv.append(dssdldws);
	
	dssdldDiv.append(dshdwdpw);
	dssdldDiv.append(dshdwdws);

	var sssddDiv=$("#select_ssdd_div");
	sssddDiv.append(sssdddpw);
	sssddDiv.append(sssdddws);
	
	var dssdddDiv=$("#detail_ssdd_dialog_div");
	dssdddDiv.append(dssdddpw);
	dssdddDiv.append(dssdddws);

	dssdddDiv.append(dssddyssdpw);
	dssdddDiv.append(dssddyssdws);
	
	dssdddDiv.append(dssddwlxxdpw);
	dssdddDiv.append(dssddwlxxdws);
	
	dssdddDiv.append(dssddfhdwdpw);
	dssdddDiv.append(dssddfhdwdws);

	dssdddDiv.append(dssddshdwdpw);
	dssdddDiv.append(dssddshdwdws);

	dssdddDiv.append(dssddcycldpw);
	dssdddDiv.append(dssddcycldws);

	dssdddDiv.append(dssddcysjdpw);
	dssdddDiv.append(dssddcysjdws);

	dssdddDiv.append(dssddjybgdpw);
	dssdddDiv.append(dssddjybgdws);

	dssdddDiv.append(dssddxdzxtzhdpw);
	dssdddDiv.append(dssddxdzxtzhdws);

	dssdddDiv.append(dssddcysjxtzhdpw);
	dssdddDiv.append(dssddcysjxtzhdws);

	dssdddDiv.append(dssddphxxdpw);
	dssdddDiv.append(dssddphxxdws);
	*/
	
}

function initEditDialog(){
	dialogTop+=20;
	$("#edit_div").dialog({
		title:"新字段组",
		width:setFitWidthInParent("body","edit_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft,
		buttons:[
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	   	checkNew();
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
	$(".panel.window .panel-title").eq(ndNum).css("color","#000");
	$(".panel.window .panel-title").eq(ndNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ndNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").eq(ndNum).css("border-color","#ddd");

	$("#edit_div #ok_but").css("left","45%");
	$("#edit_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");

	initPRSJDB();
	initEditDivZTCBB();
	initFLCBB();
	iniKSJHSJDB();
}

function initPRSJDB(){
	prsjDB=$('#prsj_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#edit_div #prsj").val(prsjDB.datebox("getValue"));
        }
    });
	prsjDB.datebox('textbox').attr('placeholder', '请选择排入时间');
	prsjDB.datebox("setValue",'${requestScope.hm.prsj }');
}

function initEditDivZTCBB(){
	var data=[];
	data.push({"value":"","text":"请选择状态"});
	$.post(path+"main/queryHaoMaZhuangTaiCBBList",
		function(result){
			var rows=result.rows;
			for(var i=0;i<rows.length;i++){
				data.push({"value":rows[i].id,"text":rows[i].mc});
			}
			ztCBB=$("#edit_div #zt_cbb").combobox({
				valueField:"value",
				textField:"text",
				//multiple:true,
				data:data,
				onLoadSuccess:function(){
					$(this).combobox("setValue",'${requestScope.hm.ztId }');
				}
			});
		}
	,"json");
}

function initFLCBB(){
	flCBB=$("#fl_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[
			{"value":"","text":"请选择分类"},{"value":"1","text":"普通"},{"value":"2","text":"其他"}
		],
		onLoadSuccess:function(){
			$(this).combobox("setValue",'${requestScope.hm.fl }');
		},
		onSelect:function(){
			$("#fl").val($(this).combobox("getValue"));
		}
	});
}

function iniKSJHSJDB(){
	ksjhsjDB=$('#ksjhsj_db').datebox({
		width:160,
        required:false,
        onSelect:function(){
        	$("#ksjhsj").val(ksjhsjDB.datebox("getValue"));
        }
    });
	ksjhsjDB.datebox('textbox').attr('placeholder', '请选择开始叫号时间');
	ksjhsjDB.datebox("setValue",'${requestScope.hm.ksjhsj }');
}

function initSSSJDialog(){
	dialogTop+=320;//330
	yssDialog=$("#sssj_div").dialog({
		title:"所属司机",
		width:setFitWidthInParent("body","sssj_div"),
		//height:setFitHeightInParent(".left_nav_div"),
		height:300,
		top:dialogTop,
		left:dialogLeft
	});
	
	$(".panel.window").eq(sssjdNum).css("width",(setFitWidthInParent("body","panel_window"))+"px");
	$(".panel.window").eq(sssjdNum).css("margin-top","20px");
	$(".panel.window").eq(sssjdNum).css("margin-left",initWindowMarginLeft());
	$(".panel.window").eq(sssjdNum).css("border-color","#ddd");
	$(".panel.window .panel-title").eq(sssjdNum).css("color","#000");
	$(".panel.window .panel-title").eq(sssjdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(sssjdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(sssjdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(sssjdNum).css("width","1000px");
	$(".window-shadow").eq(sssjdNum).css("margin-top","20px");
	$(".window-shadow").eq(sssjdNum).css("margin-left",initWindowMarginLeft());
	
	$(".window,.window .window-body").eq(sssjdNum).css("border-color","#ddd");

	initSSSJTab();
}

function initSSSJTab(){
	sssjChooseLB=$("#sssj_div #choose_but").linkbutton({
		iconCls:"icon-edit",
		onClick:function(){
			openSelectSSSJDialog(1);
		}
	});
	
	sssjTab=$("#sssj_tab").datagrid({
		toolbar:"#sssj_toolbar",
		width:setFitWidthInParent("body","sssj_tab"),
		singleSelect:true,
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"gx",title:"关系",width:200,align:"center",formatter:function(value,row){
				var str;
				switch (value) {
				case "1":
					str="所属司机";
					break;
				}
				return str;
			}},
            {field:"yhm",title:"用户名",width:200,align:"center"},
            {field:"nc",title:"昵称",width:200,align:"center"},
            {field:"sm",title:"实名",width:200,align:"center"},
			{field:"id",title:"操作",width:200,align:"center",formatter:function(value,row){
            	var str="<a onclick=\"deleteSSSJTabRow()\">删除</a>"
            		+"&nbsp;|&nbsp;<a onclick=\"editSSSJTabRow()\">编辑</a>"
            		+"&nbsp;|&nbsp;<a onclick=\"detailSSSJTabRow()\">查看</a>";
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
	//var obj = {"total":2,"rows":[{mc:"mc",bz:"一"},{mc:"2",bz:"二"}]};
	var rows;
	if('${requestScope.sssj}'==""){
		rows=[];
	}
	else{
		var yhm='${requestScope.sssj.yhm}';
		var nc='${requestScope.sssj.nc}';
		var sm='${requestScope.sssj.sm}';
		var id='${requestScope.yss.id}';
		rows=[{gx:"1",yhm:yhm,nc:nc,sm:sm,id:id}];
	}
	loadSSSJTabData(rows);
}

function loadSSSJTabData(rows){
	var rowsLength=rows.length;
	if(rowsLength>0)
		sssjChooseLB.linkbutton("disable");
	else
		sssjChooseLB.linkbutton("enable");
	var obj = {"total":rowsLength,"rows":rows};
	sssjTab.datagrid('loadData',obj);
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "edit_div":
	case "sssj_div":
	case "ssdl_div":
	case "select_sssj_tab":
	case "wlxx_div":
	case "select_wlxx_tab":
	case "edit_wlxx_div":
	case "fhdw_div":
	case "select_fhdw_tab":
	case "edit_fhdw_div":
	case "shdw_div":
	case "select_shdw_tab":
	case "edit_shdw_div":
	case "cycl_div":
	case "select_cycl_tab":
		space=340;
		break;
	case "edit_div_table":
	case "panel_window":
	case "sssj_tab":
	case "wlxx_tab":
	case "fhdw_tab":
		space=355;
		break;
	case "edit_sssj_jbxx_dialog_div":
	case "detail_sssj_jbxx_dialog_div":
	case "select_sssj_dialog_div":
	case "select_ssdl_dialog_div":
	case "detail_ssdl_jbsxz_dialog_div":
	case "select_ssdd_dialog_div":
	case "detail_ssdd_jbxx_dialog_div":
		space=50;
		break;
	case "edit_sssj_zjjs_dialog_div":
	case "detail_sssj_zjjs_dialog_div":
	case "detail_ssdl_shdw_dialog_div":
	case "detail_ssdd_yss_dialog_div":
	case "detail_ssdd_wlxx_dialog_div":
	case "detail_ssdd_fhdw_dialog_div":
	case "detail_ssdd_shdw_dialog_div":
	case "detail_ssdd_cycl_dialog_div":
	case "detail_ssdd_cysj_dialog_div":
	case "detail_ssdd_jybg_dialog_div":
	case "detail_ssdd_xdzxtzh_dialog_div":
	case "detail_ssdd_cysjxtzh_dialog_div":
	case "detail_ssdd_phxx_dialog_div":
		space=60;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}

function initWindowMarginLeft(){
	var editDivWidth=$("#sssj_div").css("width");
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
	<div class="page_location_div">号码查询-修改</div>
	
	<!-- 新字段组 start -->
	<div id="edit_div">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				号码
			</td>
			<td style="width:30%;">
				<input type="text" id="hm" name="hm" value="${requestScope.hm.hm }" placeholder="请输入号码" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				排入时间
			</td>
			<td style="width:30%;">
				<input id="prsj_db"/>
				<input type="hidden" id="prsj" name="prsj" value="${requestScope.hm.prsj }"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				排队号
			</td>
			<td>
				<input type="number" id="pdh" name="pdh" placeholder="请输入排队号" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				状态
			</td>
			<td>
				<input id="zt_cbb"/>
				<input type="hidden" id="ztId" name="ztId"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				分类
			</td>
			<td>
				<input id="fl_cbb"/>
				<input type="hidden" id="fl" name="fl"/>
			</td>
			<td align="right">
				二维码
			</td>
			<td>
				<input type="text" id="ewm" name="ewm" placeholder="请输入二维码" style="width: 150px;height:30px;"/>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				开始叫号时间
			</td>
			<td>
				<input id="ksjhsj_db"/>
				<input type="hidden" id="ksjhsj" name="ksjhsj"/>
			</td>
			<td align="right">
			</td>
			<td>
			</td>
		  </tr>
		</table>
	</form>
	</div>
	<!-- 新字段组 end -->
	
	<!-- 所属司机 start -->
	<div id="sssj_div">
		<div id="sssj_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="sssj_tab"></table>
	</div>
	<!-- 所属司机 end -->
	
	<!-- 所属队列 start -->
	<div id="ssdl_div">
		<div id="ssdl_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="ssdl_tab"></table>
	</div>
	<!-- 所属队列 end -->
	
	<!-- 所属订单 start -->
	<div id="ssdd_div">
		<div id="ssdd_toolbar" style="height:32px;line-height:32px;">
			<a id="choose_but" style="margin-left: 13px;">选择</a>
		</div>
		<table id="ssdd_tab"></table>
	</div>
	<!-- 所属订单 end -->
	
</div>
</body>
</html>