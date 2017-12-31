$(function() {
    $("#username_error_message").hide();
    $("#password_error_message").hide();

    var error_username = false;
    var error_password = false;

    $("#user").focusout(function() {

        check_username();
    });

    $("#pass").focusout(function() {
        check_password();
    });

    function check_username() {

        var username_length = $("#user").val().length;

        if (username_length < 3 || username_length > 10) {
            $("#username_error_message").html("Tên đăng nhập phải có độ dài từ 3-10 kí tự ");
            $("#username_error_message").show();
            error_username = true;
        } else {
            $("#username_error_message").hide();

        }

    }

    function check_password() {

        var password_length = $("#pass").val().length;

        if (password_length < 4) {
            $("#password_error_message").html("Mật khẩu phải có độ dài tôi thiểu 4 kí tự");
            $("#password_error_message").show();
            error_password = true;
        } else {
            $("#password_error_message").hide();
        }

    }


    $("#loginsubmit").submit(function() {

        error_username = false;
        error_password = false;

        check_username();
        check_password();


        if (error_username == false && error_password == false) {
            return true;
        } else {
            return false;
        }

  });
   function check(form) { /*function to check userid & password*/
                /*the following code checkes whether the entered userid and password are matching*/
                if(form.userid.value == "admin1234" && form.pswrd.value == "admin1234") {
                    window.open('welcome.html')/*opens the target page while Id & password matches*/
                }
                else {
                    alert("Error Password or Username")/*displays error message*/
                }
            }
    
});