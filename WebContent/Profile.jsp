
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
      <title>Thi trắc nghiệm | Thông tin cá nhân </title>
      <link href="https://online.hcmute.edu.vn/favicon.ico" rel="shortcut icon">
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="assets/material-design-iconic-font/css/material-design-iconic-font.css"
	rel="stylesheet" type="text/css" />
<link href="assets/font-awesome-4.6.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<%
		UsersDAO usersDAO = new UsersDAO();
		Users users = new Users();
		if (session.getAttribute("updateProfile") != null) {
			users = (Users) session.getAttribute("updateProfile");
		}
		if (request.getParameter("UserName") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");
			
		}else{
			String userName = request.getParameter("UserName");
			users = usersDAO.getUsers(userName);
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

									<img alt="" /> <a class="dropdown-toggle dropdown-vta-login"
										role="button" id="dropdownMenu1" data-toggle="dropdown"> <%
 	if (users != null) {
 %> <span class="hello">Xin chào <span
											style="color: #EDB637; font-weight: bold"><%=users.getFullname()%></span></span>
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
										<li><a href="Login.jsp">Thoát</a></li>
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
						<li><a href="index.jsp" title="">Trang chủ</a></li>
						<li class="active">Trang cá nhân</li>
					</ol>
				</div>

				<div class="row">
					<div class="customDiv-2">
						<div class="col-md-6"></div>
						<div class="col-md-6">

							<form class="form-horizontal" method="post" action="UserServlet">
								<div class="form-group">

									<div class="col-sm-10">
										<input name="UserName" type="hidden" class="form-control"
											id="inputUsername" placeholder=""
											value="<%=users.getUserName()%>" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputFullname" class="col-sm-2 control-label">Họ
										và tên</label>
									<div class="col-sm-10">
										<input name="fullname" type="text" class="form-control"
											id="inputFullname" placeholder=""
											value="<%=users.getFullname()%>" />

									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Giới tính</label>

									<div class="col-sm-10">

										<%
											if (users.getGender() == null) {
										%>
										<label class="radio-inline"><input type="radio"
											name="sex" value="male">Nam</label> <label
											class="radio-inline"><input type="radio" name="sex"
											value="female">Nữ</label>
										<%
											} else {
												String gender = users.getGender();
												if (gender.equals("male")) {
										%>

										<label class="radio-inline"><input checked
											type="radio" name="sex" value="male">Nam</label> <label
											class="radio-inline"><input type="radio" name="sex"
											value="female">Nữ</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											name="sex" value="male">Nam</label> <label
											class="radio-inline"><input checked type="radio"
											name="sex" value="female">Nữ</label>
										<%
											}
											}
										%>
									</div>

								</div>
								<div class="form-group">
									<label for="inputBirthday" class="col-sm-2 control-label">Ngày
										sinh</label>
									<div class="col-sm-10">
										<%
											if (users.getBirthday() != null) {
										%>
										<input name="birthday" type="date" class="form-control"
											id="inputBirthday" placeholder=""
											value=<%=users.getBirthday()%>>
										<%
											} else {
										%>
										<input name="birthday" type="date" class="form-control"
											id="inputBirthday" placeholder="" value="">
										<%
											}
										%>
									</div>
								</div>
								<div class="form-group">
									<label for="inputNumberphone" class="col-sm-2 control-label">Số
										điện thoại</label>
									<div class="col-sm-10">
										<%
											if (users.getNumberPhone() != null) {
										%>
										<input name="numberphone" type="text" class="form-control"
											id="inputNumberphone" placeholder=""
											value="<%=users.getNumberPhone()%>">
										<%
											} else {
										%>
										<input name="numberphone" type="text" class="form-control"
											id="inputNumberphone" placeholder="">
										<%
											}
										%>

									</div>
								</div>
								<div class="form-group">
									<label for="inputAddress" class="col-sm-2 control-label">Địa
										chỉ</label>
									<div class="col-sm-10">
										<input name="address" type="text" class="form-control"
											id="inputAddress" placeholder=""
											value="<%=users.getAddress()%>">

									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail" class="col-sm-2 control-label">Email</label>
									<div class="col-sm-10">
										<input name="email" type="email" class="form-control"
											id="inputEmail" placeholder="" disabled
											value="<%=users.getEmail()%>">

									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="hidden" value="updateProfile" name="command">
										<button type="submit" class="btn btn-default"
											onClick="alert('Chỉnh sửa thông tin cá nhân thành công')">Lưu</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				<!-- end col -->
			</div>
		</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	<script src="assets/JS/angular.min.js" type="text/javascript"></script>
	<script src="assets/JS/jquery.min.js" type="text/javascript"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script>
		var demoApp = angular.module('demoApp', []).controller(
				"InsertMHNDCtrl", [ '$scope', function($scope) {
					$scope.success = false;
					$scope.insert = function() {
						$scope.success = true;
					}
				} ]);
	</script>
	<%} %>
</body>

</html>