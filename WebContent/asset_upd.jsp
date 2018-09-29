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
<% //로그인여부 확인
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
            	<a href="login.jsp">로그인</a>
          </li>
            <a href="join.jsp">회원가입</a></li>
         </ul>
         </li>
       <ul>
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
         <form name="asset_reg" method="post" action="regAction.jsp">
         
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
             <thead>
                <tr>
                   <th colspan="2" style="background-color:#eeeeee; text-align:center;">자산 등록</th>
                
                </tr>   
             </thead>
             	
             <tbody>
                <tr>
                   <td><input type="text" class="form-control" placeholder="자산명" name="asset_name" maxlength="50"></td>
                </tr>
                <tr>
                   <td>자산우선순위</td>
                   <td>
                   <select name=priority>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>   
                   </select>
                </td>
   
                 <tr>
                   <td><input type=checkbox value="계정관리" name="asset_property[]">계정관리ㅤ
                   <input type=checkbox value="암호화" maxlength="50" name="asset_property[]">암호화ㅤ
                   <input type=checkbox value="로그기록" maxlength="50" name="asset_property[]">로그기록ㅤ
                   <input type=checkbox value="외부매체연결성" maxlength="50" name="asset_property[]">외부매체연결성</td>
                </tr>
          
               <tr>
                   <td><input type="text" class="form-control" placeholder="유형" name="asset_type" maxlength="50"></td>
                </tr>
                <tr>
                   <td><input type="text" class="form-control" placeholder="인터페이스" name="inter_face" maxlength="50"></td>
                   <td><input type="text" class="form-control" placeholder="프로토콜" name="protocol" maxlength="50"></td>
                </tr>
                <tr>
                   <td><input type="text" class="form-control" placeholder="OS종류" name="os_type" maxlength="50"></td>
                </tr>
               <tr>
                   <td><input type="text" class="form-control" placeholder="장치용도" name="usages" maxlength="50"></td>
                </tr>
      
             </tbody>   
             </table>
           <input type="submit" class="btn btn-primary pull-right" value="저장">
           <input type=reset class="btn btn-primary pull-right" value="취소">
               	 </form>
           </tr>
         
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>
</html>