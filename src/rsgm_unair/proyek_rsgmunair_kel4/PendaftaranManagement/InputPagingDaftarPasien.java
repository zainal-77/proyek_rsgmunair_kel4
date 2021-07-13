package rsgm_unair.proyek_webapps_kel4.PendaftaranManagement;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class InputPagingDaftarPasien{

	private int perPage = 10;
	private int offset = 0;
	private String searchKey;

}