$(document).ready(function(){
$('.step3').hide();
$( "#step2_btn" ).click(function() {
    $('.step2').hide();
    $('.step3').show();
    $( ".step2_icon" ).switchClass("active","complete");
    $( ".step3_icon" ).switchClass("disabled","active");
});
});
function showOrderDetails(){
    $('.step3').hide();
    $('.step2').show();
    $( ".step3_icon" ).switchClass("active","disabled");
    $( ".step2_icon" ).switchClass("complete","active");
}
function showPaymentDetails(){
    $('.step2').hide();
    $('.step3').show();
    $( ".step2_icon" ).switchClass("active","complete");
    $( ".step3_icon" ).switchClass("disabled","active");
}
