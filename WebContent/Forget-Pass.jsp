<%-- 
    Document   : Doimatkhau
    Created on : Oct 18, 2016, 7:54:47 PM
    Author     : Kelvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Đổi mật khẩu</title>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="assets/material-design-iconic-font/css/material-design-iconic-font.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <script src="assets/js/modernizr.min.js"></script>
     <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','../../../www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-79190402-1', 'auto');
          ga('send', 'pageview');

     </script>
    </head>
    <body>
        <div class="account-pages"></div>
        <div class="clearfix"></div>
        <div class="wrapper-page">

        	<div class="account-bg">
                <div class="card-box m-b-0">
                    <div class="text-xs-center m-t-20">
                        <a href="index.html" class="logo">
                            <i class="zmdi zmdi-layers"></i>
                            <span>EXAM <small style="font-weight: 700">ONLINE</small></span>
                        </a>
                    </div>
                    <div class="m-t-10 p-20">
                        <div class="row">
                            <div class="col-xs-12 text-xs-left">
                                <h5 class="text-muted text-uppercase m-b-0 m-t-0" style="border-bottom: 1px solid #999">Reset Password</h5>
                                <p class="text-muted m-b-0 font-13 m-t-20">Enter your email address and we'll send you an email with instructions to reset your password.  </p>
                            </div>
                        </div>
                        <form class="m-t-30" action="QuenMatKhau" method="post">
                            <div class="form-group row">
                                <div class="col-xs-12">
                                    <input class="form-control" type="text" required="" name="username" placeholder="Username">
                                </div>
                                <div class="col-xs-12">
                                    <input class="form-control" type="email" required="" name="email" placeholder="Enter email">
                                </div>
                            </div>

                            <div class="form-group row text-center m-t-20 m-b-0">
                            
                                <div class="col-xs-12">
                                    <button class="btn btn-info btn-block waves-effect waves-light" type="submit">Send Email</button>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
            <!-- end card-box-->

            <div class="m-t-20">
                <div class="text-xs-center">
                    <p class="text-white">Return to<a href="Login.jsp" class="text-white m-l-5"><b>Sign In</b></a> 
                        and <a href="index.jsp" class="text-white m-l-5"><b>Home</b></a></p>
                </div>
            </div>

        </div>
        <!-- end wrapper page -->


        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="assets/JS/jquery.min.js"></script>
        <script src="assets/JS/tether.min.js"></script><!-- Tether for Bootstrap -->
        <script src="assets/JS/bootstrap.min.js"></script>
        <script src="assets/JS/detect.js"></script>
        <script src="assets/JS/fastclick.js"></script>
        <script src="assets/JS/jquery.blockUI.js"></script>
        <script src="assets/JS/waves.js"></script>
        <script src="assets/JS/jquery.nicescroll.js"></script>
        <script src="assets/JS/jquery.scrollTo.min.js"></script>
        <script src="assets/JS/jquery.slimscroll.js"></script>
        <script src="assets/plugins/switchery/switchery.min.js"></script>

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>
    </body>
</html>
