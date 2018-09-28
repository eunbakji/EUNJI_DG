<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.lang.reflect.Type"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="eva.ControlItemDo"%>
<%@page import="eva.EvaDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="evaDAO" class="eva.EvaDAO" />
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

String jsonStr = request.getParameter("real_data"); // ajax를 이용해 데이터 받기

Gson gson = new Gson(); // 받은 데이터를 List<Item> 타입으로 변환

Type type = new TypeToken<List<ControlItemDo>>() {}.getType();
List<ControlItemDo> itemList = gson.fromJson(jsonStr, type); // itemList의 값 타입은 ControlItemDo

/*
for(ControlItemDo data : itemList) { 
	System.out.println(data.toString()); 
}
*/ //itemList의 값을 data라는 변수에 하나씩 집어넣으면서 본문 실행


String result =  (itemList.toString());
request.setAttribute("result", result); //포워딩할 페이지에서 result 객체를 받기위한 객체명 "result"

EvaDAO insertDAO = new EvaDAO(); // ControlItemDB와 연결하는 EvaDAO 객체를 생성
insertDAO.insertSelectItem(itemList); //EvaDAO에서 정의한 insertSelectItem함수로 SelectedControlItemDo 디비에 삽입

pageContext.forward("sec_eva.jsp"); //결과창 sec_eva.jsp로 포워딩

%>
</body>
</html>