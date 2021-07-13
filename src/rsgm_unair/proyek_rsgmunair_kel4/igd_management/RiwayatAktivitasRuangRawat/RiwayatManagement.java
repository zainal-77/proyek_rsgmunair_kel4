package rsgm_unair.proyek_rsgmunair_kel4.igd_management.RiwayatAktivitasRuangRawat;

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

public class RiwayatManagement {

	public static JSONObject findRiwayat(String s) throws Exception {
		CouchdbClient riwayatClient = CouchHelper.createClient();
		String id = "riwayat:" + s;
		JSONObject riwayat = riwayatClient.getDoc(id);
		riwayatClient = null;
		if (!riwayat.has("_id")) {
			return null;
		}
		return riwayat;
	}

	public static void removeRiwayat(String noriwayat) throws Exception {
		CouchdbClient riwayatClient = CouchHelper.createClient();
		riwayatClient.delDoc(noriwayat);
		riwayatClient = null;
	}

	public static Response CreateEditRiwayat(DataRiwayatAktivitas ra) throws Exception {
		Response rd = new Response();
		rd.setKode(Response.ERROR);
		rd.setPesan("Pastikan Field yang Required ,Wajib Diisi");

		if (ra.checkNull()) {
			// code here
			CouchdbClient riwayatClient = CouchHelper.createClient();

			String id = "riwayat:" + ra.getNoriwayat();

			JSONObject riwayat = riwayatClient.getDoc(id);

			// Digunakan Untuk Update atau Edit Data riwayat
			if (ra.getRevriwayat() != null) {
				riwayat.put("_rev", ra.getRevriwayat());
			}

			riwayat.put("noriwayat", ra.getNoriwayat());
			riwayat.put("noruangrawat", ra.getNoruangrawat());
			riwayat.put("namapasien", ra.getNamapasien());
			riwayat.put("namadokter", ra.getNamadokter());
			riwayat.put("namaperawat", ra.getNamaperawat());
			riwayat.put("tglmasuk", ra.getTglmasuk());
			riwayat.put("tglkeluar", ra.getTglkeluar());
			riwayat.put("obat", ra.getObat());
			riwayat.put("alatmedis", ra.getAlatmedis());

			riwayatClient.setDoc(id, riwayat);

			riwayatClient = null;

			rd.setKode(Response.OK);
			rd.setPesan("Data Telah Berhasil Disimpan");

		}
		return rd;
	}

	public static Paging getPagingRiwayat(InputPagingRiwayat ipa) throws Exception {

		Paging data = new Paging();

		CouchdbClient riwayatClient = CouchHelper.createClient();

		String param = "include_docs=true";

		param += "&limit=" + ipa.getPerPage();

		param += "&skip=" + ipa.getOffset();

		if (ipa.getSearchKey() != null) {
			param += "&key=\"riwayat:" + ipa.getSearchKey() + "\"";
		}

		JSONObject resultRaw = riwayatClient.view("riwayat", "all", param);
		JSONArray result = resultRaw.getJSONArray("rows");

		List<JSONObject> resultData = new ArrayList<JSONObject>();

		for (int i = 0; i < result.length(); i++) {
			JSONObject obj1 = result.getJSONObject(i);
			resultData.add(obj1.getJSONObject("doc"));
		}

		data.setResultList(resultData);
		int totalRows = resultRaw.getInt("total_rows");
		data.setTotalResults(totalRows);
		int resultFrom = ipa.getOffset() + 1;
		int resultTo = resultFrom + ipa.getPerPage();
		data.setResultFrom(resultFrom);
		data.setResultTo(resultTo);
		boolean hasNext = true;
		boolean hasPrev = true;
		if (resultFrom <= ipa.getPerPage()) {
			hasPrev = false;
		}
		if (resultTo >= totalRows) {
			hasNext = false;
		}
		data.setHasNext(hasNext);
		data.setHasPrevious(hasPrev);

		int prevOffset = ipa.getOffset() - ipa.getPerPage();
		int nextOffset = ipa.getOffset() + ipa.getPerPage();

		data.setPreviousOffset(prevOffset);
		data.setNextOffset(nextOffset);

		riwayatClient = null;

		return data;
	}

	public static JSONObject createNewRiwayat() {
		JSONObject riwayat = new JSONObject();
		riwayat.put("noriwayat", "");
		riwayat.put("noruangrawat", "");
		riwayat.put("namapasien", "");
		riwayat.put("namadokter", "");
		riwayat.put("namaperawat", "");
		riwayat.put("tglmasuk", "");
		riwayat.put("tglkeluar", "");
		riwayat.put("obat", "");
		riwayat.put("alatmedis", "");

		return riwayat;
	}
}
