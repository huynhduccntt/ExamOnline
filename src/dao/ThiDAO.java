package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBconnect;
import model.Thi;

public class ThiDAO {

	public boolean insert(Thi t) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="insert into thi values (?,?,?,?,?)";
		PreparedStatement ps;
		try{
			ps=con.prepareCall(sql);
			ps.setString(1, t.getUserName());
			ps.setString(2, t.getMaDe());
			ps.setString(3, t.getMaCH());
			ps.setString(4, t.getDAuser());
			ps.setInt(5, t.getDiem());
			ps.executeUpdate();
			return true;
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return false;
	}
	public Thi getWithMaCH(String maCH,String username) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="select * from thi where MaCH='"+maCH+"' and UserName='"+username+"'";
		PreparedStatement ps=con.prepareCall(sql);
		ResultSet rs=ps.executeQuery();
		try{
			Thi thi=new Thi();	
			while(rs.next()){
				thi.setMaCH(rs.getString("MaCH"));
				thi.setUserName(rs.getString("UserName"));
				thi.setMaDe(rs.getString("MaDe"));
				thi.setDAuser(rs.getString("DAUser"));
				thi.setDiem(rs.getInt("Diem"));
				return thi;
			}
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	
		return null;
	}
	public Thi getWithUser(String username) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="select * from thi where UserName='"+username+"'";
		PreparedStatement ps=con.prepareCall(sql);
		ResultSet rs=ps.executeQuery();
		try{
			Thi thi=new Thi();	
			while(rs.next()){
				thi.setMaCH(rs.getString("MaCH"));
				thi.setUserName(rs.getString("UserName"));
				thi.setMaDe(rs.getString("MaDe"));
				thi.setDAuser(rs.getString("DAUser"));
				thi.setDiem(rs.getInt("Diem"));
				return thi;
			}
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	
		return null;
	}
	public boolean update(Thi t) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="update thi SET DAUser=?,Diem=? where UserName=? and MaDe=? and MaCH=?";
		try{
		PreparedStatement ps=con.prepareCall(sql);
		ps.setString(1, t.getDAuser());
		ps.setInt(2, t.getDiem());
		ps.setString(3, t.getUserName());
		ps.setString(4, t.getMaDe());
		ps.setString(5, t.getMaCH());
		ps.executeUpdate();
		return true;
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return false;
	}
	public int countRight(String Username, String maDe) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="select count(Diem) as SL from thi where UserName='"+Username+"' and MaDe='"+maDe+"' and Diem=1 ";
		PreparedStatement ps;
		int dem=0;
		try{
			ps=con.prepareCall(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				dem=rs.getInt("SL");
			}
			return dem;
		}catch(SQLException e){
			Logger.getLogger(ThiDAO.class.getName()).log(Level.SEVERE,null,e);
		}
		return 0;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
