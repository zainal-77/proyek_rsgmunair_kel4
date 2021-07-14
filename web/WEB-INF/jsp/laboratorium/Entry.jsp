<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.LaboratoriumManagement.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject entry = null;

if(action != null && action.equals("add_entry")){
	
	FormEntry fe = new FormEntry();
	fe.setNik(request.getParameter("nik"));	
	fe.setDiagnosa(request.getParameter("diagnosa"));
	fe.setRujukan(request.getParameter("rujukan"));
	
	
	resp = EntryManagement.CreateEditEntry(fe);	
}

if(entry == null){
	entry = EntryManagement.createNewEntry();
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
	<div class="pure-u-1" align="center">
		<form class="pure-form pure-form-aligned" method="post" action="?act=entry">
		<input type="hidden" name="action" value="add_entry" />
			<fieldset>
				<div class="pure-control-group">
					<label for="aligned-nik">Paste NIK Pasien</label>
					<input type="textarea" rows="4" cols="25" name="nik"  id="aligned-nik" placeholder="paste NIK"	 value="<%=entry.getString("nik")%>" />
				</div>	
				<div class="pure-control-group">
					<label for="aligned-diagnosa">Entry Diagnosa</label>
					<input type="textarea" rows="4" cols="25" name="diagnosa"  id="aligned-diagnosa" placeholder="isi diagnosa"	 value="<%=entry.getString("diagnosa")%>" />
				</div>			
				<div class="pure-control-group">
					<label for="aligned-rujukan">Entry Rujukan</label>
					<input type="textarea" rows="4" cols="25" name="rujukan" id="aligned-rujukan" placeholder="isi rujukan" value="<%=entry.getString("rujukan")%>" />
				</div>
				
				<div class="pure-controls">	
					<input type="submit" class="pure-button pure-button-primary" value="Simpan">
				</div>
			</fieldset>
		</form>
	</div>	
</div>