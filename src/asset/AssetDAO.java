package asset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AssetDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public AssetDAO() {
      try {
         String dbURL ="jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2";
         String dbID = "admin";
         String dbPassword = "password";
         Class.forName("com.mysql.jdbc.Driver");
         conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
      }   catch(Exception e) {
         e.printStackTrace();
      }
   }
   
public int getNext() {
      String SQL="SELECT asset_name FROM AssetTable ORDER BY asset_name DESC";
      try {
         pstmt=conn.prepareStatement(SQL);
         rs=pstmt.executeQuery();
         if(rs.next()) {
            return rs.getInt(1)+1;
         }
         return 1; //첫번째 게시물인 경우 
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //데이터베이스 오류 
   }
   
   public int write(String asset_name, int priority, String account_manage,String encryption,
   String logging,String external_connect,String asset_type,String inter_face,String protocol,
   String os_type,String usage) {
      String SQL="INSERT INTO AssetTable VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?)";
      try {
         pstmt=conn.prepareStatement(SQL);
         pstmt.setInt(1, getNext());
         pstmt.setString(2, asset_name);
         pstmt.setInt(3, priority);
         pstmt.setString(4, account_manage);
         pstmt.setString(5, encryption);
         pstmt.setString(6, logging);
         pstmt.setString(7, external_connect);
         pstmt.setString(8, asset_type);
         pstmt.setString(9, inter_face);
         pstmt.setString(10, protocol);
         pstmt.setString(11, os_type);
         pstmt.setString(12, usage);
         pstmt.setInt(13, 1);
         rs=pstmt.executeQuery();
         return pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }


         
   {

   }
}