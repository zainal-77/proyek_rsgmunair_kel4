package rsgm_unair.proyek_rsgmunair_kel4.LaboratoriumManagement;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class InputPagingEntry{

	private int perPage = 10;
	private int offset = 0;
	private String searchKey;

}