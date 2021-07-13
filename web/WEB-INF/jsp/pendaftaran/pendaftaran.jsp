<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.PendaftaranManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject pendaftaran = null;

if(action != null && action.equals("cari_pendaftaran")){
	session.setAttribute("pendaftaran_search_key",request.getParameter("pendaftaran_search_key"));
}
String searchKey = (String) session.getAttribute("pendaftaran_search_key");
if(searchKey == null){
	searchKey = "";
}

InputPagingDaftarPasien ipdp = new InputPagingDaftarPasien();
ipdp.setPerPage(20);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipdp.setOffset( Integer.parseInt(request.getParameter("offset")));
}
if(searchKey != null && !searchKey.trim().equals("")){
	ipdp.setSearchKey(searchKey);
}

PagingDaftarPasien pagePendaftaran = PendaftaranManagement.getPagingDaftarPasien(ipdp);
%>

<div class="pure-u">
	<p>menampilkan <%=pagePendaftaran.getResultFrom()%> - <%=pagePendaftaran.getResultTo()%> dari total <%=pagePendaftaran.getTotalResults()%></p>
	<form action="?act=pendaftaran" method="post" class="pure-form">
		<input type="hidden" name="action" value="cari_pendaftaran" />
		<input type="text" name="pendaftaran_search_key" class="pure-input-rounded" placeholder="(Nama)+(Tanggal Daftar)" value="<%=searchKey%>" />
		<input type="submit" class="pure-button pure-button-primary" value="cari" />
	</form>
	<p></p>
	
	<table class="pure-table">
		<thead>
			<tr>
				<th>No.</th>
				<th>Nama</th>
				<th>Tanggal Daftar</th>
				<th>Keluhan</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<% for(int i=0;i<pagePendaftaran.getResultList().size();i++){ %>
			<tr>
				<td><%=(pagePendaftaran.getResultFrom() + i)%></td>
				<td><%=pagePendaftaran.getResultList().get(i).getString("nama")%></td>
				<td><%=pagePendaftaran.getResultList().get(i).getString("tanggalDaftar")%></td>
				<td><%=pagePendaftaran.getResultList().get(i).getString("keluhan")%></td>
				<td>
					<a href="?act=detail_pendaftaran&nama=<%=pagePendaftaran.getResultList().get(i).getString("nama")%>&tanggalDaftar=<%=pagePendaftaran.getResultList().get(i).getString("tanggalDaftar")%>">Detail</a>
					|
					<a href="?act=edit_pendaftaran&nama=<%=pagePendaftaran.getResultList().get(i).getString("nama")%>&tanggalDaftar=<%=pagePendaftaran.getResultList().get(i).getString("tanggalDaftar")%>">Edit</a>
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>
		
	<p>
		<% if(pagePendaftaran.isHasPrevious()){ %>
		<a href="?act=pendaftaran&offset=<%=pagePendaftaran.getPreviousOffset()%>"> Previous </a>
		<% } %>
		&nbsp;&nbsp;&nbsp; 
		<% if(pagePendaftaran.isHasNext()){ %>
		<a href="?act=pendaftaran&offset=<%=pagePendaftaran.getNextOffset()%>"> Next </a>
		<% } %>
	</p>
</div>