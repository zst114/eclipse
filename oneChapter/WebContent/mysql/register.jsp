<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%	
	request.setCharacterEncoding("utf-8");
	String message = (String)request.getAttribute("message");
%>
<meta charset="utf-8">
<title>用户注册</title>
</head>
<body>
	<div id="mess" style="color:red;">
		<%=message != null && !message.equals("")? message : "" %>
	</div>                                
	<div align="center">
		请输入注册信息
		<form name="form1" method="post" action="registercontrol.jsp">
			<table>
				<tr>
					<td>用户名:</td>
						<!-- value=如果第一次登录，value显示null,如果提交了一次，显示上一次输入的String -->
					<td><input type="text" name="userName" 
						value='<%=request.getParameter("userName") == null ? "" : request.getParameter("userName") %>'>
					</td>
				</tr>
				<tr>
					<td>请输入登录密码:</td>
					<td><input type="password" name="pwd"
						value='<%=request.getParameter("pwd") == null ? "":request.getParameter("pwd")%>'></td>
						
				</tr>
				<tr>
					<td>请再次输入码:</td>
					<td><input type="password" name="validatepwd"
						value='<%=request.getParameter("validatepwd") == null ? "" : request.getParameter("validatepwd")%>'></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="注册"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>