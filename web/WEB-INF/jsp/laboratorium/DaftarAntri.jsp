<%@ page import="rsgm_unair.proyek_webapps_kel4.LaboratoriumManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject antri = null;

if(action != null && action.equals("add_pendaftaran")){
	
	FormAntri fa = new FormAntri();
	fa.setNik(request.getParameter("nik"));
	fa.setNama(request.getParameter("nama"));
	fa.setJenisKelamin(request.getParameter("jenisKelamin"));
	fa.setUsia(request.getParameter("usia"));
	fa.setAskes(request.getParameter("askes"));
	
	resp = LaboratoriumManagement.CreateEditAntri(fa);	
}

if(antri == null){
	antri = LaboratoriumManagement.createNewAntri();
}
%>
<div class="pure-g">
	<div class="pure-u-1-12"></div>
	<div class="pure-u-11-12" align="left">
		<h2>Pendaftaran Pasien</h2>
		<hr>
		<% if(resp != null && resp.getKode() == Response.ERROR){ %>
			<h4 align="center" style="background-color:red;"><%=resp.getPesan()%></h4>
		<% }else if(resp != null && resp.getKode() == Response.OK){ %>
			<h4 align="center" style="background-color:blue;"><%=resp.getPesan()%></h4>
		<% } %>
	</div>
</div>

<div class="pure-g">
	<div class="pure-u-1" align="left">
		<form class="pure-form pure-form-aligned" method="post" action="?act=daftarAntri">
		<input type="hidden" name="action" value="add_pendaftaran" />
			<fieldset>
				<div class="pure-control-group">
					<label for="aligned-nik">NIK</label>
					<input type="text" name="nik" id="aligned-nik" placeholder="NIK" value="<%=antri.getString("nik")%>" />
				</div>			
				<div class="pure-control-group">
					<label for="aligned-nama">Nama</label>
					<input type="text" name="nama" id="aligned-nama" placeholder="Nama" value="<%=antri.getString("nama")%>" />
				</div>
				<div class="pure-control-group">
				   <label for="multi-state">Jenis Kelamin</label>
					<select id="multi-state" name="jenisKelamin">
						<option <% if(antri.getString("jenisKelamin").equals("Laki-laki")){ %> selected="selected" <% } %>>Laki-laki</option>
						<option <% if(antri.getString("jenisKelamin").equals("Perempuan")){ %> selected="selected" <% } %>>Perempuan</option>
					</select>
				</div>
				<div class="pure-control-group">
					<label for="aligned-usia">Usia</label>
					<input type="number" name="usia" id="aligned-usia" value="<%=antri.getString("usia")%>" />
				</div>
				<div class="pure-control-group">
				   <label for="multi-state">Askes</label>
					<select id="multi-state" name="askes">
						<option <% if(antri.getString("askes").equals("punya")){ %> selected="selected" <% } %>>Punya</option>
						<option <% if(antri.getString("askes").equals("tidak punya")){ %> selected="selected" <% } %>>Tidak Punya</option>
					</select>
				</div>
					
				<div class="pure-controls">	
					<input type="submit" class="pure-button pure-button-primary" value="Simpan">
				</div>
			</fieldset>
		</form>
	</div>	
</div>