package rsgm_unair.proyek_rsgmunair_kel4.LaboratoriumManagement;

import rsgm_unair.config.DatabaseConfig;
import rsgm_unair.shared.CouchHelper;
import rsgm_unair.shared.Utils;
import rsgm_unair.shared.Response;
import org.json.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;
import java.util.*;

public class LaboratoriumManagement{

	public static void removeAntri(String nama) throws Exception{
		CouchdbClient usersClient = CouchHelper.createClient();
		
		usersClient.delDoc("antri:"+nama);
		
		usersClient = null;
	}
	
	public static PagingAntri getPagingAntri(InputPagingAntri ipa) throws Exception{
        
        PagingAntri data = new PagingAntri();
		
		CouchdbClient usersClient = CouchHelper.createClient();
        
        String param = "include_docs=true";
        
        param+="&limit="+ipa.getPerPage();
        
        param += "&skip="+ipa.getOffset();
        
        if(ipa.getSearchKey() != null){
            param += "&key=\"antri:"+ipa.getSearchKey()+"\"";
        }
        
        JSONObject resultRaw = usersClient.view("antri","all",param);
        JSONArray result = resultRaw.getJSONArray("rows");
        
        List<JSONObject> resultData = new ArrayList<JSONObject>();
        
        for(int i=0;i<result.length();i++){
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
        if(resultFrom <= ipa.getPerPage()){
            hasPrev = false;
        }
        if(resultTo >= totalRows ){
            hasNext = false;
        }
        data.setHasNext(hasNext);
        data.setHasPrevious(hasPrev);
        
        int prevOffset = ipa.getOffset() - ipa.getPerPage();
        int nextOffset = ipa.getOffset() + ipa.getPerPage();
        
        data.setPreviousOffset(prevOffset);
        data.setNextOffset(nextOffset);
        
		usersClient = null;
		
		return data;
	}
		
		public static JSONObject createNewAntri(){
        JSONObject Antri = new JSONObject();
        Antri.put("nik","");
        Antri.put("nama","");
        Antri.put("jenisKelamin","");
        Antri.put("usia","");
        Antri.put("askes","");
		
        
        return Antri;
    }

	public static Response CreateEditAntri(FormAntri fa) throws Exception{
		Response fr = new Response();
		fr.setKode(Response.ERROR);
		fr.setPesan("ada field kosong");
		
		
		if(fa.getNik() != null && !fa.getNik().trim().equals("")){
			
		if(fa.getNama() != null && !fa.getNama().trim().equals("")){
			
		if(fa.getJenisKelamin() != null && !fa.getJenisKelamin().trim().equals("")){
				
		if(fa.getUsia() != null && !fa.getUsia().trim().equals("")){
			
		if(fa.getAskes() != null && !fa.getAskes().trim().equals("")){	
					
					CouchdbClient usersClient = CouchHelper.createClient();
                    
                    String id = "antri:"+fa.getNama();
					
					JSONObject antri = usersClient.getDoc(id);
                    
                    if(!antri.has("_id")){
                        antri = createNewAntri();
                    }
                    
                    antri.put("nik",fa.getNik());
					antri.put("nama",fa.getNama());
                    antri.put("jenisKelamin",fa.getJenisKelamin());
					antri.put("usia",fa.getUsia());
					antri.put("askes",fa.getAskes());
					
                    usersClient.setDoc(id,antri);				
					
					usersClient = null;
					
					fr.setKode(Response.OK);
					fr.setPesan("Data Telah Disimpan");
					
				}
				
			}
			
		}
		
		}
		
		}
		
		return fr;
	}	
	
}