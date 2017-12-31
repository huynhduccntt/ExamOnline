package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBconnect;
import model.CTThi;

public class CTThiDAO {

	public boolean insert(CTThi ctt) {
		Connection con = DBconnect.getConnecttion();
		String sql = "insert into ctthi values(?,?,?)";
		try {
			PreparedStatement ps = con.prepareCall(sql);
			ps.setString(1, ctt.getMaDe());
			ps.setString(2, ctt.getUsername());
			ps.setDouble(3, ctt.getDiem());
		
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			Logger.getLogger(CTThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}
	public CTThi getWithID(String username,String maDe){
		Connection con = DBconnect.getConnecttion();
		String sql="select * from ctthi where UserName='"+username+"' and MaDe='"+maDe+"'";
		PreparedStatement ps;
		try{
			
			ps=con.prepareCall(sql);
			ResultSet rs=ps.executeQuery();
			CTThi ctThi=new CTThi();
			while(rs.next()){
				
				ctThi.setUsername(rs.getString("UserName"));
				ctThi.setMaDe(rs.getString("MaDe"));
				ctThi.setDiem(rs.getDouble("Diem"));
				
			}
			return ctThi;
		}catch(SQLException e){
			Logger.getLogger(CTThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return null;
	}
	public ArrayList<CTThi> getwithMaDe(String maDe){
		Connection con = DBconnect.getConnecttion();
		String sql="SELECT * from ctthi where MaDe='"+maDe+"'";
		PreparedStatement ps;
		try{
			
			ps=con.prepareCall(sql);
			ResultSet rs=ps.executeQuery();
			ArrayList<CTThi> list=new ArrayList<>();
			
			while(rs.next()){
				CTThi ctThi=new CTThi();
				ctThi.setUsername(rs.getString("UserName"));
				ctThi.setMaDe(rs.getString("MaDe"));
				ctThi.setDiem(rs.getDouble("Diem"));
				list.add(ctThi);
			}
			return list;
		}catch(SQLException e){
			Logger.getLogger(CTThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return null;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
