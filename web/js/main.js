$(document).ready(function(){
$('#advancedOpt').hide();
$( "#advanced_btn" ).click(function() {
  $( "#advancedOpt" ).toggle();
});
$('.input-daterange').datepicker({
       // startDate: "+2d",
       // endDate: "+1y",
        startView: 1,
        multidate: false,
        daysOfWeekHighlighted: "0,6",
        todayHighlight: true
    });
$('input[name=day]').focusout(function(){
    console.log("update datepicker");
    var startDate = new Date(Date.parse($('.input-daterange input[name=start]').val()));
var interval =  parseInt($('input[name=day]').val());
$('.input-daterange input[name=end]').datepicker('update', addDays(startDate,parseInt(interval)));
});

$('.input-daterange input[name=end]').focusout(function(){
    var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
    var startDate = new Date($('.input-daterange input[name=start]').val());
    var endDate = new Date($('.input-daterange input[name=end]').val());
    var diffDays = Math.round(Math.abs((startDate.getTime() - endDate.getTime())/(oneDay)));
    console.log(diffDays);
    $('input[name=day]').val(diffDays);
});


$('.dropdown-menu').on('click', 'li a', function() {
    console.log("click option");
    // Do something on click on an existent or future .dynamicElement
      $(this).parents(".btn-group").find('.btn').html($(this).text() + '<span class="caret"></span>');
      $(this).parents(".btn-group").find('.btn').val($(this).data('value'));
});

$('div[name=city] .dropdown-menu').on('click', 'li a', function() {
    $('input[name=city]').val($("div[name=city]").find('.btn').text());
});

function addDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return result;
}

$("div[name=destination] li a").click(function(){
    console.log("update city option");
    console.log($(this).data('value'));
    //console.log($(this).parents(".btn-group").find('.btn').val($(this).data('value')));
  	$.ajax({
                type:"POST",
		url: "CityController.do",
		data:"selcountry="+$(this).data('value'),
                success: function(msg){
                    $("div[name=city]").find('.dropdown-menu').empty();
                    $("div[name=city]").find('.btn').html(msg[0].cityName+'<span class="caret"></span>');
                    for(var i=0;i<msg.length;i++){
                        console.log(msg[i].cityName);
                        $("div[name=city]").find('.dropdown-menu').append('<li><a href="#">'+msg[i].cityName+'</a></li>');
                    }
                    $('input[name=city]').val($("div[name=city]").find('.btn').text());
                },
                error: function(){
                    console.log("fail");
                }
	});
    });
    
$("#old_find_room_btn").click(function(){
    console.log("find btn clicked");
    var dateFrom =  $('.input-daterange input[name=start]').val();
    var dateTo = $('.input-daterange input[name=end]').val();
    var capactity = $('div[name=room_opt] button').text();
    var action = "searchRoominDateRange";
    var hid = $('input[name=hid]').val();
    console.log(dateFrom+""+dateTo+""+capactity);
      	$.ajax({
                type:"GET",
		url: "HotelController.do",
		data:{dateFrom:dateFrom, dateTo:dateTo, capacity:capactity, hid:hid, action:action},
                success: function(msg){
                    console.log("success: "+msg.length);
                    var i=0;
                    for(i=0;i<msg.length;i++){
                        console.log("rid: "+msg[i].rid);
                         console.log("rava: "+msg[i].ava_no);
                        $('button[name=order_'+msg[i].rid+']').show();
                        $('input[name=date_from]').val(dateFrom);
                        $('input[name=date_to]').val(dateTo);
                        $('#input_amount').val('1');
                        if(msg[i].ava_no==0){
                            $('#btn_order_'+msg[i].rid).addClass(' btn-danger').removeClass('btn-success btn-default');
                            $('#btn_order_'+msg[i].rid).text('Full Booking');
                            $('#btn_order_'+msg[i].rid).prop('disabled', true);
                            $('#amount_'+msg[i].rid).prop('disabled', true);
                        }else{
                            $('#btn_order_'+msg[i].rid).removeClass().addClass('btn btn-success');
                            $('#btn_order_'+msg[i].rid).text('Reserve Now');
                            $('#btn_order_'+msg[i].rid).prop('disabled', false);
                            $('#amount_'+msg[i].rid).prop('disabled', false);
                        }
                    }
                    //$('#orderForm').replaceWith('');
                },
                error: function(){
                    console.log("fail");
                }
	});
});
$('.order_btn').click(function(){
  var rid = $(this).val();
  console.log($(this).parents('tr').find('td div[name=amount_opt] button').text());
  $('input[name=amount]').val($(this).parents('tr').find('td div[name=amount_opt] button').text());
  $('input[name=rmid]').val(rid);
  $(this).val("inputReserveInfo");
  $('#hotel_order_form').get(0).submit();
});

    
    
    	$( ".sliderRange" ).slider({
		range: true,
		min: 0,
		max: 500,
		values: [ 192, 470 ],
		slide: function( event, ui ) {
			$( ".sliderRangeLabel" ).html( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
		}
	});
$('.cancel_order').click(function(){
    var booking_id = $(this).val();
    console.log(booking_id);
    if (confirm('Are you sure you want to cancel this booking?')) {
              	$.ajax({
                type:"GET",
		url: "OrderController.do",
		data:{booking_id:booking_id, action:"cancelorder"},
                success: function(msg){
                    console.log("order delete");
                    console.log($(this));
                    $('button[name=cancel_'+booking_id+']').text("This order has been Removed");
                    $('button[name=cancel_'+booking_id+']').prop('disabled', true);
                },
                error: function(){
                    console.log("fail");
                }
    });
} else {
    // Do nothing!
}

});
});
        function showMap(){
            console.log("map open");
            window.open("map.jsp");
        }
