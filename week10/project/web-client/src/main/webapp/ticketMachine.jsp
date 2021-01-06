<%-- 
    Document   : ticketMachine
    Created on : Jan 5, 2021, 5:19:46 PM
    Author     : Ivan
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="org.solent.com528.project.impl.webclient.WebClientObjectFactory"%>
<%@page import="org.solent.com528.project.model.dto.PricingDetails"%>
<%@page import="org.solent.com528.project.model.dao.PriceCalculatorDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.solent.com528.project.clientservice.impl.TicketEncoderImpl"%>
<%@page import="org.solent.com528.project.clientservice.impl.TicketEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="org.solent.com528.project.model.service.ServiceFacade"%>
<%@page import="org.solent.com528.project.model.dto.Ticket" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Issue peak/ off ticket
    
    DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    dateFormat.format(cal.getTime());
    
    DateFormat dateStart = new SimpleDateFormat("HH:mm:ss");
    String timeStart = "12:00:00 pm";
    Date date = dateStart.parse(timeStart);
    
    DateFormat dateEnd = new SimpleDateFormat("HH:mm:ss");
    String timeEnd = "14:00:00 pm";
    Date date_2 = dateEnd.parse(timeEnd);
    
    
    String message = "";
    String userInput = "";
    ArrayList<String> peak = new ArrayList<String>();
    peak.add("Monday");
    peak.add("Tuesday");
    peak.add("Wednesday");
    peak.add("Thursday");
    peak.add("Friday");
    if(userInput == "Monday"){
    message = "Ticket is peak";
}
    else if(userInput == "Tuesday"){
message = "Ticket is peak";
}
    else if(userInput == "Wednesday"){
message = "Ticket is peak";
}
    else if(userInput == "Thursday"){
message = "Ticket is peak";
}
    else if(userInput == "Friday"){
message = "Ticket is peak";
}
    else{
    message = "Ticket is off peak";
    }
   
    if(dateFormat.after(date) && dateFormat.before(date_2)) {
    message = "Ticket is peak";
}
    else{
    message = "Ticket is off peak";
    }
    
   
    
    //Issue departure time
    Date ticketDepartureTime = WebClientObjectFactory.getSetDepratureTime();
    


ServiceFacade serviceFacade = (ServiceFacade) WebClientObjectFactory.getServiceFacade();
    
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Machine</title>
    </head>
    <body>
       <form action="./ticketMachine.jsp" method="get">
                <tr>
                    <td>Input day of the week </td>

                    <td><input type="text" size="36" name="updateUuid" value="<%=message%>"></td>
                    <td>
                        <input type="hidden" name="action" value="setDepartureTime">
                        <button type="submit" >Issue peak/off peak ticket</button>
                    </td>

                </tr>
            </form>
<form action="./ticketMachine.jsp" method="get">
                <tr>
                    <td>Departure Time</td>

                    <td><input type="text" size="36" name="updateUuid" value="<%=ticketDepartureTime%>"></td>
                    <td>
                        <input type="hidden" name="action" value="setDepartureTime">
                        <button type="submit" >Set Departure Time</button>
                    </td>

                </tr>
            </form>
                    
    </body>
</html>
</body>
</html>
