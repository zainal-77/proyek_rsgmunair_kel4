<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.pasien_management.*" %>
<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%
String action = request.getParameter("action");
String id= request.getParameter("kodepasien");
Response resp = null;
JSONObject pasien = null;

pasien = PasienManagement.findPasien(id);


if(action != null && action.equals("update_pasien")){
	
	FormPasien fp = new FormPasien();
	fp.setKodepasien(request.getParameter("kodepasien"));
    fp.setNamapasien(request.getParameter("namapasien"));
    fp.setJeniskelamin(request.getParameter("jeniskelamin"));
    fp.setUmur(request.getParameter("umur"));
    fp.setKtp(request.getParameter("ktp"));
    fp.setNoKK(request.getParameter("noKK"));
    fp.setGolDarah(request.getParameter("golDarah"));
    fp.setDiagnosaPenyakit(request.getParameter("diagnosaPenyakit"));
    fp.setTglmasuk(request.getParameter("tglmasuk"));
    fp.setNoHp(request.getParameter("noHp"));
    fp.setNoHpAlt(request.getParameter("noHpAlt"));
    fp.setAlamat(request.getParameter("alamat"));
	fp.setEmail(request.getParameter("email"));
    fp.setRevpasien(request.getParameter("_rev"));
	
	resp = PasienManagement.CreateEditPasien(fp);
    %>
<script>
  window.location.href="?act=detail_pasien&kodepasien=<%=pasien.getString("kodepasien")%>";
 </script>
 <%
    }
 %>

<div class="pure-u">
<h2>Form Update Data Pasien</h2>
<div class="pure-u" align="center">
        <% if(resp != null && resp.getKode() == Response.ERROR){ %>
            <h4 align="center" style="background-color:red;"><%=resp.getPesan()%></h4>
        <% }else if(resp != null && resp.getKode() == Response.OK){ %>
            <h4 align="center" style="background-color:green;"><%=resp.getPesan()%></h4>
        <% } %>
    </div>
</div>
<div class="pure-u">
<form class="pure-form pure-form-aligned" method="post" action="?act=update_pasien">
    <fieldset>
        <input type="hidden" id="kodepasien" name="action" value="update_pasien">
        <input type="hidden" id="kodepasien" name="_rev" value="<%=pasien.getString("_rev")%>">
        <input type="hidden" id="kodepasien" name="kodepasien" value="<%=pasien.getString("kodepasien")%>">
        <%-- <div class="pure-control-group">
            <label for="aligned-kodepasien">Kode Pasien</label>
            <input class="pure-input-1-3" type="text" disabled="" id="kodepasien" name="kodepasien" value="<%=pasien.getString("kodepasien")%>">
        </div> --%>

        <div class="pure-control-group">
            <label for="aligned-namepasien">Nama Pasien</label>
            <input class="pure-u-1-2" type="text" name="namapasien" id="aligned-namapasien" placeholder=" Isi Nama Pasien" value="<%=pasien.getString("namapasien") %>"/>
        </div>

        <div class="pure-control-group">
            <label for="aligned-jeniskelamin">Jenis Kelamin </label>
            <select id="jeniskelamin" name="jeniskelamin" class="pure-u-1-2" value="<%=pasien.getString("jeniskelamin") %>">
            <option>Pria</option>
            <option>Wanita</option>
        </select>
        </div>

       <div class="pure-control-group">
            <label for="aligned-umur">Umur Pasien</label>
            <input class="pure-u-1-2" type="text" name="umur" id="aligned-umur" placeholder=" Isi Umur Pasien" value="<%=pasien.getString("umur")%>" />
        </div>

       <div class="pure-control-group">
            <label for="aligned-ktp">Identitas Pasien</label>
            <input class="pure-u-1-2" type="text" name="ktp" id="aligned-ktp" placeholder=" Isi Identitas dengan No KTP Pasien" value="<%=pasien.getString("ktp") %>"/>
        </div>

       <div class="pure-control-group">
            <label for="aligned-noKK">KK Pasien</label>
            <input class="pure-u-1-2" type="text" name="noKK" id="aligned-noKK" placeholder=" Isi NO KK Pasien" value="<%=pasien.getString("noKK") %>"/>
        </div>

        <div class="pure-control-group">
            <label for="aligned-golDarah">Tipe Golongan Darah </label>
            <select id="golDarah" name="golDarah" class="pure-u-1-2" value="<%=pasien.getString("golDarah") %>">
            <option>A</option>
            <option>B</option>
            <option>AB</option>
            <option>O</option>
        </select>
        </div>

        <div class="pure-control-group">
            <label for="aligned-diagnosaPenyakit">Diagnosa Penyakit</label>
            <input class="pure-u-1-2" type="text" name="diagnosaPenyakit" id="aligned-diagnosaPenyakit" placeholder=" Isi Diagnosa Pasien" value="<%=pasien.getString("diagnosaPenyakit")%>" />
        </div>
        
        <div class="pure-control-group">
            <label for="aligned-tglmasuk">Tanggal Masuk</label>
            <input cclass="pure-u-1-2" type="date" name="tglmasuk" id="aligned-tglmasuk" placeholder=" Isi Tanggal Masuk Pasien" value="<%=pasien.getString("tglmasuk") %>" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-noHp">No Hp</label>
            <input class="pure-u-1-2" type="text" name="noHp" id="aligned-noHp" placeholder=" Isi No HP Pasien" value="<%=pasien.getString("noHp")%>"/>
        </div>

        <div class="pure-control-group">
            <label for="aligned-noHpAlt">No Hp Alternatif</label>
            <input class="pure-u-1-2" type="text" name="noHpAlt" id="aligned-noHpAlt" placeholder=" Isi No Hp Alternatif Pasien" value="<%=pasien.getString("noHpAlt")%>" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-alamat">Alamat Lengkap</label>
            <textarea class="pure-u-1-2" name="alamat" placeholder="Isi Alamat Lengkap Pasien" ><%=pasien.getString("alamat") %></textarea>
        </div>

        <div class="pure-control-group">
            <label for="aligned-email">Email Address</label>
            <input class="pure-u-1-2" type="email" id="aligned-email" name="email" placeholder="Email Address" value="<%=pasien.getString("email") %>"/>
        </div>

    
        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">Update</button>
        </div>
    </fieldset>
</form>
        <a href="?act=pasien"><button class="button-warning pure-button" style="background: rgb(223, 117, 20);">Cancel</button></a> 

</div>
</div>