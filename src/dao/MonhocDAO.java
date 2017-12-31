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

/**
 *
 * @author Kelvin
 */
public class MonhocDAO {
    
    public ArrayList<MonHoc> getlistMH() throws SQLException{
        
        Connection con=DBconnect.getConnecttion();
        String sql="select MaMH from monhoc";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<MonHoc> list=new ArrayList<>();
        while(rs.next()){
            MonHoc monhoc=new MonHoc();
            monhoc.setMaMH(rs.getString("MaMH"));
            list.add(monhoc);
        }
        return list;
        
    }
    public boolean insertMH(MonHoc mh){
        Connection connect=DBconnect.getConnecttion();
        String sql="Insert into monhoc values (?,?)";
        try {
            PreparedStatement ps=connect.prepareCall(sql);
            ps.setString(1,mh.getMaMH());
            ps.setString(2,mh.getTenMH());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
             Logger.getLogger(MonhocDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
        
    }
    public static boolean check(String maMH){
    	 Connection connect=DBconnect.getConnecttion();
         String sql="SELECT * FROM monhoc WHERE MaMH='"+maMH+"'";
         PreparedStatement ps;
         try {
             ps=connect.prepareCall(sql);
             ResultSet rs=ps.executeQuery();
             while (rs.next()) {
                 connect.close();
                 return true; 
          }
         } catch (SQLException e) {
             Logger.getLogger(MonhocDAO.class.getName()).log(Level.SEVERE,null,e);
         }
         return false;
    }
    public boolean update(MonHoc mh){
    	Connection connect=DBconnect.getConnecttion();
        String sql="update monhoc set TenMH=? where MaMH=?";
        PreparedStatement ps;
        try {
            ps=connect.prepareCall(sql);
            ps.setString(1, mh.getTenMH());
            ps.setString(2, mh.getMaMH());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(MonhocDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
    }
    public boolean delete(String maMH){
		Connection connect=DBconnect.getConnecttion();
        String sql="delete from monhoc where MaMH='"+maMH+"'";
        PreparedStatement ps;
        try {
            ps=connect.prepareCall(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(MonhocDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return false;
	}
    public static void main(String[] args) {
        
    }
}
