package model;

public class CTDeThi {
	private String maDe;
	private String maCH;
	
	public CTDeThi(){
		
	}

	public CTDeThi(String maDe, String maCH) {
		super();
		this.maDe = maDe;
		this.maCH = maCH;
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
}
