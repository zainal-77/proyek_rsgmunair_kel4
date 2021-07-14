<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.ApotekManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject order = null;
InputPagingForumPasien ipp = new InputPagingForumPasien();
ipp.setPerPage(20);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipp.setOffset( Integer.parseInt(request.getParameter("offset")));
}

PagingForumPasien pagePasien = ApotekManagement.getPagingForumPasien(ipp);
%>

<div class="pure-u">
	
	
	<table class="pure-table">
		<thead>
			<tr>
				<th>No.</th>
				<th>Nama</th>
				<th>Dokter</th>
				<th>Obat</th>
                <th>Jumlah</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<% for(int i=0;i<pagePasien.getResultList().size();i++){ %>
			<tr>
				<td><%=(pagePasien.getResultFrom() + i)%></td>
				<td><%=pagePasien.getResultList().get(i).getString("nama")%></td>
				<td><%=pagePasien.getResultList().get(i).getString("dokter")%></td>
				<td><%=pagePasien.getResultList().get(i).getString("obat")%></td>
                <td><%=pagePasien.getResultList().get(i).getString("jumlah")%></td>
				<td>
					<a href="?act=validasiorder&nama=<%=pagePasien.getResultList().get(i).getString("nama")%>">Validasi</a>
					
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>
		
	<p>
		<% if(pagePasien.isHasPrevious()){ %>
		<a href="?act=apotek&offset=<%=pagePasien.getPreviousOffset()%>"> Previous </a>
		<% } %>
		&nbsp;&nbsp;&nbsp; 
		<% if(pagePasien.isHasNext()){ %>
		<a href="?act=apotek&offset=<%=pagePasien.getNextOffset()%>"> Next </a>
		<% } %>
	</p>
</div>