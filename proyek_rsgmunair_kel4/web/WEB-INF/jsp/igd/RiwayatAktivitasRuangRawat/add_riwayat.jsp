<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.igd_management.RiwayatAktivitasRuangRawat.*" %>
<%@ page import="rsgm_unair.igd_management.RuangRawat.RuangManagement." %>
<%@ page import="rsgm_unair.igd_management.RuangRawat.DataRuangRawat." %>
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

String ruang = request.getParameter("noruangrawat");
JSONObject ruang = RuangManagement.findRuang(id);

Response resp = null;
JSONObject Riwayat = null;

if(action != null && action.equals("add_riwayat")){
	
	DataRiwayatAktivitas ra = new DataRiwayatAktivitas();
	ra.setNoriwayat(request.getParameter("noriwayat"));
    ra.setNoruangrawat(request.getParameter("noruangrawat"));
    ra.setNamapasien(request.getParameter("namapasien"));
    ra.setNamadokter(request.getParameter("namadokter"));
    ra.setNamaperawat(request.getParameter("namaperawat"));
    ra.setTglmasuk(request.getParameter("tglmasuk"));
    ra.setTglkeluar(request.getParameter("tglkeluar"));
    ra.setObat(request.getParameter("obat"));
    ra.setAlatmedis(request.getParameter("alatmedis"));
	resp = RiwayatManagement.CreateEditRiwayat(ra);
	
}

%>
<div class="pure-u" align="center">
<h2>Form Tambah Data Riwayat Aktivitas Ruang Rawat<h2>
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
<form class="pure-form pure-form-aligned " method="post" action="?act=add_riwayat" >
    <fieldset>
        <input type="hidden" id="noriwayat" name="action" value="add_riwayat">
        <input type="hidden" id="noriwayat" name="noriwayat" value="<% out.print(uniqid); %>">


        <%-- <div class="pure-control-group ">
            <label for="aligned-noruangrawat">No RuangRawat</label>
            <input  class="pure-u-1-2" type="text" name="noruangrawat" id="aligned-noruangrawat" placeholder=" Isi Nama Pasien"  required=""/>
        </div> --%>

        <div class="pure-control-group">
            <label for="aligned-noruangrawat">Tipe Golongan Darah</label>
            
        <%-- <select>
            <%
            while(ra.next())
            {
            String Ruang = ra.getString("noruangrawat"); 
            %>
            <option value="<%=Ruang %>"><%=Ruang %></option>
            <%
            }
            %>
        </select> --%>

        <select id="noruangrawat" name="noruangrawat" class="pure-input-1-3">
            <c:forEach items="${noruangrawat}" var="noruangrawat" >
            <option value="${noruangrawat.noruangrawat}">${noruangrawat.value}</option>
            </c:forEach>
        </select> 
        </div>




        <div class="pure-control-group ">
            <label for="aligned-namepasien">Nama Pasien</label>
            <input  class="pure-u-1-2" type="text" name="namapasien" id="aligned-namapasien" placeholder=" Isi Nama Pasien"  required=""/>
        </div>

        <div class="pure-control-group ">
            <label for="aligned-namadokter">Nama Dokter</label>
            <input  class="pure-u-1-2" type="text" name="namadokter" id="aligned-namadokter" placeholder=" Isi Nama Dokter"  required=""/>
        </div>

        <div class="pure-control-group ">
            <label for="aligned-namaperawat">Nama Perawat</label>
            <input  class="pure-u-1-2" type="text" name="namaperawat" id="aligned-namaperawat" placeholder=" Isi Nama Perawat"  required=""/>
        </div>
        
        <div class="pure-control-group">
            <label for="aligned-tglmasuk">Tanggal Masuk</label>
            <input class="pure-input-1-2" type="date" name="tglmasuk"  id="aligned-tglmasuk" placeholder=" Isi Tanggal Masuk Pasien" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-tglkeluar">Tanggal Keluar</label>
            <input class="pure-input-1-2" type="date" name="tglkeluar"  id="aligned-tglkeluar" placeholder=" Isi Tanggal Keluar Pasien" />
        </div>
       
    
        <div class="pure-control-group ">
            <label for="aligned-obat">Penggunaa Obat</label>
            <input  class="pure-u-1-2" type="text" name="obat" id="aligned-obat" placeholder=" Isi Nama Perawat"  required=""/>
        </div>

        
        <div class="pure-control-group ">
            <label for="aligned-alatmedis">Penggunaan Alat Medis</label>
            <input  class="pure-u-1-2" type="text" name="alatmedis" id="aligned-alatmedis" placeholder=" Isi Penggunaan Alat Kesehatan"/>
        </div>



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