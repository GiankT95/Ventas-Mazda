<%-- 
    Document   : CarroCompras
    Created on : 21-nov-2017, 19:57:06
    Author     : Asus
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelo.*"%>
<%@page import="Modelo.CarroCompras"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito de Compras</title>
    </head>
    <body style="background-color:#34495E;">
        
    <center>
        

        <img src="http://www.carlogos.org/logo/Mazda-logo-1997-1920x1080.png" width="300px" height="160px"/>
        
        <%
    
        List<CarroCompras> carritos = (List<CarroCompras>) request.getSession().getAttribute("lista");
        
        DecimalFormat d = new DecimalFormat("$###,###.###");
        
        if (carritos != null){
        
        for (CarroCompras c : carritos){
        
        if (c.getEstado().equalsIgnoreCase("activo")) {    
            
        if (!c.getProductos().isEmpty()){%>
        
        <% double total = new Double(request.getSession().getAttribute("total").toString()); %>
        
        <font face="Agency FB" color="#5499C7" style="font-size: 14pt;"><table style="background-color:#BADFF5;" align="center" border="1" cellpadding="8" cellspacing="0" > 
        
        <tr>
            <th colspan="5" align="center">CARRITO DE COMPRAS</th>
        </tr>

        <tr>
            <th>Id Producto</th>
            <th>Tipo de Producto</th>
            <th>Nombre</th>
            <th>Modelo</th>
            <th>Precio</th>
        </tr>
        
        <% Set<Producto> pCarrito = c.getProductos(); 
        
            for (Producto p : pCarrito){%>

            <tr>
                
                <td><%= p.getIdProducto() %></td>
                
                <% if (p.getVehiculo() != null){%>

                    <td>Vehiculo</td>
                    <td><%= p.getVehiculo().getMarca() +" "+ p.getVehiculo().getModelo() %></td>
                    <td><%= p.getVehiculo().getAnio() %></td>
                    <td><%= d.format(p.getVehiculo().getPrecio()) %></td>
                <%}%>
                
                <% if (p.getAccesorio() != null){%>
    
                    <td>Accesorio</td>
                    <td><%= p.getAccesorio().getNombre() %></td>
                    <td> Nuevo </td>
                    <td><%= d.format(p.getAccesorio().getPrecio()) %></td>
                <%}%>
                
            </tr>
               
            <%}%>
            
        <tr> 
            <th colspan="4" align="right">Total</th>
            <td><%= d.format(total) %></td>   
        </tr>
        
        </table>
        </font>
        <br>
        <form method="POST" action="ServletPedido">
 
            <select name="medioDePago">
              <option value="Efectivo">Efectivo</option>
              <option value="Tarjeta de credito">Tarjeta de credito</option>
              <option value="Cheque">Cheque</option>
            </select>
            
            <input type="Submit" name="hacerPedido" value="Hacer Pedido">
            <input type="hidden" name="pedido" value="hacerPedido"/>
            
        </form>
        
        <%}%>         
        <%}%>
       
        
        <%}%>
        <%}%>
        
        <br>
        
        <form method="POST" action="ServletPedido">
            
            <input type="Submit" name="verPedidos" value="Ver Pedidos">
            <input type="hidden" name="pedido" value="verPedidos"/>
            
        </form>
        
    </center>
    </body>
</html>
