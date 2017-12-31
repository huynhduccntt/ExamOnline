package model;

/**
 *
 * @author Kelvin
 */
public class NoiDung {
   private String maND;
   private String tenND;
   private String MaMH;

    public NoiDung() {
    }

    public NoiDung(String maND, String tenND, String MaMH) {
        this.maND = maND;
        this.tenND = tenND;
        this.MaMH = MaMH;
    }

    public String getMaND() {
        return maND;
    }

    public void setMaND(String maND) {
        this.maND = maND;
    }

    public String getTenND() {
        return tenND;
    }

    public void setTenND(String tenND) {
        this.tenND = tenND;
    }

    public String getMaMH() {
        return MaMH;
    }

    public void setMaMH(String MaMH) {
        this.MaMH = MaMH;
    }
   
   
}
