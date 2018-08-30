<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>

<%@ page import="asset.AssetDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="asset" class="asset.Asset" scope="page"/>
<jsp:useBean id="user" class="user.User" scope="page"/>

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
<jsp:setProperty name="asset" property="usage" />

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
   if(userID==null){
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('로그인을 하세요.')");
      script.println("location.href='login.jsp'");
      script.println("</script>");
   }else{
      if(request.getParameter("asset_name")==null||request.getParameter("priority")==null||
                        request.getParameter("asset_type")==null||request.getParameter("inter_face")==null||
                              request.getParameter("protocol")==null||request.getParameter("os_type")==null||
                                    request.getParameter("usage").equals("")){
               PrintWriter script=response.getWriter();
               script.println("<script>");
               script.println("alert('입력이 안 된 사항이 있습니다.')");
               script.println("</script>");
            }else{
               AssetDAO assetDAO = new AssetDAO();
               int result = assetDAO.write(asset.getAsset_name(),asset.getPriority(),asset.getAccount_manage() ,asset.getEncryption(),asset.getLogging(),asset.getExternal_connect(),asset.getAsset_type(),asset.getInter_face(),
                     asset.getProtocol(),asset.getOs_type(),asset.getUsage());
               if(result==-1){
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("alert('자산리스트 추가에 실패했습니다.')");
                  script.println("history.back()");
                  script.println("</script>");
               }else{ 
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("location.href='asset_list.jsp'");
                  script.println("</script>");
               }
            }
   }
   %>
   
   <div class="container">
   <div class ="row">
      <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
          <thead>
             <tr>
                
               <th rowspan="2"style="background-color:#eeeeee; text-align:center;">자산명</th>
               <th rowspan="2"style="background-color:#eeeeee; text-align:center;">자산우선순위</th>
               <th colspan="4" scope="colgroup" id="type"style="background-color:#eeeeee; text-align:center;">자산속성</th>
               <th rowspan="2"style="background-color:#eeeeee; text-align:center;">자산유형</th>
               <th colspan="2" scope="colgroup" id="type"style="background-color:#eeeeee; text-align:center;">통신</th>
               <th rowspan="2"style="background-color:#eeeeee; text-align:center;">OS유형/종류</th>
               <th rowspan="2"style="background-color:#eeeeee; text-align:center;">장치용도</th>
               </tr>
               
               <tr>
                 <th scope="row" id="asset_manage" style="background-color:#eeeeee; text-align:center;">계정관리기능</th>
                 <th scope="row" id="encryption" style="background-color:#eeeeee; text-align:center;">암호화기능</th>
                 <th scope="row" id="logging" style="background-color:#eeeeee; text-align:center;">로그기록기능</th>
                 <th scope="row" id="external_connect" style="background-color:#eeeeee; text-align:center;">외부매체연결성</th>
                 
              
                 <th scope="row" id="inter_face" style="background-color:#eeeeee; text-align:center;">인터페이스</th>
                 <th scope="row" id="protocol" style="background-color:#eeeeee; text-align:center;">프로토콜</th>
               </tr>
          </thead>
          <tbody>

                    <tr>
                    <td><%=request.getParameter("asset_name")%></td>                  
                    <td><%=request.getParameter("priority")%></td>
                   <%
                    String[] asset_types=request.getParameterValues("asset_type");
                    if(asset_types!=null){
                       for(int i=0; i<asset_types.length;i++){
                    %>
                       <%= asset_types[i] %>
                    <%
                    }
                    }
                    %>
                    
                    <%=request.getParameter("inter_face")%>
                     <%=request.getParameter("protocol")%>
                    <%=request.getParameter("os_type")%>
                    <%=request.getParameter("usage")%>
                    
                                   
                </tr>
          </tbody>   
          </table>
        <a href="asset_reg.jsp" class="btn btn-primary pull-right">등록</a>
   </div>
   </div>
</body>
</html> 