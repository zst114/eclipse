<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receptionCookie</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		String name = "";
		String pwd = "";
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("name")) {
					name = cookies[i].getValue();
				}else if(cookies[i].getName().equals("pwd")) {
					pwd = cookies[i].getValue();
				}
			}
		}
		System.out.println("name=" + name);
		System.out.println("pwd=" + pwd);
		out.println("name=" + name);
		out.println("pwd=" + pwd);
	%>
</body>
</html>