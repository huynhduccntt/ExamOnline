<%@page import="model.Role"%>
<%@page import="dao.RoleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
     <meta http-equiv="x-ua-compatible" content="ie=edge"> 
    
    <title>Thi trắc nghiệm | Login</title>

    <link href="https://online.hcmute.edu.vn/favicon.ico" rel="shortcut icon">  
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <link href="assets/css/animate.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">

</head>
<body class="gray-bg">
<%
		RoleDAO roleDAO = new RoleDAO();
	%>
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                 <a class="logo-name" href="index.jsp"> <img src="assets/Images/logologin.png" alt="#"></a>

            </div>
            <h3>Chào mừng đến với trang thi trắc nghiệm online</h3>
            <p>Vui lòng đăng nhập để tiếp tục nhé 

                <!-- Đăng nhập ở đây --> 
            </p>
            <br>
           <!--  <form class="m-t" role="form" action="welcome.html">
                    
                <div class="form-group">
                    <input type="username" class="form-control" id="user" name ="userid" placeholder="Tên đăng nhập" required="">
                     <span class="error_form" id="username_error_message"></span>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="pass" name ="pswrd"placeholder="Mật khẩu" required="">
                    <span class="error_form" id="password_error_message"></span>
                </div>
    
                <button type="submit" onclick="check(this.form)" value="Login" class="btn btn-primary block full-width m-b">Đăng nhập</button>

                <a href="login.html#"><small>Quên mật khẩu ?</small></a>
            </form> -->
            		<form id="login-form" method="post" action="UserServlet"
							class="form-horizontal" name="form">

							<div class="form-group">
							

								<div class="col-xs-8">
									<input name="username" placeholder="Tên đăng nhập" type="text" class="form-control"
										id="user"  >
										                     <span class="error_form" id="username_error_message"></span>
										
								</div>
							</div>
							<div class="form-group">
								
								<div class="col-xs-8">
									<input name="password" type="password" id="pass"
										class="form-control"placeholder="Mật khẩu">
										                    <span class="error_form" id="password_error_message"></span>
										
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-8">
									<select class="form-control input-sm" name="Role" id="roleid">
										<%
											for (Role c : roleDAO.getListRole()) {
										%>
										<option value="<%=c.getRoleID()%>">
											<%=c.getRoleName()%>
										</option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="forget-pass">
								<span><a href="Forget-Pass.jsp">Quên
										mật khẩu</a></span>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-xs-8 col-xs-offset-4">
									<input type="hidden" value="login" name="command">
									<button type="submit" class="btn btn-primary" id="btn-login">
										Đăng nhập</button>
								</div>
							</div>
						</form>
            <p class="m-t"> <small> © 2017 - HCMUTE</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->

    <script src="assets/JS/jquery-3.1.1.min.js"></script>
    <script src="assets/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/JS/action.js"></script>             
   


</body></html>