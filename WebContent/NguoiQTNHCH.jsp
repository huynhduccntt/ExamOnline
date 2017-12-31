<%-- 
    Document   : NguoiQTNHCH
    Created on : Oct 14, 2016, 10:39:56 AM
    Author     : Kelvin
--%>
<%@page import="dao.CauHoiDAO"%>
<%@page import="connect.DBconnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.NoiDungThiDAO"%>
<%@page import="model.NoiDung"%>
<%@page import="model.MonHoc"%>
<%@page import="dao.MonhocDAO"%>
<%@page import="model.Users"%>
<%@page import="model.CauHoi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm câu hỏi</title>
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/css/style_OT.css" rel="stylesheet" type="text/css" />
<link href="assets/font-awesome-4.6.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script src="assets/JQuery/jquery-3.1.1.min.js"></script>
<script src="assets/JS/angular.min.js" type="text/javascript"></script>
</head>

<body>
	<%
		Users users = new Users();
		MonHoc monHoc = new MonHoc();
		NoiDung noidung = new NoiDung();
		CauHoi cauhoi = new CauHoi();
		MonhocDAO monhocDAO = new MonhocDAO();
		NoiDungThiDAO noiDungThiDAO = new NoiDungThiDAO();
		CauHoiDAO cauHoiDAO = new CauHoiDAO();
		if (session.getAttribute("userNHCH") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");
			
		}
		else{
			users = (Users) session.getAttribute("userNHCH");
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
			<div class="container" id="Update-CSCH">
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
											style="color: #ED7642; font-weight: 600"><%=users.getFullname()%></span></span>
										<%
											}
										%> <span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-vta-sub-menu"
										aria-labelledby="dropdownMenu1">
										<li><a
											href="Profile.jsp?UserName=<%=users.getUserName()%>">Thông
												tin cá nhân</a></li>
										<li><a
											href="Doimatkhau.jsp?UserName=<%=users.getUserName()%>">Đổi
												mật khẩu</a></li>
										<li><a href="LogOut">Thoát</a></li>
									</ul>
								</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<ol class="breadcrumb">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<li><a href="NguoiQTNHCH.jsp" title="">Quản trị câu hỏi</a></li>
						<li class="active">Thêm câu hỏi</li>
					</ol>
				</div>
				<div class="row">
					<div class="customDiv-2">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-primary">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne"> 1. Thêm
											môn học - Nội dung</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<div id="main" ng-app="demoApp" ng-controller="InsertMHNDCtrl">
											<div class="row">
												<div class="col-md-6">
													<form method="post" action="MonHocServlet"
														class="form-horizontal" id="register-form" name="form"
														ng-submit="insert()" novalidate>
														<div class="form-group">
															<label for="inputMaMH" class="col-sm-4 control-label">*
																Mã môn học</label>
															<div class="col-sm-8">
																<input name="mamh" id="inputMaMH" type="text"
																	class="form-control" placeholder="" ng-model="mamh"
																	autocomplete="off" required> <span
																	id="mh-result"></span>
																<!--Dấu check thể hiện việc nhập dữ liệu được nhập là hợp lệ-->

																<div ng-show="form.mamh.$dirty && form.mamh.$invalid"
																	class="text-danger">
																	<i class="fa fa-times text-danger"></i> <span
																		ng-show="form.mamh.$error.required">Bạn chưa
																		nhập mã môn học</span>

																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="inputTenMH" class="col-sm-4 control-label">*
																Tên môn học</label>
															<div class="col-sm-8">
																<input name="tenmh" id="inputTenMH" ng-model="tenmh"
																	type="text" class="form-control" placeholder=""
																	required> <i class="fa fa-check text-success"
																	ng-show="form.tenmh.$dirty && form.tenmh.$valid"></i>

																<div ng-show="form.tenmh.$dirty && form.tenmh.$invalid"
																	class="text-danger">
																	<i class="fa fa-times text-danger"></i> <span
																		ng-show="form.tenmh.$error.required"> Bạn chưa
																		nhập tên môn học</span>

																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-offset-4 col-sm-8">
																<button type="submit" class="btn btn-primary"
																	onClick="alert('Tạo thành công môn học')"
																	ng-disabled="!form.$dirty || (form.$dirty && form.$invalid)"
																	style="margin-top: 10px; margin-bottom: 10px" onclick="return alert('Thêm môn học thành công')">
																	Thêm</button>
															</div>
														</div>
													</form>
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>Mã MH</th>
																<th>Tên MH</th>
																<th>Hành động</th>
															</tr>

														</thead>
														<%
															Connection connection = DBconnect.getConnecttion();
															String sql = "SELECT * FROM monhoc";
															PreparedStatement ps = connection.prepareCall(sql);
															ResultSet rs;
															rs = ps.executeQuery();
															while (rs.next()) {
														%>
														<tr>
															<td><%=rs.getString("MaMH")%></td>
															<td><%=rs.getString("TenMH")%></td>
															<td><a data-toggle="modal" href="#form-update-mh"
																data-target="#form-update-mh"
																data-mamh='<%=rs.getString("MaMH")%>'
																data-tenmh='<%=rs.getString("TenMH")%>'>Edit</a> || <a
																onclick="return confirm('Bạn có chắc chắn muốn xóa?')"
																href="DeleteUser?command=deleteMH&MaMH=<%=rs.getString("MaMH")%>">Delete</a></td>
														</tr>
														<%
															}
														%>
													</table>
												</div>
												<div class="col-md-6">
													<form method="post" action="NoiDungThiServlet"
														class="form-horizontal" id="register-form" name="form1"
														ng-submit="insert()" novalidate>
														<div class="form-group">
															<label for="inputMaND" class="col-sm-4 control-label">*
																Mã nội dung</label>
															<div class="col-sm-8">
																<input name="mand" id="inputMaND" type="text"
																	class="form-control" placeholder="" ng-model="mand"
																	autocomplete="off" required> <span
																	id="nd-result"></span>
																<div ng-show="form1.mand.$dirty && form1.mand.$invalid"
																	class="text-danger">
																	<i class="fa fa-times text-danger"></i> <span
																		ng-show="form1.mand.$error.required">Bạn chưa
																		nhập mã nội dung</span>

																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="inputTenND" class="col-sm-4 control-label">*
																Tên nội dung</label>
															<div class="col-sm-8">
																<input name="tennd" id="inputTenND" ng-model="tennd"
																	type="text" class="form-control" placeholder=""
																	required> <i class="fa fa-check text-success"
																	ng-show="form1.tennd.$dirty && form1.tennd.$valid"></i>

																<div
																	ng-show="form1.tennd.$dirty && form1.tennd.$invalid"
																	class="text-danger">
																	<i class="fa fa-times text-danger"></i> <span
																		ng-show="form1.tennd.$error.required"> Bạn chưa
																		nhập tên nội dung</span>

																</div>
															</div>
														</div>
														<div class="form-group">
															<label for="inputMaMH" class="col-sm-4 control-label">*
																Mã môn học</label>
															<div class="col-sm-8">
																<select class="form-control input-sm" name="mamh"
																	ng-model="manh" required>
																	<option value="">Chọn</option>
																	<%
																		for (MonHoc c : monhocDAO.getlistMH()) {
																	%>
																	<option value=<%=c.getMaMH()%>>
																		<%=c.getMaMH()%>
																	</option>
																	<%
																		}
																	%>
																</select> <i class="fa fa-check text-success"
																	ng-show="form.mamh.$dirty && form.manh.$valid"></i>
																<div ng-show="form.mamh.$dirty && form.manh.$invalid"
																	class="text-danger"></div>
															</div>


														</div>
														<div class="form-group">
															<div class="col-sm-offset-4 col-sm-8">
																<button type="submit" class="btn btn-primary"
																	onClick="alert('Tạo thành công nội dung thi')"
																	ng-disabled="!form1.$dirty || (form1.$dirty && form1.$invalid)"
																	style="margin-top: 10px; margin-bottom: 10px" onclick="return alert('Thêm nội dung thành công')">
																	Thêm</button>
															</div>
														</div>
													</form>
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>Mã ND</th>
																<th>Tên ND</th>
																<th>Mã MH</th>
																<th>Hành động</th>
															</tr>

														</thead>
														<%
															Connection connection1 = DBconnect.getConnecttion();
															String sql1 = "SELECT * FROM noidungthi";
															PreparedStatement ps1 = connection.prepareCall(sql1);
															ResultSet rs1;
															rs1 = ps1.executeQuery();
															while (rs1.next()) {
														%>
														<tr>
															<td><%=rs1.getString("MaND")%></td>
															<td><%=rs1.getString("TenND")%></td>
															<td><%=rs1.getString("MaMH")%></td>
															<td><a data-toggle="modal" href='#form-update-nd'
																data-target="#form-update-nd"
																data-mand='<%=rs1.getString("MaND")%>'
																data-tennd='<%=rs1.getString("TenND")%>'
																data-mamh='<%=rs1.getString("MaMH")%>'>Edit</a> || <a
																onclick="return confirm('Bạn có chắc chắn muốn xóa?')"
																href="DeleteUser?command=deleteND&MaND=<%=rs1.getString("MaND")%>">Delete</a></td>
														</tr>
														<%
															}
														%>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel panel-primary">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo"
											aria-expanded="true" aria-controls="collapseTwo"> 2. Nhập
											câu hỏi</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<form class="form-horizontal" action="ThemCauHoi"
											method="post">
											<div class="form-group">
												<div class="col-md-6">
													<label for="inputEmail3"
														class="col-sm-4 control-label text-left">Mã môn
														học </label>
													<div class="col-sm-8">
														<select class="form-control input-xs" name="maMH">
															<option value="">Chọn</option>
															<%
																for (MonHoc c : monhocDAO.getlistMH()) {
															%>
															<option value=<%=c.getMaMH()%>>
																<%=c.getMaMH()%>
															</option>
															<%
																}
															%>
														</select>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-6">
													<label for="inputEmail3"
														class="col-sm-4 control-label text-left">Nội dung
														thi </label>
													<div class="col-sm-8">
														<select class="form-control input-xs" name="maND">
															<option value="">Chọn</option>
															<%
																for (NoiDung c : noiDungThiDAO.getListND()) {
															%>
															<option value=<%=c.getMaND()%>>
																<%=c.getMaND()%>
															</option>
															<%
																}
															%>
														</select>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-6">
													<div class="col-sm-4"></div>
													<div class=col-sm-8>
														<a type="button" class="btn btn-primary"
															href="#form-insert-ch" data-toggle="modal"
															data-target="#form-insert-ch">Thêm câu hỏi</a>
														<div class="modal fade bs-example-modal-lg" tabindex="-1"
															role="dialog" aria-labelledby="myLargeModalLabel"
															id="form-insert-ch">
															<div class="modal-dialog modal-lg" role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																		<h4 class="modal-title" id="myModalLabel">Thêm
																			câu hỏi</h4>
																	</div>
																	<div class="modal-body">

																		<fieldset class="form-group">
																			<label for="inputMaCH" class="col-sm-4 control-label">Mã
																				câu hỏi</label>
																			<div class="col-sm-8">
																				<input type="text" name="mach" class="form-control"
																					required="" id="inputMaCH" placeholder="">
																				<span class="field-validation-valid text-danger"
																					data-valmsg-for="Username"
																					data-valmsg-replace="true"></span>

																			</div>
																		</fieldset>
																		<fieldset class="form-group">
																			<label for="inputNDCH" class="col-sm-4 control-label">Nội
																				dung câu hỏi </label>
																			<div class="col-sm-8">
																				<textarea class="form-control" name="ndcauhoi"
																					rows="3" col="10"></textarea>
																			</div>
																		</fieldset>


																		<fieldset class="form-group">
																			<label for="inputDAA" class="col-sm-4 control-label">Phương
																				án 1</label>
																			<div class="col-sm-8">
																				<textarea class="form-control" name="PAA" rows="2"
																					col="10" id="inputDAA"></textarea>
																			</div>
																		</fieldset>
																		<fieldset class="form-group">
																			<label for="inputDAB" class="col-sm-4 control-label">Phương
																				án 2</label>
																			<div class="col-sm-8">
																				<textarea class="form-control" name="PAB" rows="2"
																					col="10" id="inputDAB"></textarea>
																			</div>
																		</fieldset>
																		<fieldset class="form-group">
																			<label for="inputDAC" class="col-sm-4 control-label">Phương
																				án 3</label>
																			<div class="col-sm-8">
																				<textarea class="form-control" name="PAC" rows="2"
																					col="10" id="inputDAC"></textarea>
																			</div>
																		</fieldset>
																		<fieldset class="form-group">
																			<label for="inputDAD" class="col-sm-4 control-label">Phương
																				án 4</label>
																			<div class="col-sm-8">
																				<textarea class="form-control" name="PAD" rows="2"
																					col="10" id="inputDAD"></textarea>
																			</div>
																		</fieldset>
																		<fieldset class="form-group">
																			<label for="inputDA" class="col-sm-4 control-label">Đáp
																				án </label>
																			<div class="col-sm-8">
																				<input type="text" class="form-control" name="DA"
																					required="" id="inputDA" placeholder="">
																			</div>
																		</fieldset>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Đóng</button>
																		<button type="submit" class="btn btn-primary"
																			id="btn-add" onclick="return alert('Tạo câu hỏi thành công')">Lưu</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>

										</form>
									</div>
								</div>
							</div>
							<div class="panel panel-primary">
								<div class="panel-heading" role="tab" id="headingThree">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree"
											aria-expanded="true" aria-controls="collapseThree"> 3.
											Tìm kiếm câu hỏi</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
									<div class="panel-body">
										<div class="row">
											<div class="col-md-6">
												<form class="form-horizontal" method="post" action="">
													<div class="form-group">
														<label for="inputEmail3"
															class="col-sm-5 control-label text-left">Nhập nội
															dung câu hỏi</label>
														<div class="col-sm-7">
															<input class="form-control" type="text" name="noidung">
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-5 control-label"></label>
														<div class="col-sm-7">
															<button type="submit" class="btn btn-primary">Search</button>
														</div>
													</div>

												</form>
											</div>
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>Mã CH</th>
														<th>Nội dung</th>
														<th>Đáp án</th>
														<th>Hành động</th>
													</tr>

												</thead>
												<%
													String nd = request.getParameter("noidung");
													for (CauHoi ch : cauHoiDAO.searchCH(nd)) {
												%>
												<tr>
													<td><%=ch.getMaCH()%></td>
													<td><%=ch.getNoiDung()%></td>
													<td><%=ch.getDapAn()%></td>
													<td><a data-toggle="modal" href='#form-update-ch'
														data-target="#form-update-ch"
														data-mach='<%=ch.getMaCH()%>'
														data-nd='<%=ch.getNoiDung()%>'
														data-paa='<%=ch.getDapAnA()%>'
														data-pab='<%=ch.getDapAnB()%>'
														data-pac='<%=ch.getDapAnC()%>'
														data-pad='<%=ch.getDapAnD()%>'
														data-da='<%=ch.getDapAn()%>' data-mamh='<%=ch.getMaMH()%>'
														data-mand='<%=ch.getMaND()%>'>Edit</a> || <a
														onclick="return confirm('Bạn có chắc chắn muốn xóa?')"
														href="DeleteUser?command=deleteCH&MaCH=<%=ch.getMaCH()%>">Delete</a></td>
												</tr>
												<%
													}
												%>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade bs-example-modal-lg" id="form-update-ch">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title">Chỉnh sửa câu hỏi</h4>
									</div>
									<div class="modal-body">
										<form action="UpdateServlet" method="POST"
											class="form-horizontal" role="form">
											<div class="row">
												<div class="col-md-6">
													<fieldset class="form-group">
														<label for="input-username" class="col-sm-4">Mã
															câu hỏi</label>
														<div class="col-sm-8">
															<input readonly type="text" name="mach" id="input-mach"
																class="form-control input-sm" value="" required="">
														</div>
													</fieldset>
													<fieldset class=form-group>
														<label for="input-username" class="col-sm-4">Nội
															dung</label>
														<div class="col-sm-8">
															<textarea name="nd" id="input-nd"
																class="form-control input-sm" required=""></textarea>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="input-fullname" class="col-sm-4">Mã
															môn học</label>
														<div class="col-sm-8">
															<input readonly type="text" name="mamh" id="input-mamh"
																class="form-control input-sm" value="" required="">
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="input-fullname" class="col-sm-4">Mã
															nội dung</label>
														<div class="col-sm-8">
															<input readonly type="text" name="mand" id="input-mand"
																class="form-control input-sm" value="" required="">
														</div>
													</fieldset>

												</div>
												<div class="col-md-6">
													<fieldset class="form-group">
														<label for="input-fullname" class="col-sm-4">Phương
															án A</label>
														<div class="col-sm-8">
															<textarea name="paa" id="input-paa"
																class="form-control input-sm" required=""></textarea>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="input-fullname" class="col-sm-4">Phương
															án B</label>
														<div class="col-sm-8">
															<textarea name="pab" id="input-pab"
																class="form-control input-sm" required=""></textarea>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="input-fullname" class="col-sm-4">Phương
															án C</label>
														<div class="col-sm-8">
															<textarea name="pac" id="input-pac"
																class="form-control input-sm" required=""></textarea>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="input-fullname" class="col-sm-4">Phương
															án D</label>
														<div class="col-sm-8">
															<textarea name="pad" id="input-pad"
																class="form-control input-sm" required=""></textarea>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="input-fullname" class="col-sm-4">Đáp
															án</label>
														<div class="col-sm-8">
															<input type="text" name="da" id="input-da"
																class="form-control input-sm" value="" required="">
														</div>
													</fieldset>

												</div>
											</div>
											<fieldset class="form-group">
												<hr>
												<div class="pull-right">
													<input type="hidden" value="updateTK" name="command">
													<button type="submit" class="btn btn-primary btn-sm"
														style="margin-right: 20px" onclick="return alert('Chỉnh sửa thành công câu hỏi')">Lưu</button>
													<button type="button" class="btn btn-default btn-sm"
														data-dismiss="modal" style="margin-right: 30px">Đóng</button>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="form-update-mh">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title">Chỉnh sửa môn học</h4>
									</div>
									<div class="modal-body">
										<form action="Update" method="POST" class="form-horizontal"
											role="form">
											<fieldset class="form-group">
												<label for="input-username" class="col-sm-3">Mã môn
													học</label>
												<div class="col-sm-9">
													<input readonly type="text" name="mamh" id="input-mamh1"
														class="form-control input-sm" value="" required="">
												</div>
											</fieldset>

											<fieldset class=form-group>
												<label for="input-username" class="col-sm-3">Tên môn
													học</label>
												<div class="col-sm-9">
													<input type="text" name="tenmh" id="input-tenmh"
														class="form-control input-sm" value="" required="">
												</div>
											</fieldset>
											<fieldset class="form-group">
												<hr>
												<div class="pull-right">
													<input type="hidden" value="updateMH" name="command">
													<button type="submit" class="btn btn-primary btn-sm"
														style="margin-right: 20px" onclick="return alert('Chỉnh sửa thành công môn học')">Lưu</button>
													<button type="button" class="btn btn-default btn-sm"
														data-dismiss="modal" style="margin-right: 30px">Đóng</button>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="form-update-nd">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title">Chỉnh sửa nội dung</h4>
									</div>
									<div class="modal-body">
										<form action="Update" method="POST" class="form-horizontal"
											role="form">
											<fieldset class="form-group">
												<label for="input-username" class="col-sm-3">Mã nội
													dung</label>
												<div class="col-sm-9">
													<input readonly type="text" name="mand" id="input-mand1"
														class="form-control input-sm" value="" required="">
												</div>
											</fieldset>

											<fieldset class=form-group>
												<label for="input-username" class="col-sm-3">Tên nội
													dung</label>
												<div class="col-sm-9">
													<input type="text" name="tennd" id="input-tennd"
														class="form-control input-sm" value="" required="">
												</div>
											</fieldset>
											<fieldset class=form-group>
												<label for="input-username" class="col-sm-3">Mã môn
													học</label>
												<div class="col-sm-9">
													<input readonly type="text" name="mamh" id="input-mamh2"
														class="form-control input-sm" value="" required="">
												</div>
											</fieldset>
											<fieldset class="form-group">
												<hr>
												<div class="pull-right">
													<input type="hidden" value="updateND" name="command">
													<button type="submit" class="btn btn-primary btn-sm"
														style="margin-right: 20px" onclick="return alert('Chỉnh sửa thành công nội dung')">Lưu</button>
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
		<br> <br> <br>
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>


	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/JS/Check.js"></script>
	<script type="text/javascript" src="assets/JS/QLND.js"></script>
	<script>
		var demoApp = angular.module('demoApp', []).controller(
				"InsertMHNDCtrl", [ '$scope', function($scope) {
					$scope.success = false;
					$scope.insert = function() {
						$scope.success = true;
					}
				} ]);
	</script>
	<script>
		$(function() {
			$('#btn-add').click(function() {
				alert('Tạo thành công câu hỏi');
			});
		});
	</script>
	<script>
		$('#form-update-ch').on('show.bs.modal', function(event) {
			var a = $(event.relatedTarget) // Button that triggered the modal
			var mach = a.data('mach') // Extract info from data-* attributes
			var nd = a.data('nd') // Extract info from data-* attributes
			var daa = a.data('paa')
			var dab = a.data('pab')
			var dac = a.data('pac')
			var dad = a.data('pad')
			var da = a.data('da')
			var mamh = a.data('mamh') // Extract info from data-* attributes
			var mand = a.data('mand')

			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			$('#input-mach').val(mach)
			$('#input-nd').val(nd)
			$('#input-paa').val(daa)
			$('#input-pab').val(dab)
			$('#input-pac').val(dac)
			$('#input-pad').val(dad)
			$('#input-da').val(da)
			$('#input-mamh').val(mamh)
			$('#input-mand').val(mand)
		})
	</script>
	<script>
		$('#form-update-mh').on('show.bs.modal', function(event) {
			var a = $(event.relatedTarget) // Button that triggered the modal
			var mamh = a.data('mamh') // Extract info from data-* attributes
			var tenmh = a.data('tenmh') // Extract info from data-* attributes

			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			$('#input-mamh1').val(mamh)
			$('#input-tenmh').val(tenmh)
		})
	</script>
	<script>
		$('#form-update-nd').on('show.bs.modal', function(event) {
			var a = $(event.relatedTarget) // Button that triggered the modal
			var mand = a.data('mand') // Extract info from data-* attributes
			var tennd = a.data('tennd') // Extract info from data-* attributes
			var mamh = a.data('mamh')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			$('#input-mand1').val(mand)
			$('#input-tennd').val(tennd)
			$('#input-mamh2').val(mamh)
		})
	</script>
	<%} %>
</body>

</html>
