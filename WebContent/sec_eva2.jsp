<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ page import="java.io.PrintWriter" %>
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
	<div style="display: inline-block; float: left; border: 1px solid black;padding: 3px; text-align: center; text-margin: auto; width: 88px;
height: 44px; "><a href="main.jsp">터빈계통  모니터링기기</a></div>
	<div style="display: inline-block; float: left; border: 1px solid black;padding: 3px; text-align: center; text-margin: auto; width: 88px;
height: 44px; "><a href="main.jsp"> 터빈계통  제어기기</a></div>
	<div style="display: inline-block; float: left; border: 1px solid black;padding: 3px; text-align: center; text-margin: auto; width: 88px;
height: 44px; "><a href="main.jsp"> 지진감시계통 PLC</a></div>
	<div class="row">
	<div style="text-align:right;"><a href="sec_eva.jsp">통제항목순으로 보기</a></div>
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	<thead>
	<tr>
	<th style="background-color: #eeeeee; text-align: center;">통제분야</th>
	<th style="background-color: #eeeeee; text-align: center;">No.</th>
	<th style="background-color: #eeeeee; text-align: center;">통제항목</th>
	<th style="background-color: #eeeeee; text-align: center;">점검항목</th>
	<th style="background-color: #eeeeee; text-align: center;">근거자료(관리적)</th>
	<th style="background-color: #eeeeee; text-align: center;">근거자료(물리적)</th>
	<th style="background-color: #eeeeee; text-align: center;">점검방법</th>
	<th style="background-color: #eeeeee; text-align: center;">평가결과</th>
	<th style="background-color: #eeeeee; text-align: center;">보안조치사항</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td>접근제어</td>
        <td>D.1.2</td>
        <td>계정관리</td>
        <td>자산 계정 권한을 관리하기 위한 접근제어 목록 검토 기준,<br>검토 방법, 주기 등을 정하여 이를 이행하고 있는가?</td>
        <td>O</td>
        <td>X</td>
        <td><strong>계정관리대장 존재 여부 및 다음 항목 포함 여부</strong><br>- 계정/비밀번호, 비밀번호 변경일자, 담당자, 승인여부, 승인일자</td>
        <td>N</td>
        <td>비밀번호를 3개월 주기로 변경, 변경 시 승인을 득한다</td>
	</tr>
	</tbody>
	</table>
	</div>
	<div align="right"><button id="save">저장</button></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>