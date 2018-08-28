<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String[] sels = request.getParameterValues("select_asset");
String sel = "";
if (sels != null){ 
	for(int i = 0;i < sels.length;i++) sel += sels[i] + " "; } 
String str = "SELECT:" + sel;

out.println(str);


%>
</body>
</html>