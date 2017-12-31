<%-- 
    Document   : NguoiRaDe-QLD
    Created on : Oct 14, 2016, 10:52:31 AM
    Author     : BAO UY
--%>

<%@page import="model.DeThi"%>
<%@page import="connect.DBconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Users"%>
<%@page import="model.MonHoc"%>
<%@page import="model.NoiDung"%>
<%@page import="dao.MonhocDAO"%>
<%@page import="dao.NoiDungThiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý đề</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/style_OT.css" rel="stylesheet" type="text/css" />
<!-- Latest compiled and minified CSS -->
<!-- Optional theme -->
<link href="assets/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<!-- Latest compiled and minified JavaScript -->
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<body>
	<%
		Users users = null;
		MonhocDAO mhDAO = new MonhocDAO();
		NoiDungThiDAO ndtDAO = new NoiDungThiDAO();
		NoiDung noiDung = new NoiDung();
		DeThi deThi = new DeThi();
		if (session.getAttribute("userQLDE") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");

		} else {
			users = (Users) session.getAttribute("userQLDE");
	%>
	<div class="wapper">
<div class="bgded overlay" style="background-image:url('assets/Images/welcome.jpg');"> 

  <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <div id="logo" class="fl_left">
        <h1><a href="index.jsp">  <img src="assets/Images/logo.png" alt=""></a></h1>
      </div>
      <nav id="mainav" class="fl_right">
        <ul class="clear">
          <li class="active"><a href="index.jsp">TRANG CHỦ </a></li>
          <li><a href="Contact.jsp">liên Hệ</a></li>
          <li><a href="Login.jsp">Đăng xuất</a></li>
     
        </ul>
      </nav>
    </header>
  </div>
  </div>		
		<div class="main">
			<div class="container" id="Update-QLND">
				<div class="row">
					<div class="col-md-9 col-sm-8 col-xs-0">
						<div class="row">
							<div class="col-sm-6"></div>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-9">
						<div class="block-user-info block-user-info-responsive logged">
							<ul class="clearfix">
								<div class="dropdown dropdown-vta">
									<a class="dropdown-toggle dropdown-vta-login" role="button"
										id="dropdownMenu1" data-toggle="dropdown"> <%
 	if (users != null) {
 %> <span class="hello">Xin chào <span
											style="color: #ED7642; font-weight: 600"> <%=users.getFullname()%></span>
											<span class="caret"></span> <%
 	}
 %></a>
									<ul class="dropdown-menu dropdown-vta-sub-menu"
										aria-labelledby="dropdownMenu1">
										<li><a
											href="Profile.jsp?UserName=<%=users.getUserName()%>">Thông
												tin cá nhân</a></li>

										<li><a
											href="Doimatkhau.jsp?UserName=<%=users.getUserName()%>">Đổi
												mật khẩu</a></li>
										<li><a href="Login.jsp">Thoát</a></li>
									</ul>
								</div>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<ol class="breadcrumb">
						<span class="glyphicon glyphicon-home" aria-hidden="true"
							style="color: #000 !important"></span>
						<li><a href="index.jsp">Trang chủ</a></li>
						<li class="active">Quản lý đề</li>
					</ol>
				</div>
				<div class="row">

					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">1. Tạo
										mới đề thi</a>
								</h4>
							</div>

							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<div class="col-md-6">
										<div id="form-taodethi" ng-app="demoApp"
											ng-controller="InsertMHNDCtrl">
											<form method="post" action="TaoDeThi" id="login-taodethi"
												class="form-horizontal" name="form" ng-submit="login()"
												novalidate>
												<div class="form-group">
													<label for="inputMD" class="col-sm-4 control-label">Mã
														đề: </label>
													<div class="col-xs-8">
														<input name="made" type="text" class="form-control"
															placeholder="" ng-model="made" autocomplete="off"
															required> <i class="fa fa-check text-success"
															ng-show="form.made.$dirty && form.made.$valid"></i>

														<!--Dấu check thể hiệviệc nhập dữ liệu được nhập là hợp lệ-->

														<div ng-show="form.made.$dirty && form.made.$invalid"
															class="text-danger">
															<i class="fa fa-times text-danger"></i>

															<!--Nếu dữ liệu không hợp lệ-->
															<span ng-show="form.made.$error.required"></span>
														</div>

													</div>
												</div>
												<div class="form-group">
													<label for="inputMD" class="col-sm-4 control-label">Tên
														đề: </label>
													<div class="col-xs-8">
														<input name="tende" type="text" class="form-control"
															placeholder="" ng-model="tende" autocomplete="off"
															required> <i class="fa fa-check text-success"
															ng-show="form.tende.$dirty && form.tende.$valid"></i>

														<!--Dấu check thể hiệviệc nhập dữ liệu được nhập là hợp lệ-->

														<div ng-show="form.tende.$dirty && form.tende.$invalid"
															class="text-danger">
															<i class="fa fa-times text-danger"></i>

															<!--Nếu dữ liệu không hợp lệ-->
															<span ng-show="form.tende.$error.required"></span>
														</div>

													</div>
												</div>
												<div class="form-group">
													<label for="inputMD" class="col-sm-4 control-label">Thời
														gian làm bài: </label>
													<div class="col-xs-8">
														<input name="thoigian" type="text" class="form-control"
															placeholder="" ng-model="thoigian" autocomplete="off"
															required> <i class="fa fa-check text-success"
															ng-show="form.thoigian.$dirty && form.thoigian.$valid"></i>

														<!--Dấu check thể hiệviệc nhập dữ liệu được nhập là hợp lệ-->

														<div
															ng-show="form.thoigian.$dirty && form.thoigian.$invalid"
															class="text-danger">
															<i class="fa fa-times text-danger"></i>

															<!--Nếu dữ liệu không hợp lệ-->
															<span ng-show="form.thoigian.$error.required"></span>
														</div>

													</div>
												</div>
												<div class="form-group">
													<label for="mon" class="col-sm-4 control-label">Môn
														thi: </label>
													<div class="col-sm-8">
														<select class="form-control" name="mamh">
															<option value="">Chọn</option>
															<%
																for (MonHoc c : mhDAO.getlistMH()) {
															%>
															<option value="<%=c.getMaMH()%>">
																<%=c.getMaMH()%>
															</option>
															<%
																}
															%>
														</select> <i class="fa fa-check text-success"
															ng-show="form.mamh.$dirty && form.mamh.$valid"></i>
														<div ng-show="form.mamh.$dirty && form.mamh.$invalid"
															class="text-danger"></div>

													</div>
												</div>

												<div class="form-group">

													<label for="noidung"
														class="col-sm-4 control-label required">Nội dung:
													</label>
													<div class="col-sm-8">
														<select class="form-control" id="noidung" name="mand">
															<option value="">Chọn</option>
															<%
																for (NoiDung nd : ndtDAO.getListND()) {
															%>
															<option value=<%=nd.getMaND()%>>
																<%=nd.getMaND()%>
															</option>
															<%
																}
															%>
														</select> <i class="fa fa-check text-success"
															ng-show="form.mand.$dirty && form.mand.$valid"></i>
														<div ng-show="form.mand.$dirty && form.mand.$invalid"
															class="text-danger"></div>
													</div>
												</div>

												<div class="form-group">
													<label for="soch" class="col-sm-4 control-label">Số
														câu hỏi lấy: </label>
													<div class="col-sm-8">
														<input class="form-control" type="text" id="soch" min="1"
															max="30" name="socauhoi" placeholder="Số câu hỏi sẽ lấy"
															ng-model="socauhoi" required> <span
															style="color: red"
															ng-show="form.socauhoi.$dirty && form.socauhoi.$invalid">
															<span ng-show="form.socauhoi.$error.required"></span>
														</span>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-4"></div>
													<div class="col-sm-8">
														<button type="submit" class="btn btn-danger" id="btn-CN"
															ng-disabled="!form.$dirty || (form.$dirty && form.$invalid)"
															onclick="return alert('Tạo đề thi thành công')">
															Thêm</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">2. Danh
										sách các đề đã tạo</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">

									<div class="row">
										<%
											Connection con = null;
												PreparedStatement ps = null;
												try {
													con = DBconnect.getConnecttion();
													String sql = "select b.MaMH,b.MaDe,b.SLCH,b.TenMH,dethi.TenDe,dethi.ThoiGian "
															+ "from (SELECT a.MaMH,MaDe,SLCH, TenMH from (select MaMH,MaDe,COUNT(dt.MaCH) as SLCH "
															+ "from ctdethi dt inner join cauhoi ch on dt.MaCH=ch.MaCH GROUP BY MaDe) as a "
															+ "inner JOIN monhoc mh on a.MaMH=mh.MaMH) as b INNER JOIN dethi on b.MaDe=dethi.MaDe";
													ps = con.prepareCall(sql);
													ResultSet rs = ps.executeQuery(sql);
										%>

										<table class="table table-bordered">
											<thead>
												<tr>
													<th>Mã đề</th>
													<th>Môn</th>
													<th>Số câu hỏi</th>
													<th>Hành động</th>
												</tr>
											</thead>
											<tbody>
												<%
													while (rs != null && rs.next()) {
												%>
												<tr>
													<td><%=rs.getString("MaDe")%></td>
													<td><%=rs.getString("TenMH")%></td>
													<td><%=rs.getInt("SLCH")%></td>
													<td><a data-toggle="modal" href="#form-update-dethi"
														data-target="#form-update-dethi"
														data-made='<%=rs.getString("MaDe")%>'
														data-tende='<%=rs.getString("TenDe")%>'
														data-thoigian='<%=rs.getString("ThoiGian")%>'>Edit</a> ||
														<a href="XoaDeThi?maDe=<%=rs.getString("MaDe")%>"
														onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Delete</a></td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>

										<%
											} catch (Exception e) {
													out.println(e.getMessage());
												}
										%>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="form-update-dethi">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title">Chỉnh sửa đề</h4>
									</div>
									<div class="modal-body">
										<form action="Update" method="POST" class="form-horizontal"
											role="form">
											<fieldset class="form-group">
												<label for="input-username" class="col-sm-3">Mã đề</label>
												<div class="col-sm-9">
													<input readonly type="text" name="made" id="input-made"
														class="form-control input-sm" value="" required>
												</div>
											</fieldset>

											<fieldset class=form-group>
												<label for="input-username" class="col-sm-3">Tên đề</label>
												<div class="col-sm-9">
													<input type="text" name="tende" id="input-tende"
														class="form-control input-sm" value="" required>
												</div>
											</fieldset>
											<fieldset class=form-group>
												<label for="input-username" class="col-sm-3">Thời
													gian</label>
												<div class="col-sm-9">
													<input type="text" name="thoigian" id="input-thoigian"
														class="form-control input-sm" value="" required>
												</div>
											</fieldset>
											<fieldset class="form-group">
												<hr>
												<div class="pull-right">
													<input type="hidden" value="updateDE" name="command">
													<button type="submit" class="btn btn-primary btn-sm"
														style="margin-right: 20px"
														onclick="return confirm('Chỉnh sửa thành công đề thi')">Lưu</button>
													<button type="button" class="btn btn-default btn-sm"
														data-dismiss="modal" style="margin-right: 30px">Đóng</button>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br>
		<jsp:include page="Footer.jsp"></jsp:include>
		<button type="button" class="back-to-top" data-toggle="tooltip"
			data-placement="top" title="Lên đầu trang">
			<p>
				<i class="zmdi zmdi-chevron-up"></i>
			</p>
		</button>
	</div>
	<script src="assets/JQuery/jquery-3.1.1.min.js"></script>
	<script src="assets/JS/angular.min.js" type="text/javascript"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script>
		$('#form-update-dethi').on('show.bs.modal', function(event) {
			var a = $(event.relatedTarget) // Button that triggered the modal
			var made = a.data('made') // Extract info from data-* attributes
			var tende = a.data('tende') // Extract info from data-* attributes
			var thoigian = a.data('thoigian')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			$('#input-made').val(made)
			$('#input-tende').val(tende)
			$('#input-thoigian').val(thoigian)
		});
	</script>
	<script>
		var demoApp = angular.module('demoApp', []).controller(
				"InsertMHNDCtrl", [ '$scope', function($scope) {
					$scope.success = false;
					$scope.register = function() {
						$scope.success = true;
					}
				} ]);
	</script>
	<%
		}
	%>
</body>
</html>
