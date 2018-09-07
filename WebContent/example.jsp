<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="utf-8">

<script

  src="https://code.jquery.com/jquery-1.12.4.min.js"

  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="

  crossorigin="anonymous"></script>
<%
String[] check = request.getParameterValues("checkBox");

if(check != null) {
for(int i=0; i<check.length; i++) {
System.out.println(check[i]);
}
}

%>


</body>

</html>

    