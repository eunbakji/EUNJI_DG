<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");
%>
    
<jsp:useBean id="listDAO" class="list.ListDAO" />
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
			<li class="active"><a href="asset_list.jsp">자산 리스트</a></li>
			<li><a href="asset_eva.jsp">자산 평가</a></li>
			<li><a href="sec_eva.jsp">보안성 평가 결과</a></li>	
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
			}else{
		%>
		<ul class = "nav navbar-nav navbar-right">
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
	<div class="container">
		<div class ="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			 	<thead>
			 		<tr>
			 			<th rowspan="2" style="background-color:#eeeeee; text-align:center;">^^</th>
						<th rowspan="2" style="background-color:#eeeeee; text-align:center;">번호</th>
						<th rowspan="2"style="background-color:#eeeeee; text-align:center;">자산명</th>
						<th rowspan="2"style="background-color:#eeeeee; text-align:center;">자산우선순위</th>
						<th colspan="4" scope="colgroup" id="type"style="background-color:#eeeeee; text-align:center;">자산속성</th>
						<th rowspan="2"style="background-color:#eeeeee; text-align:center;">자산유형</th>
						<th colspan="2" scope="colgroup" id="type"style="background-color:#eeeeee; text-align:center;">통신</th>
						<th rowspan="2"style="background-color:#eeeeee; text-align:center;">OS유형/종류</th>
						<th rowspan="2"style="background-color:#eeeeee; text-align:center;">장치용도</th>
						</tr>
						
						<tr>
						  <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">계정관리기능</th>
						  <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">암호화기능</th>
						  <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">로그기록기능</th>
						  <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">외부매체연결성</th>

						  <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">인터페이스</th>
						  <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">프로토콜</th>
						  
						
						</tr>
			 	</thead>
			 	<tbody>
				 	<c:forEach var ="data" items="${listDAO.getListItem() }">
		        		<tr>
			        		<td><input id = "checkbox" type="checkbox"></td>
							<td>${data.no}</td>
					        <td>${data.asset_name}</td>
					        <td>${data.priority}</td>
					        <td>${data.account_manage}</td>
					        <td>${data.encryption}</td>
					        <td>${data.logging}</td>
					        <td>${data.external_connect}</td>
					        <td>${data.asset_type}</td>
					        <td>${data.inter_face}</td>
					        <td>${data.protocol}</td>
					        <td>${data.os_type}</td>
					        <td>${data.usage}</td>
					        
					        			       
				    	</tr>
          			</c:forEach>			 		
			 	</tbody>	
			 	</table>
			  <a href="asset_reg.jsp" class="btn btn-primary pull-right">등록</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>