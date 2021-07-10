package rsgm_unair.pasien_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.ToString;
import java.lang.reflect.Field;

@Data
public class FormPasien {
	private String kodepasien;
	private String namapasien;
	private String jeniskelamin;
	private String umur;
	private String ktp;
	private String noKK;
	private String golDarah;
	private String diagnosaPenyakit;
	private String tglmasuk;
	private String noHp;
	private String noHpAlt;
	private String alamat;
	private String email;
	private String revpasien;

//function dibawah ini adalah alternatif untuk mempersingkat kode dengan hanya memanggil function dibawah ini jika kondisi
	//seperti berikut untuk mengecek apakah null atau empty
	public boolean checkNull() throws IllegalAccessException {
		for (Field f : getClass().getDeclaredFields())
			if ((f.get(this) != null) && (f.get(this).toString().trim().isEmpty()))
				return false;
		return true;
	}
}