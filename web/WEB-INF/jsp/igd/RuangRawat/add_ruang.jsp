<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.igd_management.RuangRawat.*" %>
<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%
//Alternatif menggunakan metode generator untuk No Ruang Rawat
String uniqueKey = UUID.randomUUID().toString();
String [] uniq=uniqueKey.split("-");
String uniqid= uniq[1].toUpperCase()+uniq[2].toUpperCase();

// Untuk Menambah ruang
String action = request.getParameter("action");

Response resp = null;
JSONObject user = null;

if(action != null && action.equals("add_ruang")){
	
	DataRuangRawat rr = new DataRuangRawat();
	rr.setNoruangrawat(request.getParameter("noruangrawat"));
    rr.setNamapasien(request.getParameter("namapasien"));
    rr.setTiperuangrawat(request.getParameter("tiperuangrawat"));
    rr.setTglmasuk(request.getParameter("tglmasuk"));
    rr.setStatus(request.getParameter("status"));
	resp = RuangManagement.CreateEditRuang(rr);	
}

%>
<div class="pure-u" align="center">
<h2>Form Tambah Data Ruang Rawat<h2>
<div class="pure-u" align="center">
        <% if(resp != null && resp.getKode() == Response.ERROR){ %>
            <h4 align="center" style="background-color:red;"><%=resp.getPesan()%></h4>
        <% }else if(resp != null && resp.getKode() == Response.OK){ %>
            <h4 align="center" style="background-color:green;"><%=resp.getPesan()%></h4>
        <% } %>
    </div>
</div>
<p>
<div class="pure-u">
<form class="pure-form pure-form-aligned " method="post" action="?act=add_ruang" >
    <fieldset>
        <input type="hidden" id="noruangrawat" name="action" value="add_ruang">
        <%-- <input type="hidden" id="noruangrawat" name="noruangrawat" value="<% out.print(uniqid); %>"> --%>

        <div class="pure-control-group ">
            <label for="aligned-noruangrawat">No RuangRawat</label>
            <input  class="pure-u-1-2" type="text" name="noruangrawat" id="aligned-noruangrawat" placeholder=" Isi No Ruang Rawat"  />
        </div>

        <div class="pure-control-group ">
            <label for="aligned-namepasien">Nama Pasien</label>
            <input  class="pure-u-1-2" type="text" name="namapasien" id="aligned-namapasien" placeholder=" Isi Nama Pasien"  />
        </div>

       <div class="pure-control-group">
            <label for="aligned-tiperuangrawat">Tipe Ruang</label>
            <input class= class="pure-u-1-2" type="text" name="tiperuangrawat" required=""   id="aligned-tiperuangrawat" placeholder=" Isi Tipe Ruang" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-tglmasuk">Tanggal Masuk</label>
            <input class="pure-input-1-2" type="date" name="tglmasuk"    id="aligned-tglmasuk" placeholder=" Isi Tanggal Masuk Pasien" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-status">Status Ruang</label>
            <input class="pure-input-1-2" type="text" name="status"  required=""  id="aligned-status" placeholder=" Isi Status Ruang Rawat" />
        </div>
     


        <div class="pure-controls">
            <label for="aligned-cb" class="pure-checkbox">
            <input type="checkbox" id="aligned-cb" /> I&#x27;ve read the terms and conditions</label>
            <button type="submit" class="pure-button pure-button-primary pure-u-1-2">Simpan</button>
            <a href="?act=ruangrawat"><button class="button-warning pure-input-1-2">Cancel</button></a> 
            <p></p>
        </div>
    </fieldset>
</form>
</div>
