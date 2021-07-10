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

if(action != null && action.equals("addpasien")){
	
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
	
	resp = PasienManagement.CreateEditPasien(fp);
	
}

%>
<div class="pure-u" align="center">
<h2>Form Tambah Data Pasien<h2>
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
<form class="pure-form pure-form-aligned " method="post" action="?act=addpasien" >
    <fieldset>
        <input type="hidden" id="kodepasien" name="action" value="addpasien">
        <input type="hidden" id="kodepasien" name="kodepasien" value="<% out.print(uniqid); %>">


        <div class="pure-control-group ">
            <label for="aligned-namepasien">Nama Pasien</label>
            <input  class="pure-u-1-2" type="text" name="namapasien" id="aligned-namapasien" placeholder=" Isi Nama Pasien"  required=""/>
        </div>

        <div class="pure-control-group" >
            <label for="aligned-jeniskelamin">Jenis Kelamin</label>
            <select id="jeniskelamin" name="jeniskelamin" class="pure-input-1-3"  required="">
            <option >Pria</option>
            <option >Wanita</option>
        </select>
        </div>

       <div class="pure-control-group">
            <label for="aligned-umur">Umur Pasien</label>
            <input class= class="pure-u-1-2" type="text" name="umur"  required=""  id="aligned-umur" placeholder=" Isi Umur Pasien" />
        </div>

       <div class="pure-control-group">
            <label for="aligned-ktp">Identitas Pasien</label>
            <input class="pure-input-1-2"type="text" name="ktp" id="aligned-ktp"  placeholder=" Isi Identitas dengan No KTP Pasien" />
        </div>

       <div class="pure-control-group">
            <label for="aligned-noKK">KK Pasien</label>
            <input class="pure-input-1-2" type="text" name="noKK" id="aligned-noKK"   placeholder=" Isi NO KK Pasien" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-golDarah">Tipe Golongan Darah</label>
            <select id="golDarah" name="golDarah" class="pure-input-1-3"  >
            <option>A</option>
            <option>B</option>
            <option>AB</option>
            <option>O</option>
        </select>
        </div>

        <div class="pure-control-group">
            <label for="aligned-diagnosaPenyakit">Diagnosa Penyakit</label>
            <input class="pure-input-1-2" type="text" name="diagnosaPenyakit"   id="aligned-diagnosaPenyakit" placeholder=" Isi Diagnosa Pasien" />
        </div>
        
        <div class="pure-control-group">
            <label for="aligned-tglmasuk">Tanggal Masuk</label>
            <input class="pure-input-1-2" type="date" name="tglmasuk"  id="aligned-tglmasuk" placeholder=" Isi Tanggal Masuk Pasien" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-noHp">No Hp</label>
            <input class="pure-input-1-2" type="text" name="noHp"   id="aligned-noHp" placeholder=" Isi No HP Pasien" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-noHpAlt">No Hp Alt</label>
            <input class="pure-input-1-2" type="text" name="noHpAlt"  required="" id="aligned-noHpAlt" placeholder=" Isi No Hp Alternatif Pasien" />
        </div>

        <div class="pure-control-group">
            <label for="aligned-alamat">Alamat</label>
            <textarea class="pure-input-1-2" name="alamat" required="" placeholder="Isi Alamat Lengkap Pasien"></textarea>
        </div>

        <div class="pure-control-group">
            <label for="aligned-email">Email Address</label>
            <input type="email" id="aligned-email" class="pure-input-1-2" name="email"  required="" placeholder="Email Address" />
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
