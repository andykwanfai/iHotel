<%-- 
    Document   : test
    Created on : Apr 10, 2016, 6:39:48 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <title>Google Maps AJAX</title>
        <script src="http://maps.google.com/maps/api/js?key=AIzaSyBIB_LsobQTb3e3T50NzVY-RbQnl8Lzoa0&sensor=false"
        type="text/javascript"></script>
        <script type="text/javascript">
            //<![CDATA[

            var customIcons = {
               s1: {
                    icon: 'img/hotel_1s.png',
                    shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
                },
                s2: {
                    icon: 'img/hotel_2s.png',
                    shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
                },
                s3: {
                    icon: 'img/hotel_3s.png',
                    shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
                },
                s4: {
                    icon: 'img/hotel_4s.png',
                    shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
                },
                s5: {
                    icon: 'img/hotel_5s.png',
                    shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
                }
            };

            function load() {
                var map = new google.maps.Map(document.getElementById("map"), {
                    center: new google.maps.LatLng(25.032969, 121.565418),
                    zoom: 10,
                    mapTypeId: 'roadmap'
                });
                var infoWindow = new google.maps.InfoWindow;

                // Change this depending on the name of your PHP file
                downloadUrl("MapServlet.do", function (data) {
                    var xml = data.responseXML;
                    console.log(xml);
                    var markers = xml.documentElement.getElementsByTagName("marker");
                    for (var i = 0; i < markers.length; i++) {
                        /**var address = markers[i].getAttribute("address");
                         var type = markers[i].getAttribute("type");
                         var point = new google.maps.LatLng(
                         parseFloat(markers[i].getAttribute("lat")),
                         parseFloat(markers[i].getAttribute("lng")));**/

                        var hid = markers[i].getAttribute("hid");
                        var name = markers[i].getAttribute("name");
                        var address = markers[i].getAttribute("address");
                        var point = new google.maps.LatLng(
                                parseFloat(markers[i].getAttribute("lat")),
                                parseFloat(markers[i].getAttribute("lng")));
                        //  var remarks = markers[i].getAttribute("remarks");
                        var type = markers[i].getAttribute("type");
                        var html = "<b>" + "<a href='HotelController.do?country=Taiwan&hid=" + hid + "'>"+name+"</a></b> <br/>" + address;
                        var icon = customIcons[type] || {};
                        var marker = new google.maps.Marker({
                            map: map,
                            position: point,
                            icon: icon.icon,
                            shadow: icon.shadow
                        });
                        bindInfoWindow(marker, map, infoWindow, html);
                    }
                });
            }

            function bindInfoWindow(marker, map, infoWindow, html) {
                google.maps.event.addListener(marker, 'click', function () {
                    infoWindow.setContent(html);
                    infoWindow.open(map, marker);
                });
            }

            function downloadUrl(url, callback) {
                var request = window.ActiveXObject ?
                        new ActiveXObject('Microsoft.XMLHTTP') :
                        new XMLHttpRequest;

                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        request.onreadystatechange = doNothing;
                        callback(request, request.status);
                    }
                };

                request.open('GET', url, true);
                request.send(null);
            }

            function doNothing() {}

            //]]>
        </script>
    </head>

    <body onload="load()">
        <div id="map" style="width: 600px; height: 800px;"></div>
    </body>
</html>