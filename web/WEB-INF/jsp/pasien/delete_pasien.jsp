<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.pasien_management.*" %>
<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.user_management.*" %>
<%@ page import="org.json.*" %>
<%
String id = request.getParameter("kodepasien");
JSONObject pasien = PasienManagement.findPasien(id);
if(pasien == null){
 pasien = PasienManagement.createNewPasien();
}else{

 String isConfirm = request.getParameter("is_confirm");
 if(isConfirm != null && isConfirm.equals("yes")){
  PasienManagement.removePasien(pasien.getString("_id"));
%>
 <script>
  window.location.href="?act=pasien";
 </script>
<%
  return;
 }
}
%>

	<div class="pure-u-1-3" align="center">
			<p style="background-color:yellow;">Apakah Anda Yakin Ingin Menghapus ?</p>	
	  <table border="0">
     <tr>
      <td>kodepasien</td>
      <td>:</td>
      <td><%=pasien.getString("kodepasien")%></td>
     </tr>
     <tr>
      <td>Namapasien</td>
      <td>:</td>
      <td><%=pasien.getString("namapasien")%></td>
     </tr>
    </table>

<form action="?act=delete_pasien&kodepasien=<%=pasien.getString("kodepasien")%>&namapasien=<%=pasien.getString("kodepasien")%>" method="post">
          <input type="hidden" name="kodepasien" value="<%=pasien.getString("kodepasien")%>" />
					<input type="hidden" name="is_confirm" value="yes" />
					<input type="submit" class="pure-button pure-button-danger" value="hapus" />
				</form>

		</div>