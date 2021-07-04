<%@ page import="rsgm_unair.igd_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%
//Alternatif menggunakan metode generator untuk IDpasien
String uniqueKey = UUID.randomUUID().toString();
String [] uniq=uniqueKey.split("-");
String uniqid= uniq[1].toUpperCase()+uniq[2].toUpperCase();

// Untuk Menambah pasien
String action = request.getParameter("action");

Response resp = null;
JSONObject user = null;

if(action != null && action.equals("addruang")){
	
	DataRuangRawat fp = new DataRuangRawat();
	fp.setNoruangrawat(request.getParameter("noruangrawat"));
    fp.setNamapasien(request.getParameter("namapasien"));
    fp.setTiperuangrawat(request.getParameter("tiperuangrawat"));
    fp.setTglmasuk(request.getParameter("tglmasuk"));
    fp.setStatus(request.getParameter("status"));
	resp = RuangManagement.CreateEditRuang(fp);
	
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
<form class="pure-form pure-form-aligned " method="post" action="?act=addruang" >
    <fieldset>
        <input type="hidden" id="noruangrawat" name="action" value="addruang">
        <input type="hidden" id="noruangrawat" name="noruangrawat" value="<% out.print(uniqid); %>">


        <div class="pure-control-group ">
            <label for="aligned-namepasien">Nama Pasien</label>
            <input  class="pure-u-1-2" type="text" name="namapasien" id="aligned-namapasien" placeholder=" Isi Nama Pasien"  required=""/>
        </div>

       <div class="pure-control-group">
            <label for="aligned-tiperuangrawat">Tipe Ruang</label>
            <input class= class="pure-u-1-2" type="text" name="tiperuangrawat"  required=""  id="aligned-tiperuangrawat" placeholder=" Isi Tipe Ruang" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-tglmasuk">Tanggal Masuk</label>
            <input class="pure-input-1-2" type="date" name="tglmasuk"  id="aligned-tglmasuk" placeholder=" Isi Tanggal Masuk Pasien" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-status">Diagnosa Penyakit</label>
            <input class="pure-input-1-2" type="text" name="status"   id="aligned-status" placeholder=" Isi Status Ruang Rawat" />
        </div>
     


     <%-- COBA DIPIKIR KEMBALI < ITU REDIRECT KE MANA ??????????????? --%>
        <div class="pure-controls">
            <label for="aligned-cb" class="pure-checkbox">
            <input type="checkbox" id="aligned-cb" /> I&#x27;ve read the terms and conditions</label>
            <button type="submit" class="pure-button pure-button-primary pure-u-1-2">Simpan</button>
            <a href="?act=pasien"><button class="button-warning pure-input-1-2">Cancel</button></a> 
            <p></p>
        </div>
    </fieldset>
</form>
</div>
