<%@ page import="rsgm_unair.proyek_webapps_kel4.PendaftaranManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject pendaftaran = null;

if(action != null && action.equals("add_pendaftaran")){
	
	FormPendaftaran fpd = new FormPendaftaran();
	fpd.setNama(request.getParameter("nama"));
	fpd.setNik(request.getParameter("nik"));
	fpd.setJenisKelamin(request.getParameter("jenisKelamin"));
	fpd.setAlamat(request.getParameter("alamat"));
	fpd.setUsia(request.getParameter("usia"));
	fpd.setGolonganDarah(request.getParameter("golonganDarah"));
	fpd.setAgama(request.getParameter("agama"));
	fpd.setTanggalDaftar(request.getParameter("tanggalDaftar"));
	fpd.setEmail(request.getParameter("email"));
	fpd.setKeluhan(request.getParameter("keluhan"));
	fpd.setDeskripsiKeluhan(request.getParameter("deskripsiKeluhan"));
	
	resp = PendaftaranManagement.CreateEditPendaftaran(fpd);	
}

if(pendaftaran == null){
	pendaftaran = PendaftaranManagement.createNewPendaftaran();
}
%>
<div class="pure-u">
	<h2>Pendaftaran Pasien</h2>
	<hr>
	<% if(resp != null && resp.getKode() == Response.ERROR){ %>
		<h4 align="center" style="background-color:red;"><%=resp.getPesan()%></h4>
	<% }else if(resp != null && resp.getKode() == Response.OK){ %>
		<h4 align="center" style="background-color:blue;"><%=resp.getPesan()%></h4>
	<% } %>
</div>

<div class="pure-u">
	<form class="pure-form pure-form-aligned" method="post" action="?act=new_pendaftaran">
	<input type="hidden" name="action" value="add_pendaftaran" />
		<fieldset>
			<div class="pure-control-group">
				<label for="aligned-nama">Nama</label>
				<input type="text" name="nama" id="aligned-nama" placeholder="Nama" value="<%=pendaftaran.getString("nama")%>" />
			</div>
			<div class="pure-control-group">
				<label for="aligned-nik">NIK</label>
				<input type="text" name="nik" id="aligned-nik" placeholder="NIK" value="<%=pendaftaran.getString("nik")%>" />
			</div>
			<div class="pure-control-group">
               <label for="multi-state">Jenis Kelamin</label>
				<select id="multi-state" name="jenisKelamin">
					<option <% if(pendaftaran.getString("jenisKelamin").equals("Laki-laki")){ %> selected="selected" <% } %>>Laki-laki</option>
					<option <% if(pendaftaran.getString("jenisKelamin").equals("Perempuan")){ %> selected="selected" <% } %>>Perempuan</option>
				</select>
			</div>
			<div class="pure-control-group">
				<label for="aligned-alamat">Alamat</label>
				<input type="text" name="alamat" id="aligned-alamat" placeholder="Alamat" value="<%=pendaftaran.getString("alamat")%>" />
			</div>
			<div class="pure-control-group">
				<label for="aligned-usia">Usia</label>
				<input type="number" name="usia" id="aligned-usia" value="<%=pendaftaran.getString("usia")%>" />
			</div>
			<div class="pure-control-group">
               <label for="multi-state">Golongan Darah</label>
				<select id="multi-state" name="golonganDarah">
					<option <% if(pendaftaran.getString("golonganDarah").equals("A")){ %> selected="selected" <% } %>>A</option>
					<option <% if(pendaftaran.getString("golonganDarah").equals("B")){ %> selected="selected" <% } %>>B</option>
					<option <% if(pendaftaran.getString("golonganDarah").equals("O")){ %> selected="selected" <% } %>>O</option>
					<option <% if(pendaftaran.getString("golonganDarah").equals("AB")){ %> selected="selected" <% } %>>AB</option>
				</select>
			</div>
			<div class="pure-control-group">
               <label for="multi-state">Agama</label>
				<select id="multi-state" name="agama">
					<option <% if(pendaftaran.getString("agama").equals("Islam")){ %> selected="selected" <% } %>>Islam</option>
					<option <% if(pendaftaran.getString("agama").equals("Kristen")){ %> selected="selected" <% } %>>Kristen</option>
					<option <% if(pendaftaran.getString("agama").equals("Katolik")){ %> selected="selected" <% } %>>Katolik</option>
					<option <% if(pendaftaran.getString("agama").equals("Hindu")){ %> selected="selected" <% } %>>Hindu</option>
					<option <% if(pendaftaran.getString("agama").equals("Buddha")){ %> selected="selected" <% } %>>Buddha</option>
					<option <% if(pendaftaran.getString("agama").equals("Khonghucu")){ %> selected="selected" <% } %>>Khonghucu</option>
				</select>
			</div>
			<div class="pure-control-group">
				<label for="aligned-tanggalDaftar">Tanggal Daftar</label>
				<input type="text" name="tanggalDaftar" id="aligned-tanggalDaftar" placeholder="DD-MM-YYYY" value="<%=pendaftaran.getString("tanggalDaftar")%>" />
			</div>
			<div class="pure-control-group">
				<label for="aligned-email">Email</label>
				<input type="text" name="email" id="aligned-email" placeholder="Email" value="<%=pendaftaran.getString("email")%>" />
			</div>
			<div class="pure-control-group">
				<label for="aligned-keluhan">Keluhan</label>
				<input type="text" name="keluhan" id="aligned-keluhan" placeholder="Keluhan" value="<%=pendaftaran.getString("keluhan")%>" />
			</div>
			<div class="pure-control-group">
				<label for="aligned-deskripsiKeluhan">Deskripsi Keluhan</label>
				<input type="text" name="deskripsiKeluhan" id="aligned-deskripsiKeluhan" placeholder="Deskripsi Keluhan" height="150px" value="<%=pendaftaran.getString("deskripsiKeluhan")%>" />
			</div>
				
			<div class="pure-controls">
					
				<input type="submit" class="pure-button pure-button-primary" value="Simpan">
			</div>
		</fieldset>
	</form>
</div>