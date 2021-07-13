package rsgm_unair.proyek_rsgmunair_kel4.PendaftaranManagement;

import rsgm_unair.config.DatabaseConfig;
import rsgm_unair.shared.CouchHelper;
import rsgm_unair.shared.Utils;
import rsgm_unair.shared.Response;
import org.json.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;
import java.util.*;

public class PendaftaranManagement{
	public static Response CreateEditPendaftaran(FormPendaftaran fpd) throws Exception{
		Response fr = new Response();
		fr.setKode(Response.ERROR);
		fr.setPesan("Data yang dimasukkan tidak lengkap");
		
		if(fpd.getNama() != null && !fpd.getNama().trim().equals("")){			
			if(fpd.getNik() != null && !fpd.getNik().trim().equals("")){				
				if(fpd.getJenisKelamin() != null && !fpd.getJenisKelamin().trim().equals("")){					
					if(fpd.getAlamat() != null && !fpd.getAlamat().trim().equals("")){						
						if(fpd.getUsia() != null && !fpd.getUsia().trim().equals("")){							
							if(fpd.getGolonganDarah() != null && !fpd.getGolonganDarah().trim().equals("")){								
								if(fpd.getAgama() != null && !fpd.getAgama().trim().equals("")){									
									if(fpd.getTanggalDaftar() != null && !fpd.getTanggalDaftar().trim().equals("")){										
										if(fpd.getEmail() != null && !fpd.getEmail().trim().equals("")){											
											if(fpd.getKeluhan() != null && !fpd.getKeluhan().trim().equals("")){												
												if(fpd.getDeskripsiKeluhan() != null && !fpd.getDeskripsiKeluhan().trim().equals("")){
					
													CouchdbClient usersClient = CouchHelper.createClient();													
													String id = "pendaftaran:"+fpd.getNama()+fpd.getTanggalDaftar();													
													JSONObject pendaftaran = usersClient.getDoc(id);		
													
													pendaftaran.put("nama",fpd.getNama());
													pendaftaran.put("nik",fpd.getNik());
													pendaftaran.put("jenisKelamin",fpd.getJenisKelamin());
													pendaftaran.put("alamat",fpd.getAlamat());
													pendaftaran.put("usia",fpd.getUsia());
													pendaftaran.put("golonganDarah",fpd.getGolonganDarah());
													pendaftaran.put("agama",fpd.getAgama());
													pendaftaran.put("tanggalDaftar",fpd.getTanggalDaftar());
													pendaftaran.put("email",fpd.getEmail());
													pendaftaran.put("keluhan",fpd.getKeluhan());
													pendaftaran.put("deskripsiKeluhan",fpd.getDeskripsiKeluhan());
																										
													usersClient.setDoc(id,pendaftaran);																	
													usersClient = null;
													
													fr.setKode(Response.OK);
													fr.setPesan("Data Pendaftaran Telah Disimpan");
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return fr;
	}
	
	public static JSONObject createNewPendaftaran(){
        JSONObject pendaftaran = new JSONObject();
        pendaftaran.put("nama","");
		pendaftaran.put("nik","");
		pendaftaran.put("jenisKelamin","");
		pendaftaran.put("alamat","");
		pendaftaran.put("usia","");
		pendaftaran.put("golonganDarah","");
		pendaftaran.put("agama","");
        pendaftaran.put("tanggalDaftar","");
		pendaftaran.put("email","");
		pendaftaran.put("keluhan","");
		pendaftaran.put("deskripsiKeluhan","");
        
        return pendaftaran;
    }
	
	public static PagingDaftarPasien getPagingDaftarPasien(InputPagingDaftarPasien ipdp) throws Exception{
        PagingDaftarPasien data = new PagingDaftarPasien();
		
		CouchdbClient usersClient = CouchHelper.createClient();
        
        String param = "include_docs=true";
        
        param+="&limit="+ipdp.getPerPage();
        
        param += "&skip="+ipdp.getOffset();
        
        if(ipdp.getSearchKey() != null){
            param += "&key=\"pendaftaran:"+ipdp.getSearchKey()+"\"";
        }
        
        JSONObject resultRaw = usersClient.view("pendaftaran","all",param);
        JSONArray result = resultRaw.getJSONArray("rows");
        
        List<JSONObject> resultData = new ArrayList<JSONObject>();
        
        for(int i=0;i<result.length();i++){
            JSONObject obj1 = result.getJSONObject(i);
            resultData.add(obj1.getJSONObject("doc"));
        }
        
        data.setResultList(resultData);
        int totalRows = resultRaw.getInt("total_rows");
        data.setTotalResults(totalRows);
        int resultFrom = ipdp.getOffset()+1;
        int resultTo = resultFrom + ipdp.getPerPage();
        data.setResultFrom(resultFrom);
        data.setResultTo(resultTo);
        boolean hasNext = true;
        boolean hasPrev = true;
        if(resultFrom <= ipdp.getPerPage()){
            hasPrev = false;
        }
        if(resultTo >= totalRows ){
            hasNext = false;
        }
        data.setHasNext(hasNext);
        data.setHasPrevious(hasPrev);
        
        int prevOffset = ipdp.getOffset() - ipdp.getPerPage();
        int nextOffset = ipdp.getOffset() + ipdp.getPerPage();
        
        data.setPreviousOffset(prevOffset);
        data.setNextOffset(nextOffset);
        
		usersClient = null;
		
		return data;
	}
	
	public static JSONObject findPendaftaran(String s) throws Exception{
		CouchdbClient usersClient = CouchHelper.createClient();
		String id = "pendaftaran:"+s;
		JSONObject pendaftaran = usersClient.getDoc(id);
		usersClient = null;
        if(!pendaftaran.has("_id")){
            return null;
        }
		return pendaftaran;
	}

}