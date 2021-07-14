<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.ApotekManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject laporanbulanan = null;
InputPagingLaporanBulanan ipp = new InputPagingLaporanBulanan();
ipp.setPerPage(20);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipp.setOffset( Integer.parseInt(request.getParameter("offset")));
}

PagingLaporanBulanan pageBulan = ApotekManagement.getPagingLaporanBulanan(ipp);
%>

<div class="pure-u">
	
	
	<table class="pure-table">
		<thead>
			<tr>
                <th>Bulan</th>
				<th>Jumlah Penghasilan</th>
			</tr>
		</thead>
		<tbody>
		<% for(int i=0;i<pageBulan.getResultList().size();i++){ %>
			<tr>
				<td><%=pageBulan.getResultList().get(i).getString("bulan")%></td>
                <td><%=pageBulan.getResultList().get(i).getString("jumlahpenghasilan")%></td>
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>
		
	<p>
		<% if(pageBulan.isHasPrevious()){ %>
		<a href="?act=apotek&offset=<%=pageBulan.getPreviousOffset()%>"> Previous </a>
		<% } %>
		&nbsp;&nbsp;&nbsp; 
		<% if(pageBulan.isHasNext()){ %>
		<a href="?act=apotek&offset=<%=pageBulan.getNextOffset()%>"> Next </a>
		<% } %>
	</p>
</div>