package asset;

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
		
	public ArrayList<Asset> getListItem() {
		ArrayList<Asset> datas = new ArrayList<Asset>();
		
		String SQL="SELECT * FROM AssetTable";
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Asset asset = new Asset();
				
			
				asset.setNo(rs.getInt("no"));
				asset.setAsset_name(rs.getString("asset_name"));
				asset.setPriority(rs.getInt("priority"));
				asset.setAccount_manage(rs.getString("account_manage"));
				asset.setEncryption(rs.getString("encryption"));
				asset.setLogging(rs.getString("logging"));
				asset.setExternal_connect(rs.getString("external_connect"));
				asset.setAsset_type(rs.getString("asset_type"));
				asset.setInter_face(rs.getString("inter_face"));
				asset.setProtocol(rs.getString("protocol"));
				asset.setOs_type(rs.getString("os_type"));
				asset.setUsages(rs.getString("usage"));
				
				
				datas.add(asset);
			}

			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return datas;
		
	}

	
}
