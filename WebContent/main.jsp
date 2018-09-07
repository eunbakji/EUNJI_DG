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
         <li class="active"><a href="main.jsp">메인</a></li>
         <li><a href="asset_list.jsp">자산 리스트</a></li>
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
      <section id="features">
               <div class="container">
                  <header>
                     <h3>Welcome! this is</h3>
                     <h2><strong>Industry Control System</strong> Vulnerability Assessment Program</h2>
                  </header>
                  <div class="row aln-center">
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Feature -->
                           <section id="section1">
                              <a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
                              <header>
                                 <h3>Introduction</h3>
                              </header>
                              <p>프로그램 소개 및 만들게 된 계기 같은거 적으면 될 듯ㅎ 이미지는 못 차자써여~~~~~</p>
                           </section>

                     </div>
                     
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Feature -->
                           <section id="section2">
                              <a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
                              <header>
                                 <h3>How to use?</h3>
                              </header>
                              <p>사용방법을 사용자들에게 알려주면 됩니다 ㅇㅅㅇ 이미지는 못 차자써여~~~</p>
                           </section>

                     </div>
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Feature -->
                           <section id="section3">
                              <a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
                              <header>
                                 <h3>Program Features</h3>
                              </header>
                              <p>프로그램 장점?이랑 특징들 나열하면 됩니다~~~~~~~~~~ 이미지는 역시 없습니다 꺄르르륵깔깔 빠빠나나빠빠빠나나나나빠빠나나빠빠빠나나나나레드벨벳짱짱</p>
                           </section>

                     </div>
                  </div>
                  <hr>
                  <div class="col-12">
                        <a href="main.jsp" class="button icon fa-file">Back to Top</a>
                     </div>
               </div>
            </section>
            <footer id="mainfooter"><span>Copyright @kimjuyeon @kimeunji @yoonjoohye</span></footer>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>
</html>