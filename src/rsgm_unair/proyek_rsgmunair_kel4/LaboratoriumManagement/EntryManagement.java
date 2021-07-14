package rsgm_unair.proyek_rsgmunair_kel4.LaboratoriumManagement;

import rsgm_unair.config.DatabaseConfig;
import rsgm_unair.shared.CouchHelper;
import rsgm_unair.shared.Utils;
import rsgm_unair.shared.Response;
import org.json.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;
import java.util.*;

public class EntryManagement{

	public static void removeEntry(String diagnosa) throws Exception{
		CouchdbClient usersClient = CouchHelper.createClient();
		
		usersClient.delDoc("entry:"+diagnosa);
		
		usersClient = null;
	}
	
	public static PagingEntry getPagingEntry(InputPagingEntry ipe) throws Exception{
        
        PagingEntry data = new PagingEntry();
		
		CouchdbClient usersClient = CouchHelper.createClient();
        
        String param = "include_docs=true";
        
        param+="&limit="+ipe.getPerPage();
        
        param += "&skip="+ipe.getOffset();
        
        if(ipe.getSearchKey() != null){
            param += "&key=\"entry:"+ipe.getSearchKey()+"\"";
        }
        
        JSONObject resultRaw = usersClient.view("entry","all",param);
        JSONArray result = resultRaw.getJSONArray("rows");
        
        List<JSONObject> resultData = new ArrayList<JSONObject>();
        
        for(int i=0;i<result.length();i++){
            JSONObject obj1 = result.getJSONObject(i);
            resultData.add(obj1.getJSONObject("doc"));
        }
        
        data.setResultList(resultData);
        int totalRows = resultRaw.getInt("total_rows");
        data.setTotalResults(totalRows);
        int resultFrom = ipe.getOffset() + 1;
        int resultTo = resultFrom + ipe.getPerPage();
        data.setResultFrom(resultFrom);
        data.setResultTo(resultTo);
        boolean hasNext = true;
        boolean hasPrev = true;
        if(resultFrom <= ipe.getPerPage()){
            hasPrev = false;
        }
        if(resultTo >= totalRows ){
            hasNext = false;
        }
        data.setHasNext(hasNext);
        data.setHasPrevious(hasPrev);
        
        int prevOffset = ipe.getOffset() - ipe.getPerPage();
        int nextOffset = ipe.getOffset() + ipe.getPerPage();
        
        data.setPreviousOffset(prevOffset);
        data.setNextOffset(nextOffset);
        
		usersClient = null;
		
		return data;
	}
		
		public static JSONObject createNewEntry(){
        JSONObject entry = new JSONObject();
		entry.put("nik","");
        entry.put("diagnosa","");
        entry.put("rujukan","");

		
        
        return entry;
    }

	public static Response CreateEditEntry(FormEntry fe) throws Exception{
		Response fr = new Response();
		fr.setKode(Response.ERROR);
		fr.setPesan("ada field kosong");
		
		if(fe.getNik() != null && !fe.getNik().trim().equals("")){
					
		if(fe.getDiagnosa() != null && !fe.getDiagnosa().trim().equals("")){
			
		if(fe.getRujukan() != null && !fe.getRujukan().trim().equals("")){
					
					CouchdbClient usersClient = CouchHelper.createClient();
                    
                    String id = "entry:"+fe.getDiagnosa();
					
					JSONObject entry = usersClient.getDoc(id);
                    
                    if(!entry.has("_id")){
                        entry = createNewEntry();
                    }
                    
					entry.put("nik",fe.getNik());					
                    entry.put("diagnosa",fe.getDiagnosa());
					entry.put("rujukan",fe.getRujukan());

					
                    usersClient.setDoc(id,entry);				
					
					usersClient = null;
					
					fr.setKode(Response.OK);
					fr.setPesan("Data Telah Disimpan");
					
				}
				
			}
		}
			return fr;
			
		}
		
		}
		
		
		

		
	
