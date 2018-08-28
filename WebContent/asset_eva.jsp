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
	<nav class="navbar navbar-default">\
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
			<li><a href="sec_eva.jsp">보안성 평가 결과</a></li>	
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">접속하기<span class="caret"></span></a>
			<ul class="dropdown-menu">
		<li class="active"><a href="login.jsp">로그인</a></li>
		<li><a href="join.jsp">회원가입</a></li>
		</ul>
		</li>
		</ul>
		</div>
		
		</nav>

  <article id = "article">
    <div id="check" style="margin:10px; padding:5px; text-align : right;">
   
<!-- <form action="" method="post"> -->
	   <select name="select_asset">
	        <c:forEach var="data" items="${evaDAO.getAssetlist() }">
	        	<option value="${data }">${data }</option>
	        </c:forEach>
	   </select>
	   <button type = "button" onclick="div_show();">선택</button>
	   
	   <script>
		   function checkFun() {
		     var x = document.getElementsByClassName("asset_list_table");
		     for (var i = 0; i < x.length; i++) {
		       x[i].style.display = "none";
		     }
		    }
		   
		   function div_show() {
			   document.getElementById("evaluation_table").style.display = "block";
			  }
	   </script>
<!-- </form> -->

   
  </div>
  
  
    <div id = "evaluation_table" style=" height:auto;padding-left:10px;margin:10px; overflow:scroll;display:none" >
    <form name = form1 action = "" method = post>
        <table class="evaluation_table" style="text-align: center; border : 1px solid #dddddd">
          <thead>
          	<tr>
          	 <th style = "background-color : #eeeeee; text-align:center;"> </th>
          	 <th style = "background-color : #eeeeee; text-align:center;">No.</th>
          	 <th style = "background-color : #eeeeee; text-align:center;">통제분야</th>
          	 <th style = "background-color : #eeeeee; text-align:center;">항목번호</th>
          	 <th style = "background-color : #eeeeee; text-align:center;">통제항목</th>
          	 <th style = "background-color : #eeeeee; text-align:center;">점검항목</th>
          	 <th style = "background-color : #eeeeee; text-align:center;">평가결과</th>
          	 <th style = "background-color : #eeeeee; text-align:center;">항목중요도</th>
          	</tr>
          </thead>

          <tbody>
          
		<c:forEach var ="data" items="${evaDAO.getControlItem() }">
        	<tr>
        		<td><input id = "checkbox" type="checkbox"></td>
				<td>${data.no}</td>
		        <td>${data.control_field}</td>
		        <td>${data.control_item_no}</td>
		        <td>${data.control_item}</td>
		        <td>${data.check_item}</td>
		        <td><select> <option> Y</option> <option> N</option></select></td>
		        <td>${data.importance}</td>
		    </tr>
          </c:forEach>
          
       
          </tbody>


        </table>
      </form>  
      </div>
      <div id = button style="padding-left:10px;margin:10px" align="right">
<button> <a href="Result_1.html" class="" title="평가하기" target="_top">평가하기</a></button>

</div>
</article>

     <footer><span>Copyright @kimjuyeon @kimeunji@yunjuhae</span></footer>
</body>
</html>
    