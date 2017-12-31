package dao;

import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Users;

/**
 *
 * @author Kelvin
 */
public class UsersDAO {
    
    //Lay DS cac users
    public ArrayList<Users> getListUsers() throws SQLException
    {
        Connection connect=DBconnect.getConnecttion();
        String sql="Select UserName, PASSWORD, FullName, RoleID  from users";
        PreparedStatement ps=connect.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<Users> list=new ArrayList<>();
        while(rs.next()){
            Users users=new Users();
            users.setUserName(rs.getString("UserName"));
            users.setPassword(rs.getString("PASSWORD"));
            users.setFullname(rs.getString("FullName"));
            users.setRoleId(rs.getString("RoleID"));
            list.add(users);
        }
        return list;
    }
    public ArrayList<Users> getListUserswithRole(String RoleID) throws SQLException
    {
        Connection connect=DBconnect.getConnecttion();
        String sql="Select *  from users where RoleID='"+RoleID+"'";
        PreparedStatement ps=connect.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<Users> list=new ArrayList<>();
        while(rs.next()){
            Users users=new Users();
            users.setUserName(rs.getString("UserName"));
            users.setPassword(rs.getString("PASSWORD"));
            users.setFullname(rs.getString("FullName"));
            users.setGender(rs.getString("Gender"));
            users.setBirthday(rs.getDate("Birthday"));
            users.setNumberPhone(rs.getString("NumberPhone"));
            users.setAddress(rs.getString("Address"));
            users.setRoleId(rs.getString("RoleID"));
            list.add(users);
        }
        return list;
    }
    // them nguoi dùng
    public boolean insertUsers(Users u )
    {
        Connection connect=DBconnect.getConnecttion();
        String sql="Insert into users values (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps=connect.prepareCall(sql);
            ps.setString(1,u.getUserName());
            ps.setString(2,u.getPassword());
            ps.setString(3,u.getFullname());
            ps.setString(4, u.getGender());
            ps.setDate(5, u.getBirthday());
            ps.setString(6, u.getNumberPhone());
            ps.setString(7, u.getAddress());
            ps.setString(8, u.getEmail());
            ps.setString(10,u.getRoleId());
            ps.setString(9, u.getMaLop());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
             Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
    }
    public boolean check(String username)
    {
        Connection connect=DBconnect.getConnecttion();
        String sql="SELECT * FROM users WHERE UserName='"+username+"'";
        PreparedStatement ps;
        try {
            ps=connect.prepareCall(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return true; 
         }
        } catch (SQLException e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
    }
    //check Login
    public boolean checkLogin(String username, String pass, String roleid)
    {
        Connection connect=DBconnect.getConnecttion();
        String sql="SELECT * FROM users WHERE UserName='"+username+"' and PASSWORD='"+pass+"' and RoleID='"+roleid+"'";
        PreparedStatement ps;
        try {
            ps=connect.prepareCall(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return true; 
         }
        } catch (SQLException e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
    }
    public boolean checkLogin1(String username, String pass)
    {
        Connection connect=DBconnect.getConnecttion();
        String sql="SELECT * FROM users WHERE UserName='"+username+"' and PASSWORD='"+pass+"'";
        PreparedStatement ps;
        try {
            ps=connect.prepareCall(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return true; 
         }
        } catch (SQLException e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
    }
    // đăng nhập
    public Users login(String username, String password, String roleid) 
    {
            Connection con = DBconnect.getConnecttion();
            String sql = "select * from users where UserName='" + username + "' and PASSWORD='" + password + "' and RoleID='"+roleid+"'";
            PreparedStatement ps;
            try {
                    ps = con.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        Users users=new Users();
                        users.setUserName(rs.getString("UserName"));
                        users.setFullname(rs.getString("FullName"));
                        users.setGender(rs.getString("Gender"));
                        users.setBirthday(rs.getDate("Birthday"));
                        users.setNumberPhone(rs.getString("NumberPhone"));
                        users.setAddress(rs.getString("Address"));
                        users.setEmail(rs.getString("Email"));
                            return users;
                    }
            } catch (SQLException e) {
                    e.printStackTrace();
            }
            return null;
    }
    // Lấy thông tin users thông qua mã users
    public Users getUsers(String UserName) throws SQLException
    {
        Connection con=DBconnect.getConnecttion();
        String sql="Select * from users where UserName='"+UserName+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        Users users=new Users();
        while(rs.next()){
            users.setUserName(rs.getString("UserName"));
            users.setPassword(rs.getString("PASSWORD"));
            users.setFullname(rs.getString("FullName"));
            users.setGender(rs.getString("Gender"));
            users.setBirthday(rs.getDate("Birthday"));
            users.setNumberPhone(rs.getString("NumberPhone"));
            users.setAddress(rs.getString("Address"));
            users.setEmail(rs.getString("Email"));
            users.setMaLop(rs.getString("MaLop"));
        }
        return users;
    }
    // Update thông tin users
    public boolean updateUsers1(Users u) throws SQLException
    {
        Connection con=DBconnect.getConnecttion();
        String sql="Update users set PASSWORD=?, FullName=?, NumberPhone=?, Address=?, Email=? where UserName=?";
        try {
            PreparedStatement ps=con.prepareCall(sql);
            ps.setString(1, u.getPassword());
            ps.setString(2,u.getFullname());
            ps.setString(3, u.getNumberPhone());
            ps.setString(4, u.getAddress());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getUserName());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
             Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
    }
    public boolean updateUsers2(Users u) throws SQLException
    {
        Connection con=DBconnect.getConnecttion();
        String sql="Update users set FullName=?, Gender=?, Birthday=?, NumberPhone=?, Address=? where UserName=?";
        try {
            PreparedStatement ps=con.prepareCall(sql);
            ps.setString(1, u.getFullname());
            ps.setString(2,u.getGender());
            ps.setDate(3, u.getBirthday());
            ps.setString(4, u.getNumberPhone());
            ps.setString(5, u.getAddress());
            ps.setString(6, u.getUserName());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
             Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
    }
    // update password
    public boolean updatePass(Users u)
    {
    	Connection con=DBconnect.getConnecttion();
    	String sql="Update users set PASSWORD=? where UserName=?";
    	try{
    		PreparedStatement ps=con.prepareCall(sql);
    		ps.setString(1, u.getPassword());
    		ps.setString(2, u.getUserName());
    		ps.executeUpdate();
    		return true;
    		}catch(SQLException e){
    			Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, e);
    		}
    	return false;
    }
    public boolean getPassWithID(String Username){
    	Connection con=DBconnect.getConnecttion();
    	String sql="Select PASSWORD from users where UserName='"+Username+"'";
    	PreparedStatement ps;
    	try {
            ps=con.prepareCall(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    	return false;
    }
    public boolean delete(String userName){
    	Connection con=DBconnect.getConnecttion();
    	String sql="delete from users where UserName='"+userName+"'";
    	PreparedStatement ps;
    	try {
            ps=con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    	return false;
    }
    public ArrayList<Users> getDSLop() throws SQLException{
    	Connection con=DBconnect.getConnecttion();
    	String sql="Select distinct MaLop from users where RoleID='SV'";
    	PreparedStatement ps=con.prepareCall(sql);
    	ResultSet rs=ps.executeQuery();
    	ArrayList<Users> list=new ArrayList<>();
    	
    	while(rs.next()){
    		Users users=new Users();
    		users.setMaLop(rs.getString("MaLop"));
    		list.add(users);
    	}
    	return list;
    }
  
    public static void main(String[] args) throws SQLException {
       
    }
}
