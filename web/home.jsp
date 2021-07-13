<%@ page import="rsgm_unair.proyek_rsgmunair_kel4.user_management.UserManagement" %>

<%
String act = request.getParameter("act");
if(act == null || act.trim().equals("")){
	act = "default";
}


%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="css/pure-min.css"/>
    </head>
	<body>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
				<div class="pure-menu pure-menu-horizontal" >
					<a href="home.jsp" class="pure-menu-heading pure-menu-link"><img class="pure-img" width="100" src="img/logo.png"></a>
					<ul class="pure-menu-list">
						<li class="pure-menu-item">
							<a href="?act=user" class="pure-menu-link">user</a>
						</li>
				

						<% if(("admin").equals(session.getAttribute("permission_level"))){ %>
                            <h4 align="center" style="background-color:red;"><li class="pure-menu-item">
                            <a href="?act=ruangrawat" class="pure-menu-link">Ruang Rawat</a>
                            </li></h4>
                        <% } %>
                        
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
		</div>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
				<hr>
			</div>
		</div>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
			<% if(act.equals("default")){ %>
			<h3> Silakan memilih menu </h3>
			<% }else if(act.equals("logout")){ %>
			<jsp:include page="WEB-INF/jsp/user/konfirmasi_logout.jsp"/>
			<% }else if(act.equals("info_akun")){ %>
			<jsp:include page="WEB-INF/jsp/user/info_akun.jsp"/>
			<% }else if(act.equals("ganti_password")){ %>
			<jsp:include page="WEB-INF/jsp/user/ganti_password.jsp"/>
			<% }else if(act.equals("user")){ %>
			<jsp:include page="WEB-INF/jsp/user/user.jsp"/>
			<% }else if(act.equals("delete_user")){ %>
			<jsp:include page="WEB-INF/jsp/user/delete_user.jsp"/>
			<% }else if(act.equals("pasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/pasien.jsp"/>
			<% }else if(act.equals("addpasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/addpasien.jsp"/>
			<% }else if(act.equals("delete_pasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/delete_pasien.jsp"/>
			<% }else if(act.equals("update_pasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/update_pasien.jsp"/>
			<% }else if(act.equals("detail_pasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/detail_pasien.jsp"/>  
			<% }else if(act.equals("riwayataktivitas")){ %>
			<jsp:include page="WEB-INF/jsp/igd/RiwayatAktivitasRuangRawat/riwayataktivitas.jsp"/>
			<% }else if(act.equals("add_riwayat")){ %>
			<jsp:include page="WEB-INF/jsp/igd/RiwayatAktivitasRuangRawat/add_riwayat.jsp"/>  
			<% }else if(act.equals("update_riwayat")){ %>
			<jsp:include page="WEB-INF/jsp/igd/RiwayatAktivitasRuangRawat/update_riwayat.jsp"/>  
			<% }else if(act.equals("detail_riwayat")){ %>
			<jsp:include page="WEB-INF/jsp/igd/RiwayatAktivitasRuangRawat/detail_riwayat.jsp"/>  
			<% }else if(act.equals("add_ruang")){ %>
			<jsp:include page="WEB-INF/jsp/igd/RuangRawat/add_ruang.jsp"/>  
			<% }else if(act.equals("update_ruang")){ %>
			<jsp:include page="WEB-INF/jsp/igd/RuangRawat/update_ruang.jsp"/>  
			<% }else if(act.equals("ruangrawat")){ %>
			<jsp:include page="WEB-INF/jsp/igd/RuangRawat/ruangrawat.jsp"/>                                                                  					 <%-- MODUL IGD  --%>
			<% }%>

							
			</div>
		</div>
	
		
	</body>
</html>