<%@ page import="rsgm_unair.Pasien_management.*" %>
<%@ page import="rsgm_unair.igd_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%


String id= request.getParameter("noriwayat");
JSONObject Riwayat = RiwayatManagement.findRiwayat(id);


%>
<div>
<h2>Master Detail Riwayat</h2>

</div>

<div class="pure-u" align="center">
<table class="pure-table" align="center">
    <thead>
        <tr>
            <th >No Riwayat</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("noriwayat") %></th>
        </tr>
    </thead>
    <tbody>
        <tr class="pure-table-odd">
            <th >No Ruang</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("noruang") %></th>
        </tr>
        <tr>
            <th>Nama Pasien</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("namapasien") %></th>
        </tr>
        <tr class="pure-table-odd">
          <th>Nama Dokter</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("namadokter") %></th>
        </tr>
        <tr>
             <th>Nama Perawat</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("namaperawat") %></th>
        </tr>
        <tr class="pure-table-odd">
          <th>Tanggal Masuk</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("tglmasuk") %></th>
        </tr>
     
        <tr>
          <th>Tanggal Keluar</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("tglkeluar") %></th>
        </tr>
      
      
        <tr>
          <th>Penggunaan Obat</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("obat") %></th>
        </tr>
        
        <tr>
          <th>Penggunaan Alat Medis</th>
            <th class="pure-u-1-2"><%=Riwayat.getString("alatkesehatan") %></th>
        </tr>
    </tbody>
</table>

            <a href="?act=riwayataktivitas"><button type="submit" class="pure-button pure-button-primary pure-u-1-2">Back</button></a> 

</div>
