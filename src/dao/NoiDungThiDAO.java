package dao;

import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.MonHoc;
import model.NoiDung;

/**
 *
 * @author Kelvin
 */
public class NoiDungThiDAO {

	public boolean insertNDThi(NoiDung nd) throws SQLException {
		Connection connect = DBconnect.getConnecttion();
		String sql = "Insert into noidungthi values (?,?,?)";
		try {
			PreparedStatement ps = connect.prepareCall(sql);
			ps.setString(1, nd.getMaND());
			ps.setString(2, nd.getTenND());
			ps.setString(3, nd.getMaMH());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			Logger.getLogger(NoiDungThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}

	public ArrayList<NoiDung> getListND() throws SQLException {
		Connection con = DBconnect.getConnecttion();
		String sql = "select * from noidungthi";
		PreparedStatement ps = con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<NoiDung> list = new ArrayList<>();
		while (rs.next()) {
			NoiDung noiDung = new NoiDung();
			noiDung.setMaND(rs.getString("MaND"));
			noiDung.setTenND(rs.getString("TenND"));
			noiDung.setMaMH(rs.getString("MaMH"));
			list.add(noiDung);
		}
		return list;
	}

	public static boolean check(String maND) {
		Connection con = DBconnect.getConnecttion();
		String sql = "select * from noidungthi where MaND='" + maND + "'";
		PreparedStatement ps;
		try {
			ps = con.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				con.close();
				return true;
			}
		} catch (SQLException e) {
			Logger.getLogger(NoiDungThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}
	public ArrayList<NoiDung> getListNDwithMH(String maMH) throws SQLException
	{
		Connection con=DBconnect.getConnecttion();
		String sql="select * from noidungthi where MaMH='"+maMH+"'";
		PreparedStatement ps=con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<NoiDung> list=new ArrayList<>();
		while(rs.next()) {
			NoiDung n =new NoiDung();
			n.setMaND(rs.getString("MaND"));
			n.setTenND(rs.getString("TenND"));
			list.add(n);
		}
		return list;
	}
	public boolean update(NoiDung nd){
    	Connection connect=DBconnect.getConnecttion();
        String sql="update noidungthi set TenND=?, MaMH=? where MaND=?";
        PreparedStatement ps;
        try {
            ps=connect.prepareCall(sql);
            ps.setString(1, nd.getTenND());
            ps.setString(2, nd.getMaMH());
            ps.setString(3, nd.getMaND());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(MonhocDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
    }
	public boolean delete(String maND){
		Connection connect=DBconnect.getConnecttion();
        String sql="delete from noidungthi where MaND='"+maND+"'";
        PreparedStatement ps;
        try {
            ps=connect.prepareCall(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(NoiDungThiDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
	}
	public static void main(String[] args) {

	}
}
