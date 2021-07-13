<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.pasien_management.*" %>
<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject pasien = null;

if(action != null && action.equals("cari_pasien")){
    session.setAttribute("pasien_search_key",request.getParameter("pasien_search_key"));
}
String searchKey = (String) session.getAttribute("pasien_search_key");
if(searchKey == null){
    searchKey = "";
}


InputPagingPasien ipp = new InputPagingPasien();
ipp.setPerPage(10);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipp.setOffset( Integer.parseInt(request.getParameter("offset")));
}
if(searchKey != null && !searchKey.trim().equals("")){
    ipp.setSearchKey(searchKey);
}

Paging pagePasien = PasienManagement.getPagingPasien(ipp);
String kodepasien = request.getParameter("kodepasien");
if(kodepasien != null && !kodepasien.trim().equals("")){
    pasien = PasienManagement.findPasien(kodepasien);
}


%>


<div class="pure-g">

<div class="pure-u-1-1" style="align-items:center;">
        <form action="?act=pasien" method="post" class="pure-form pure-u-1-2">
            <input type="hidden" name="action" value="cari_pasien" />
            <input type="text" name="pasien_search_key" class="pure-input-rounded" placeholder="kodepasien" value="<%=searchKey%>" />
            <input type="submit" class="pure-button pure-button-primary" value="cari" />
        </form>
        <a href="?act=addpasien" class="pure-u-1-3"><button class="button-success pure-button" style="background: rgb(28, 184, 65);">Tambah</button></a> 
        <p></p>
        <table class="pure-table pure-table-horizontal ">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Kode Pasien</th>
                    <th>Nama Pasien</th>
                    <th>Jenis Kelamin</th>
                    <th>Tanggal Masuk</th>
                    <th>No Hp</th>
                    <th>Aksi</th>                    
                </tr>
            </thead>
            <tbody>
                <% for(int i=0;i<pagePasien.getResultList().size();i++){ 
                    
                %>
                <tr>
                    <td><%=(pagePasien.getResultFrom() + i)%></td>
                    <td><%=pagePasien.getResultList().get(i).getString("kodepasien")%></td>
                    <td><%=pagePasien.getResultList().get(i).getString("namapasien")%></td>
                    <td><%=pagePasien.getResultList().get(i).getString("jeniskelamin")%></td>
                    <td><%=pagePasien.getResultList().get(i).getString("tglmasuk")%></td>
                    <td><%=pagePasien.getResultList().get(i).getString("noHp")%></td>
                    <td>
                    <a href="?act=update_pasien&kodepasien=<%=pagePasien.getResultList().get(i).getString("kodepasien")%>"><button class="button-warning pure-button" style="background: rgb(223, 117, 20);">Edit</button></a>
                    <a href="?act=delete_pasien&kodepasien=<%=pagePasien.getResultList().get(i).getString("kodepasien")%>&namapasien=<%=pagePasien.getResultList().get(i).getString("namapasien")%>"><button class="button-error pure-button" style="background: rgb(202, 60, 60);">Delete</button></a>              
                    <a href="?act=detail_pasien&kodepasien=<%=pagePasien.getResultList().get(i).getString("kodepasien")%>"><button class="button-secondary pure-button" style="background: rgb(66, 184, 221);">Detail</button></a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
       
        <p></p>
            <% if(pagePasien.isHasPrevious()){ %>
            <a href="?act=pasien&offset=<%=pagePasien.getPreviousOffset()%>"> Previous </a>
            <% } %>
            &nbsp;&nbsp;&nbsp; 
            <% if(pagePasien.isHasNext()){ %>
            <a href="?act=pasien&offset=<%=pagePasien.getNextOffset()%>"> Next </a>
            <% } %>
        </p>
        <p>menampilkan <%=pagePasien.getResultFrom()%> - <%=pagePasien.getResultTo()%> dari total <%=pagePasien.getTotalResults()%></p>
    </div>        
</div>
