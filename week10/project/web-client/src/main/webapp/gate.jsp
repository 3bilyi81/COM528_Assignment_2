<%-- 
    Document   : gate
    Created on : Jan 5, 2021, 5:19:23 PM
    Author     : Ivan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.solent.com528.project.clientservice.impl.TicketEncoder"%>
<%@page import="org.solent.com528.project.model.dao.PriceCalculatorDAO"%>
<%@page import="org.solent.com528.project.model.dto.Ticket"%>
<%@page import="org.solent.com528.project.impl.webclient.WebClientObjectFactory"%>
<%@page import="org.solent.com528.project.model.dto.Station"%>
<%@page import="org.solent.com528.project.model.dao.StationDAO"%>
<%@page import="org.solent.com528.project.model.service.ServiceFacade"%>
<%@page import="org.solent.com528.project.impl.service.rest.client.ClientObjectFactoryImpl"%>
<%@page import="java.util.Date"%>
<%@page import="org.solent.com528.project.clientservice.impl.TicketEncoderImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Enter arrival station
    String arrivalStation = WebClientObjectFactory.getArrivalStation();
    
    //Enter arrival time
    Date arrivalTime = WebClientObjectFactory.getArrivalTime();
   
    
    ServiceFacade serviceFacade = (ServiceFacade) WebClientObjectFactory.getServiceFacade();
    
    //Variable which we are going to use to check if the ticket is valid or not
    
    Boolean decodeTicket = false;
    String encodeTicket = "";
    String Log = "";
    
    
//Checking if the ticket is valid or not
    try {
        if (encodeTicket != null || encodeTicket.length() != 0) {
            decodeTicket = TicketEncoderImpl.validateTicket(encodeTicket);
            if (decodeTicket == true) {
                Ticket decodedTicket = new Ticket();
                StationDAO stationDAO = serviceFacade.getStationDAO();
                Station station = stationDAO.findByName(decodedTicket.getStartStation());
                
                Log = "The ticket is valid! Gate Open!";
            } else {
                Log = "The ticket is not valid! Gate cannot open!";
            }
        }
    } catch (Exception Err) {
        Log = Err.getMessage();
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gate</title>
    </head>
    <body>
        <h1>Ticket Gate</h1>
        <h1><%= Log%></h1>
        <p>Ticket validation</p>
        <form action="./gate.jsp"  method="post">
            <table>    
            <tr>
                <td>Starting Station:</td>
                <td><input type="text" name="arrivalStation"></td>
            </tr>
            </table>
            <textarea <textarea rows="15" cols="60" value="" name="encodedTicketString" ></textarea>
            <button type="submit">Validate Ticket</button>
        </form>
        
                    <td>Arrival station</td>

                    <td><input type="text" size="36" name="updateUuid" value="<%=arrivalStation%>"></td>
                    <td>
                        <input type="hidden" name="action" value="setDepartureTime">
                        <button type="submit" >Enter arrival station</button>
                    </td>

                </tr>
            </form>
                    <form action="./gate.jsp" method="get">
                <tr>
                    <td>Arrival time</td>

                    <td><input type="text" size="36" name="updateUuid" value="<%=arrivalTime%>"></td>
                    <td>
                        <input type="hidden" name="action" value="setDepartureTime">
                        <button type="submit" >Enter arrival time</button>
                    </td>

                </tr>
            </form>
    </body>
</html>
