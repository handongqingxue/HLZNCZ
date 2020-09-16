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
	$("#edit_div").dialog({
		title:"基本属性组",
		width:setFitWidthInParent("body"),
		height:231,
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
	$("#edit_div table tr").eq(0).css("height","90px");
	$("#edit_div table tr").eq(1).css("height","45px");

	$(".panel.window").css("margin-top","20px");
	$(".panel.window .panel-title").css("color","#000");
	$(".panel.window .panel-title").css("font-size","15px");
	$(".panel.window .panel-title").css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").css("margin-top","20px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#ok_but").css("left","45%");
	$("#ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
});

function checkEdit(){
	/*
	if(checkLabel()){
		if(checkModule()){
			if(checkIsShow()){
				if(checkIsPublic()){
					if(checkIsCheck()){
						if(checkSort()){
							*/
							editWuZiLeiXing();
							/*
						}
					}
				}
			}
		}
	}
	*/
}

function editWuZiLeiXing(){
	var id=$("#id").val();
	var mc=$("#mc").val();
	var bz=$("#bz").val();
	var px=$("#px").val();
	
	$.post(path+"main/editWuZiLeiXing",
		{id:id,mc:mc,bz:bz,px:px},
		function(data){
			if(data.message=="ok"){
				alert(data.info);
				history.go(-1);
			}
			else{
				alert(data.info);
			}
		}
	,"json");
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
		<input type="hidden" id="id" name="id" value="${requestScope.wzlx.id }"/>
		<table>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right" style="width:15%;">
				名称
			</td>
			<td style="width:30%;">
				<input type="text" id="mc" value="${requestScope.wzlx.mc }" style="width: 150px;height:30px;"/>
			</td>
			<td align="right" style="width:15%;">
				备注
			</td>
			<td style="width:30%;">
				<textarea id="bz" rows="3" cols="30">${requestScope.wzlx.bz }</textarea>
			</td>
		  </tr>
		  <tr style="border-bottom: #CAD9EA solid 1px;">
			<td align="right">
				排序
			</td>
			<td>
				<input type="number" id="px" value="${requestScope.wzlx.px }" style="width: 150px;height:30px;"/>
			</td>
			<td align="right">
				编辑时间
			</td>
			<td>
				${requestScope.wzlx.bjsj }
			</td>
		  </tr>
		</table>
	</div>
</div>
</body>
</html>