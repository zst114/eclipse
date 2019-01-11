<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="org.news.dao.*,org.news.entity.NewsUser,org.news.daoimpl.NewsUserImpl" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录Control</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String uName = request.getParameter("userName1");
		String uPwd = request.getParameter("pwd1");
 		NewsUser newsUser = new NewsUser(uName, uPwd);
 		System.out.println("成功添加到newsuser中");
 		boolean fals = new NewsUserImpl().judgeUser(newsUser);
 		if(fals) {
 			out.println("<script type='text/javascript'>alert('输入正确！登录成功。');location.href='admin.jsp';</script");
 		}else {
	 		request.setAttribute("message", "抱歉用户式密码不正确，请重新输入");
			request.getRequestDispatcher("login.jsp").forward(request, response);
 		}
	%>
</body>
</html>