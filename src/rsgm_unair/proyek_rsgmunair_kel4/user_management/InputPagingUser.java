package rsgm_unair.proyek_rsgmunair_kel4.user_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class InputPagingUser{

	private int perPage = 10;
	private int offset = 0;
	private String searchKey;

}