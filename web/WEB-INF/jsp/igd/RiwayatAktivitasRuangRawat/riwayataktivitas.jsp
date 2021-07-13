<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.igd_management.RiwayatAktivitasRuangRawat.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
String action = request.getParameter("action");

Response resp = null;
JSONObject riwayat = null;

if(action != null && action.equals("cari_riwayat")){
    session.setAttribute("riwayat_search_key",request.getParameter("riwayat_search_key"));
}
String searchKey = (String) session.getAttribute("riwayat_search_key");
if(searchKey == null){
    searchKey = "";
}


InputPagingRiwayat ipa = new InputPagingRiwayat();
ipa.setPerPage(10);

if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
    ipa.setOffset( Integer.parseInt(request.getParameter("offset")));
}
if(searchKey != null && !searchKey.trim().equals("")){
    ipa.setSearchKey(searchKey);
}

Paging pageriwayat = RiwayatManagement.getPagingRiwayat(ipa);
String noriwayat = request.getParameter("noriwayat");
if(noriwayat != null && !noriwayat.trim().equals("")){
    riwayat = RiwayatManagement.findRiwayat(noriwayat);
}


%>

<style>
.vl {
  border-left: 6px solid green;
  height: 500px;
}
</style>




<div class="pure-g">
			<div class="pure-u-1-5" align="left">
				<div class="pure-menu pure-menu-vertical">
						<ul class="pure-menu-list">
						<li class="pure-menu-item">
							<a href="?act=user" class="pure-menu-link">user</a>
						</li>
						
                        
						<li class="pure-menu-item">
							<a href="?act=riwayataktivitas" class="pure-menu-link">Riwayat</a>
						</li>
                        
						<li class="pure-menu-item">
							<a href="?act=pasien" class="pure-menu-link">pasien</a>
						</li>
						<li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
							<a href="#" class="pure-menu-link">akun</a>
							<ul class="pure-menu-children">
								<li class="pure-menu-item">
									<a href="?act=info_akun" class="pure-menu-link">info akun</a>
								</li>
								<li class="pure-menu-item">
									<a href="?act=ganti_password" class="pure-menu-link">ganti password</a>
								</li>
							</ul>
						</li>
						<li class="pure-menu-item">
							<a href="?act=logout" class="pure-menu-link">logout</a>
						</li>
					</ul>	
				</div>
			</div>
		

<div class="vl"></div>

<div class="pure-u-2-3" style="align-items:center;">
        <form action="?act=riwayataktivitas" method="post" class="pure-form pure-u-1-2">
            <input type="hidden" name="action" value="cari_riwayat" />
            <input type="text" name="riwayat_search_key" class="pure-input-rounded" placeholder="noriwayat" value="<%=searchKey%>" />
            <input type="submit" class="pure-button pure-button-primary" value="cari" />
        </form>
        <a href="?act=add_riwayat" class="pure-u-1-3"><button class="button-success pure-button" style="background: rgb(28, 184, 65);">Tambah</button></a> 
        <p></p>
        <table class="pure-table pure-table-horizontal ">
            <thead>
                <tr>
                    <th>No</th>
                    <th>No Riwayat</th>
                    <th>No Ruang</th>
                    <th>Nama Pasien</th>
                    <th>Nama Dokter</th>
                    <th>Nama Perawat</th>
                    <th>Tanggal Masuk</th>
                    <th>Tanggal Keluar</th>
                    <th>Aksi</th>                    
                </tr>
            </thead>
            <tbody>
                <% for(int i=0;i<pageriwayat.getResultList().size();i++){ 
                    
                %>
                <tr>
                    <td><%=(pageriwayat.getResultFrom() + i)%></td>
                    <td><%=pageriwayat.getResultList().get(i).getString("noriwayat")%></td>
                    <td><%=pageriwayat.getResultList().get(i).getString("noruangrawat")%></td>
                    <td><%=pageriwayat.getResultList().get(i).getString("namapasien")%></td>
                    <td><%=pageriwayat.getResultList().get(i).getString("namadokter")%></td>
                    <td><%=pageriwayat.getResultList().get(i).getString("namaperawat")%></td>
                    <td><%=pageriwayat.getResultList().get(i).getString("tglmasuk")%></td>
                    <td><%=pageriwayat.getResultList().get(i).getString("tglkeluar")%></td>
                    <td>
                    <a href="?act=update_riwayat&noriwayat=<%=pageriwayat.getResultList().get(i).getString("noriwayat")%>"><button class="button-warning pure-button" style="background: rgb(223, 117, 20);">Edit</button></a>
                    <%-- <a href="?act=delete_riwayat&noriwayat=<%=pageriwayat.getResultList().get(i).getString("noriwayat")%>&namapasien=<%=pageriwayat.getResultList().get(i).getString("namapasien")%>"><button class="button-error pure-button" style="background: rgb(202, 60, 60);">Delete</button></a>               --%>
                    <a href="?act=detail_riwayat&noriwayat=<%=pageriwayat.getResultList().get(i).getString("noriwayat")%>"><button class="button-secondary pure-button" style="background: rgb(66, 184, 221);">Detail</button></a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
       
        <p></p>
            <% if(pageriwayat.isHasPrevious()){ %>
            <a href="?act=riwayataktivitas&offset=<%=pageriwayat.getPreviousOffset()%>"> Previous </a>
            <% } %>
            &nbsp;&nbsp;&nbsp; 
            <% if(pageriwayat.isHasNext()){ %>
            <a href="?act=riwayataktivitas&offset=<%=pageriwayat.getNextOffset()%>"> Next </a>
            <% } %>
        </p>
        <p>menampilkan <%=pageriwayat.getResultFrom()%> - <%=pageriwayat.getResultTo()%> dari total <%=pageriwayat.getTotalResults()%></p>
    </div>        
</div>


