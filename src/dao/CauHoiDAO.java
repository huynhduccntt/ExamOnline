package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBconnect;
import model.CauHoi;
import model.Users;

public class CauHoiDAO {

	// insert cauhoi
	public boolean insertCauHoi(CauHoi ch) {
		Connection con = DBconnect.getConnecttion();
		String sql = "insert into cauhoi values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareCall(sql);
			ps.setString(1, ch.getMaCH());
			ps.setString(2, ch.getNoiDung());
			ps.setString(3, ch.getDapAnA());
			ps.setString(4, ch.getDapAnB());
			ps.setString(5, ch.getDapAnC());
			ps.setString(6, ch.getDapAnD());
			ps.setString(7, ch.getDapAn());
			ps.setString(8, ch.getMaMH());
			ps.setString(9, ch.getMaND());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			Logger.getLogger(CauHoiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}

	public ArrayList<CauHoi> getChWithMaMhMaND(String maMH, String maND) throws SQLException {
		Connection con = DBconnect.getConnecttion();
		ArrayList<CauHoi> list = new ArrayList<>();
		String sql = "select * from cauhoi where MaMH='" + maMH + "' and MaND='" + maND + "'";
		PreparedStatement ps = con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			CauHoi cauHoi = new CauHoi();
			cauHoi.setMaCH(rs.getString("MaCH"));
			cauHoi.setNoiDung(rs.getString("NoiDung"));
			cauHoi.setDapAnA(rs.getString("PhuongAnA"));
			cauHoi.setDapAnB(rs.getString("PhuongAnB"));
			cauHoi.setDapAnC(rs.getString("PhuongAnC"));
			cauHoi.setDapAnD(rs.getString("PhuongAnD"));
			cauHoi.setDapAn(rs.getString("DapAn"));
			list.add(cauHoi);
		}
		return list;
	}

