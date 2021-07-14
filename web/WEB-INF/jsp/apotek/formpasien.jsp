<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.ApotekManagement.*"%>
<%@ page import="rsgm_unair.shared.*"%>
<%@ page import="org.json.*"%>
<%@ page import="java.util.*"%>

<% 
String action = request.getParameter("action");

Response resp = null;
JSONObject order = null;
if(action != null && action.equals("add_pasien")){
ForumPasien fp = new ForumPasien();
	fp.setNama(request.getParameter("nama"));
	fp.setDokter(request.getParameter("dokter"));
	fp.setObat(request.getParameter("obat"));
	fp.setJumlah(request.getParameter("jumlah"));
    resp = ApotekManagement.CreateEditForumPasien(fp);	
}
if(order == null){
	order = ApotekManagement.createNewForumPasien();
}
	%>
    

<div class="pure-g">
    <div class="pure-u-1-3" align="left">
        <h2>Pasien</h2>
        <hr>
        <% if(resp != null && resp.getKode() == Response.ERROR){ %>
            <h4 align="center" style="background-color:red;"><%=resp.getPesan()%></h4>
        <% }else if(resp != null && resp.getKode() == Response.OK){ %>
            <h4 align="center" style="background-color:blue;"><%=resp.getPesan()%></h4>
        <% } %>
    </div>
    <div class="pure-u-2-3"></div>
</div>

<div class="pure-g">
    <div class="pure-u-1-3" align="left">
        <form class="pure-form pure-form-aligned" method="post" action="?act=apotek">
        <input type="hidden" name="action" value="add_pasien" />
            <fieldset>
                <div class="pure-control-group">
                    <label for="aligned-name">Nama</label>
                    <input type="text" name="nama" id="aligned-nama" placeholder="nama"value="<%=order.getString("nama")%>"/>
                </div>
                <div class="pure-control-group">
                    <label for="aligned-name">Dokter</label>
                    <input type="text" name="dokter" id="aligned-dokter" placeholder="dokter"value="<%=order.getString("dokter")%>"/>
                </div>
                <div class="pure-control-group">
                    <label for="aligned-name">Obat</label>
                    <input type="text" name="obat" id="aligned-resepobat" placeholder="obat"value="<%=order.getString("obat")%>"/>
                </div>
                <div class="pure-control-group">
                    <label for="aligned-name">Jumlah</label>
                    <input type="text" name="jumlah" id="aligned-jumlah" placeholder="jumlah"value="<%=order.getString("jumlah")%>"/>
                </div>
                <div class="pure-controls">
                    
                    <input type="submit" class="pure-button pure-button-primary" value="Simpan">
                </div>
            </fieldset>
        </form>
    </div>
