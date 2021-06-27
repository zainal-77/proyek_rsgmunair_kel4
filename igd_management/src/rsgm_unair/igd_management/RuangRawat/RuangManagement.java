package rsgm_unair.igd_management.RuangRawat;

import rsgm_unair.user_management.*;
import rsgm_unair.pasien_management.*;
import rsgm_unair.config.DatabaseConfig;
import rsgm_unair.shared.CouchHelper;
import rsgm_unair.shared.Utils;
import rsgm_unair.shared.Response;
import org.json.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;
import java.util.*;
import lombok.Getter;

public class RuangManagement {

	public static JSONObject findRuang(String s) throws Exception {
		CouchdbClient RuangClient = CouchHelper.createClient();
		String id = "ruang:" + s;
		JSONObject ruang = ruangClient.getDoc(id);
		ruangClient = null;
		if (!ruang.has("_id")) {
			return null;
		}
		return ruang;
	}

	public static void removeruang(String noruangrawat) throws Exception {
		CouchdbClient ruangClient = CouchHelper.createClient();
		ruangClient.delDoc(noruangrawat);
		ruangClient = null;
	}

	public static Response CreateEditruang(DataRuangRawat fp) throws Exception {
		Response fr = new Response();
		fr.setKode(Response.ERROR);
		fr.setPesan("Coba di cek Ulang field yang belum terisi, Karena Semua wajib Disi.");

		if (fp.checkNull()) {
			// code here
			CouchdbClient ruangClient = CouchHelper.createClient();

			String id = "ruang:" + fp.getnoruangrawat();

			JSONObject ruang = ruangClient.getDoc(id);

			// Digunakan Untuk Update atau Edit Data ruang
			if (fp.getRevruang() != null) {
				ruang.put("_rev", fp.getRevruang());
			}

			ruang.put("noruangrawat", fp.getnoruangrawat());
			ruang.put("namapasien", fp.getNamapasien());
			ruang.put("tiperuangrawat", fp.getTiperuangrawat());
			ruang.put("tglmasuk", fp.getTglmasuk());
			ruang.put("status", fp.getStatus());

			ruangClient.setDoc(id, ruang);

			ruangClient = null;

			fr.setKode(Response.OK);
			fr.setPesan("Data Telah Disimpan");

		}
		return fr;
	}

	public static Paging getPagingruang(InputPagingruang ipp) throws Exception {

		Paging data = new Paging();

		CouchdbClient ruangClient = CouchHelper.createClient();

		String param = "include_docs=true";

		param += "&limit=" + ipp.getPerPage();

		param += "&skip=" + ipp.getOffset();

		if (ipp.getSearchKey() != null) {
			param += "&key=\"ruang:" + ipp.getSearchKey() + "\"";
		}

		JSONObject resultRaw = ruangClient.view("ruang", "all", param);
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

		ruangClient = null;

		return data;
	}

	public static JSONObject createNewruang() {
		JSONObject ruang = new JSONObject();
		ruang.put("noruangrawat", "");
		ruang.put("namapasien", "");
		ruang.put("tiperuangrawat", "");
		ruang.put("tglmasuk", "");
		ruang.put("status", "");
		return ruang;
	}
}
