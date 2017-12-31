<%-- 
    Document   : SinhVien_ThiWeb
    Created on : Oct 17, 2016, 9:11:17 PM
    Author     : BAO UY
--%>

<%@page import="model.CTThi"%>
<%@page import="dao.CTThiDAO"%>
<%@page import="model.Thi"%>
<%@page import="dao.ThiDAO"%>
<%@page import="dao.CauHoiDAO"%>
<%@page import="model.CauHoi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CTDeThiDAO"%>
<%@page import="model.DeThi"%>
<%@page import="dao.DeThiDAO"%>
<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>HỆ THỐNG THI TRẮC NGHIỆM ONLINE</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/style_OT.css" rel="stylesheet" type="text/css" />
<link href="assets/font-awesome-4.6.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script src="assets/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="assets/JS/bootstrap.min.js"></script>
<script>
	var h = null; // Giờ
	var m; // Phút
	var s; // Giây
	var phut;
	var timeout = null; // Timeout
	function start() {
		/*BƯỚC 1: LẤY GIÁ TRỊ BAN ĐẦU*/
		if (h == null) {
			h = 0;
			m = document.getElementById("m_val").value;
			s = document.getElementById("s_val").value;
		}
		timeout = setTimeout(function() {
			s--;
			start();
			/*BƯỚC 1: CHUYỂN ĐỔI DỮ LIỆU*/
			// Nếu số giây = -1 tức là đã chạy ngược hết số giây, lúc này:
		}, 1000);
		//  - giảm số phút xuống 1 đơn vị
		//  - thiết lập số giây lại 59
		if (s === -1) {
			m -= 1;
			s = 59;
		}

		// Nếu số phút = -1 tức là đã chạy ngược hết số phút, lúc này:
		//  - giảm số giờ xuống 1 đơn vị
		//  - thiết lập số phút lại 59
		if (m === -1) {
			h -= 1;
			m = 59;
		}

		// Nếu số giờ = -1 tức là đã hết giờ, lúc này:
		//  - Dừng chương trình
		if (h == -1) {
			clearTimeout(timeout);
			$('#nopbai').click();
			document.getElementById("next").disabled = true;
			document.getElementById("pre").disabled = true;
			return false;
		}
		var a = $("s1").val(s.toString());
		/*BƯỚC 1: HIỂN THỊ ĐỒNG HỒ*/
		document.getElementById("h").innerHTML = h.toString();
		document.getElementById("m").innerHTML = m.toString();
		document.getElementById("m1").value = m.toString();
		document.getElementById("s").innerHTML = s.toString();
		document.getElementById("s1").value = s.toString();
		/*BƯỚC 1: GIẢM PHÚT XUỐNG 1 GIÂY VÀ GỌI LẠI SAU 1 GIÂY */
	}
	function stop() {
		clearTimeout(timeout);
	}
</script>
</head>

