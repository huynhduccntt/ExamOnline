<!DOCTYPE html>
<html>
<%@ page import="model.Users"%>
<%@ page import="dao.UsersDAO"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">


<!-- App title -->
<title>Thi trắc nghiệm |Change Passwork</title>

<!-- App CSS --> 
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<script src="assets/js/modernizr.min.js"></script>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'../../../www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-79190402-1', 'auto');
	ga('send', 'pageview');
</script>

</head>


<body>
	<%
		UsersDAO usersDAO = new UsersDAO();
		Users users = new Users();

		if (request.getParameter("UserName") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");

		} else {
			String userName = request.getParameter("UserName");
			users = usersDAO.getUsers(userName);
	%>
	<div class="account-pages"></div>
	<div class="clearfix"></div>
	<div class="wrapper-page">

		<div class="account-bg">
			<div class="card-box m-b-0">
				<div class="text-xs-center m-t-20">
					<a href="OnlineTest.jsp" class="logo"> <i
						class="zmdi zmdi-layers"></i> <span>EXAM <small
							style="font-weight: 700">ONLINE</small></span>
					</a>
				</div>
				<div class="m-t-10 p-20">
					<div class="row">
						<div class="col-xs-12 text-xs-left">
							<h5 class="text-muted text-uppercase m-b-0 m-t-0"
								style="border-bottom: 1px solid #999">Change Password</h5>
						</div>
					</div>
					<form class="m-t-20" action="Doimatkhau" method="post">
						<div class="form-group row">
							<div class="col-xs-12">
								<input class="form-control" type="hidden" name="username"
									required="" placeholder="" value="<%=users.getUserName()%>">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-xs-12">
								<input class="form-control" type="password" name="currentpass"
									required="" placeholder="Current password">
							</div>
						</div>

						<div class="form-group row">
							<div class="col-xs-12">
								<input class="form-control" type="password" name="newpass"
									required="" placeholder="New password">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-xs-12">
								<input class="form-control" type="password" name="confirmpass"
									required="" placeholder="Comfirm password">
							</div>
						</div>
						<div class="form-group text-center row m-t-10">
							<div class="col-xs-12">
								<button class="btn btn-info btn-block waves-effect waves-light"
									type="submit">Submit</button>
							</div>
						</div>
					</form>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
		<!-- end card-box-->

		<div class="m-t-20">
			<div class="text-xs-center">
				<p class="text-white">
					Return to<a href="Login.jsp" class="text-white m-l-5"><b>Sign
							In</b></a> or <a href="index.jsp" class="text-white m-l-5"><b>Home</b></a>
				</p>
			</div>
		</div>
	</div>
	<!-- end wrapper page -->
	<script>
		var resizefunc = [];
	</script>
	<!-- jQuery  -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/tether.min.js"></script>
	<!-- Tether for Bootstrap -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/detect.js"></script>
	<script src="assets/js/fastclick.js"></script>
	<script src="assets/js/jquery.blockUI.js"></script>
	<script src="assets/js/waves.js"></script>
	<script src="assets/js/jquery.nicescroll.js"></script>
	<script src="assets/js/jquery.scrollTo.min.js"></script>
	<script src="assets/js/jquery.slimscroll.js"></script>
	<script src="assets/plugins/switchery/switchery.min.js"></script>

	<!-- App js -->
	<script src="assets/js/jquery.core.js"></script>
	<script src="assets/js/jquery.app.js"></script>
	<%
		}
	%>
</body>

</html>