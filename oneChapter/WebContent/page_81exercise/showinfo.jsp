<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showInfo</title>
</head>
<body>
	<%
		//request.setCharacterEncoding（）：是设置从request中取得的值或从数据库中取出的值,默认是ISO....。
		//response.setCharacterEncoding(“UTF-8”)的作用是指定服务器响应给浏览器的编码。
		//response.setContentType(“text/html;charset=utf-8”)
		//的作用是指定服务器响应给浏览器的编码。同时，浏览器也是根据这个参数来对其接收到的数据进行重新编码（或者称为解码）。
			
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		// 得到所有的Cookie
		Cookie cookies[] = request.getCookies();
		// 如果是上一步提交过来的，则更新Cookie的值
		if(name == null && cookies == null) {
			System.out.println("你还没登录");
			response.sendRedirect("login.jsp");
		}else if(name != null) {
			Cookie c = new Cookie("name", name);
			System.out.println("添加cookie");
			c.setMaxAge(30); // Cookie 的有效期为 30 秒
			System.out.println("setCookieTime");
			response.addCookie(c);
			System.out.println("addCookie");
			//如果是两个页面之间的跳转的话， 一定要有下面一句（就是再次跳转到本页面，才能让cookie保存成功）
			response.sendRedirect("showinfo.jsp");
		}
		if(cookies != null) {
			System.out.println("cookies != null");
			// 如果已经设置了cookie ， 则得到它的值，并保存到变量pName中
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("name")){
					name = cookies[i].getValue();
					System.out.println("name = cookies[i].getValue();");
					out.print("欢迎你：" + name);
				}
			}
		}
	%>
</body>
</html>