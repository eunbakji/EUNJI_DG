<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
 	//DB에 저장된 AssetTable의 속성들을 getParameter 함수를 통해 불러옴 
   Connection Conn=null;
   Statement stmt=null;
   ResultSet rs=null;
   
   String asset_name=request.getParameter("asset_name");
   String priority=request.getParameter("priority");
   String account_manage=request.getParameter("account_manage");
   String encryption=request.getParameter("encryption");
   String logging=request.getParameter("logging");
   String external_connect=request.getParameter("external_connect");
   String asset_type=request.getParameter("asset_type");
   String inter_face=request.getParameter("inter_face");
   String protocol=request.getParameter("protocol");
   String os_type=request.getParameter("os_type");
   String usages=request.getParameter("usages");
   
   String db_list="select * from AssetTable";
   
   int num=1;
 %>
    
<jsp:useBean id="listDAO" class="asset.ListDAO" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
</head>
<body>
<% // 로그인여부 확인
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
         <li><a href="asset_eva.jsp" onclick="return eva_button()">자산 평가</a></li>
          <script type="text/javascript">
         function eva_button() {
        	  return confirm("평가할 자산을 선택해주세요.")           }
       </script>
         <li><a href="sec_eva.jsp">보안성 평가 결과</a></li>   
      </ul>
      <% //로그인 여부에 따라 달라지는 탭 구현 위한 코드
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
          <% //DB연동을 위함
                       try {
                           String dbURL = "jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2?useUnicode=true&characterEncoding=utf8";
                           String dbID = "admin";
                           String dbPassword = "password";
                           Class.forName("com.mysql.cj.jdbc.Driver");
                           Conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
                          stmt=Conn.createStatement();
                  
                          %>
                        
   <div class="container">
      <div class ="row">
         <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
             <thead>
                <tr>
                   <th rowspan="2" style="background-color:#eeeeee; text-align:center;"></th>
                  <th width=5% rowspan="2" style="background-color:#eeeeee; text-align:center;">번호</th>
                  <th width=20% rowspan="2"style="background-color:#eeeeee; text-align:center;">자산명</th>
                  <th width=10% rowspan="2"style="background-color:#eeeeee; text-align:center;">자산우선순위</th>
                  <th width=27% colspan="4" scope="colgroup" id="type"style="background-color:#eeeeee; text-align:center;">자산속성</th>
                  <th width=5% rowspan="2"style="background-color:#eeeeee; text-align:center;">자산유형</th>
                  <th colspan="2" scope="colgroup" id="type"style="background-color:#eeeeee; text-align:center;">통신</th>
                  <th rowspan="2"style="background-color:#eeeeee; text-align:center;">OS</th>
                  <th width=13% rowspan="2"style="background-color:#eeeeee; text-align:center;">장치용도</th>
                  </tr>
                  
                  <tr>
                    <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">계정관리기능</th>
                    <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">암호화기능</th>
                    <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">로그기록기능</th>
                    <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">외부매체연결성</th>

                    <th width=8% scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">인터페이스</th>
                    <th width=7% scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">프로토콜</th>
                    
                  
                  </tr>
             </thead>
             <tbody>
    
                       <%
                       rs=stmt.executeQuery(db_list);
                       while(rs.next())
                       {
                       %>
                    <tr>
                       <td><input id = "checkbox" type="checkbox"></td>
                       <td><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                       <td><%=rs.getString(3) %></td>
                       <td><%=rs.getString(4) %></td>
                       <td><%=rs.getString(5) %></td>
                       <td><%=rs.getString(6) %></td>
                       <td><%=rs.getString(7) %></td>
                       <td><%=rs.getString(8) %></td>
                       <td><%=rs.getString(9) %></td>
                       <td><%=rs.getString(10) %></td>
                       <td><%=rs.getString(11) %></td>
                       <td><%=rs.getString(12) %></td>
                       
                     
                   </tr>
                   <%
                   num++;
                   }
                   rs.close();
                   stmt.close();
                   Conn.close();
                   }
                   catch(SQLException e)
                   {
                   out.println(e);
                   }
                   catch(Exception e1)
                   {
                   out.println(e1);
                   }
                   
                   if(num==1)
                   {
                   %>
                   <tr>
                   <td colspan="3"> 저장된 데이터가 없습니다.</td>
                   </tr>
                    <%
                   }
                    %>   
                          
             </tbody>   
             </table>
             <tr>
                <td> <a href="asset_del.jsp" class="btn btn-primary pull-right">삭제</a></td>
              </tr>
                <tr></tr>
              
             <tr>
               <td><a href="asset_upd.jsp" class="btn btn-primary pull-right">수정</a></td>ㅤㅤ
             </tr>
               <tr></tr>
             <tr>
           		<a href="asset_reg.jsp" class="btn btn-primary pull-right">추가</a>ㅤㅤ
           		</tr>
           
      </div>
   </div>
                     <hr>
   
            <footer id="mainfooter">
            <span>ㅤㅤ ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ COPYRIGHT ⓒ 2018 HelloSecurity. All Rights Reserved</span></footer>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>
