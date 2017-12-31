package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBconnect;
import model.CTDeThi;

public class CTDeThiDAO {

	public boolean insert(CTDeThi ctdt) throws SQLException {

		Connection con = DBconnect.getConnecttion();
		String sql = "insert into ctdethi values(?,?)";
		try {
			PreparedStatement ps = con.prepareCall(sql);

			ps.setString(1, ctdt.getMaDe());
			ps.setString(2, ctdt.getMaCH());

			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			Logger.getLogger(DeThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}
	public int SLCH(String maDe) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="select count(MaCH) as SLCH from ctdethi where MaDe='"+maDe+"'";
		PreparedStatement ps;
		int SL=0;
		try{
			ps=con.prepareCall(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				SL=rs.getInt("SLCH");
			}
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return SL;
	}
}
