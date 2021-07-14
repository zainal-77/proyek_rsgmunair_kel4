package rsgm_unair.proyek_rsgmunair_kel4.ApotekManagement;

import rsgm_unair.config.DatabaseConfig;
import rsgm_unair.shared.CouchHelper;
import rsgm_unair.shared.Utils;
import rsgm_unair.shared.Response;
import org.json.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;
import java.util.*;

public class ApotekManagement{
	
		public static Response CreateEditForumPasien(ForumPasien fp) throws Exception{
		Response fr = new Response();
		fr.setKode(Response.ERROR);
		fr.setPesan("ada field kosong");
		
		if(fp.getNama() != null && !fp.getNama().trim().equals("")){
			
			if(fp.getDokter() != null && !fp.getDokter().trim().equals("")){
				
				if(fp.getObat() != null && !fp.getObat().trim().equals("")){
					
					if(fp.getJumlah() != null && !fp.getJumlah().trim().equals("")){
						
					
							CouchdbClient usersClient = CouchHelper.createClient();
							
							String id = "order:"+fp.getNama();
							
							JSONObject order = usersClient.getDoc(id);
														
							order.put("nama",fp.getNama());
							order.put("dokter",fp.getDokter());
							order.put("obat",fp.getObat());
							order.put("jumlah",fp.getJumlah());

                usersClient.setDoc(id,order);				
							
							usersClient = null;
							
							fr.setKode(Response.OK);
							fr.setPesan("Data Pasien Telah Disimpan");
						
						}
					
					}
					
				}
				
			}
			
		
		return fr;
	}
	
	public static JSONObject createNewForumPasien(){
        JSONObject order = new JSONObject();
        order.put("nama","");
        order.put("dokter","");
		order.put("obat","");
		order.put("jumlah","");
		
        
        return order;
    }

    

public static PagingForumPasien getPagingForumPasien(InputPagingForumPasien ipp) throws Exception{
        
        PagingForumPasien data = new PagingForumPasien();
		
		CouchdbClient usersClient = CouchHelper.createClient();
        
        String param = "include_docs=true";
        
        param+="&limit="+ipp.getPerPage();
        
        param += "&skip="+ipp.getOffset();
        
        if(ipp.getSearchKey() != null){
            param += "&key=\"order:"+ipp.getSearchKey()+"\"";
        }
        
        JSONObject resultRaw = usersClient.view("order","all",param);
        JSONArray result = resultRaw.getJSONArray("rows");
        
        List<JSONObject> resultData = new ArrayList<JSONObject>();
        
        for(int i=0;i<result.length();i++){
            JSONObject obj1 = result.getJSONObject(i);
            resultData.add(obj1.getJSONObject("doc"));
        }
        
        data.setResultList(resultData);
        int totalRows = resultRaw.getInt("total_rows");
        data.setTotalResults(totalRows);
        int resultFrom = ipp.getOffset()+1;
        int resultTo = resultFrom + ipp.getPerPage();
        data.setResultFrom(resultFrom);
        data.setResultTo(resultTo);
        boolean hasNext = true;
        boolean hasPrev = true;
        if(resultFrom <= ipp.getPerPage()){
            hasPrev = false;
        }
        if(resultTo >= totalRows ){
            hasNext = false;
        }
        data.setHasNext(hasNext);
        data.setHasPrevious(hasPrev);
        
        int prevOffset = ipp.getOffset() - ipp.getPerPage();
        int nextOffset = ipp.getOffset() + ipp.getPerPage();
        
        data.setPreviousOffset(prevOffset);
        data.setNextOffset(nextOffset);
        
		usersClient = null;
		
		return data;
	}

public static PagingLaporanBulanan getPagingLaporanBulanan(InputPagingLaporanBulanan ipp) throws Exception{
        
        PagingLaporanBulanan data = new PagingLaporanBulanan();
		
		CouchdbClient usersClient = CouchHelper.createClient();
        
        String param = "include_docs=true";
        
        param+="&limit="+ipp.getPerPage();
        
        param += "&skip="+ipp.getOffset();
        
        if(ipp.getSearchKey() != null){
            param += "&key=\"laporanbulanan:"+ipp.getSearchKey()+"\"";
        }
        
        JSONObject resultRaw = usersClient.view("laporanbulanan","all",param);
        JSONArray result = resultRaw.getJSONArray("rows");
        
        List<JSONObject> resultData = new ArrayList<JSONObject>();
        
        for(int i=0;i<result.length();i++){
            JSONObject obj1 = result.getJSONObject(i);
            resultData.add(obj1.getJSONObject("doc"));
        }
        
        data.setResultList(resultData);
        int totalRows = resultRaw.getInt("total_rows");
        data.setTotalResults(totalRows);
        int resultFrom = ipp.getOffset()+1;
        int resultTo = resultFrom + ipp.getPerPage();
        data.setResultFrom(resultFrom);
        data.setResultTo(resultTo);
        boolean hasNext = true;
        boolean hasPrev = true;
        if(resultFrom <= ipp.getPerPage()){
            hasPrev = false;
        }
        if(resultTo >= totalRows ){
            hasNext = false;
        }
        data.setHasNext(hasNext);
        data.setHasPrevious(hasPrev);
        
        int prevOffset = ipp.getOffset() - ipp.getPerPage();
        int nextOffset = ipp.getOffset() + ipp.getPerPage();
        
        data.setPreviousOffset(prevOffset);
        data.setNextOffset(nextOffset);
        
		usersClient = null;
		
		return data;
	}

