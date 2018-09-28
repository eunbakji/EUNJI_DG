<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ page import="java.io.PrintWriter" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <!-- DAO 호출 -->
<jsp:useBean id="ResultDAO" class="result.ResultDAO" />
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
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
%>
	<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
		data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
		aria-expanded="false">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>				
		</button>
		<a class="navbar-brand" href="main.jsp">ICS 취약점 진단 웹 사이트</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="main.jsp">메인</a></li>
			<li><a href="asset_list.jsp">자산 리스트</a></li>
			<li><a href="asset_eva.jsp">자산 평가</a></li>
			<li class="active"><a href="sec_eva.jsp">보안성 평가 결과</a></li>	
		</ul>
		<%
			if(userID==null){
		%>
			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">접속하기<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
			</li>
			</ul>
		<%
			} else{
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">회원관리<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="logoutAction.jsp">로그아웃</a></li>
				
			</ul>
			</li>
			</ul>
			<% 
			} 
			%>
		
		</div>
	</nav>
	<div class="container" style="width: 95%">
			<!-- 자산 선택 화면 -->
	<div 
		style="display: inline-block; float: left; border: 1px solid black;padding: 3px; text-align: center; text-margin: auto; width: 88px;
height: 44px; "><a href="main.jsp">터빈계통  모니터링기기</a>
	</div>
	<div 
		style="display: inline-block; float: left; border: 1px solid black;padding: 3px; text-align: center; text-margin: auto; width: 88px;
height: 44px; "><a href="main.jsp"> 터빈계통  제어기기</a>
	</div>
	<div 
		style="display: inline-block; float: left; border: 1px solid black;padding: 3px; text-align: center; text-margin: auto; width: 88px;
height: 44px; "><a href="main.jsp"> 지진감시계통 PLC</a>
	</div>

		<!-- 표 삽입 -->
	<div class="row">
		<div style="text-align:right;">
			<a href="sec_eva2.jsp">조치우선순위 순으로 보기</a>
		</div>
		<table class="table table-striped" 
			style="text-align: center; border: 1px solid #dddddd"  overflow: scroll;>
			<thead>
				<tr>
					<th width=5% style="background-color: #eeeeee; text-align: center;">우선순위</th>	
					<th width=5% style="background-color: #eeeeee; text-align: center;">통제분야</th>
					<th width=5% style="background-color: #eeeeee; text-align: center;">No.</th>
					<th width=5% style="background-color: #eeeeee; text-align: center;">통제항목</th>
					<th style="background-color: #eeeeee; text-align: center;">점검항목</th>
					<th width=5% style="background-color: #eeeeee; text-align: center;">근거자료(관리적)</th>
					<th width=5% style="background-color: #eeeeee; text-align: center;">근거자료(물리적)</th>
					<th style="background-color: #eeeeee; text-align: center;">점검방법</th>
					<th style="background-color: #eeeeee; text-align: center;">평가결과</th>
					<th style="background-color: #eeeeee; text-align: center;">보안조치사항</th>
	</tr>
	</thead>
	<tbody>
	<!-- ResultDAO에 있는 getResult 함수 호출 -->
	<c:forEach var="data" items="${ResultDAO.getResult() }">
						<tr>
							<!-- jstl -->
							<td>${data.finalPriority}</td>
							<td>${data.control_field}</td>
							<td>${data.control_item}</td>
							<td>${data.control_item_no}</td>
							<td>${data.check_item}</td>
							<td>${data.management}</td>
							<td>${data.physics}</td>
							<td>${data.method}</td>
							<td>${data.result}</td>
							<td>${data.action}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="right">
		<!-- Result DB에 데이터 저장 -->
			<button id="save">저장</button>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>