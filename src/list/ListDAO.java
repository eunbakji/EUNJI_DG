package list;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ListDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	public ListDAO( ) {
		try {
			String dbURL ="jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2";
			String dbID = "admin";
			String dbPassword = "password";
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}	catch(Exception e) {
			e.printStackTrace();
		}
		
	}
		
	public ArrayList<ListItemDo> getListItem() {
		ArrayList<ListItemDo> datas = new ArrayList<ListItemDo>();
		
		String SQL="SELECT * FROM AssetTable";
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ListItemDo listItemDO = new ListItemDo();
				
			
				listItemDO.setNo(rs.getInt("no"));
				listItemDO.setAsset_name(rs.getString("asset_name"));
				listItemDO.setPriority(rs.getInt("priority"));
				listItemDO.setAccount_manage(rs.getString("account_manage"));
				listItemDO.setEncryption(rs.getString("encryption"));
				listItemDO.setLogging(rs.getString("logging"));
				listItemDO.setExternal_connect(rs.getString("external_connect"));
				listItemDO.setAsset_type(rs.getString("asset_type"));
				listItemDO.setInter_face(rs.getString("inter_face"));
				listItemDO.setProtocol(rs.getString("protocol"));
				listItemDO.setOs_type(rs.getString("os_type"));
				listItemDO.setUsage(rs.getString("usage"));
				
				
				datas.add(listItemDO);
			}

			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return datas;
		
	}

	
}
