<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
%>
    
<jsp:useBean id="evaDAO" class="eva.EvaDAO" />
<jsp:useBean id="assetDAO" class="asset.AssetDAO" />

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
</head>
<body>
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
   
	<form action="" method="post" name = "formm">
      <select name="select_asset" id = "select_asset">
           <c:forEach var="data" items="${evaDAO.getAssetlist() }">
              <option value="${data }">${data }</option>
           </c:forEach>
      </select>
      <input type = "submit" value ="선택">
	</form>
	
<%
//select box에서 사용자가 선택한 자산명을 가져오는 함수
String[] sels = request.getParameterValues("select_asset"); 
String sel = "";
if (sels != null){ 
   for(int i = 0;i < sels.length;i++)
	   sel += sels[i] + " "; } 

String asset_name = sel; //asset_name에 저장

request.setAttribute("str", asset_name);


Connection Conn=null;

try {
    String dbURL = "jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2?useUnicode=true&characterEncoding=utf8";
    String dbID = "admin";
    String dbPassword = "password";
    Class.forName("com.mysql.cj.jdbc.Driver");
    Conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
    String sql = "SELECT * from AssetTable where asset_name = '" +asset_name+ "'";
    PreparedStatement pstmt = Conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    
    rs.next();
    int priority = rs.getInt("priority");
    request.setAttribute("PRIORITY", priority);
    
} catch (Exception e) {
   e.printStackTrace();
}

%>	
선택한 자산 : ${str } <br> 
자산우선순위 : ${PRIORITY } <br>

   
  </div>
  
  <c:if test="${str != '' }">
	<form name = form1 id = "myForm" action = "asset_eva_select.jsp" method = post> 
    <div id = "evaluation_table" style=" height:480px;padding-left:10px;margin:10px; overflow:scroll;" >
    	<input type="hidden" name="asset_name" value="${str }" />
       	<input type="hidden" id="real_data" name="real_data"/>
        <table class="evaluation_table" id = "grid" style="text-align: center; border : 1px solid #dddddd">
          <thead>
             <tr>
              <th style = "background-color : #eeeeee; text-align:center;"> </th>
              <th style = "background-color : #eeeeee; text-align:center;">id</th>
              <th width=4% style = "background-color : #eeeeee; text-align:center;">No.</th>
              <th width=8% style = "background-color : #eeeeee; text-align:center;">통제분야</th>
              <th style = "background-color : #eeeeee; text-align:center;">항목번호</th>
              <th style = "background-color : #eeeeee; text-align:center;">통제항목</th>
              <th style = "background-color : #eeeeee; text-align:center;">점검항목</th>
              <th width=10% style = "background-color : #eeeeee; text-align:center;">평가결과</th>
              <th width=7% style = "background-color : #eeeeee; text-align:center;">항목중요도</th>
              <th style = "background-color : #eeeeee; text-align:center; display: none;">근거자료(관리적)</th>
              <th style = "background-color : #eeeeee; text-align:center; display: none;">근거자료(기술적)</th>
              <th style = "background-color : #eeeeee; text-align:center; display: none;">점검방법</th>
              <th style = "background-color : #eeeeee; text-align:center; display: none;">보안조치사항</th>
              </tr>
          </thead>

          <tbody>
          
      <c:forEach var ="data" items="${evaDAO.getControlItem() }">
      <!-- evaDAO는 DB에서 테이블의 값들을 가져오게 하는 자바빈즈. getControlItem은 db테이블의 값을 저장한 배열 -->
           
           <tr>
              <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
              <td><c:out value = "${data.id}"/></td>
            <td><c:out value = "${data.no}"/></td>
              <td><c:out value =  "${data.control_field}"/></td>
              <td><c:out value =  "${data.control_item_no}"/></td>
              <td><c:out value = "${data.control_item}"/></td>
              <td><c:out value = "${data.check_item}"/></td>
              <td><select id = "select">
                 <option value = "N"> N</option>
                  <option value = "Y"> Y</option>
                  </select></td>
              <td><c:out value = "${data.importance}"/></td>
              <td style="display: none;"><c:out value = "${data.management}"/></td>
              <td style="display: none;"><c:out value = "${data.physics}"/></td>
              <td style="display: none;"><c:out value = "${data.method}"/></td>
              <td style="display: none;"><c:out value = "${data.action}"/></td>
          </tr>
         
          </c:forEach>
      
          </tbody>

        </table>
         </div>
         <div id="selectBtn" style="padding-left:10px;margin:10px;" align="right">
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
         <button class = "btn btn-primary pull-right" type="submit" onclick="eva_end()">평가완료</button>
         
         <script type="text/javascript">
         function eva_end() {
             return confirm("자산 평가가 완료되었습니다.")
         }
         
         </script>
         </div>
      	
   
         
       <script>
       
       $(document).ready(function () { 
         $('#selectBtn').click(function(){
           
            var tdArr = new Array();
            var checkbox = $("input[name=checkBox]:checked");
            var checklen = $("input[name=checkBox]:checked").length;
            
            
               //each는 가각에 대해서 반복문을 돌린다.
                 checkbox.each(function(i){
               var tr = checkbox.parent().parent().eq(i);
               var td = tr.children();
      
               
               var id = td.eq(1).text();
               var no = td.eq(2).text();
               var control_field = td.eq(3).text();
               var control_item_no=td.eq(4).text();
               var control_item = td.eq(5).text();       
               var check_item = td.eq(6).text();
               var result = $(this).closest("tr").find("option:selected").val();
                 
               
               var importance = td.eq(8).text();
               var management = td.eq(9).text();
               var physics = td.eq(10).text();
               var method = td.eq(11).text();
               var action = td.eq(12).text();
               
               var json_obj = {
                     'id' : id,
                      'no' : no,
                      'control_field' : control_field,
                      'control_item_no' : control_item_no,
                      'control_item' : control_item,
                      'check_item' : check_item,
                      'result' : result,
                      'importance' : importance,
                      'management' : management,
                      'physics' : physics,
                      'method' : method,
                      'action' : action
                   };
             //배열에 json 객체 저장
               tdArr.push(json_obj);
              
               //console.log(tdArr);
               //alert(result);
               //console.log(result);

               //console.log()           
                //배열에 저장 된 데이터를 json 문자열로 파싱
                     });
                  var json_str = JSON.stringify(tdArr);
                //alert(json_str); 매번보는 통제항목 알림창
                 
                 
               //hidden으로 설정 된 input 태그에 json 문자열 세팅
               $('#real_data').val(json_str);
                   
              /* //form 태그의  action 페이지에 전송하기 위해 form id 호출!
              $('#myForm').submit();    
      
                var real_data = { 'real_data' : json_str }
                $.post('asset_eva_select.jsp', real_data, function(result) {
                // alert(result);
               
                }); */
               
               });
               
            });
       
       </script>       
     </form>  
  
  </c:if>

</article>

     <footer id="mainfooter">
     <span>ㅤㅤ ㅤㅤㅤㅤㅤㅤㅤㅤㅤ COPYRIGHT ⓒ 2018 HelloSecurity. All Rights Reserved</span>
     </footer>
</body>
</html>
    