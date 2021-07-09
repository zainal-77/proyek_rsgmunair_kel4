package rsgm_unair.igd_management.RiwayatAktivitasRuangRawat;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.ToString;
import java.lang.reflect.Field;

@Data
public class DataRiwayatAktivitas {
    private String noriwayat;
    private String noruangrawat;
    private String namapasien;
    private String namadokter;
    private String namaperawat;
    private String tglmasuk;
    private String tglkeluar;
    private String obat;
    private String alatmedis;
    private String revriwayat;

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
