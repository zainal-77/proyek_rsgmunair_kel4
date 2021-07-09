<%@ page import="rsgm_unair.igd_management.RuangRawat.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%
String action = request.getParameter("action");
String id= request.getParameter("noruangrawat");
Response resp = null;
JSONObject ruang = null;

ruang = RuangManagement.findRuang(id);


if(action != null && action.equals("update_ruang")){
	DataRuangRawat rr = new DataRuangRawat();
	rr.setNoruangrawat(request.getParameter("noruangrawat"));
    rr.setNamapasien(request.getParameter("namapasien"));
    rr.setTiperuangrawat(request.getParameter("tiperuangrawat"));
    rr.setTglmasuk(request.getParameter("tglmasuk"));
    rr.setStatus(request.getParameter("status"));
	resp = RuangManagement.CreateEditRuang(rr);
    %>
<%-- <script>
  window.location.href="?act=detail_pasien&noruangrawat=<%=pasien.getString("noruangrawat")%>";
 </script> --%>
 <%
    }
 %>

<div class="pure-u">
<h2>Form Update Data Ruang Rawat</h2>
<div class="pure-u" align="center">
        <% if(resp != null && resp.getKode() == Response.ERROR){ %>
            <h4 align="center" style="background-color:red;"><%=resp.getPesan()%></h4>
        <% }else if(resp != null && resp.getKode() == Response.OK){ %>
            <h4 align="center" style="background-color:green;"><%=resp.getPesan()%></h4>
        <% } %>
    </div>
</div>
<div class="pure-u">
<form class="pure-form pure-form-aligned" method="post" action="?act=update_ruang">
    <fieldset>
        <input type="hidden" id="noruangrawat" name="action" value="update_ruang">
        <input type="hidden" id="noruangrawat" name="_rev" value="<%=ruang.getString("_rev")%>">
        <input type="hidden" id="noruangrawat" name="noruangrawat" value="<%=ruang.getString("noruangrawat")%>">
        <%-- <div class="pure-control-group">
            <label for="aligned-kodepasien">Kode Pasien</label>
            <input class="pure-input-1-3" type="text" disabled="" id="kodepasien" name="kodepasien" value="<%=pasien.getString("kodepasien")%>">
        </div> --%>
    
        <div class="pure-control-group ">
            <label for="aligned-namepasien">Nama Pasien</label>
            <input  class="pure-u-1-2" type="text" name="namapasien" id="aligned-namapasien" placeholder=" Isi Nama Pasien"  value="<%=ruang.getString("namapasien") %>"/>
        </div>


        <div class="pure-control-group">
            <label for="aligned-tglmasuk">Tanggal Masuk</label>
            <input cclass="pure-u-1-2" type="date" name="tglmasuk" id="aligned-tglmasuk" placeholder=" Isi Tanggal Masuk Pasien" value="<%=ruang.getString("tglmasuk") %>" />
        </div>


       <div class="pure-control-group">
            <label for="aligned-tiperuangrawat">Tipe Ruang</label>
            <input class= class="pure-u-1-2" type="text" name="tiperuangrawat"   id="aligned-tiperuangrawat" placeholder=" Isi Tipe Ruang" value="<%=ruang.getString("tiperuangrawat") %>" />
        </div>
   

        <div class="pure-control-group">
            <label for="aligned-status">Status Ruang</label>
            <input class="pure-input-1-2" type="text" name="status"   id="aligned-status" placeholder=" Isi Status Ruang Rawat" value="<%=ruang.getString("status") %>"/>
        </div>
      
    
        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">Update</button>
        </div>
    </fieldset>
</form>
        <a href="?act=pasien"><button class="button-warning pure-button" style="background: rgb(223, 117, 20);">Cancel</button></a> 

</div>
</div>