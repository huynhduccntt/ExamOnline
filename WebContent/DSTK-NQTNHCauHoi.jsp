

<%@page import="dao.UsersDAO"%>
<%@page import="model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Demo
    Created on : Dec 20, 2017, 20:25:10 AM
    Author     : Huynh Duc
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="generator" content="Founder Moha Team HN Đức ">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <meta name="description" content="Website thi trắc nghiệm online" >
      <meta name="keywords" content="online, thi trac nghiem, hcmute, trac nghiem online " />
      <meta name="author" content =" Huỳnh Ngọc Đức ">
      <title>Thi trắc nghiệm | Admin </title>
      <link href="https://online.hcmute.edu.vn/favicon.ico" rel="shortcut icon">

<link href="assets2/plugins/bootstrap-sweetalert/sweet-alert.css"
	rel="stylesheet" type="text/css" />
<!-- Switchery css -->
<link href="assets2/plugins/switchery/switchery.min.css" rel="stylesheet" />

<!-- App CSS -->
<link href="assets2/css/style.css" rel="stylesheet" type="text/css" />

<!-- Modernizr js -->
<script src="assets2/JS/modernizr.min.js"></script>
<link
	href="assets2/material-design-iconic-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" type="text/css" />

</head>
<body class="fixed-left">
	<%
		UsersDAO usersDAO = new UsersDAO();

		Users users = null;
		if (session.getAttribute("userAdmin") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");
			
		}
		else{
			users = (Users) session.getAttribute("userAdmin");
	%>
	<!-- Begin page -->
	<div id="wrapper">
		<!-- Top Bar Start -->
		<div class="topbar">
			<!-- LOGO -->
			<div class="topbar-left">
				<a href="Admin.jsp">  <img src="assets/Images/logo.png" alt="" class="logo"></a> <span>Chào Admin	</span>
				
			</div>
			<div class="navbar navbar-custom">
				<ul class="nav navbar-nav">
					<li class="nav-item">
						<button
							class="button-menu-mobile open-left waves-light waves-effect">
							<i class="zmdi zmdi-menu"></i>
						</button>
					</li>
					
				</ul>
				<ul class="nav navbar-nav pull-right">

					<li class="nav-item dropdown notification-list"><a
						class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user"
						data-toggle="dropdown" href="#" role="button"
						aria-haspopup="false" aria-expanded="false"> <img src="http://www.clker.com/cliparts/Z/j/s/D/8/H/man-user-operator-md.png"
							alt="user" class="img-circle">
					</a>
						<div
							class="dropdown-menu dropdown-menu-right dropdown-arrow profile-dropdown "
							aria-labelledby="Preview">
							<!-- item-->
							<div class="dropdown-item noti-title">
								<%
									if (users != null) {
								%>
								<h5 class="text-overflow">
									<small>Xin chào <%=users.getUserName()%></small>
								</h5>
								<%
									}
								%>
							</div>

							<!-- item-->
							<a href="Profile.jsp?UserName=<%=users.getUserName()%>"
								class="dropdown-item notify-item"> <i
								class="zmdi zmdi-account-circle"></i> <span>Profile</span>
							</a>
							<!-- item-->
							<a href="Doimatkhau.jsp?UserName=<%=users.getUserName()%>"
								class="dropdown-item notify-item"> <i
								class="zmdi zmdi-lock-open"></i> <span>Đổi mật khẩu</span>

							</a>

							<!-- item-->
							<a href="LogOut" class="dropdown-item notify-item"> <i
								class="zmdi zmdi-power"></i> <span>Logout</span>
							</a>

						</div></li>

				</ul>
			</div>
		</div>
			<div class="left side-menu">
			<div class="sidebar-inner slimscrollleft">
				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<ul>
						<li class="text-muted menu-title"></i> Quản lý tài khoản</li>
						
						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect">
								<span style="margin-left: 20px">Danh sách tài khoản  </span> <span
								class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li><a href="DSTK-NQTNHCauHoi.jsp" id="DSTK-QTNHCH">Quản lý câu hỏi</a></li>
								<li><a href="DSTK-NguoiRaDe.jsp" id="DSTK-NRD">Tạo đề thi</a></li>
								<li><a href="DSTKNQTKyThi.jsp" id="DSTK-NQTKT">Quản lý kì thi </a></li>
								<li><a href="DSTKSinhVien.jsp" id="DSTK-SV">Sinh viên</a></li>
							</ul></li>
						<li class="has_sub"><a href="DSRole.jsp" class="waves-effect"><span
								style="margin-left: 20px"> Vai trò </span></a></li>
						<li class="text-muted menu-title"> Quản lý điểm</li>
						<li class="has_sub"><a href="DSDiem.jsp" class="waves-effect"><span
								style="margin-left: 20px"> Quản lý điểm </span></a></li>

					</ul>
					<div class="clearfix"></div>
				</div>
				<!-- Sidebar -->
				<div class="clearfix"></div>

			</div>

		</div>
		<!-- Left Sidebar-->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="page-title-box">
								<h4 class="page-title">
									Website thi trắc nghiệm trực tuyến <small></small>
								</h4>
								<ol class="breadcrumb p-0">
									<li><a href="index.jsp">Trang chủ</a></li>
									<li class="active">Danh sách tài khoản</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="card-box table-responsive">
							<table class="table table-hover">
									<thead>
										<tr>
											<th>Username</th>
											<th>Password</th>
											<th>Tên người dùng</th>
											<th>Giới tính</th>
											<th>Ngày sinh</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ</th>
											<th>Email</th>
										</tr>
									</thead>
									<tbody>
									<%
									String roleid="QLNHCH";
										for(Users u : usersDAO.getListUserswithRole(roleid)){
									%>
									
									<tr>
										<td><%=u.getUserName() %></td>
										<td><%=u.getPassword() %></td>
										<td><%=u.getFullname() %></td>
										<td><%=u.getGender() %></td>
										<td><%=u.getBirthday() %></td>
										<td><%=u.getNumberPhone() %></td>
										<td><%=u.getAddress() %></td>
										<td><%=u.getEmail() %></td>
											</tr>
									<%} %>
									</tbody>
									
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer text-right"> 2017 © HCMUTE </footer>
	</div>
	<!-- content -->
	<script>
		var resizefunc = [];
	</script>

	<!-- jQuery  -->
	<script src="assets2/JS/jquery.min.js"></script>
	<script src="assets2/JS/tether.min.js"></script>
	<!-- Tether for Bootstrap -->
	<script src="assets2/JS/bootstrap.min.js"></script>
	<script src="assets2/JS/detect.js"></script>
	<script src="assets2/JS/fastclick.js"></script>
	<script src="assets2/JS/jquery.blockUI.js"></script>
	<script src="assets2/JS/waves.js"></script>
	<script src="assets2/JS/jquery.nicescroll.js"></script>
	<script src="assets2/JS/jquery.scrollTo.min.js"></script>
	<script src="assets2/JS/jquery.slimscroll.js"></script>
	<script src="assets2/plugins/switchery/switchery.min.js"></script>

	<!-- Sweet Alert js -->
	<script src="assets2/plugins/bootstrap-sweetalert/sweet-alert.min.js"
		type="text/javascript"></script>
	<script src="assets2/pages/jquery.sweet-alert.init.js"
		type="text/javascript"></script>
	<!-- Required datatable js -->
	<script src="assets2/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="assets2/plugins/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Buttons examples -->
	<script src="assets2/plugins/datatables/dataTables.buttons.min.js"></script>
	<script src="assets2/plugins/datatables/buttons.bootstrap4.min.js"></script>
	<script src="assets2/plugins/datatables/jszip.min.js"></script>
	<script src="assets2/plugins/datatables/pdfmake.min.js"></script>
	<script src="assets2/plugins/datatables/vfs_fonts.js"></script>
	<script src="assets2/plugins/datatables/buttons.html5.min.js"></script>
	<script src="assets2/plugins/datatables/buttons.print.min.js"></script>
	<script src="assets2/plugins/datatables/buttons.colVis.min.js"></script>
	<!-- Responsive examples -->
	<script src="assets2/plugins/datatables/dataTables.responsive.min.js"></script>
	<script src="assets2/plugins/datatables/responsive.bootstrap4.min.js"></script>

	<script src="assets2/JS/jquery.core.js"></script>
	<script src="assets2/JS/jquery.app.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#datatable').DataTable();

					//Buttons examples
					var table = $('#datatable-buttons').DataTable({
						lengthChange : false,
						buttons : [ 'copy', 'excel', 'pdf', 'colvis' ]
					});

					table.buttons().container().appendTo(
							'#datatable-buttons_wrapper .col-md-6:eq(0)');
				});
	</script>
	<%} %>
</body>


</html>