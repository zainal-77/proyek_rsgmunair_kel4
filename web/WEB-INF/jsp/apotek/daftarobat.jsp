<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.ApotekManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject daftarobat = null;
InputPagingDaftarObat ipp = new InputPagingDaftarObat();
ipp.setPerPage(20);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipp.setOffset( Integer.parseInt(request.getParameter("offset")));
}

PagingDaftarObat pageObat = ApotekManagement.getPagingDaftarObat(ipp);
%>

<div class="pure-u">
	
	
	<table class="pure-table">
		<thead>
			<tr>
				<th>No.</th>
				<th>Obat</th>
				<th>Jumlah</th>
			</tr>
		</thead>
		<tbody>
		<% for(int i=0;i<pageObat.getResultList().size();i++){ %>
			<tr>
				<td><%=(pageObat.getResultFrom() + i)%></td>
				<td><%=pageObat.getResultList().get(i).getString("obat")%></td>
                <td><%=pageObat.getResultList().get(i).getString("jumlah")%></td>
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>
		
	<p>
		<% if(pageObat.isHasPrevious()){ %>
		<a href="?act=apotek&offset=<%=pageObat.getPreviousOffset()%>"> Previous </a>
		<% } %>
		&nbsp;&nbsp;&nbsp; 
		<% if(pageObat.isHasNext()){ %>
		<a href="?act=apotek&offset=<%=pageObat.getNextOffset()%>"> Next </a>
		<% } %>
	</p>
</div>