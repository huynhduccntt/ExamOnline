package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import connect.DBconnect;
import model.KyThi;

public class KyThiDAO {

	public boolean insert(KyThi kt) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="insert into kythi values(?,?,?,?,?)";
		PreparedStatement ps=con.prepareCall(sql);
		try{
			ps.setString(1, kt.getMaDe());
			ps.setString(2, kt.getLopThi());
			ps.setTime(3,kt.getThoiGian());
			ps.setDate(4, kt.getNgayThi());
			ps.setString(5, kt.getPhongThi());
			ps.executeUpdate();
			return true;
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return false;
	}
	public boolean update(KyThi kt) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="update kythi set ThoiGian=?, NgayThi=?, PhongThi=? where MaDe=? and MaLop=?";
		PreparedStatement ps=con.prepareCall(sql);
		try{
			ps.setTime(1,kt.getThoiGian());
			ps.setDate(2, kt.getNgayThi());
			ps.setString(3, kt.getPhongThi());
			ps.setString(4, kt.getMaDe());
			ps.setString(5, kt.getLopThi());
			ps.executeUpdate();
			return true;
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return false;
	}
	public boolean delete(String made) throws SQLException{
		Connection con=DBconnect.getConnecttion();
		String sql="delete from kythi where MaDe='"+made+"'";
		PreparedStatement ps;
		try{
			ps=con.prepareCall(sql);
			ps.executeUpdate();
			return true;
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return false;
	}
	public KyThi getWithMaDe(String maDe){
		Connection con=DBconnect.getConnecttion();
		String sql="select * from kythi where MaDe='"+maDe+"'";
		PreparedStatement ps;
		KyThi thi=new KyThi();
		try{
			ps=con.prepareCall(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				thi.setMaDe(rs.getString("MaDe"));
				thi.setNgayThi(rs.getDate("NgayThi"));
				thi.setPhongThi(rs.getString("PhongThi"));
				thi.setLopThi(rs.getString("MaLop"));
				thi.setThoiGian(rs.getTime("ThoiGian"));
			}
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return thi;
	}
	public KyThi getWithTG(){
		Connection con=DBconnect.getConnecttion();
		String sql="SELECT * from kythi where NgayThi>=CURDATE() and ThoiGian>=CURTIME()";
		PreparedStatement ps;
		KyThi thi=new KyThi();
		try{
			ps=con.prepareCall(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				return thi;
			}
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
