package result;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import asset.Asset;

public class ResultDAO {
   private Connection conn;
   private PreparedStatement pstmt;
   
   public ResultDAO() {
      try {
         String dbURL ="jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2";
         String dbID = "admin";
         String dbPassword = "password";
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
         
      }   catch(Exception e) {
         e.printStackTrace();
      }
      
   }
   public ArrayList<String> getAssetlist() {
      ArrayList<String> datas = new ArrayList<String>();
      
      String SQL="SELECT asset_name FROM AssetTable";
      try {
         pstmt = conn.prepareStatement(SQL);
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()) {
            datas.add(rs.getString("asset_name"));
            
         }

         rs.close();
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      
      return datas;
      
   }
   
   public ArrayList<Result> getResult() {
      ArrayList<Result> datas = new ArrayList<Result>();
      
      String SQL="SELECT * FROM SelectedControlItem";
      try {
         pstmt = conn.prepareStatement(SQL);
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Result result = new Result();
            
            result.setControl_field(rs.getString("control_field"));
            result.setControl_item_no(rs.getString("control_item_no"));
            result.setControl_item(rs.getString("control_item"));
            result.setCheck_item(rs.getString("check_item"));
            result.setManagement(rs.getString("management"));
            result.setPhysics(rs.getString("physics"));
            result.setMethod(rs.getString("method"));
            result.setResult(rs.getString("result"));
            result.setAction(rs.getString("action"));
            result.setFinalPriority(rs.getInt("finalPriority"));

            
            datas.add(result);
         }

         rs.close();
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      
      return datas;
      
   }
}
