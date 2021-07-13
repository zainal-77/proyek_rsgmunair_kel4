<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.pasien_management.*" %>
<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%


String id= request.getParameter("kodepasien");
JSONObject pasien = PasienManagement.findPasien(id);


%>
<div>
<h2>Master Detail Pasien</h2>

</div>

<div class="pure-u" align="center">
<table class="pure-table" align="center">
    <thead>
        <tr>
            <th >Kode Pasien</th>
            <th class="pure-u-1-2"><%=pasien.getString("kodepasien") %></th>
        </tr>
    </thead>
    <tbody>
        <tr class="pure-table-odd">
            <th >Nama Pasien</th>
            <th class="pure-u-1-2"><%=pasien.getString("namapasien") %></th>
        </tr>
        <tr>
            <th  >Umur</th>
            <th class="pure-u-1-2"><%=pasien.getString("umur") %></th>
        </tr>
        <tr class="pure-table-odd">
          <th  >Tanggal Masuk</th>
            <th class="pure-u-1-2"><%=pasien.getString("tglmasuk") %></th>
        </tr>
        <tr>
             <th >DiagnosaPenyakit Pasien</th>
            <th class="pure-u-1-2"><%=pasien.getString("diagnosaPenyakit") %></th>
        </tr>
        <tr class="pure-table-odd">
          <th  >Ktp/Identitas Pasien</th>
            <th class="pure-u-1-2"><%=pasien.getString("ktp") %></th>
        </tr>
       <tr >
          <th  >KK/Identitas Pasien</th>
            <th class="pure-u-1-2"><%=pasien.getString("noKK") %></th>
        </tr>
        <tr class="pure-table-odd">
          <th >Alamat</th>
            <th class="pure-u-1-2"><%=pasien.getString("alamat") %></th>
        </tr>
         <tr>
          <th  >No Hp</th>
            <th class="pure-u-1-2"><%=pasien.getString("noHp") %></th>
        </tr>
        
        <tr class="pure-table-odd">
          <th  >No Hp Alternatif</th>
            <th class="pure-u-1-2"><%=pasien.getString("noHpAlt") %></th>
        </tr>
        
        <tr>
          <th >Email</th>
            <th class="pure-u-1-2"><%=pasien.getString("email") %></th>
        </tr>
      
    </tbody>
</table>

            <a href="?act=pasien"><button type="submit" class="pure-button pure-button-primary pure-u-1-2">Back</button></a> 

</div>
