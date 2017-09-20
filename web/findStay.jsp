<%@page import="asg2.mdoel.Country"%>
<%@page import="java.util.List"%>
<%@page import="DB.CountryDAO"%>
<div class="panel panel-primary">
    <div class="panel-heading">Find your stay</div>

    <div class="panel-body">
        <form role="form" id="searchForm" method="get" action="SearchController.do">
            <label for="hotel_name">Name</label>
            <input type="text" class="form-control" name="hotel_name" aria-describedby="sizing-addon1">
            <div class="row">
                <div class="col-md-6">
                    <label for="date">Date</label>
                    <!--input type="date" class="form-control" name="date" placeholder="DD/MM/YY" aria-describedby="sizing-addon1"-->
                    <div class="input-daterange input-group" id="datepicker">
                        <input type="text" class="input-sm form-control" name="start" />
                        <span class="input-group-addon">to</span>
                        <input type="text" class="input-sm form-control" name="end" />
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="day">Nights</label>
                    <input type="text" class="form-control" name="day" aria-describedby="sizing-addon1">
                </div>
            </div>

            <br>

            <div class="row">



                <div class="col-md-12">
                    <label for="destination">Destination</label>
                    <br>
                    <div name="destination" class="btn-group">

                        <button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Country<span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <!--li><a href="#">Japan</a></li>
                            <li><a href="#">US</a></li>
                            <li><a href="#">UK</a></li-->
                            <%
                                CountryDAO countryDAO = new CountryDAO();
                                List al = countryDAO.getCountryList();
                                for (int i = 0; i < al.size(); i++) {
                                    out.println("<li><a href=\"#\"  data-value=\"" + ((Country) (al.get(i))).getCountryCode() + "\">" + ((Country) (al.get(i))).getCountryName() + "</a></li>");
                                }
                            %>
                        </ul>
                    </div>


                    <div name="city" class="btn-group">
                        <button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            City <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <!--li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li-->
                        </ul>
                    </div>
                    <input name="city" type="hidden"/>



                    <button type="button" class="btn btn-default" onclick="showMap()">Map</button>
                </div>
            </div>

            <br>

            <div class="row">

                <div class="col-md-12">
                    <label for="room_opt">Room Option</label>
                    <br>
                    <div name="amount_opt" class="btn-group">
                        Amount:
                        <select name="numOfRoom">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </div>
                    <div name="room_opt" class="btn-group">
                        No of ppl:
                        <select name="capacity">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </div>
                </div>

            </div>
            <!--
            
                        <div class="row">
                            <div class="col-md-3">
            
                            </div>
                            <div class="col-md-5">
            
                            </div>
                            <div class="col-md-4">
                                <div class="btn-group" id="advanced_btn">
                                    Advanced <span class="caret"></span>
                                </div>
            
                            </div>
                        </div>
            
            
                        
                                    <div id="advancedOpt">
                                        <hr>
                                        <div class="row">
                        
                                            <div class="col-md-12">
                                                <label for="rating">Rating</label>
                                                <br>
                                                <div name="rating" class="btn-group">
                                                    <button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        Rating <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="#">1</a></li>
                                                        <li><a href="#">2</a></li>
                                                        <li><a href="#">3</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                        
                                        <br>
                        
                                        <div class="row">
                        
                                            <div class="col-md-12">
                                                <label for="price">Price</label>
                                                <div class="slider sliderRange sliderBlue"></div>
                                                <div class="field_notice">Price Range: <span class="must sliderRangeLabel">$192 - $470</span></div>
                                                <br>
                                            </div>
                        
                                        </div>
                        
                                    </div>
                                    <br>
            -->
            <div class="row">
                <div class="col-md-3">

                </div>
                <div class="col-md-5">

                </div>
                <div class="col-md-4">
                    <button id="old_find_btn" type="submit" value="findMatchedCriteria" class="btn btn-success">FIND</button>
                </div>

            </div>
        </form>
    </div>
</div>