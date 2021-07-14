<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.LaboratoriumManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject entry = null;

InputPagingEntry ipe = new InputPagingEntry();
ipe.setPerPage(20);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipe.setOffset( Integer.parseInt(request.getParameter("offset")));
}

PagingEntry pageEntry = EntryManagement.getPagingEntry(ipe);
%>

<div class="pure-u">
	<p>menampilkan <%=pageEntry.getResultFrom()%> - <%=pageEntry.getResultTo()%> dari total <%=pageEntry.getTotalResults()%></p>
	<p></p>
	
	<table class="pure-table">
		<thead>
			<tr>
				<th>No.</th>
				<th>NIK</th>				
				<th>Diagnosa</th>
				<th>Rujukan</th>
				<th>Action</th>				
			</tr>
		</thead>
		<tbody>
		<% for(int i=0;i<pageEntry.getResultList().size();i++){ %>
			<tr>
				<td><%=(pageEntry.getResultFrom() + i)%></td>
				<td><%=pageEntry.getResultList().get(i).getString("nik")%></td>			
				<td><%=pageEntry.getResultList().get(i).getString("diagnosa")%></td>
				<td><%=pageEntry.getResultList().get(i).getString("rujukan")%></td>
				
				<td>
					<a href="?act=#=<%=pageEntry.getResultList().get(i).getString("diagnosa")%>">Print</a>
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>
		
	<p>
		<% if(pageEntry.isHasPrevious()){ %>
		<a href="?act=laboratorium&offset=<%=pageEntry.getPreviousOffset()%>"> Previous </a>
		<% } %>
		&nbsp;&nbsp;&nbsp; 
		<% if(pageEntry.isHasNext()){ %>
		<a href="?act=laboratorium&offset=<%=pageEntry.getNextOffset()%>"> Next </a>
		<% } %>
	</p>
</div>