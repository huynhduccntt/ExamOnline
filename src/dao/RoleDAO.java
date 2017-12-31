package dao;

import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

/**
 *
 * @author Kelvin
 */
public class RoleDAO {
	public ArrayList<Role> getListRole() throws SQLException {
		Connection con = DBconnect.getConnecttion();
		String sql = "select * from role";
		PreparedStatement ps = con.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Role> list = new ArrayList<Role>();
		while (rs.next()) {
			Role role = new Role();
			role.setRoleID(rs.getString("RoleID"));
			role.setRoleName(rs.getString("RoleName"));
			list.add(role);
		}
		return list;
	}

	public boolean insertRole(Role r) {
		Connection con = DBconnect.getConnecttion();
		String sql = "Insert into role values (?,?)";
		try {
			PreparedStatement ps = con.prepareCall(sql);
			ps.setString(1, r.getRoleID());
			ps.setString(2, r.getRoleName());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}

	public boolean update(Role r) {
		Connection con = DBconnect.getConnecttion();
		String sql = "update role set RoleName=? where RoleID=?";
		try {
			PreparedStatement ps = con.prepareCall(sql);

			ps.setString(1, r.getRoleName());
			ps.setString(2, r.getRoleID());

			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}

	public boolean delete(String roleID) {
		Connection connect = DBconnect.getConnecttion();
		String sql = "delete from role WHERE RoleID='" + roleID + "'";
		PreparedStatement ps;
		try {
			ps = connect.prepareCall(sql);
			ps.executeUpdate();

			return true;
		} catch (SQLException e) {
			Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}

	public boolean check(String roleid) {
		Connection connect = DBconnect.getConnecttion();
		String sql = "SELECT * FROM role WHERE RoleID='" + roleid + "'";
		PreparedStatement ps;
		try {
			ps = connect.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				return true;
			}
		} catch (SQLException e) {
			Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		return false;
	}

	public static void main(String[] args) throws SQLException {
		RoleDAO dao = new RoleDAO();
		for (Role ds : dao.getListRole()) {
			System.out.println(ds.getRoleID());
		}
	}
}
