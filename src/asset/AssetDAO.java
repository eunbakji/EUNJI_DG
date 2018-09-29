package asset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class AssetDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public AssetDAO() {
      try {
         String dbURL ="jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2?useUnicode=true&characterEncoding=utf8";
         String dbID = "admin";
         String dbPassword = "password";
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
      }   catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public int getNext() {
	   String SQL = "SELECT no FROM AssetTable ORDER BY no DESC";
	   try {
		   PreparedStatement pstmt=conn.prepareStatement(SQL);
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
   
   //write 함수 생성
   public int write(String asset_name, int priority,String account_manage, String encryption, String logging, String external_connect, String asset_type,String inter_face,String protocol, String os_type,String usages) {
	 //AssetTable에 데이터 삽입
	   String SQL="INSERT INTO AssetTable VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
      try {
         PreparedStatement pstmt=conn.prepareStatement(SQL);
         pstmt.setInt(1, getNext());
         pstmt.setString(2, asset_name);
         pstmt.setInt(3, priority);
         pstmt.setString(4, account_manage);
         pstmt.setString(5, encryption);
         pstmt.setString(6,logging);
         pstmt.setString(7, external_connect);
         pstmt.setString(8, asset_type);
         pstmt.setString(9, inter_face);
         pstmt.setString(10, protocol);
         pstmt.setString(11, os_type);
         pstmt.setString(12, usages);      
         pstmt.setInt(13,1);
         rs=pstmt.executeQuery();
         return pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //데이터베이스 오류 

   }
   
   
   public ArrayList<Asset> getList(int pageNumber){
	   String SQL="SELECT*FROM AssetTable WHERE no<? AND assetAvailable=1 ORDER BY no DESC LIMIT 10";
	   ArrayList<Asset> list=new ArrayList<Asset>();
	   try {
		   PreparedStatement pstmt=conn.prepareStatement(SQL);
		   pstmt.setInt(1, getNext()-(pageNumber-1)*10);
		   rs=pstmt.executeQuery();
		   while (rs.next()) {
			   Asset asset=new Asset();
			   asset.setNo(rs.getInt(1));
			   asset.setAsset_name(rs.getString(2));
			   asset.setPriority(rs.getInt(3));
			   asset.setAccount_manage(rs.getString(4));
			   asset.setEncryption(rs.getString(5));
			   asset.setLogging(rs.getString(6));
			   asset.setExternal_connect(rs.getString(7));
			   asset.setAsset_type(rs.getString(8));
			   asset.setInter_face(rs.getString(9));
			   asset.setProtocol(rs.getString(10));
			   asset.setOs_type(rs.getString(11));
			   asset.setUsages(rs.getString(12));
			   asset.setAssetAvailable(rs.getInt(13));
			   list.add(asset);
		   	}
	   }catch(Exception e) {
		   e.printStackTrace();
		   }
	   return null;
   }

   
   public boolean nextPage(int pageNumber) { //자산리스트 페이지 설정을 위한 함수
	   String SQL="SELECT*FROM AssetTable WHERE no<? AND assetAvailable=1";
	   try {
		   PreparedStatement pstmt=conn.prepareStatement(SQL);
		   pstmt.setInt(1, getNext()-(pageNumber-1)*10);
		   rs=pstmt.executeQuery();
		   if(rs.next()) {
			   return true;
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return false;
   }
   
   public Asset getAsset(int no) {
	   String SQL="SELECT*FROM AssetTable WHERE no=?";
	   try {
		   PreparedStatement pstmt = conn.prepareStatement(SQL);
		   pstmt.setInt(1, no);
		   rs=pstmt.executeQuery();
		   if(rs.next()) {
			   Asset asset=new Asset();
			   asset.setNo(rs.getInt(1));
			   asset.setAsset_name(rs.getString(2));
			   asset.setPriority(rs.getInt(3));
			   asset.setAccount_manage(rs.getString(4));
			   asset.setEncryption(rs.getString(5));
			   asset.setLogging(rs.getString(6));
			   asset.setExternal_connect(rs.getString(7));
			   asset.setAsset_type(rs.getString(8));
			   asset.setInter_face(rs.getString(9));
			   asset.setProtocol(rs.getString(10));
			   asset.setOs_type(rs.getString(11));
			   asset.setUsages(rs.getString(12));
			   return asset;
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return null;
   }
   
   
   //자산수정을 위한 함수
   public int update(int no, String asset_name, int priority,String account_manage, String encryption, String logging, String external_connect, String asset_type,String inter_face,String protocol, String os_type,String usages){
	   String SQL="UPDATE AssetTable SET asset_name=?, priority=?, account_manage=?, encryption=?, logging=?, external_connect=?, asset_type=?,inter_face=?,protocol=?, os_type=?,usages=? WHERE no=?";
	   try {
	         pstmt=conn.prepareStatement(SQL);
	         pstmt.setString(1, asset_name);
	         pstmt.setInt(2, priority);
	         pstmt.setString(3, account_manage);
	         pstmt.setString(4, encryption);
	         pstmt.setString(5,logging);
	         pstmt.setString(6, external_connect);
	         pstmt.setString(7, asset_type);
	         pstmt.setString(8, inter_face);
	         pstmt.setString(9, protocol);
	         pstmt.setString(10, os_type);
	         pstmt.setString(11, usages);
	         pstmt.setInt(12, no);
	         return pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return -1;
   }
}
   
	   
   
