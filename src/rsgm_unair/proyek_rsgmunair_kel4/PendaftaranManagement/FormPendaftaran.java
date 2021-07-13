package rsgm_unair.proyek_webapps_kel4.PendaftaranManagement;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;


@Data public class FormPendaftaran{

	private String nama;
	private String nik;
	private String jenisKelamin;
	private String alamat;
	private String usia;
	private String golonganDarah;
	private String agama;
	private String tanggalDaftar;
	private String email;
	private String keluhan;
	private String deskripsiKeluhan;
	
}