	public ArrayList<CauHoi> searchCH(String tenCH) throws SQLException {
		Connection con = DBconnect.getConnecttion();
		ArrayList<CauHoi> list = new ArrayList<>();
		String sql = "select * from cauhoi where NoiDung like '%" + tenCH + "%'";
		PreparedStatement ps = con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			CauHoi cauHoi = new CauHoi();
			cauHoi.setMaCH(rs.getString("MaCH"));
			cauHoi.setNoiDung(rs.getString("NoiDung"));
			cauHoi.setDapAnA(rs.getString("PhuongAnA"));
			cauHoi.setDapAnB(rs.getString("PhuongAnB"));
			cauHoi.setDapAnC(rs.getString("PhuongAnC"));
			cauHoi.setDapAnD(rs.getString("PhuongAnD"));
			cauHoi.setDapAn(rs.getString("DapAn"));
			cauHoi.setMaMH(rs.getString("MaMH"));
			cauHoi.setMaND(rs.getString("MaND"));
			list.add(cauHoi);
		}
		return list;
	}

	// random cau hoi
	public ArrayList<CauHoi> randomCH(String maMH, String maND, String SL) throws SQLException {
		Connection con = DBconnect.getConnecttion();
		ArrayList<CauHoi> list = new ArrayList<>();
		String sql = "select MaCH from cauhoi where MaMH='" + maMH + "' and MaND='" + maND + "' ORDER BY RAND() LIMIT "
				+ SL + "";
		PreparedStatement ps = con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			CauHoi cauHoi = new CauHoi();
			cauHoi.setMaCH(rs.getString("MaCH"));
			list.add(cauHoi);
		}
		return list;

	}

	public ArrayList<CauHoi> getListCHWithMaDe(String maDe, int firstResult, int maxResult) throws SQLException {
		Connection connection = DBconnect.getConnecttion();
		String sql = "SELECT ch.MaCH,ch.NoiDung,ch.PhuongAnA,ch.PhuongAnB,ch.PhuongAnC,ch.PhuongAnD,ch.DapAn "
				+"FROM (SELECT ct.MaCH FROM (SELECT kt.MaDe FROM (SELECT MaDe,ThoiGian from dethi WHERE MaDe='"+maDe+"') a INNER JOIN kythi kt on a.MaDe=kt.MaDe "
				+"WHERE kt.NgayThi>=CURDATE() and kt.ThoiGian<=CURTIME() and CURTIME()<=ADDTIME(kt.ThoiGian,CONCAT('00:',a.ThoiGian,':00'))) " 
				+"b inner join ctdethi ct on b.MaDe=ct.MaDe ORDER BY RAND()) c INNER JOIN cauhoi ch on c.MaCH=ch.MaCH  LIMIT ?,? ";
							
		PreparedStatement ps;
		try {
			ps = connection.prepareCall(sql);
			ps.setInt(1, firstResult);
			ps.setInt(2, maxResult);
			ResultSet rs = ps.executeQuery();
			ArrayList<CauHoi> list = new ArrayList<>();
			while (rs.next()) {
				CauHoi ch = new CauHoi();
				ch.setMaCH(rs.getString("MaCH"));
				ch.setNoiDung(rs.getString("NoiDung"));
				ch.setDapAnA(rs.getString("PhuongAnA"));
				ch.setDapAnB(rs.getString("PhuongAnB"));
				ch.setDapAnC(rs.getString("PhuongAnC"));
				ch.setDapAnD(rs.getString("PhuongAnD"));
				ch.setDapAn(rs.getString("DapAn"));
				list.add(ch);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(CauHoiDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	// tính tổng câu hỏi
	public int countCHByMaDe(String maDe) throws SQLException {
		Connection connection = DBconnect.getConnecttion();
		String sql = "SELECT COUNT(a.MaCH) as SLCH FROM (SELECT MaCH from ctdethi where MaDe='" + maDe
				+ "') a INNER JOIN cauhoi ch on a.MaCH=ch.MaCH";
		PreparedStatement ps;
		try {
			ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			int dem = 0;
			while (rs.next()) {
				dem = rs.getInt("SLCH");

			}
			return dem;
		} catch (SQLException e) {
			Logger.getLogger(CauHoiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return 0;

	}

	public CauHoi getCHwithMaCH(String maCH) throws SQLException {
		Connection con = DBconnect.getConnecttion();
		String sql = "Select * from cauhoi where MaCH='" + maCH + "'";
		PreparedStatement ps = con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		CauHoi ch = new CauHoi();
		while (rs.next()) {
			ch.setDapAn(rs.getString("DapAn"));
			return ch;
		}
		return null;
	}

	public boolean update(CauHoi ch) throws SQLException {
		Connection con = DBconnect.getConnecttion();
		String sql = "update cauhoi set NoiDung=?, PhuongAnA=?, PhuongAnB=?, PhuongAnC=?, PhuongAnD=?, DapAn=?, MaMH=?, MaND=? where MaCH=?";
		PreparedStatement ps;
		try {
			ps = con.prepareCall(sql);
			ps.setString(1, ch.getNoiDung());
			ps.setString(2, ch.getDapAnA());
			ps.setString(3, ch.getDapAnB());
			ps.setString(4, ch.getDapAnC());
			ps.setString(5, ch.getDapAnD());
			ps.setString(6, ch.getDapAn());
			ps.setString(7, ch.getMaMH());
			ps.setString(8, ch.getMaND());
			ps.setString(9, ch.getMaCH());
			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean delete(String maCH) {
		Connection con = DBconnect.getConnecttion();
		String sql = "delete from cauhoi where MaCH='" + maCH + "'";
		PreparedStatement ps;
		try {
			ps = con.prepareCall(sql);

			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) throws SQLException {
		CauHoiDAO cauHoiDAO = new CauHoiDAO();
		System.out.println(cauHoiDAO.getCHwithMaCH("CH001"));
	}
}
