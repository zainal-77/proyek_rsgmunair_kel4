<%@ page import="rsgm_unair.proyek_webapps_kel4.LaboratoriumManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject entry = null;

if(action != null && action.equals("add_pendaftaran")){
	
	FormEntry fe = new FormEntry();
	fe.setEntryDiagnosa(request.getParameter("diagnosa"));
	fe.setEntryRujukan(request.getParameter("rujukan"));
	
	resp = LaboratoriumManagement.CreateEditEntry(fe);	
}

if(entry == null){
	entry = LaboratoriumManagement.createNewEntry();
}
%>
<div class="pure-g">
	<div class="pure-u-1-12"></div>
	<div class="pure-u-11-12" align="left">
		<h2>Entry Diagnosa & Rujukan</h2>
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
					<label for="aligned-diagnosa">Entry Diagnosa</label>
					<input type="text" name="diagnosa" id="aligned-diagnosa" placeholder="isi diagnosa" value="<%=entry.getString("diagnosa")%>" />
				</div>			
				<div class="pure-control-group">
					<label for="aligned-rujukan">Entry Rujukan</label>
					<input type="text" name="rujukan" id="aligned-rujukan" placeholder="isi rujukan" value="<%=antri.getString("rujukan")%>" />
				</div>

					
				<div class="pure-controls">	
					<input type="submit" class="pure-button pure-button-primary" value="Simpan">
				</div>
			</fieldset>
		</form>
	</div>	
</div>