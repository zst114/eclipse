<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="org.apache.commons.fileupload.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
</head>
<body>
	<form action="doupload.jsp" enctype="multipart/form-data" method="post">
		姓名：<input name="user"><br>
		<input type="file" name="nfile"><br>
		<input type="submit" value="提交"><br>
	</form>
</body>
</html>