    public static PagingDaftarObat getPagingDaftarObat(InputPagingDaftarObat ipp) throws Exception{
        
        PagingDaftarObat data = new PagingDaftarObat();
		
		CouchdbClient usersClient = CouchHelper.createClient();
        
        String param = "include_docs=true";
        
        param+="&limit="+ipp.getPerPage();
        
        param += "&skip="+ipp.getOffset();
        
        if(ipp.getSearchKey() != null){
            param += "&key=\"daftarobat:"+ipp.getSearchKey()+"\"";
        }
        
        JSONObject resultRaw = usersClient.view("daftarobat","all",param);
        JSONArray result = resultRaw.getJSONArray("rows");
        
        List<JSONObject> resultData = new ArrayList<JSONObject>();
        
        for(int i=0;i<result.length();i++){
            JSONObject obj1 = result.getJSONObject(i);
            resultData.add(obj1.getJSONObject("doc"));
        }
        
        data.setResultList(resultData);
        int totalRows = resultRaw.getInt("total_rows");
        data.setTotalResults(totalRows);
        int resultFrom = ipp.getOffset()+1;
        int resultTo = resultFrom + ipp.getPerPage();
        data.setResultFrom(resultFrom);
        data.setResultTo(resultTo);
        boolean hasNext = true;
        boolean hasPrev = true;
        if(resultFrom <= ipp.getPerPage()){
            hasPrev = false;
        }
        if(resultTo >= totalRows ){
            hasNext = false;
        }
        data.setHasNext(hasNext);
        data.setHasPrevious(hasPrev);
        
        int prevOffset = ipp.getOffset() - ipp.getPerPage();
        int nextOffset = ipp.getOffset() + ipp.getPerPage();
        
        data.setPreviousOffset(prevOffset);
        data.setNextOffset(nextOffset);
        
		usersClient = null;
		
		return data;
	}
    
    public static JSONObject findOrder(String s) throws Exception{
		CouchdbClient usersClient = CouchHelper.createClient();
		String id = "order:"+s;
		JSONObject order = usersClient.getDoc(id);
		usersClient = null;
        if(!order.has("_id")){
            return null;
        }
		return order;
	}

    public static void removeOrder(String nama) throws Exception{
		CouchdbClient usersClient = CouchHelper.createClient();
		usersClient.delDoc(nama);
		usersClient = null;
	}
}
