<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.PendaftaranManagement.*"%>
<%@ page import="org.json.*"%>

<%
String id = request.getParameter("nama")+request.getParameter("tanggalDaftar");
JSONObject pendaftaran = PendaftaranManagement.findPendaftaran(id);
%>

<div class="pure-g">
	<div class="pure-u-1-3">
	</div>
	
	<div class="pure-u-1-3">
		<p style="background-color:green;">Detail Formulir Pendaftaran Pasien</p>
				
		<table border="0">
			<tr>
				<td>Nama</td>
				<td>:</td>
				<td><%=pendaftaran.getString("nama")%></td>
			</tr>
			<tr>
				<td>NIK</td>
				<td>:</td>
				<td><%=pendaftaran.getString("nik")%></td>
			</tr>
			<tr>
				<td>Jenis Kelamin</td>
				<td>:</td>
				<td><%=pendaftaran.getString("jenisKelamin")%></td>
			</tr>
			<tr>
				<td>Alamat</td>
				<td>:</td>
				<td><%=pendaftaran.getString("alamat")%></td>
			</tr>
			<tr>
				<td>Usia</td>
				<td>:</td>
				<td><%=pendaftaran.getString("usia")%></td>
			</tr>
			<tr>
				<td>Golongan Darah</td>
				<td>:</td>
				<td><%=pendaftaran.getString("golonganDarah")%></td>
			</tr>
			<tr>
				<td>Agama</td>
				<td>:</td>
				<td><%=pendaftaran.getString("agama")%></td>
			</tr>
			<tr>
				<td>Tanggal Daftar</td>
				<td>:</td>
				<td><%=pendaftaran.getString("tanggalDaftar")%></td>
			</tr>
			<tr>
				<td>Email</td>
				<td>:</td>
				<td><%=pendaftaran.getString("email")%></td>
			</tr>
			<tr>
				<td>Keluhan</td>
				<td>:</td>
				<td><%=pendaftaran.getString("keluhan")%></td>
			</tr>
			<tr>
				<td>Deskripsi Keluhan</td>
				<td>:</td>
				<td><%=pendaftaran.getString("deskripsiKeluhan")%></td>
			</tr>
		</table>
	</div>

	<div class="pure-u-1-3">
	</div>
</div>
