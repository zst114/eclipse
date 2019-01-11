<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加cookie</title>
</head>
<body>
	<%
		response.addCookie(new Cookie("name", "jack"));
		response.addCookie(new Cookie("pwd", "123"));
		response.sendRedirect("showInfo.jsp");
	%>
</body>
</html>