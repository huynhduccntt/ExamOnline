package model;

import java.sql.Time;

public class DeThi {
	private String maDe;
	private String tenDe;
	private String thoiGian;
	public DeThi() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DeThi(String maDe, String tenDe, String thoiGian) {
		super();
		this.maDe = maDe;
		this.tenDe = tenDe;
		this.thoiGian = thoiGian;
	}
	public String getMaDe() {
		return maDe;
	}
	public void setMaDe(String maDe) {
		this.maDe = maDe;
	}
	public String getTenDe() {
		return tenDe;
	}
	public void setTenDe(String tenDe) {
		this.tenDe = tenDe;
	}
	public String getThoiGian() {
		return thoiGian;
	}
	public void setThoiGian(String thoiGian) {
		this.thoiGian = thoiGian;
	}
	
	
}
