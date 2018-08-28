<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="asset.AssetDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="asset" class="asset.Asset_list" scope="page"/>
<jsp:setProperty name="asset" property="자산명" />
<jsp:setProperty name="asset" property="자산우선순위" />
<jsp:setProperty name="asset" property="계정관리" />
<jsp:setProperty name="asset" property="암호화" />
<jsp:setProperty name="asset" property="로그기록" />
<jsp:setProperty name="asset" property="외부매체연결성" />
<jsp:setProperty name="asset" property="유형" />
<jsp:setProperty name="asset" property="인터페이스" />
<jsp:setProperty name="asset" property="프로토콜" />
<jsp:setProperty name="asset" property="OS유형종류" />
<jsp:setProperty name="asset" property="장치용도" />

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취약점 진단 프로그램</title>
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(userID!=null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{
		if(request.getAttribute("자산명")==null||request.getAttribute("자산우선순위")==null||request.getAttribute("계정관리")==null
		||request.getAttribute("암호화")==null){
					
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("location.href='asset_list.jsp'");
					script.println("</script>");
				}else{
					AssetDAO assetDAO = new AssetDAO();
					int result = assetDAO.write(asset.get자산명(),asset.get자산우선순위(),asset.get계정관리()
							,asset.get암호화(),asset.get로그기록(),asset.get외부매체연결성(),asset.get유형(),asset.get인터페이스(),
							asset.get프로토콜(),asset.getOS유형종류(),asset.get장치용도());
					if(result==-1){
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('자산리스트 추가에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{ 
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('입력이 안 된 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
				}
	}
%>
</body>
</html>