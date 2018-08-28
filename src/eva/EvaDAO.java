package eva;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import list.ListItemDo;


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
	
	public ArrayList<ControlItemDo> getControlItem() {
		ArrayList<ControlItemDo> datas = new ArrayList<ControlItemDo>();
		
		String SQL="SELECT * FROM ControlItem";
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ControlItemDo controlItemDO = new ControlItemDo();
				
				//controlItemDO.setId(rs.getInt("id"));
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
}
	
