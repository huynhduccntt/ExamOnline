package model;

public class Thi {

	private String userName;
	private String maDe;
	private String maCH;
	private String DAuser;
	private int diem;
	
	
	public Thi() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Thi(String userName, String maDe, String maCH, String dAuser, int diem) {
		super();
		this.userName = userName;
		this.maDe = maDe;
		this.maCH = maCH;
		DAuser = dAuser;
		this.diem = diem;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getMaDe() {
		return maDe;
	}


	public void setMaDe(String maDe) {
		this.maDe = maDe;
	}


	public String getMaCH() {
		return maCH;
	}


	public void setMaCH(String maCH) {
		this.maCH = maCH;
	}


	public String getDAuser() {
		return DAuser;
	}


	public void setDAuser(String dAuser) {
		DAuser = dAuser;
	}


	public int getDiem() {
		return diem;
	}


	public void setDiem(int diem) {
		this.diem = diem;
	}


}
