<%@ page import="rsgm_unair.proyek_webapps_kel4.LaboratoriumManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject antri = null;

InputPagingAntri ipa = new InputPagingAntri();
ipa.setPerPage(20);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipa.setOffset( Integer.parseInt(request.getParameter("offset")));
}

PagingAntri pageAntri = LaboratoriumManagement.getPagingAntri(ipa);
%>

<div class="pure-u">
	<p>menampilkan <%=pageAntri.getResultFrom()%> - <%=pageAntri.getResultTo()%> dari total <%=pageAntri.getTotalResults()%></p>
	<p></p>
	
	<table class="pure-table">
		<thead>
			<tr>
				<th>No.</th>
				<th>NIK</th>
				<th>Nama</th>
				<th>JenisKelamin</th>
				<th>Usia</th>
				<th>Askes</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<% for(int i=0;i<pageAntri.getResultList().size();i++){ %>
			<tr>
				<td><%=(pageAntri.getResultFrom() + i)%></td>
				<td><%=pageAntri.getResultList().get(i).getString("nik")%></td>
				<td><%=pageAntri.getResultList().get(i).getString("nama")%></td>
				<td><%=pageAntri.getResultList().get(i).getString("jenisKelamin")%></td>
				<td><%=pageAntri.getResultList().get(i).getString("usia")%></td>								
				<td><%=pageAntri.getResultList().get(i).getString("askes")%></td>
				<td>
					<a href="web/WEB-INF/jsp/laboratorium/Entry.jsp"=<%=pageAntri.getResultList().get(i).getString("nama")%>">Selesai</a>
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>
		
	<p>
		<% if(pageAntri.isHasPrevious()){ %>
		<a href="?act=laboratorium&offset=<%=pageAntri.getPreviousOffset()%>"> Previous </a>
		<% } %>
		&nbsp;&nbsp;&nbsp; 
		<% if(pageAntri.isHasNext()){ %>
		<a href="?act=laboratorium&offset=<%=pageAntri.getNextOffset()%>"> Next </a>
		<% } %>
	</p>
</div>