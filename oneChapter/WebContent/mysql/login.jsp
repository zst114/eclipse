<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String message = (String) request.getAttribute("message");
	%>
	<div id="mes">
		<%=message != null && !message.equals("") ? message : "" %>
	</div> 
	<form action="logincontrol.jsp" method="post" name="form1">
		用户名:<input type="text" name="userName1">
		密码:<input type="password" name="pwd1">
		<input type="submit" value="登录">
	</form>
</body>
</html>