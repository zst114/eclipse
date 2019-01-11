<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>显示注册信息</title>
</head>
<body>
	<%
		String username = (String) session.getAttribute("name");
		System.out.println("username=" + username);
		String userpassword = (String) session.getAttribute("password");
		System.out.println("userpassword=" + userpassword);
		String[] userchannels = (String[]) session.getAttribute("channels");
		
		if (username == null || userpassword == null) {
			response.sendRedirect("reginput.jsp");
		}
	%>
	<div align="center">
		你输入的注册信息
		<table>
			<tr>
				<td width="80" height="20">用户名：</td>
				<td><%=username%></td>
			</tr>
			<tr>
				<td width="80" height="20">密码：</td>
				<td><%=userpassword%></td>
			</tr>
			<tr>
				<td height="20">信息来源</td>
				<td>
					<%
						if(userchannels != null) {
							for (String channel : userchannels) {
								out.print(channel + "&nbsp;");
							}
						}else{
							out.print("您未选择任何推荐来源");
						}
					%>
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>