<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//此句代码可以让，传过来的数据转换为UTF-8，设置此代码会有乱码产生
		//request.setCharacterEncoding（）：是设置从request中取得的值或从数据库中取出的值,默认是ISO....。
		
		//response.setCharacterEncoding(“UTF-8”)的作用是指定服务器响应给浏览器的编码。

		//response.setContentType(“text/html;charset=utf-8”)
		//的作用是指定服务器响应给浏览器的编码。同时，浏览器也是根据这个参数来对其接收到的数据进行重新编码（或者称为解码）。
		
		request.setCharacterEncoding("UTF-8");
		//response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name").trim();
		String password = request.getParameter("password").trim();
		String[] channels = request.getParameterValues("channel");
		boolean valid = false;
		if ("admin".equals(name) && "admin".equals(password)) {
			valid = true;
			session.setAttribute("name", name);
			session.setAttribute("password", password);
			session.setAttribute("channels", channels);
			session.setMaxInactiveInterval(10 * 5);
		}

		if (valid) {
			response.sendRedirect("reginfo.jsp");
		} else {
			out.print("抱歉,用户或密码不是admin");
		}
	%>
</body>
</html>