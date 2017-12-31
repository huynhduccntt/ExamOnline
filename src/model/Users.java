package model;

import java.sql.Date;

/**
 *
 * @author Kelvin
 */
public class Users {
    private String UserName;
    private String Password;
    private String Fullname;
    private String Gender;
    private Date Birthday;
    private String NumberPhone;
    private String Address;
    private String Email;
    private String MaLop;
    private String roleId;
    public Users() {
    }
	public Users(String userName, String password, String fullname, String gender, Date birthday, String numberPhone,
			String address, String email, String maLop, String roleId) {
		super();
		UserName = userName;
		Password = password;
		Fullname = fullname;
		Gender = gender;
		Birthday = birthday;
		NumberPhone = numberPhone;
		Address = address;
		Email = email;
		MaLop = maLop;
		this.roleId = roleId;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getFullname() {
		return Fullname;
	}
	public void setFullname(String fullname) {
		Fullname = fullname;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public Date getBirthday() {
		return Birthday;
	}
	public void setBirthday(Date birthday) {
		Birthday = birthday;
	}
	public String getNumberPhone() {
		return NumberPhone;
	}
	public void setNumberPhone(String numberPhone) {
		NumberPhone = numberPhone;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
}