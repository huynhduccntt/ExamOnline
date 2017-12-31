package model;

public class CTThi {
	private String maDe;
	private String username;
	private double diem;
	public CTThi() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CTThi(String maDe, String username, double diem) {
		super();
		this.maDe = maDe;
		this.username = username;
		this.diem = diem;
	}
	public String getMaDe() {
		return maDe;
	}
	public void setMaDe(String maDe) {
		this.maDe = maDe;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public double getDiem() {
		return diem;
	}
	public void setDiem(double diem) {
		this.diem = diem;
	}
}
