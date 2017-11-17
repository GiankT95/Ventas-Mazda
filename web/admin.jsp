<%-- 
    Document   : admin
    Created on : 01-nov-2017, 19:35:28
    Author     : Asus
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
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
        
        <h1><font face="arial black" color="blue">Bienvenido <%= request.getSession().getAttribute("nombreUsuario") %> </font></h1><br>
        <h2> <font face="arial black">Lista de usuarios registrados</font></h2>
        <table border="3">
            <tr>
            <td>Id</td>
            <td>Rol</td>
            <td>Usuario</td>
            <td>Nombre</td>
            <td>Apellido</td>
            <td>Clave</td>
            
            </tr>
            <%
            List<Usuario> lista = (List<Usuario>) request.getSession().getAttribute("lista");
            for (Usuario u : lista){%>
               <tr>
               <td><%= u.getIdUsuario() %></td>
               <td><%= u.getRolUsuario().getTipo() %></td>
               <td><%= u.getNombreUsuario() %></td>
               <td><%= u.getNombre() %></td>
               <td><%= u.getApellido() %></td>
               <td><%= u.getClave() %></td>
               
               </tr>
            <%}%>
        </table>

        <h2> <font face="arial black">Catalogo Mazda</font></h2>
        <table border="3">
            <tr>
            <td>Id</td>
            <td>Marca</td>
            <td>Modelo</td>
            <td>Año</td>
            <td>Precio</td>
            <td>Stock</td>
            <td>Vehiculo</td>
            </tr>
            <%
            List<Vehiculo> vehiculos = (List<Vehiculo>) request.getSession().getAttribute("vehiculos");
            DecimalFormat df = new DecimalFormat("$###,###.###");
            
            
            for (Vehiculo v : vehiculos){%>
               <tr>
               <td><%= v.getIdVehiculo() %></td>
               <td><%= v.getMarca() %></td>
               <td><%= v.getModelo() %></td>
               <td><%= v.getAnio() %></td>
               <td><%= df.format(v.getPrecio()) %></td>
               <td><%= v.getStock() %></td>
               
               <% if (v.getModelo().equalsIgnoreCase("6")){%>
                   
                <td><img src="mazda6.png" width="300px" height="160px"/></td>
                        <%}%>
                <% if (v.getModelo().equalsIgnoreCase("cx-5")){%>

                <td><img src="cx-5.png" width="300px" height="160px"/></td>
                        <%}%>
                
                <% if (v.getModelo().equalsIgnoreCase("3")){%>

                <td><img src="mazda3.jpg" width="300px" height="160px"/></td>
                        <%}%>
                
                <% if (v.getModelo().equalsIgnoreCase("cx-9")){%>

                <td><img src="cx-9.png" width="300px" height="160px"/></td>
                        <%}%>
                
                <% if (v.getModelo().equalsIgnoreCase("2")){%>

                <td><img src="mazda2.png" width="300px" height="160px"/></td>
                        <%}%>
                
               </tr>
            <%}
            %>
        </table>
        
        <form method="POST" action="ServletAdmin">
            <br>
            <h3><font face="arial black">Ingrese un nombre de usuario:</font></h3>
            <input type="text" name="elimUsuario" id="claveInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left">
            <input type="Submit" name="eliminar" value="Eliminar">
            
        </form>
        
        <br><br>
        <a href="inicioSesion.jsp">Cerrar Sesion</a>
        
    </body>
</html>
