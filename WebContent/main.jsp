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
                              <header>
                                 <h3>Introduction</h3>
                              </header>
                              <p>
                             ▷ 해커가 인터넷에 연결된 외부 시스템과 폐쇄된 내부 망의 접점에서 발생할 수 있는 보안상 허점을 이용해 폐쇄망을 공격하는 사례가 지속적으로 발견되고 있음</br>
			▷ 국내 산업제어시스템의 체계적인 보안수준 강화를 위해 ISO27014(정보보안 Governance 표준)의 영역과 미국 원자력산업협회에서 발행한 ‘NEI 08-09'의 통제 항목을 통합하여 개발</br>
 			▷ 보안취약점 진단 프로그램에서 도출된 결과를 바탕으로 ICS 정보보안 Governance 구축의 초석 마련</p>
                           </section>

                     </div>
                     
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Feature -->
                           <section id="section2">
                              <header>
                                 <h3>Advantage & Feature</h3>
                              </header>
                              <p>
                              ▷ 시간이 지날수록 보안 사고는 점차 지능화되어 효과적인 대응이 어렵기 때문에 정보보호의 패러다임은 기술적인 관점에서 기업전체에 대한 관점으로 변화하고 있음</br>
▷ IT 환경의 변화와 보안사고의 지속적인 발생에 대응할 보안 위험 통합 관리 시스템이 요구됨</br>
▷ 이 프로그램은 이러한 정보보호 거버넌스 구조 내에서 산업제어시스템을 보유한 에너지 기관에 초점을 맞추기 위해 미국 원자력협회에서 발행한 NEI 08-09의 통제항목을 접목시켜 ICS 보안 위험을 통합적으로 관리 
                              
                              ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ
                              ㅤㅤ
                              
                              </p>
                           </section>

                     </div>
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Feature -->
                           <section id="section3">
                              <header>
                                 <h3>Proposal Background</h3>
                              </header>
                              <p>
                              ▷ ICS 중요성: 에너지/교통/통신/상하수도 등 주요 인프라가 제 역할을 하지 못할 경우 우리 삶에 큰 혼란 야기</br>
 			▷ ICS 대상 해킹: 이란 핵시설, 한수원 원전, 우크라이나 전력망 등 산업시설의 근간인 ICS 표적 공격 증가</br>
 ▷ 사이버위협 전문가 부족: 2017년 3월 포네몬 연구소 조사에 의하면 에너지 기관/기업 내부에 사이버 위협을 관리할 전문가가 부족하다고 55%가 응답</br>
 ▷ 보안Governance구축: 에너지 기업/기관의 지속적인 정보보안 수준 향상을 위해 정보보안 관리체계 구축 필요</p>
                           </section>

                     </div>
                  </div>
                  <hr>
                  <div class="col-12">
                        <a href="main.jsp" class="button icon fa-file">Back to Top</a>
                     </div>
               </div>
            <footer id="mainfooter">
            <span>ㅤㅤ ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ COPYRIGHT ⓒ 2018 HelloSecurity. All Rights Reserved</span></footer>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>
</html>