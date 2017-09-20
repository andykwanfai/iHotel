<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="asg2.mdoel.Account"%>
<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<html lang="en-us">

    <head>
        <meta charset="utf-8">
        <title>Hotel Booking Web Applciation - Find Password</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/process_bar.css">
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"   integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM="   crossorigin="anonymous"></script>
        <script src="js/order.js"></script>
        <script src="js/main.js"></script>
        <script src="js/payment.js"></script>
    </head>

    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="container">


                        <div class="row bs-wizard" style="border-bottom:0;">

                            <div class="col-xs-3 bs-wizard-step complete step1_icon">
                                <div class="text-center bs-wizard-stepnum">Step 1</div>
                                <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>
                                <a href="#" class="bs-wizard-dot"></a>
                                <div class="bs-wizard-info text-center">Select your Room</div>
                            </div>

                            <div class="col-xs-3 bs-wizard-step active step2_icon">
                                <!-- complete -->
                                <div class="text-center bs-wizard-stepnum">Step 2</div>
                                <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>
                                <a onclick="showOrderDetails()" href="#" class="bs-wizard-dot"></a>
                                <div class="bs-wizard-info text-center">Your personal information</div>
                            </div>

                            <div class="col-xs-3 bs-wizard-step disabled step3_icon">
                                <!-- complete -->
                                <div class="text-center bs-wizard-stepnum">Step 3</div>
                                <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>
                                <a onclick="showPaymentDetails()" href="#" class="bs-wizard-dot"></a>
                                <div class="bs-wizard-info text-center">Order payment details</div>
                            </div>

                            <div class="col-xs-3 bs-wizard-step disabled step4_icon">
                                <!-- active -->
                                <div class="text-center bs-wizard-stepnum">Step 4</div>
                                <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>
                                <a href="#" class="bs-wizard-dot"></a>
                                <div class="bs-wizard-info text-center">Order complete</div>
                            </div>
                        </div>





                    </div>
                </div>
            </div>
        </div>
        <br>
        <form role="form" method="GET" action="OrderController.do">
            <div class="row">
                <div class="step2">
                    <div class="col-md-2"></div>
                    <div class="col-md-4">

                        <div class="panel panel-default">
                            <div class="panel-heading">Personal Information</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="contact_person">Contact Person</label>
                                        <input type="text" class="form-control" name="contact_person_first_name" value="${ac.first_name}" placeholder="First Name" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="contact_person">&nbsp</label>
                                        <input type="text" class="form-control" name="contact_person_last_name" value="${ac.last_name}" placeholder="Last Name" aria-describedby="basic-addon1">
                                    </div>

                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" name="email" value="${ac.email}" aria-describedby="basic-addon1">
                                    </div>

                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="phone">Phone</label>
                                        <input type="text" class="form-control" name="phone" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="country">Living Country</label>
                                        <br>
                                        <div name="country"class="btn-group" >
                                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                Hong Kong
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <li><a href="#">Hong Kong</a></li>
                                                <li><a href="#">Another location</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <input type="checkbox" aria-label="...">

                                            </span>
                                            <input type="text" class="form-control" placeholder="This reservation is not for myself" aria-describedby="basic-addon1" disabled="disabled">
                                            <br>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <label for="remark">Remarks </label>
                                <textarea rows="3" class="form-control" name="remark"></textarea>
                                <br>
                                <input type="button" value="Confirm" id="step2_btn" href="#" class="btn btn-success btn-block"/>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="list-group">
                            <div class="list-group-item active">
                                <h4 class="list-group-item-heading">Reservation Details</h4>
                            </div>
                            <div class="list-group-item ">
                                <h4 class="list-group-item-heading">${hotel.h_name}</h4>
                                <p class="list-group-item-text">${hotel.address}</p>
                            </div>
                            <div class="list-group-item ">
                                <h4 class="list-group-item-heading">${order.date_from} - ${order.date_to}  (${nights} nights)<h4>
                                        <h4 class="list-group-item-heading">${room.room_type} Room</h4>
                                        <p class="list-group-item-text">Unit Price: HKD $ ${room.unitprice}</p>
                                        </div>
                                        <div class="list-group-item ">
                                            <h4 class="list-group-item-heading">Sub-Total</h4>
                                            <p class="list-group-item-text">
                                                <fmt:setLocale value="zh_HK"/>
                                                <fmt:formatNumber value="${order.subPrice}" type="currency"/>
                                                for ${nights} nights and ${order.quantity} room(s)</p>
                                        </div>
                                        <div class="list-group-item active">
                                            <h4 class="list-group-item-heading">Total (include 10% service charge and 5% tax)</h4>
                                            <% if(session.getAttribute("ac")!=null)
                                                out.println("<p class='list-group-item-text'>with 10% Member discount</p>");
                                                %>
                                            <p class="list-group-item-text">
                                                <fmt:setLocale value="zh_HK"/>
                                                <fmt:formatNumber value="${order.finalPrice}" type="currency"/>
                                            </p>
                                        </div>
                                        </div>
                                        </div>
                                        <div class="col-md-2"></div>
                                        </div>
                                        </div>

                                        <div class="step3">
                                            <div class="col-md-4"></div>
                                            <div class="col-md-4">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">Payment Method</div>
                                                    <div class="panel-body">
                                                        <div class="col-md-12">
                                                            <label for="paymentmethod">Payment Method</label>
                                                            <br>
                                                            <div name="paymentmethod" class="btn-group" >
                                                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Visa<span class="caret"></span></button>
                                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                                    <li><a href="#">Visa</a></li>
                                                                    <li><a href="#">PayPal</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div id="pay-paypal" style="display: none;" class="col-md-12">
                                                            <script src="js/paypal-button.min.js?merchant=ihotel@cs4280asg2.com" 
                                                                    data-button="buynow"
                                                                    data-name=" ${order.date_from} - ${order.date_to}  ${hotel.h_name}  ${nights} nights and ${order.quantity} room(s)"
                                                                    data-amount="${order.finalPrice}"
                                                                    data-currency="HKD" 
                                                                    data-callback="http://localhost:8080/index.jsp" 
                                                                    data-return="http://localhost:8080/OrderController.do" 
                                                            data-env="sandbox"></script>
                                                        </div>
                                                        <div id="pay-creditcard" class="col-md-12">
                                                            <label for="card">Card Number</label>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span></span>
                                                                <input type="text" class="form-control" name="card" aria-describedby="basic-addon1">
                                                            </div>
                                                            <br>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label for="expiration">Expiration Date</label>
                                                                    <input type="text" class="form-control" name="expiration" aria-describedby="basic-addon1">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="cvc">CV Code</label>
                                                                    <input type="text" class="form-control" name="cvc" aria-describedby="basic-addon1">
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">
                                                                    <input type="checkbox" aria-label="...">

                                                                </span>
                                                                <input type="text" class="form-control" placeholder="Save my payment info to account" aria-describedby="basic-addon1" disabled="disabled">
                                                                <br>
                                                            </div>
                                                            <br>
                                                            We will send you the confirmation email at 
                                                            <% %>
                                                            <br>
                                                            <input type="submit" name="action" value="PayByVisa" id="btn_pay" href="#" class="btn btn-success btn-block"/>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-4"></div>

                                        </div>
                                        <input type="hidden" name="paymentmethod"  value="Visa"/>
                                        </form>
                                        </div>
                                        </body>

                                        </html>
