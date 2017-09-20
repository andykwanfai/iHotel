$(document).ready(function () {
    $("div[name=paymentmethod] li a").click(function () {
        var paymentmethod = $(this).text();
        console.log(paymentmethod);
        $('input[name=paymentmethod]').val(paymentmethod);
        if (paymentmethod === 'PayPal') {
            $('#pay-paypal').show();
            $('#pay-creditcard').hide();
        } else {
            $('#pay-paypal').hide();
            $('#pay-creditcard').show();
        }
    });
    
$('.paypal-button').click(function(){
    var action="PayByPayPal";
    var contact_person_first_name = $('input[name=contact_person_first_name]').val();
    var contact_person_last_name = $('input[name=contact_person_last_name]').val();
    var email = $('input[name=email]').val();
    var phone = $('input[name=phone]').val();
    var paymentmethod = $('input[name=paymentmethod]').val();
    console.log(paymentmethod);
    var remarks = $('input[name=remarks]').val();
    $.ajax({
      url: "OrderController.do",
      data : {contact_person_first_name:contact_person_first_name, contact_person_last_name:contact_person_last_name, email:email, phone:phone, paymentmethod:paymentmethod, remarks:remarks, action:action},
      type : "GET",
      success: function(){
        $("form.paypal-button").submit();   //assuming id of second form  is form2
      }
    });
    return false;   //to prevent submit
});
});
