package rsgm_unair.proyek_rsgmunair_kel4.pasien_management;

import rsgm_unair.proyek_rsgmunair_kel4.user_management.*;
import rsgm_unair.config.DatabaseConfig;
import rsgm_unair.shared.CouchHelper;
import rsgm_unair.shared.Utils;
import rsgm_unair.shared.Response;
import org.json.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;
import java.util.*;
import lombok.Getter;

public class PasienManagement {

	public static JSONObject findPasien(String s) throws Exception {
		CouchdbClient pasienClient = CouchHelper.createClient();
		String id = "pasien:" + s;
		JSONObject pasien = pasienClient.getDoc(id);
		pasienClient = null;
		if (!pasien.has("_id")) {
			return null;
		}
		return pasien;
	}

	public static void removePasien(String kodepasien) throws Exception {
		CouchdbClient pasienClient = CouchHelper.createClient();
		pasienClient.delDoc(kodepasien);
		pasienClient = null;
	}

	public static Response CreateEditPasien(FormPasien fp) throws Exception {
		Response fr = new Response();
		fr.setKode(Response.ERROR);
		fr.setPesan("Coba di cek Ulang field yang belum terisi, Karena Semua wajib Disi.");

		if (fp.checkNull()) {
			// code here
			CouchdbClient pasienClient = CouchHelper.createClient();

			String id = "pasien:" + fp.getKodepasien();

			JSONObject pasien = pasienClient.getDoc(id);

			// Digunakan Untuk Update atau Edit Data Pasien
			if (fp.getRevpasien() != null) {
				pasien.put("_rev", fp.getRevpasien());
			}

			pasien.put("kodepasien", fp.getKodepasien());
			pasien.put("namapasien", fp.getNamapasien());
			pasien.put("jeniskelamin", fp.getJeniskelamin());
			pasien.put("umur", fp.getUmur());
			pasien.put("ktp", fp.getKtp());
			pasien.put("noKK", fp.getNoKK());
			pasien.put("golDarah", fp.getGolDarah());
			pasien.put("diagnosaPenyakit", fp.getDiagnosaPenyakit());
			pasien.put("tglmasuk", fp.getTglmasuk());
			pasien.put("noHp", fp.getNoHp());
			pasien.put("noHpAlt", fp.getNoHpAlt());
			pasien.put("alamat", fp.getAlamat());
			pasien.put("email", fp.getEmail());

			pasienClient.setDoc(id, pasien);

			pasienClient = null;

			fr.setKode(Response.OK);
			fr.setPesan("Data Telah Disimpan");

		}
		return fr;
	}

	public static Paging getPagingPasien(InputPagingPasien ipp) throws Exception {

		Paging data = new Paging();

		CouchdbClient pasienClient = CouchHelper.createClient();

		String param = "include_docs=true";

		param += "&limit=" + ipp.getPerPage();

		param += "&skip=" + ipp.getOffset();

		if (ipp.getSearchKey() != null) {
			param += "&key=\"pasien:" + ipp.getSearchKey() + "\"";
		}

		JSONObject resultRaw = pasienClient.view("pasien", "all", param);
		JSONArray result = resultRaw.getJSONArray("rows");

		List<JSONObject> resultData = new ArrayList<JSONObject>();

		for (int i = 0; i < result.length(); i++) {
			JSONObject obj1 = result.getJSONObject(i);
			resultData.add(obj1.getJSONObject("doc"));
		}

		data.setResultList(resultData);
		int totalRows = resultRaw.getInt("total_rows");
		data.setTotalResults(totalRows);
		int resultFrom = ipp.getOffset() + 1;
		int resultTo = resultFrom + ipp.getPerPage();
		data.setResultFrom(resultFrom);
		data.setResultTo(resultTo);
		boolean hasNext = true;
		boolean hasPrev = true;
		if (resultFrom <= ipp.getPerPage()) {
			hasPrev = false;
		}
		if (resultTo >= totalRows) {
			hasNext = false;
		}
		data.setHasNext(hasNext);
		data.setHasPrevious(hasPrev);

		int prevOffset = ipp.getOffset() - ipp.getPerPage();
		int nextOffset = ipp.getOffset() + ipp.getPerPage();

		data.setPreviousOffset(prevOffset);
		data.setNextOffset(nextOffset);

		pasienClient = null;

		return data;
	}

	public static JSONObject createNewPasien() {
		JSONObject pasien = new JSONObject();
		pasien.put("kodepasien", "");
		pasien.put("namapasien", "");
		pasien.put("jeniskelamin", "");
		pasien.put("umur", "");
		pasien.put("ktp", "");
		pasien.put("NoKK", "");
		pasien.put("golDarah", "");
		pasien.put("diagnosaPenyakit", "");
		pasien.put("tglmasuk", "");
		pasien.put("noHp", "");
		pasien.put("noHpAlt", "");
		pasien.put("alamat", "");
		pasien.put("email", "");
		return pasien;
	}
}
