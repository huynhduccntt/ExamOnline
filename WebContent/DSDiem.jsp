
<%@page import="dao.DeThiDAO"%>
<%@page import="model.DeThi"%>
<%@page import="dao.CTThiDAO"%>
<%@page import="model.CTThi"%>
<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="generator" content="Founder Moha Team HN Đức ">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <meta name="description" content="Website thi trắc nghiệm online" >
      <meta name="keywords" content="online, thi trac nghiem, hcmute, trac nghiem online " />
      <meta name="author" content =" Huỳnh Ngọc Đức ">
      <title>Thi trắc nghiệm | Admin </title>
      <link href="https://online.hcmute.edu.vn/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" href="assets2/plugins/morris/morris.css">
<link href="assets2/plugins/switchery/switchery.min.css" rel="stylesheet" />
<link href="assets2/css/style.css" rel="stylesheet" type="text/css" />
<script src="assets2/JS/modernizr.min.js"></script>
<script src="assets2/JS/analytics.js" type="text/javascript"></script>
<link href="assets2/font-awesome-4.6.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="assets2/material-design-iconic-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="fixed-left">
	<%
		Users users = null;
		UsersDAO usersDAO = new UsersDAO();
		CTThiDAO ctThiDAO = new CTThiDAO();
		DeThiDAO deThiDAO=new DeThiDAO();
		if (session.getAttribute("userAdmin") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");

		} else {
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
						<li class="has_sub"><a href="DSTaiKhoan.jsp"
							class="waves-effect" id="DSTK"><span style="margin-left: 20px">
									Danh sách tài khoản</span> </a></li>
									
						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect">
								<span style="margin-left: 20px">Chi tiết  </span> <span
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
									<li><a href="Admin.jsp">Admin</a></li>
									<li class="active">Điểm</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->
					
					<div class="row">
						<div class="col-sm-12">
							<div class="card-box table-responsive">
								<table id="datatable-buttons"
									class="table table-striped table-bordered" cellspacing="0"
									width="100%">
									<thead>
										<tr>
											<th>MSSV</th>
											<th>Mã đề</th>
											<th>Điểm</th>
										</tr>
									</thead>
									<tbody>
										<%
											String made = request.getParameter("made");
												for (CTThi ct : ctThiDAO.getwithMaDe(made)) {
										%>
										<tr>

											<td><%=ct.getUsername()%></td>
											<td><%=ct.getMaDe()%></td>
											<td><%=ct.getDiem()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- end row -->
					<div class="row">
						<div class="col-sm-6">
							<div class="card-box table-responsive">
								<form method="post" action="">
									<div class="form-group">
										<label for="inputEmail3" class="control-label">Đề thi</label> <select
											class="form-control" name="made">
											<option value="">Chọn</option>
											<%
												for (DeThi dt : deThiDAO.getDSDeThi()) {
											%>
											<option value="<%=dt.getMaDe()%>">
												<%=dt.getTenDe()%>
											</option>
											<%
												}
											%>
										</select>
									</div>
									<div class="form-group">

										<button type="submit" class="btn btn-primary">Search</button>

									</div>
								</form>
							</div>
						</div>

					</div>
				</div>
				<!-- container -->
			</div>
			<!-- content -->
		</div>
		<!-- End content-page -->
		<!-- End Right content here -->
		<!-- Right Sidebar -->

		<!-- /Right-bar -->

		<footer class="footer text-right"> 2017 © HCMUTE </footer>


	</div>
	<!-- END wrapper -->


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
	<!--Morris Chart-->
	<script src="assets2/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="assets2/plugins/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Buttons examples -->
	<script src="assets2/plugins/datatables/dataTables.buttons.min.js"></script>
	<script src="assets2/plugins/datatables/buttons.bootstrap4.min.js"></script>

	<script src="assets2/plugins/datatables/pdfmake.min.js"></script>
	<script src="assets2/plugins/datatables/vfs_fonts.js"></script>
	<script src="assets2/plugins/datatables/buttons.html5.min.js"></script>
	<script src="assets2/plugins/datatables/buttons.print.min.js"></script>
	<script src="assets2/plugins/datatables/buttons.colVis.min.js"></script>
	<!-- Responsive examples -->


	<!-- App js -->
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
	<%
		}
	%>
</body>


</html>