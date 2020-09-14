<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
.left_nav_div .item_div{
	width: 262px;height:40px;line-height:40px;font-size: 14px;color: rgb(163,173,180);padding-left:24px; background: #001529;margin-top: 3px;
}
</style>
</head>
<body>
<div>
	<div style="width: 288px;height:90px;line-height:90px;font-size: 20px;color: #fff;text-align: center;background: #002140;">智能称重</div>
	<div class="left_nav_div">
	<c:forEach items="${requestScope.leftNavList }" var="item">
		<a href=""><div class="item_div">${item.mc }</div></a>
	</c:forEach>
	</div>
</div>
</body>
</html>