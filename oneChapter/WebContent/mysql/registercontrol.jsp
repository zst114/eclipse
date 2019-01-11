<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.news.daoimpl.*"%>
<%@page import="org.news.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册处理页面</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("userName");
		System.out.println("name是 ：" + name);
		String pwd = request.getParameter("pwd");
		System.out.println("pwd是：" + pwd);
		String validatepwd = request.getParameter("validatepwd");
		if (name == null || name.equals("")) {
			request.setAttribute("message", "用户名不能为空");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else if (name.indexOf(" ") != -1) {
			request.setAttribute("message", "用户名不能包含空格");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else if (pwd == null || pwd.equals("")) {
			request.setAttribute("message", "用户密码不能为空");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else if (pwd.indexOf(" ") != -1) {
			request.setAttribute("message", "用户密码不能包含空格");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else if (!pwd.equals(validatepwd)) {
			request.setAttribute("message", "两次密码不一致，请检查");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}else{
			NewsUser newsUser = new NewsUser(name, pwd);
			int result = new NewsUserImpl().insert(newsUser);
			if (result > 0) {
				out.println("<script type='text/javascript'>" + "alert('注册成功！马上登录。');"
						+ "</script>");
				response.sendRedirect("login.jsp");
			} else {
				request.setAttribute("message", "抱歉，注册失败，请重新注册");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		}
	%>
</body>
</html>