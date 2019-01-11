<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>颜色</title>
</head>
<body>
	<%
		String color = request.getParameter("color");
		System.out.print(color);
	%>
	你喜欢的是<%=color%>
</body>
</html>					