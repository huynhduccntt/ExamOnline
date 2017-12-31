$(document).ready(function() {
	var x_timer;
	$("#inputMaMH").keyup(function(e) {
		clearTimeout(x_timer);
		var mamh = $(this).val();
		x_timer = setTimeout(function() {
			check_mamh_ajax(mamh);
		}, 1000);
	});

	function check_mamh_ajax(mamh) {
		$("#mh-result").html('<img src="assets/Images/ajax-loader.gif" />');
		$.post('CheckMaMH', {
			'mamh' : mamh
		}, function(data) {
			$("#mh-result").html(data);
		});
	}
});

$(document).ready(function() {
	var x_timer;
	$("#inputMaND").keyup(function(e) {
		clearTimeout(x_timer);
		var mand = $(this).val();
		x_timer = setTimeout(function() {
			check_mand_ajax(mand);
		}, 1000);
	});

	function check_mand_ajax(mand) {
		$("#nd-result").html('<img src="assets/Images/ajax-loader.gif" />');
		$.post('CheckMaND', {
			'mand' : mand
		}, function(data) {
			$("#nd-result").html(data);
		});
	}
});
