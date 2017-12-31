package model;

public class CauHoi {
	private String maCH;
	private String noiDung;
	private String DapAnA;
	private String DapAnB;
	private String DapAnC;
	private String DapAnD;
	private String DapAn;
	private String maMH;
	private String maND;
	public CauHoi() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CauHoi(String maCH, String noiDung, String dapAnA, String dapAnB, String dapAnC, String dapAnD, String dapAn,
			 String maMH, String maND) {
		super();
		this.maCH = maCH;
		this.noiDung = noiDung;
		DapAnA = dapAnA;
		DapAnB = dapAnB;
		DapAnC = dapAnC;
		DapAnD = dapAnD;
		DapAn = dapAn;
		this.maMH = maMH;
		this.maND = maND;
	}
	public String getMaCH() {
		return maCH;
	}
	public void setMaCH(String maCH) {
		this.maCH = maCH;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public String getDapAnA() {
		return DapAnA;
	}
	public void setDapAnA(String dapAnA) {
		DapAnA = dapAnA;
	}
	public String getDapAnB() {
		return DapAnB;
	}
	public void setDapAnB(String dapAnB) {
		DapAnB = dapAnB;
	}
	public String getDapAnC() {
		return DapAnC;
	}
	public void setDapAnC(String dapAnC) {
		DapAnC = dapAnC;
	}
	public String getDapAnD() {
		return DapAnD;
	}
	public void setDapAnD(String dapAnD) {
		DapAnD = dapAnD;
	}
	public String getDapAn() {
		return DapAn;
	}
	public void setDapAn(String dapAn) {
		DapAn = dapAn;
	}
	public String getMaMH() {
		return maMH;
	}
	public void setMaMH(String maMH) {
		this.maMH = maMH;
	}
	public String getMaND() {
		return maND;
	}
	public void setMaND(String maND) {
		this.maND = maND;
	}
}
