package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.sun.org.apache.xerces.internal.dom.PSVIDOMImplementationImpl;

import connect.DBconnect;
import model.DeThi;
import model.Users;

public class DeThiDAO {

	public boolean insert(DeThi dt) throws SQLException {

		Connection con = DBconnect.getConnecttion();
		String sql = "insert into dethi values(?,?,?)";
		try {
			PreparedStatement ps = con.prepareCall(sql);

			ps.setString(1, dt.getMaDe());
			ps.setString(2, dt.getTenDe());
			ps.setString(3, dt.getThoiGian());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			Logger.getLogger(DeThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}

	public boolean delete(String maDe) throws SQLException {

		Connection con = DBconnect.getConnecttion();
		String sql = "delete from dethi where MaDe='" + maDe + "'";
		try {
			PreparedStatement ps = con.prepareCall(sql);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			Logger.getLogger(DeThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}

	public ArrayList<DeThi> getDSDeThi() throws SQLException {
		Connection con = DBconnect.getConnecttion();
		String sql = "select * from dethi";

		PreparedStatement ps = con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<DeThi> list = new ArrayList<>();

		while (rs.next()) {
			DeThi dt = new DeThi();
			dt.setMaDe(rs.getString("MaDe"));
			dt.setTenDe(rs.getString("TenDe"));
			dt.setThoiGian(rs.getString("ThoiGian"));
			list.add(dt);
		}
		return list;
	}

	public ArrayList<DeThi> getDSDTuser(String userName) throws SQLException {
		Connection con = DBconnect.getConnecttion();
		String sql = "SELECT b.UserName,b.MaDe,dt.TenDe,dt.ThoiGian from (SELECT a.UserName,a.MaLop,ky.MaDe from (select UserName,MaLop from users WHERE UserName='"
				+ userName + "') a INNER JOIN kythi ky on a.MaLop=ky.MaLop) b inner join dethi dt ON b.MaDe=dt.MaDe";
		PreparedStatement ps = con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<DeThi> list = new ArrayList<>();

		while (rs.next()) {
			DeThi dt = new DeThi();
			dt.setMaDe(rs.getString("MaDe"));
			dt.setTenDe(rs.getString("TenDe"));
			dt.setThoiGian(rs.getString("ThoiGian"));
			list.add(dt);
		}
		return list;
	}

	public DeThi CTDeThi(String maDe) throws SQLException {
		Connection con = DBconnect.getConnecttion();
		String sql = "select * from dethi where MaDe='" + maDe + "'";
		PreparedStatement ps;
		try {
			ps = con.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DeThi dt = new DeThi();
				dt.setMaDe(rs.getString("MaDe"));
				dt.setTenDe(rs.getString("TenDe"));
				dt.setThoiGian(rs.getString("ThoiGian"));
				return dt;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean update(DeThi dt){
		Connection connect=DBconnect.getConnecttion();
        String sql="update dethi set TenDe=?, ThoiGian=? where MaDe=?";
        PreparedStatement ps;
        try {
            ps=connect.prepareCall(sql);
            ps.setString(1, dt.getTenDe());
            ps.setString(2, dt.getThoiGian());
            ps.setString(3, dt.getMaDe());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DeThiDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
	}
	public static void main(String[] args) throws SQLException {
		DeThiDAO d = new DeThiDAO();
		for (DeThi deThi : d.getDSDeThi()) {
			System.out.println(deThi.getMaDe());
		}
	}
}
