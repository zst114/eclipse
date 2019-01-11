<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>测试JNDI</title>
</head>
<body>  
	<%
		//java.naming.Context提供了查找JNDI Resource的接口
		Context ctx = new InitialContext();
		//java:comp/env/
		System.out.print("test jndi:");
		String testjndi = (String) ctx.lookup("java:comp/env/tjndi");
		System.out.print(testjndi);
		out.print("test jndi:" + testjndi);
	%>
</body>
</html>