<body onload="start()">
	<%
		UsersDAO usersDAO = new UsersDAO();
		Users users = new Users();

		String made = "";
		int sthi = 0;
		int mthi = 0;
		if (request.getParameter("sthi") != null) {
			sthi = Integer.parseInt(request.getParameter("sthi"));
		}
		if (request.getParameter("mthi") != null) {
			mthi = Integer.parseInt(request.getParameter("mthi"));
		}
		int pages = 0, firstResult = 0, maxResult = 0, total = 0, count = 0;
		DeThi deThi = new DeThi();

		DeThiDAO deThiDAO = new DeThiDAO();

		CTDeThiDAO ctDeThiDAO = new CTDeThiDAO();
		CauHoiDAO cauHoiDAO = new CauHoiDAO();
		ThiDAO thiDAO = new ThiDAO();
		CTThiDAO ctThiDAO = new CTThiDAO();
		CTThi ctThi = new CTThi();
		if (request.getParameter("maDe") != null) {
			made = request.getParameter("maDe");
			deThi = deThiDAO.CTDeThi(made);

		}
		if (request.getParameter("pages") != null) {
			pages = Integer.parseInt(request.getParameter("pages"));
		}
		deThi = deThiDAO.CTDeThi(made);
		total = cauHoiDAO.countCHByMaDe(made);
		firstResult = (pages - 1) * 1;
		maxResult = 1;
		count = firstResult + 1;
		ArrayList<CauHoi> listCH = cauHoiDAO.getListCHWithMaDe(made, firstResult, maxResult);
		if (session.getAttribute("userSV") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");
		} else {
			users = (Users) session.getAttribute("userSV");
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
					<%
						ctThi = ctThiDAO.getWithID(users.getUserName(), made);
							if (ctThi.getUsername() == null) {
								if (listCH.size() > 0) {
					%>
					<div class="col-md-4">
						<div class="info-test">
							<h3 style="color: #F22C39">
								<i class="fa fa-cog fa-spin fa-fw"></i>Bài thi:
								<%=deThi.getTenDe()%></h3>
							<h4 style="margin-left: 30px">
								Thời gian làm bài: <span style="text-decoration: underline;"><%=deThi.getThoiGian()%></span>
								phút
							</h4>
							<h4 style="margin-left: 30px">
								Số lượng câu hỏi: <span style="text-decoration: underline;"><%=ctDeThiDAO.SLCH(made)%></span>
							</h4>
							<input value="<%=deThi.getThoiGian()%>" type="hidden"
								id="thoigian"> <input type="hidden" value=<%=sthi%>
								id="s_val"> <input type="hidden" value="<%=mthi%>"
								id="m_val"> <input type="hidden"
								value="<%=deThi.getThoiGian()%>" name=""> <strong
								style="margin-left: 30px; font-size: 20px"><span id="h">00</span>
								: <span id="m">00</span>: <span id="s">00</span> </strong>
						</div>
					</div>
					<div class="col-md-8">
						<%
							for (CauHoi ch : listCH) {
						%>
						<form class="form-horizontal" method="post" action="KiemTraDapAn">

							<span style="font-size: 17px">Câu <%=count%>: <%=ch.getNoiDung()%></span>
							<%
								String da = "";
												Thi t = new Thi();
												t = thiDAO.getWithMaCH(ch.getMaCH(), users.getUserName());

												if (t != null) {
													da = t.getDAuser();
													if (da == null) {
							%>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="A"> A. <%=ch.getDapAnA()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="B"> B. <%=ch.getDapAnB()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="C"> C. <%=ch.getDapAnC()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="D"> D. <%=ch.getDapAnD()%> </label>
									</div>
								</div>
							</div>
							<%
								} else if (da.equals("A")) {
							%>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											checked name="answer" value="A"> A. <%=ch.getDapAnA()%>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="B"> B. <%=ch.getDapAnB()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="C"> C. <%=ch.getDapAnC()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="D"> D. <%=ch.getDapAnD()%> </label>
									</div>
								</div>
							</div>
							<%
								} else if (da.equals("B")) {
							%>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="A"> A. <%=ch.getDapAnA()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											checked name="answer" value="B"> B. <%=ch.getDapAnB()%>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="C"> C. <%=ch.getDapAnC()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="D"> D. <%=ch.getDapAnD()%> </label>
									</div>
								</div>
							</div>
							<%
								} else if (da.equals("C")) {
							%>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="A"> A. <%=ch.getDapAnA()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="B"> B. <%=ch.getDapAnB()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											checked name="answer" value="C"> C. <%=ch.getDapAnC()%>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="D"> D. <%=ch.getDapAnD()%> </label>
									</div>
								</div>
							</div>
							<%
								} else if (da.equals("D")) {
							%>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="A"> A. <%=ch.getDapAnA()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="B"> B. <%=ch.getDapAnB()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="C"> C. <%=ch.getDapAnC()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											checked name="answer" value="D"> D. <%=ch.getDapAnD()%>
										</label>
									</div>
								</div>
							</div>
							<%
								}
												} else {
							%>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="A"> A. <%=ch.getDapAnA()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="B"> B. <%=ch.getDapAnB()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="C"> C. <%=ch.getDapAnC()%> </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio">
										<label style="font-size: 17px"><input type="radio"
											name="answer" value="D"> D. <%=ch.getDapAnD()%> </label>
									</div>
								</div>
							</div>
							<%
								}
							%>
							<div class="form-group">
								<%
									int i = pages;
								%>
								<div class="next-pre">
									<%
										if (pages == 1) {
									%>
									<button class="btn btn-primary" disabled name="next"
										style="margin-top: 10px">Previous</button>
										<input type="hidden" name="pages"
										value="<%=pages%>"> <input type="hidden" name="mach"
										value="<%=ch.getMaCH()%>"> <input type="hidden"
										name="made" value="<%=request.getParameter("maDe")%>">
									<input type="hidden" name="username"
										value="<%=users.getUserName()%>"> <input type="hidden"
										id="s1" value="<%=sthi%>" name="sthi"> <input
										type="hidden" id="m1" value="<%=mthi%>" name="mthi"> <input
										class="btn btn-primary" id="next" type="submit" value="Next"
										name="command">
									<%
										} else if (pages == total) {
									%>
									<input class="btn btn-primary" type="submit"
										style="margin-top: 10px" value="Previous" name="command"
										id="pre"> <input type="hidden" name="pages"
										value="<%=pages%>"> <input type="hidden" name="mach"
										value="<%=ch.getMaCH()%>"> <input type="hidden"
										name="made" value="<%=request.getParameter("maDe")%>">
									<input type="hidden" name="username"
										value="<%=users.getUserName()%>"> <input type="hidden"
										id="s1" value="<%=sthi%>" name="sthi"> <input
										type="hidden" id="m1" value="<%=mthi%>" name="mthi"> <input
										class="btn btn-primary" id="next" type="submit" value="Next"
										name="command" disabled>
									<%
										}else{
									%>
									<input class="btn btn-primary" type="submit"
										style="margin-top: 10px" value="Previous" name="command"
										id="pre">
									<input type="hidden" name="pages" value="<%=pages%>"> <input
										type="hidden" name="mach" value="<%=ch.getMaCH()%>"> <input
										type="hidden" name="made"
										value="<%=request.getParameter("maDe")%>"> <input
										type="hidden" name="username" value="<%=users.getUserName()%>">
									<input type="hidden" id="s1" value="<%=sthi%>" name="sthi">
									<input type="hidden" id="m1" value="<%=mthi%>" name="mthi">
									<input class="btn btn-primary" id="next" type="submit"
										value="Next" name="command">

									<%
										}
									%>
								</div>
							</div>
							<div class="form-group">
								<input class="btn btn-danger" id="nopbai" type="submit"
									value="Submit" name="command"
									onclick="return confirm('Bạn có chắc chắn muốn nộp bài không ?')">
							</div>
							<%} %>
						</form>

					</div>
					<%
						} else {
					%>
					<h3 style="text-align: center">
						<strong>Xin lỗi</strong>, hiện tại chưa tới giờ làm bài thi trắc
						nghiệm, vui lòng quay lại sau.
					</h3>
					<img src="assets/Images/404.png"
						style="margin: auto; display: block;">

					<%
						}
							} else {
					%>
					<h3 style="text-align: center">
						<strong>Xin lỗi</strong>, Bạn đã làm bài thi này rồi, vui lòng
						chọn bài thi khác
					</h3>
					<img src="assets/Images/404.png"
						style="margin: auto; display: block;">
					<%
						}
					%>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br>
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	<%
		}
	%>

</body>

</html>