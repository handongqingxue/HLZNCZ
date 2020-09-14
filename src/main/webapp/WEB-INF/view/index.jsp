<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	resetNavLoc();
});

function resetNavLoc(){
	var fiml=0;
	$("#top_nav_div #first_item_div").each(function(i){
		if(i>=1){
			fiml+=110;
			$(this).css("margin-left",fiml+"px");
			var length=$("#top_nav_div .second_nav_div").eq(i-1).find(".second_item_div").length;
			if($("#top_nav_div .second_nav_div").eq(i-1).css("display")=="none"){
				$(this).css("margin-top","-50px");
			}
			else{
				$(this).css("margin-top","-"+(length*40+60)+"px");
			}
		}
	});

	var snml=20;
	$("#top_nav_div .second_nav_div").each(function(i){
		if(i>=1){
			snml+=110;
			$(this).css("margin-left",snml+"px");
		}
	});
}

function showSecondNav(snId){
	var display=$("#second_nav_div"+snId).css("display");
	if(display=="block"){
		$("#second_nav_div"+snId).css("display","none");
	}
	else{
		$("#second_nav_div"+snId).css("display","block");
	}
	resetNavLoc();
}
</script>
<title>Insert title here</title>
<style type="text/css">
body{
	margin: 0;
}
.left_nav_div{
	width: 286px;
	height:90vh;
	background: #001529;
	padding: 1px;
}
.left_nav_div a{
	text-decoration: none;
}
.left_nav_div .item_div{
	width: 262px;height:40px;line-height:40px;font-size: 14px;color: rgb(163,173,180);padding-left:24px; background: #001529;margin-top: 3px;
}
.top_nav_div{
	width: 100%;height: 50px;margin-left: 288px;margin-top: -100vh;font-size: 16px;background: #fff;border-bottom: 1px solid #40a9ff;
}
.top_nav_div .first_item_div{
	width: 110px;height: 50px;line-height: 50px;color: #1890ff;text-align:center;
}
.top_nav_div .second_nav_div{
	width: 90px;
	margin-top: 10px;
	margin-left:20px; 
	box-shadow: 0 2px 8px rgba(0,0,0,.15);
	-webkit-transform: translateZ(0);
	background-color: #fff;
	border-radius: 4px;
	display: none;
}
.top_nav_div .second_nav_div .second_item_div{
	width: 90px;height: 40px;line-height: 40px;font-size: 14px;color: rgba(0,0,0,.65);text-align:center;
}
</style>
</head>
<body>
<div>
	<div style="width: 288px;height:90px;line-height:90px;font-size: 20px;color: #fff;text-align: center;background: #002140;">智能称重</div>
	<div class="left_nav_div">
	<c:forEach items="${requestScope.leftNavList }" var="item">
		<a href="${item.lj }"><div class="item_div">${item.mc }</div></a>
	</c:forEach>
	</div>
	<div class="top_nav_div" id="top_nav_div">
	<c:forEach items="${requestScope.topNavList }" var="item">
		<div class="first_item_div" id="first_item_div" onclick="showSecondNav(${item.id })">${item.mc }</div>
		<div class="second_nav_div" id="second_nav_div${item.id }">
			<c:forEach items="${item.childList }" var="childItem">
			<div class="second_item_div">${childItem.mc }</div>
			</c:forEach>
		</div>
	</c:forEach>
		<!-- 
		<div class="first_item_div" style="margin-left: 110px;margin-top: -140px;">我的订单</div>
		<div class="second_nav_div" style="margin-left: 130px;">
			<div class="second_item_div">我要下单</div>
			<div class="second_item_div">aaa</div>
		</div>
		 -->
	</div>
</div>
</body>
</html>