<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="asset.AssetDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*,java.util.*" %>

<!-- DAO 호출 -->
<jsp:useBean id="asset" class="asset.Asset" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:setProperty name="asset" property="asset_name" />
<jsp:setProperty name="asset" property="priority" />
<jsp:setProperty name="asset" property="account_manage" />
<jsp:setProperty name="asset" property="encryption" />
<jsp:setProperty name="asset" property="logging" />
<jsp:setProperty name="asset" property="external_connect" />
<jsp:setProperty name="asset" property="asset_type" />
<jsp:setProperty name="asset" property="inter_face" />
<jsp:setProperty name="asset" property="protocol" />
<jsp:setProperty name="asset" property="os_type" />
<jsp:setProperty name="asset" property="usages" />

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취약점 진단 프로그램</title>
</head>
<body>
<% // 세션의 로그인여부 확인
   String userID=null;
   if(session.getAttribute("userID")!=null){
      userID=(String)session.getAttribute("userID");
   }
   if(userID==null){ //로그인 안 됐을 경우
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('로그인을 하세요.')");
      script.println("location.href='login.jsp'");
      script.println("</script>");
   }else{ //로그인이 된 경우 
      if(request.getParameter("asset_name")==null||request.getParameter("priority")==null||
    						  request.getParameter("asset_type")==null||request.getParameter("inter_face")==null||
    								  request.getParameter("protocol")==null||request.getParameter("os_type").equals("")){
               PrintWriter script=response.getWriter();
               script.println("<script>");
               script.println("alert('입력이 안 된 사항이 있습니다.')");
               script.println("</script>");
            }else{ //모든 입력사항을 다 입력한 경우 
               AssetDAO assetDAO = new AssetDAO(); //assetDAO 객체에 AssetDAO 저장
               //result에 assetDAO에 있는 write함수 값을 저장
               int result = assetDAO.write(asset.getAsset_name(),asset.getPriority(), asset.getAccount_manage(),asset.getEncryption(),asset.getLogging(),asset.getEncryption(),asset.getAsset_type(),asset.getInter_face(),asset.getProtocol(),asset.getOs_type(),asset.getUsages());
               if(result==-1){
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("alert('자산리스트 추가에 실패했습니다.')");
                  script.println("</script>");
               }else{ //자산 추가 성공적으로 이루어진 경우
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("location.href='asset_list.jsp'");
                  script.println("</script>");
               }
            }
   }
   %>
<%

request.setCharacterEncoding("utf-8");
//getParameter로 데이터 받아오기

String re_asset_name=request.getParameter("asset_name");                  
String re_priority=request.getParameter("priority");      
String re_account_manage=request.getParameter("account_manage");                  
String re_encryption=request.getParameter("encryption");                  
String re_logging=request.getParameter("logging");                  
String re_external_connect=request.getParameter("external_connect");                  
String re_asset_type=request.getParameter("asset_type");        
String re_inter_face=request.getParameter("inter_face");
String re_protocol=request.getParameter("protocol");
String re_os_type=request.getParameter("os_type");
String re_usages=request.getParameter("usages");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn=null;
PreparedStatement pstmt=null;

try{
    String dbURL ="jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2?useUnicode=true&characterEncoding=utf8";	       
	String dbID = "admin";
	String dbPassword = "password";
	 conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
		              pstmt=conn.prepareStatement("INSERT INTO AssetTable(asset_name,priority,account_manage,encryption,logging,external_connect,asset_type,inter_face,protocol,os_type,usages) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
		       		  pstmt.setString(1, re_asset_name);
		              pstmt.setString(2, re_priority);
		              pstmt.setString(3, re_account_manage);
		              pstmt.setString(4, re_encryption);
		              pstmt.setString(5, re_logging);
		              pstmt.setString(6, re_external_connect);
		              pstmt.setString(7, re_asset_type);
		              pstmt.setString(8, re_inter_face);
		              pstmt.setString(9, re_protocol);
		              pstmt.setString(10, re_os_type);
		              pstmt.setString(11, re_usages);

		             int i= pstmt.executeUpdate();
		             System.out.println("i"+i);
		      }  finally{
		    	  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		    	  if(conn!=null)try{conn.close();}catch(SQLException ex){}
		    	  if(conn!=null)try{conn.close();}catch(SQLException ex){}
		      }
%>
       
   </div>
</body>
</html> 