/// <reference path="jquery-1.7.1.min.js" />

function doWork() {

    var a = $('#ContentPlaceHolder1_TextBox1').val();
    $.get("Handler.ashx?a=" + a, function (data) {
        if ((data == "ID Not Available") || (data == "ID in Wrong Format")) {
            $('#ContentPlaceHolder1_Label1').html(data); $('#ContentPlaceHolder1_Label1').removeClass("tvalidation");
            $('#ContentPlaceHolder1_Label1').addClass("validation");
        }
        if (data == "ID Available") {
            $('#ContentPlaceHolder1_Label1').html(data); $('#ContentPlaceHolder1_Label1').removeClass("validation");
            $('#ContentPlaceHolder1_Label1').addClass("tvalidation");
        }
    }
    );
}