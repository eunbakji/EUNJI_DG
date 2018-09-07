<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
%>
    
<jsp:useBean id="evaDAO" class="eva.EvaDAO" />

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
   

	   <select name="select_asset">
	        <c:forEach var="data" items="${evaDAO.getAssetlist() }"> <!-- evaDAO.java에서 정의한 gettAssetlist()의 값을 data라는 변수로 저장 -->
	        	<option value="${data }">${data }</option> <!-- jstl 구문으로 불러옴 -->
	        </c:forEach>
	   </select>
	   <button type = "button" onclick="div_show();">선택</button>
		<script>
		   function div_show() { //button 클릭 시 evaluation_table이 나타나도록 하는 함수
			   document.getElementById("evaluation_table").style.display = "block"; 
			  }
	    </script>
<!-- </form> -->

   
  </div> 
    <div id = "evaluation_table" style=" height:auto;padding-left:10px;margin:10px; overflow:scroll;display:none" >
    <form name = form1 id = "myForm" action = "asset_eva_select.jsp" method = post>
    	<input type="hidden" id="real_data" name="real_data"/>
        <table class="evaluation_table" id = "grid" style="text-align: center; border : 1px solid #dddddd">
          <thead>
          	<tr>
          	 <th style = "background-color : #eeeeee; text-align:center;"> </th>
          	 <th style = "background-color : #eeeeee; text-align:center;">id</th>
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
		<!-- evaDAO는 DB에서 테이블의 값들을 가져오게 하는 자바빈즈. getControlItem은 db테이블의 값을 저장한 배열 -->
        	
        	<tr>
        		<td><input id = "checkbox" name = "checkBox" type="checkbox"></td> 
        		<td><c:out value = "${data.id}"/></td> <!-- data.으로 각 값을 불러옴 -->
				<td><c:out value = "${data.no}"/></td>
		        <td><c:out value =  "${data.control_field}"/></td>
		        <td><c:out value =  "${data.control_item_no}"/></td>
		        <td><c:out value = "${data.control_item}"/></td>
		        <td><c:out value = "${data.check_item}"/></td>
		        <td><select id = "select">
		        	<option value = "Y"> Y</option>
		            <option value = "N"> N</option>
		            </select></td>
		        <td><c:out value = "${data.importance}"/></td>
		    </tr>
		    
		   
          </c:forEach>
          
       
          </tbody>


        </table>
        
       <button type="button" id="selectBtn">평가하기</button>
       
       <script> //평가하기 버튼 누를 때 체크박스에 체크된 모든 행의 값을 가져온다
       $(document).ready(function () { 
		   $('#selectBtn').click(function(){ 
			  
			   var tdArr = new Array();
			   var checkbox = $("input[name=checkBox]:checked");
			   
			   
			   
			      //체크된 체크박스 값을 가져온다
	   			  checkbox.each(function(i){
			      var tr = checkbox.parent().parent().eq(i);
			      //checkbox.parent().parent()은 <tr>	 
			      var td = tr.children(); 
					
			      //eq()함수와 인덱스를 사용하여 td의 값을 가져온다.
			      var id = td.eq(1).text();
			      var no = td.eq(2).text();
			      var control_field = td.eq(3).text();
			      var control_item_no=td.eq(4).text();
			      var control_item = td.eq(5).text();		 
			      var check_item = td.eq(6).text();
			      var result = $(this).closest("tr").find("option:selected").val();
			      //var result =$("#select option:selected").val();	
			      
			      var importance = td.eq(8).text();
			      
			      //json_obj 객체 에 td에서 가져온 값 저장
			      var json_obj = {
			    		  'id' : id,
			    	      'no' : no,
			    	      'control_field' : control_field,
			    	      'control_item_no' : control_item_no,
			    	      'control_item' : control_item,
			    	      'check_item' : check_item,
			    	      'result' : result,
			    	      'importance' : importance
			    	   };
				 //배열에 json 객체 저장
			      tdArr.push(json_obj);
				     
			  	  //배열에 저장 된 데이터를 json 문자열로 파싱
	
               		});
	   				var json_str = JSON.stringify(tdArr);
			  	   alert(json_str);
			  	   
			  	   
				   //hidden으로 설정 된 input 태그에 json 문자열 세팅
				   $('#real_data').val(json_str);
				  	  
				  //form 태그의  action 페이지에 전송하기 위해 form id 호출!
				  $('#myForm').submit();	 
					
				  //체크한 값을 DB에 저장하는 asset_eva_select.jsp로 전송
		          var real_data = { 'real_data' : json_str }
		          $.post('asset_eva_select.jsp', real_data, function(result) {
		         
			      
			  	  });
				   
			      
			      
			      
			      });
			      
			   });
			   

			
       
       </script>
       
		   
      </form>  
      </div>
      <div id = button style="padding-left:10px;margin:10px" align="right">



</div>


</article>

     <footer><span>Copyright @kimjuyeon @kimeunji@yunjuhae</span></footer>
</body>
</html>
    