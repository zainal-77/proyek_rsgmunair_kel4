package rsgm_unair.proyek_rsgmunair_kel4.igd_management.RuangRawat;

import rsgm_unair.proyek_rsgmunair_kel4.pasien_management.*;
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
		JSONObject ruang = RuangClient.getDoc(id);
		RuangClient = null;
		if (!ruang.has("_id")) {
			return null;
		}
		return ruang;
	}

	public static void removeRuang(String noruangrawat) throws Exception {
		CouchdbClient RuangClient = CouchHelper.createClient();
		RuangClient.delDoc(noruangrawat);
		RuangClient = null;
	}

	public static Response CreateEditRuang(DataRuangRawat rr) throws Exception {
		Response rp = new Response();
		rp.setKode(Response.ERROR);
		rp.setPesan("Pastikan Field yang Required ,Wajib Diisi");

		if (rr.checkNull()) {
			// code here
			CouchdbClient RuangClient = CouchHelper.createClient();

			String id = "ruang:" + rr.getNoruangrawat();

			JSONObject ruang = RuangClient.getDoc(id);

			// Digunakan Untuk Update atau Edit Data ruang
			if (rr.getRevruang() != null) {
				ruang.put("_rev", rr.getRevruang());
			}

			ruang.put("noruangrawat", rr.getNoruangrawat());
			ruang.put("namapasien", rr.getNamapasien());
			ruang.put("tiperuangrawat", rr.getTiperuangrawat());
			ruang.put("tglmasuk", rr.getTglmasuk());
			ruang.put("status", rr.getStatus());

			RuangClient.setDoc(id, ruang);

			RuangClient = null;

			rp.setKode(Response.OK);
			rp.setPesan("Data Telah Berhasil Disimpan");

		}
		return rp;
	}

	public static Paging getPagingRuang(InputPagingRuang ipr) throws Exception {

		Paging data = new Paging();

		CouchdbClient RuangClient = CouchHelper.createClient();

		String param = "include_docs=true";

		param += "&limit=" + ipr.getPerPage();

		param += "&skip=" + ipr.getOffset();

		if (ipr.getSearchKey() != null) {
			param += "&key=\"ruang:" + ipr.getSearchKey() + "\"";
		}

		JSONObject resultRaw = RuangClient.view("ruang", "all", param);
		JSONArray result = resultRaw.getJSONArray("rows");

		List<JSONObject> resultData = new ArrayList<JSONObject>();

		for (int i = 0; i < result.length(); i++) {
			JSONObject obj1 = result.getJSONObject(i);
			resultData.add(obj1.getJSONObject("doc"));
		}

		data.setResultList(resultData);
		int totalRows = resultRaw.getInt("total_rows");
		data.setTotalResults(totalRows);
		int resultFrom = ipr.getOffset() + 1;
		int resultTo = resultFrom + ipr.getPerPage();
		data.setResultFrom(resultFrom);
		data.setResultTo(resultTo);
		boolean hasNext = true;
		boolean hasPrev = true;
		if (resultFrom <= ipr.getPerPage()) {
			hasPrev = false;
		}
		if (resultTo >= totalRows) {
			hasNext = false;
		}
		data.setHasNext(hasNext);
		data.setHasPrevious(hasPrev);

		int prevOffset = ipr.getOffset() - ipr.getPerPage();
		int nextOffset = ipr.getOffset() + ipr.getPerPage();

		data.setPreviousOffset(prevOffset);
		data.setNextOffset(nextOffset);

		RuangClient = null;

		return data;
	}

	public static List<JSONObject> getAll() throws Exception {

		CouchdbClient RuangClient = CouchHelper.createClient();

		String param = "include_docs=true";

		JSONObject resultRaw = RuangClient.view("ruang", "all", param);
		JSONArray result = resultRaw.getJSONArray("rows");

		List<JSONObject> resultData = new ArrayList<JSONObject>();

		for (int i = 0; i < result.length(); i++) {
			JSONObject obj1 = result.getJSONObject(i);
			resultData.add(obj1.getJSONObject("doc"));
		}
		return resultData;
	}

	public static JSONObject createNewRuang() {
		JSONObject ruang = new JSONObject();
		ruang.put("noruangrawat", "");
		ruang.put("namapasien", "");
		ruang.put("tiperuangrawat", "");
		ruang.put("tglmasuk", "");
		ruang.put("status", "");
		return ruang;
	}
}
