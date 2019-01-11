<%@page import="java.util.Arrays"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.*"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
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
		//jsp到servlet编码处理
		request.setCharacterEncoding("utf-8");
		//servlet到jsp编码处理
		response.setCharacterEncoding("utf-8");
		//数据显示时的编码
		response.setContentType("text/html; charset=UTF-8");
		String uploadFileName = ""; //上传的文件名
		String fieldName = ""; //表单字段元素name属性值
		//请求信息中的内容是否是multipart类型
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		//上传文件的存储路径（服务器文件系统上的绝对文件路径 ||磁盘上的绝对路径）
		//注意，如果修改代码，，那么新建的upload将会消失
		String uploadFilePath = request.getSession().getServletContext().getRealPath("a");
		//第一步：判断请求信息中的内容是否是multipart类型，如果是则进行处理。
		if (isMultipart) {
			//第二步：通过FileItemFactory工厂对象实例化ServletFileUpload对象。
			//并且需要将此对象传到ServletFileUpload对象中，
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			File filePath = new File("F:\\upload"); //缓冲区路径，不管它是否存在
			if (!filePath.exists()) { //判断缓冲区路径是否存在
				/* 
				mkdir() 如果你想在已经存在的文件夹(D盘下的yyy文件夹)下建立新的文件夹（2010-02-28文件夹），
				就可以用此方法。此方法不能在不存在的文件夹下建立新的文件夹。
				假如想建立名字是”2010-02-28”文件夹，那么它的父文件夹必须存在。
				
				mkdirs() 如果你想根据File里的路径名建立文件夹（当你不知道此文件夹是否存在，
				也不知道父文件夹存在），就可用此方法，它建立文件夹的原则是：
				如果父文件夹不存在并且最后一级子文件夹不存在，它就自动新建所有路经里写的文件夹；
				如果父文件夹存在，它就直接在已经存在的父文件夹下新建子文件夹。
				*/
				filePath.mkdir(); //不存在就创建，包括其父级目录
			}

			try {
				factory.setSizeThreshold(4096); //设置缓冲区大小4KB
				factory.setRepository(filePath); //设置上传文件用到的缓存路径(临时路径)。
				//设置一个完整路径请求的最大允许大小
				//有一点要注意，修改路径最大允许大小时，一定要在解析之前配置，否则无效，再下面一句代码就是解析操作
				upload.setSizeMax(1024 * 5);
				/*
				第三步：调用ServletFileUpload对象的parseRequest(),
				将表单中字段解析并保存到了FileItem对象集合中。				
				*/
				List<FileItem> items = upload.parseRequest(request);
				/*
				第四步：通过Iterator迭代器依次处理每个FileItem对象，如果是普通字段，
				通过getString()方法得到相应表单字符的值，该值与表单字段中的”name“属性对应。
				如果是文件字段，则通过File的构造方法构建一个指定路径名和文件名的文件，
				并通过FileItem对象的write()方法将上传文件的内容保存到文件中
				*/
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
					FileItem item = iter.next();
					if (item.isFormField()) {//判断此表单是否是普通类型，如果不是，则是File类型
						//因为ServletFileUpload解析时，没有顺序,所以要判断第一个普通类型是哪个字段
						fieldName = item.getFieldName();
						//这里只有一个，如果多个可再else if继续判断
						if (fieldName.equals("user")) {
							//输出表单字段,此处里面如果不写utf-8则会出现中文乱码，
							//意思是拿值时是以什么编码格式拿值。
							System.out.print(item.getString("utf-8"));
							out.print(item.getString("utf-8") + "上传了文件。<br/>");
						}
					} else {//如果不是普通类型，就是File字段
						//限制是下面的四种类型
						//List<String> filType = Arrays.asList("png", "jpg", "gif", "bmp");
						String fileName = item.getName();
						//截取文件类型“.”后面的文件字符串，也就是文件后缀
						//String ext = fileName.substring(fileName.indexOf(".") + 1);
						//查看是前台传来的文件是不是上面的四种类型，不是就上传失败
						//if (filType.contains(ext)) {
							//上面普通字段用的是getFieldName，拿的是传过来的普通字段的值，
							//如果是File用的是getName拿的是上传的文件的名称。
							if (fileName != null && !fileName.equals("")) {
								File fullFile = new File(item.getName());
								File saveFile = new File(uploadFilePath, fileName);
								item.write(saveFile);
								uploadFileName = fullFile.getName();
								out.print("上传成功后的文件名是：" + uploadFileName);
							}
						//} else {
						//	System.out.print("抱歉文件类型不匹配！");
						//}
					}
				}
			} catch (FileUploadBase.SizeLimitExceededException e) {
				System.out.print("上传文件超出限制范围，上传失败");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>