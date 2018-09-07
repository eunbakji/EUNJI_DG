package eva;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import asset.Asset;


public class EvaDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	
	public EvaDAO() {
		try {
			String dbURL ="jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2";
			String dbID = "admin";
			String dbPassword = "password";
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			getAssetlist();
		}	catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<String> getAssetlist() { //getAssetlist 데이터를 순서대로 String 배열에 넣음
	      ArrayList<String> datas = new ArrayList<String>(); //String 객체 생성
	      
	      String SQL="SELECT asset_name FROM AssetTable"; //SQL 쿼리문
	      try {
	         pstmt = conn.prepareStatement(SQL);
	         ResultSet rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            datas.add(rs.getString("asset_name")); //asset_name 데이터 가져오기
	            
	         }

	         rs.close();
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      return datas;
	      
	   }
	
	public ArrayList<ControlItemDo> getResultItem() { //getResultItem 데이터를 순서대로 ControlItemDo 배열에 저장
	      ArrayList<ControlItemDo> datas = new ArrayList<ControlItemDo>(); //ControlItemDo 객체 생성
	      
	      String SQL="SELECT * FROM ControlItem"; //SQL 쿼리문
	      try {
	         pstmt = conn.prepareStatement(SQL);
	         ResultSet rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            ControlItemDo controlItemDO = new ControlItemDo(); //ControlItemDo 객체   
	            //controlItemDO 객체에 DB 데이터 저장
	            controlItemDO.setControl_field(rs.getString("control_field")); 
	            controlItemDO.setControl_item_no(rs.getString("control_item_no"));
	            controlItemDO.setControl_item(rs.getString("control_item"));
	            controlItemDO.setCheck_item(rs.getString("check_item"));
	            controlItemDO.setManagement(rs.getString("management"));
	            controlItemDO.setPhysics(rs.getString("physics"));
	            controlItemDO.setMethod(rs.getString("method"));
	            controlItemDO.setResult(rs.getString("result"));
	            controlItemDO.setAction(rs.getString("action"));
	            
	            datas.add(controlItemDO);
	         }

	         rs.close();
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      return datas;
	      
	}
	
	public ArrayList<ControlItemDo> getControlItem() {//ControlItemDo 배열 선언
		ArrayList<ControlItemDo> datas = new ArrayList<ControlItemDo>();
		
		String SQL="SELECT * FROM ControlItem"; //ControlItem DB에서 모든 내용 선택
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ControlItemDo controlItemDO = new ControlItemDo();
				
				//controlItemDO 객체에 DB 데이터 저장
				controlItemDO.setNo(rs.getString("no")); 
				controlItemDO.setControl_field(rs.getString("control_field"));
				controlItemDO.setControl_item_no(rs.getString("control_item_no"));
				controlItemDO.setControl_item(rs.getString("control_item"));
				controlItemDO.setCheck_item(rs.getString("check_item"));
				controlItemDO.setImportance(rs.getString("importance"));
				datas.add(controlItemDO);
			}

			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return datas;
		
	}
	
	//ControlItemDo라는 자바빈즈 파일!
	//asset_eva_select에서 만든 List<ControlItemDo> json객체를 SelectedControlItemDo DB에 넣을 함수 정의

	public void insertSelectItem(List<ControlItemDo> insertItemDo) {
		String sql = "INSERT INTO SelectedControlItem("
				+ "id,no,control_field, control_item_no, control_item,  check_item, result, importance)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ? )";
	      try {
	         
	          pstmt = conn.prepareStatement(sql);
	          
	          for (int j = 0; j<insertItemDo.size(); j++) { //list 객체의 크기 만큼 DB삽입
	          //list객체의 인덱스[0]인 ControlItemDo객체에서 함수 사용하여 id, No 등을 각각 불러옴  
	          pstmt.setInt(1, insertItemDo.get(j).getId()); 
	          pstmt.setString(2, insertItemDo.get(j).getNo().toString());
	          pstmt.setString(3, insertItemDo.get(j).getControl_field().toString());          
	          pstmt.setString(4, insertItemDo.get(j).getControl_item_no().toString());
	          pstmt.setString(5, insertItemDo.get(j).getControl_item().toString());
	          pstmt.setString(6, insertItemDo.get(j).getCheck_item().toString());
	          pstmt.setString(7, insertItemDo.get(j).getResult().toString());
	          pstmt.setString(8, insertItemDo.get(j).getImportance().toString());
	          }
	          
	          pstmt.executeUpdate();
	       } catch(Exception e) {
	          
	    	   e.printStackTrace();
	    	    //데이터베이스 오류
	       }

}
	
}
	
	
		
	
	
	


	
	




	
	
	
	
