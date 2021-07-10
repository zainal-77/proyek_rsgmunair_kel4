<%@ page import="rsgm_unair.ruang_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
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


InputPagingruang ipp = new InputPagingruang();
ipp.setPerPage(10);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipp.setOffset( Integer.parseInt(request.getParameter("offset")));
}
if(searchKey != null && !searchKey.trim().equals("")){
    ipp.setSearchKey(searchKey);
}

Paging pageruang = RuangManagement.getPagingruang(ipp);
String noruangrawat = request.getParameter("noruangrawat");
if(koderuang != null && !noruangrawat.trim().equals("")){
    ruang = RuangManagement.findruang(noruangrawat);
}


%>


<div class="pure-g">

<div class="pure-u-1-1" style="align-items:center;">
        <form action="?act=ruang" method="post" class="pure-form pure-u-1-2">
            <input type="hidden" name="action" value="cari_ruang" />
            <input type="text" name="ruang_search_key" class="pure-input-rounded" placeholder="noruangrawat" value="<%=searchKey%>" />
            <input type="submit" class="pure-button pure-button-primary" value="cari" />
        </form>
        <a href="?act=addruang" class="pure-u-1-3"><button class="button-success pure-button" style="background: rgb(28, 184, 65);">Tambah</button></a> 
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
                <% for(int i=0;i<pageruang.getResultList().size();i++){ 
                    
                %>
                <tr>
                    <td><%=(pageruang.getResultFrom() + i)%></td>
                    <td><%=pageruang.getResultList().get(i).getString("noruangrawat")%></td>
                    <td><%=pageruang.getResultList().get(i).getString("namapasien")%></td>
                    <td><%=pageruang.getResultList().get(i).getString("tiperuangrawat")%></td>
                    <td><%=pageruang.getResultList().get(i).getString("tglmasuk")%></td>
                    <td><%=pageruang.getResultList().get(i).getString("status")%></td>
                    <td>
                    <a href="?act=update_ruang&noruangrawat=<%=pageruang.getResultList().get(i).getString("noruangrawat")%>"><button class="button-warning pure-button" style="background: rgb(223, 117, 20);">Edit</button></a>
                    <a href="?act=delete_ruang&noruangrawat=<%=pageruang.getResultList().get(i).getString("noruangrawat")%>&namapasien=<%=pageruang.getResultList().get(i).getString("namaruang")%>"><button class="button-error pure-button" style="background: rgb(202, 60, 60);">Delete</button></a>              
                    <a href="?act=detail_ruang&noruangrawat=<%=pageruang.getResultList().get(i).getString("noruangrawat")%>"><button class="button-secondary pure-button" style="background: rgb(66, 184, 221);">Detail</button></a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
       
        <p></p>
            <% if(pageruang.isHasPrevious()){ %>
            <a href="?act=ruang&offset=<%=pageruang.getPreviousOffset()%>"> Previous </a>
            <% } %>
            &nbsp;&nbsp;&nbsp; 
            <% if(pageruang.isHasNext()){ %>
            <a href="?act=ruang&offset=<%=pageruang.getNextOffset()%>"> Next </a>
            <% } %>
        </p>
        <p>menampilkan <%=pageruang.getResultFrom()%> - <%=pageruang.getResultTo()%> dari total <%=pageruang.getTotalResults()%></p>
    </div>        
</div>
