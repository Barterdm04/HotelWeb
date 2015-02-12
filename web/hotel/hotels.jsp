<%-- 
    Document   : hotels
    Created on : Feb 10, 2015, 12:30:14 PM
    Author     : DB7
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="hotel.model.Hotel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <link href='<%= request.getContextPath() + "/jquery-ui.theme.css"%>' rel="stylesheet" type="text/css"/>
        <title>Hotel List</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <script>
            $(function() {
              $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
              $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
            });
        </script>
        <style>
            .ui-tabs-vertical { width: 55em; }
            .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
            .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; font-size: 10pt;}
            .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
            .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
            .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
        </style>
    </head>
    
    <body>
        <h1>List of Hotels</h1>
        <form id="form2" name="form2" method="POST" action='<%= request.getContextPath() + "/HotelDisplayController"%>'>
        <div id="tabs">
            <ul>
                <c:forEach var="hotel" items="${hotelList}" varStatus="rowCount">
                    <li><a href="#tabs-${hotel.hotelId}">${hotel.hotelName}</a></li>
                </c:forEach>
            </ul>
            <c:forEach var="hotel" items="${hotelList}" varStatus="rowCount">
                <div id="tabs-${hotel.hotelId}">
                    <table style='width:100%'>
                        <thead>
                        <th>Hotel ID</th>
                        <th>Hotel Name</th>
                        <th>Hotel Address</th>
                        <th>Notes</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${hotel.hotelId}</td>
                                <td>${hotel.hotelName}</td>
                                <td>${hotel.streetAddress}<br>${hotel.city},${hotel.state} ${hotel.postalCode}</td>
                                <td>${hotel.notes}</td>
                            </tr>
                            
                    </table>
                </div>
            </c:forEach>
        </div>      
            <input type="submit" name="submit" value="Populate List of Hotels" />
        </form>
        
                
        <!--<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>-->
    </body>
</html>
