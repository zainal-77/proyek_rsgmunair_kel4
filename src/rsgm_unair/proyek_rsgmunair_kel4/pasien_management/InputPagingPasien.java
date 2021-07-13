package rsgm_unair.proyek_rsgmunair_kel4.pasien_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
public class InputPagingPasien {

	private int perPage = 10;
	private int offset = 0;
	private String searchKey;

}