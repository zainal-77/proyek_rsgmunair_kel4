<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.igd_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%
String action = request.getParameter("action");
String id= request.getParameter("noriwayat");
Response resp = null;
JSONObject riwayat = null;

riwayat = RiwayatManagement.findRiwayat(id);


if(action != null && action.equals("update_RiwayatAktivitas")){
	
    DataRiwayatAktivitas ra = new DataRiwayatAktivitas();
	ra.setNoriwayat(request.getParameter("noriwayat"));
    ra.setNoruangrawat(request.getParameter("noruangrawat"));
    ra.setNamapasien(request.getParameter("namapasien"));
    ra.setNamadokter(request.getParameter("namadokter"));
    ra.setNamaperawat(request.getParameter("namaperawat"));
    ra.setTglmasuk(request.getParameter("tglmasuk"));
    ra.setTglkeluar(request.getParameter("tglkeluar"));
    ra.setObat(request.getParameter("obat"));
    ra.setAlatkesehatan(request.getParameter("alatkesehatan"));
	resp = RiwayatManagement.CreateEditRiwayat(ra);
	
}
    %>
<script>
  window.location.href="?act=detail_pasien&noriwayat=<%=riwayat.getString("noriwayat")%>";
 </script>
 <%
    }
 %>

<div class="pure-u">
<h2>Form Update Data Riwayat Aktivitas Ruang Rawat</h2>
<div class="pure-u" align="center">
        <% if(resp != null && resp.getKode() == Response.ERROR){ %>
            <h4 align="center" style="background-color:red;"><%=resp.getPesan()%></h4>
        <% }else if(resp != null && resp.getKode() == Response.OK){ %>
            <h4 align="center" style="background-color:green;"><%=resp.getPesan()%></h4>
        <% } %>
    </div>
</div>
<div class="pure-u">
<form class="pure-form pure-form-aligned" method="post" action="?act=update_RiwayatAktivitas">
    <fieldset>
        <input type="hidden" id="noriwayat" name="action" value="update_RiwayatAktivitas">
        <input type="hidden" id="noriwayat" name="_rev" value="<%=pasien.getString("_rev")%>">
        <input type="hidden" id="noriwayat" name="noriwayat" value="<%=pasien.getString("noriwayat")%>">


        <div class="pure-control-group ">
            <label for="aligned-namepasien">No RuangRawat</label>
            <input  class="pure-u-1-2" type="text" name="noruangrawat" id="aligned-noruangrawat" placeholder=" Isi No Ruang Rawat"  value="<%=riwayat.getString("noruangrawat") %>"/>
        </div>


        <div class="pure-control-group ">
            <label for="aligned-namepasien">Nama Pasien</label>
            <input  class="pure-u-1-2" type="text" name="namapasien" id="aligned-namapasien" placeholder=" Isi Nama Pasien"  value="<%=riwayat.getString("namapasien") %>"/>
        </div>

        <div class="pure-control-group ">
            <label for="aligned-namadokter">Nama Dokter</label>
            <input  class="pure-u-1-2" type="text" name="namadokter" id="aligned-namadokter" placeholder=" Isi Nama Dokter"  value="<%=riwayat.getString("namadokter") %>"/>
        </div>

        <div class="pure-control-group ">
            <label for="aligned-namaperawat">Nama Perawat</label>
            <input  class="pure-u-1-2" type="text" name="namaperawat" id="aligned-namaperawat" placeholder=" Isi Nama Perawat"  value="<%=riwayat.getString("namaperawat") %>"/>
        </div>
        
        <div class="pure-control-group">
            <label for="aligned-tglmasuk">Tanggal Masuk</label>
            <input class="pure-input-1-2" type="date" name="tglmasuk"  id="aligned-tglmasuk" placeholder=" Isi Tanggal Masuk Pasien" value="<%=riwayat.getString("tglmasuk") %>"/>
        </div>

        <div class="pure-control-group">
            <label for="aligned-tglkeluar">Tanggal Keluar</label>
            <input class="pure-input-1-2" type="date" name="tglkeluar"  id="aligned-tglkeluar" placeholder=" Isi Tanggal Keluar Pasien" value="<%=riwayat.getString("tglkeluar") %>"/>
        </div>
       
    
        <div class="pure-control-group ">
            <label for="aligned-obat">Penggunaa Obat</label>
            <input  class="pure-u-1-2" type="text" name="obat" id="aligned-obat" placeholder=" Isi Penggunaan Obat" value="<%=riwayat.getString("obat") %>"/>
        </div>

        
        <div class="pure-control-group ">
            <label for="aligned-alatkesehatan">Alat Kesehatan</label>
            <input  class="pure-u-1-2" type="text" name="alatkesehatan" id="aligned-alatkesehatan" placeholder=" Isi Penggunaan Alat Kesehatan" value="<%=riwayat.getString("alatkesehatan") %>"/>
        </div>


    
        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">Update</button>
        </div>
    </fieldset>
</form>
        <a href="?act=pasien"><button class="button-warning pure-button" style="background: rgb(223, 117, 20);">Cancel</button></a> 

</div>
</div>