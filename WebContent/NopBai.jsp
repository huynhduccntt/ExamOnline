
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.tomcat.jni.Mmap"%>
<%@page import="model.CTThi"%>
<%@page import="dao.CTThiDAO"%>
<%@page import="dao.DeThiDAO"%>
<%@page import="model.DeThi"%>
<%@page import="dao.CauHoiDAO"%>
<%@page import="dao.ThiDAO"%>
<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

<head>
<title>Kết quả bài làm</title>
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/style_OT.css" rel="stylesheet" type="text/css" />
<!-- Latest compiled and minified CSS -->
<!-- Optional theme -->
<link href="assets/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<!-- Latest compiled and minified JavaScript -->
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="assets/material-design-iconic-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Bungee"
	rel="stylesheet">
</head>

<body>
	<%
		UsersDAO usersDAO = new UsersDAO();
		ThiDAO thiDAO = new ThiDAO();
		DeThiDAO deThiDAO = new DeThiDAO();
		Users users = new Users();
		CTThiDAO ctThiDAO = new CTThiDAO();
		CTThi ctThi = new CTThi();
		if (session.getAttribute("ctthi") != null) {
			ctThi = (CTThi) session.getAttribute("ctthi");
		}
		users = usersDAO.getUsers(ctThi.getUsername());
		DeThi dt = deThiDAO.CTDeThi(ctThi.getMaDe());
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
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-sm-8 col-xs-0">
						<div class="row">
							<div class="col-sm-6"></div>
						</div>
					</div>
					<div class="col-md-3 col-sm-5 col-xs-9">
						<div class="block-user-info block-user-info-responsive logged">
							<ul class="clearfix">
								<div class="dropdown dropdown-vta">

									<img alt="" /> <a class="dropdown-toggle dropdown-vta-login"
										role="button" id="dropdownMenu1" data-toggle="dropdown"> <%
 	if (users != null) {
 %> <span class="hello">Xin chào <span
											style="color: #ED7642; font-weight: 600"><%=users.getFullname()%></span></span>
										<span class="caret"></span></a>
									<ul class="dropdown-menu dropdown-vta-sub-menu"
										aria-labelledby="dropdownMenu1">

										<li><a
											href="Profile.jsp?UserName=<%=users.getUserName()%>">Thông
												tin cá nhân</a></li>

										<li><a
											href="Doimatkhau.jsp?UserName=<%=users.getUserName()%>">Đổi
												mật khẩu</a></li>
										<%
											}
										%>
										<li><a href="LogOut">Thoát</a></li>
									</ul>
								</div>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Kết quả bài làm</h3>
						</div>
						<div class="panel-body">
							<div class="row" id="detail-mark">
								<%
									int dung = thiDAO.countRight(ctThi.getUsername(), ctThi.getMaDe());
								%>
								<div class="col-md-2"></div>
								<div class="col-md-4" id="detail-mark">
									<p>
										- Mã số sinh viên: <span><%=users.getUserName()%></span>
									</p>
									<p>
										- Họ và tên: <span><%=users.getFullname()%></span>
									</p>
									<p>
										- Lớp: <span><%=users.getMaLop()%></span>
									</p>
								</div>
								<div class="col-md-2"></div>
								<div class="col-md-4" id="detail-mark">
									<p>
										- Đề thi: <span style="font-size: 18px"><%=dt.getTenDe()%></span>
									</p>
									<p>

										- Số câu đúng: <span style="text-decoration: underline;"><%=dung%></span>
									</p>

									<p style="color: red">
										* Điểm: <span style="text-decoration: underline;"><%=ctThi.getDiem()%></span>
									</p>

								</div>

							</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<br>
				<div class="row" id="noti">
					<%
						if (ctThi.getDiem() < 4) {
					%>
					<p id="mark-bad">Bài làm khá tệ, cố gắng lần sau nhé !!!</p>
					<img src="assets/Images/sad.png">
					<%
						} else if (ctThi.getDiem() <= 7) {
					%>
					<p id="mark-good">Chúc mừng bạn, bài làm rất tốt !!!</p>
					<img src="assets/Images/happy.png">
					<%
						} else {
					%>
					<p id="mark-cool">Bài làm khá tốt, chúc mừng bạn !!!</p>
					<img src="assets/Images/smile.png">
					<%
						}
					%>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	<script src="assets/JS/jquery.min.js" type="text/javascript"></script>
	<script src="assets/JS/bootstrap.min.js" type="text/javascript"></script>
</body>

</html>