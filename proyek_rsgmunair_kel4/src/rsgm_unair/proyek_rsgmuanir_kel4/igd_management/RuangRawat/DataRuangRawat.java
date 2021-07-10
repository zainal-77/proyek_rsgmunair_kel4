package rsgm_unair.igd_management.RuangRawat;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.ToString;
import java.lang.reflect.Field;

@Data
public class DataRuangRawat {
    private String noruangrawat;
    private String namapasien;
    private String tiperuangrawat;
    private String tglmasuk;
    private String status;
    private String revruang;

    // function dibawah ini adalah alternatif untuk mempersingkat kode dengan hanya
    // memanggil function dibawah ini jika kondisi
    // seperti berikut untuk mengecek apakah null atau empty
    public boolean checkNull() throws IllegalAccessException {
        for (Field f : getClass().getDeclaredFields())
            if ((f.get(this) != null) && (f.get(this).toString().trim().isEmpty()))
                return false;
        return true;
    }
}
