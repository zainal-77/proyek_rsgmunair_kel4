package rsgm_unair.igd_management.RiwayatAktivitasRuangRawat;

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

public class RiwayatManagement {

	public static JSONObject findRiwayat(String s) throws Exception {
		CouchdbClient riwayatClient = CouchHelper.createClient();
		String id = "riwayataktivitasruang:" + s;
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

	public static Response CreateEditriwayat(DataRiwayatAktivitas ra) throws Exception {
		Response fr = new Response();
		fr.setKode(Response.ERROR);
		fr.setPesan("Coba di cek Ulang field yang belum terisi, Karena Semua wajib Disi.");

		if (ra.checkNull()) {
			// code here
			CouchdbClient riwayatClient = CouchHelper.createClient();

			String id = "riwayataktivitasruang:" + ra.getnoriwayat();

			JSONObject riwayat = riwayatClient.getDoc(id);

			// Digunakan Untuk Update atau Edit Data riwayat
			if (ra.getRevriwayat() != null) {
				riwayat.put("_rev", ra.getRevriwayat());
			}

			riwayat.put("noriwayat", ra.getNoriwayat());
			riwayat.put("namapasien", ra.getNamapasien());
			riwayat.put("namadokter", ra.getNamadokter());
			riwayat.put("namaperawat", ra.getNamaperawat());
			riwayat.put("tglmasuk", ra.getTglmasuk());
			riwayat.put("tglkeluar", ra.getTglkeluar());
			riwayat.put("obat", ra.getObat());
			riwayat.put("alatkes", ra.getAlatkes());

			riwayatClient.setDoc(id, riwayat);

			riwayatClient = null;

			fr.setKode(Response.OK);
			fr.setPesan("Data Telah Disimpan");

		}
		return fr;
	}

	public static Paging getPagingRiwayat(InputPagingRiwayat ipp) throws Exception {

		Paging data = new Paging();

		CouchdbClient riwayatClient = CouchHelper.createClient();

		String param = "include_docs=true";

		param += "&limit=" + ipp.getPerPage();

		param += "&skip=" + ipp.getOffset();

		if (ipp.getSearchKey() != null) {
			param += "&key=\"riwayataktivitas:" + ipp.getSearchKey() + "\"";
		}

		JSONObject resultRaw = riwayatClient.view("riwayataktivitas", "all", param);
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

		riwayatClient = null;

		return data;
	}

	public static JSONObject createNewriwayat() {
		JSONObject riwayat = new JSONObject();
		riwayat.put("noriwayat", "");
		riwayat.put("namapasien", "");
		riwayat.put("namadokter", "");
		riwayat.put("namaperawat", "");
		riwayat.put("tglmasuk", "");
		riwayat.put("tglkeluar", "");
		riwayat.put("obat", "");
		riwayat.put("alatkes", "");

		return riwayat;
	}
}
