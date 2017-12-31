package model;

import java.sql.Date;
import java.sql.Time;

public class KyThi {
	
	private String maDe;
	private Time thoiGian;
	private Date ngayThi;
	private String phongThi;
	private String lopThi;
	public KyThi() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KyThi(String maDe, Time thoiGian, Date ngayThi, String phongThi, String lopThi) {
		super();
		this.maDe = maDe;
		this.thoiGian = thoiGian;
		this.ngayThi = ngayThi;
		this.phongThi = phongThi;
		this.lopThi = lopThi;
	}
	public String getMaDe() {
		return maDe;
	}
	public void setMaDe(String maDe) {
		this.maDe = maDe;
	}
	public Time getThoiGian() {
		return thoiGian;
	}
	public void setThoiGian(Time thoiGian) {
		this.thoiGian = thoiGian;
	}
	public Date getNgayThi() {
		return ngayThi;
	}
	public void setNgayThi(Date ngayThi) {
		this.ngayThi = ngayThi;
	}
	public String getPhongThi() {
		return phongThi;
	}
	public void setPhongThi(String phongThi) {
		this.phongThi = phongThi;
	}
	public String getLopThi() {
		return lopThi;
	}
	public void setLopThi(String lopThi) {
		this.lopThi = lopThi;
	}
}
