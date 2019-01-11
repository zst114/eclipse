<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>control</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		if (name != null && name != "" && password != null && password != "") {
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		} else {
			out.print("抱歉，用户名或密码不能为空");
		}
	%>


</body>
</html>