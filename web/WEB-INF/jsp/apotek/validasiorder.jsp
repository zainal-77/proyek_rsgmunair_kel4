<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.ApotekManagement.*" %>
<%@ page import="org.json.*" %>
<%
String id = request.getParameter("nama");
JSONObject order = ApotekManagement.findOrder(id);
if(order == null){
	order = ApotekManagement.createNewForumPasien();
}else{
    String isConfirm = request.getParameter("is_confirm");
	if(isConfirm != null && isConfirm.equals("yes")){
		ApotekManagement.removeOrder(order.getString("_id"));
%>
	<script>
		window.location.href="?act=order";
	</script>
<%
		return;
	}
}
%>

<div class="pure-g">
    <div class="pure-u-1-3">
    </div>
    <div class="pure-u-1-3">
        <p style="background-color:yellow;">Apakah Anda Ingin Validasi ?</p>

        <form action="?act=validasiorder&nama=<%=order.getString("nama")%> method="post">
					
            <input type="hidden" name="is_confirm" value="yes" />
            <input type="submit" class="pure-button pure-button-danger" value="validasi" />
        </form>
    </div>
    <div class="pure-u-1-3">
    </div>
</div>