package rsgm_unair.proyek_rsgmunair_kel4.user_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;


@Data public class FormUser{

	private String username;
	private String password;
	private String role;

}