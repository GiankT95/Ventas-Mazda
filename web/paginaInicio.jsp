<%-- 
    Document   : paginaInicio
    Created on : 30-oct-2017, 18:30:51
    Author     : Asus
--%>

<%@page import="Modelo.Vehiculo"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= request.getSession().getAttribute("nombreUsuario") %></title>
    </head>

    <body>
        
        <h1>Bienvenido <%= request.getSession().getAttribute("nombreUsuario") %> </h1>
        
        <h2> <font face="arial black">Catalogo Mazda</font></h2>
        <table border="1">
            <tr>
            <td>Id</td>
            <td>Marca</td>
            <td>Modelo</td>
            <td>Año</td>
            <td>Precio</td>
            </tr>
            <%
            List<Vehiculo> vehiculos = (List<Vehiculo>) request.getSession().getAttribute("vehiculos");
            for (Vehiculo v : vehiculos){
               out.println("<tr>");
               out.println("<td>"+v.getIdVehiculo()+"</td>");
               out.println("<td>"+v.getMarca()+"</td>");
               out.println("<td>"+v.getModelo()+"</td>");
               out.println("<td>"+v.getAnio()+"</td>");
               out.println("<td>"+v.getPrecio()+"</td>");
               out.println("</tr>");
            }
            %>
        </table>
        
        <a href="inicioSesion.jsp">Cerrar Sesion</a>
        
    </body>
</html>
