<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.igd_management.RuangRawat.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject ruang = null;

if(action != null && action.equals("cari_ruang")){
    session.setAttribute("ruang_search_key",request.getParameter("ruang_search_key"));
}
String searchKey = (String) session.getAttribute("ruang_search_key");
if(searchKey == null){
    searchKey = "";
}


InputPagingRuang ipr = new InputPagingRuang();
ipr.setPerPage(10);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipr.setOffset( Integer.parseInt(request.getParameter("offset")));
}
if(searchKey != null && !searchKey.trim().equals("")){
    ipr.setSearchKey(searchKey);
}

Paging pageRuang = RuangManagement.getPagingRuang(ipr);
String noruangrawat = request.getParameter("noruangrawat");
if(noruangrawat != null && !noruangrawat.trim().equals("")){
    ruang = RuangManagement.findRuang(noruangrawat);
}


%>


<div class="pure-g">

<div class="pure-u-1-1" style="align-items:center;">
        <form action="?act=ruangrawat" method="post" class="pure-form pure-u-1-2">
            <input type="hidden" name="action" value="cari_ruang" />
            <input type="text" name="ruang_search_key" class="pure-input-rounded" placeholder="noruangrawat" value="<%=searchKey%>" />
            <input type="submit" class="pure-button pure-button-primary" value="cari" />
        </form>
        <a href="?act=add_ruang" class="pure-u-1-3"><button class="button-success pure-button" style="background: rgb(28, 184, 65);">Tambah</button></a> 
        <p></p>
        <table class="pure-table pure-table-horizontal ">
            <thead>
                <tr>
                    <th>No</th>
                    <th>No RuangRawat</th>
                    <th>Nama Pasien</th>
                    <th>Tanggal Masuk</th>
                    <th>Tipe Ruang</th>
                    <th>Status</th>  
                    <th>Aksi</th>                  
                </tr>
            </thead>
            <tbody>
                <% for(int i=0;i<pageRuang.getResultList().size();i++){ 
                    
                %>
                <tr>
                    <td><%=(pageRuang.getResultFrom() + i)%></td>
                    <td><%=pageRuang.getResultList().get(i).getString("noruangrawat")%></td>
                    <td><%=pageRuang.getResultList().get(i).getString("namapasien")%></td>
                    <td><%=pageRuang.getResultList().get(i).getString("tiperuangrawat")%></td>
                    <td><%=pageRuang.getResultList().get(i).getString("tglmasuk")%></td>
                    <td><%=pageRuang.getResultList().get(i).getString("status")%></td>
                    <td>
                    <a href="?act=update_ruang&noruangrawat=<%=pageRuang.getResultList().get(i).getString("noruangrawat")%>"><button class="button-warning pure-button" style="background: rgb(223, 117, 20);">Edit</button></a>
                    <%-- <a href="?act=delete_ruang&noruangrawat=<%=pageRuang.getResultList().get(i).getString("noruangrawat")%>&namapasien=<%=pageRuang.getResultList().get(i).getString("namaruang")%>"><button class="button-error pure-button" style="background: rgb(202, 60, 60);">Delete</button></a>              
                    <a href="?act=detail_ruang&noruangrawat=<%=pageRuang.getResultList().get(i).getString("noruangrawat")%>"><button class="button-secondary pure-button" style="background: rgb(66, 184, 221);">Detail</button></a> --%>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
       
        <p></p>
            <% if(pageRuang.isHasPrevious()){ %>
            <a href="?act=ruang&offset=<%=pageRuang.getPreviousOffset()%>"> Previous </a>
            <% } %>
            &nbsp;&nbsp;&nbsp; 
            <% if(pageRuang.isHasNext()){ %>
            <a href="?act=ruang&offset=<%=pageRuang.getNextOffset()%>"> Next </a>
            <% } %>
        </p>
        <p>menampilkan <%=pageRuang.getResultFrom()%> - <%=pageRuang.getResultTo()%> dari total <%=pageRuang.getTotalResults()%></p>
    </div>        
</div>
