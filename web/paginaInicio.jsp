<%-- 
    Document   : paginaInicio
    Created on : 30-oct-2017, 18:30:51
    Author     : Asus
--%>

<%@page import="Modelo.ServicioLogin"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="Modelo.CarroCompras"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.text.DecimalFormat"%>
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

    <body style="background-color:#34495E;">
        
    <center>
        
        <img src="http://www.carlogos.org/logo/Mazda-logo-1997-1920x1080.png" width="300px" height="160px"/>
        
        <font face="Agency FB" color="#5499C7" style="font-size: 20pt;"><h1>Bienvenido <%= request.getSession().getAttribute("nombreUsuario") %> </h1>
        
        <h2> <font face="arial black">Catalogo Mazda</font></h2></font>
        
        <div style="overflow: scroll; height: 225px; width:45%; overflow:auto">
        <font face="Agency FB" color="#5499C7" style="font-size: 14pt;"><table style="background-color:#BADFF5;" border="1" CELLSPACING="0" cellpadding="8">
            
            <tr> <th>Producto</th>
            <th colspan="2" >Detalle</th>
            </tr>
            
            <%
            List<Producto> productos = (List<Producto>) request.getSession().getAttribute("catalogo");
            DecimalFormat df = new DecimalFormat("$###,###.###");
            
            
            for (Producto p : productos){%>
            
            <% if (p.getVehiculo() != null){%>
            
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("6")){%>
                <tr> <td rowspan="6" ><img src="mazda6.png" width="300px" height="160px"/></td>
            <%}%>
            
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("cx-5")){%>
                <tr> <td rowspan="6" ><img src="cx-5.png" width="300px" height="160px"/></td>
            <%}%>
                    
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("2")){%>
                <tr> <td rowspan="6" ><img src="mazda2.png" width="300px" height="160px"/></td>
            <%}%>
                    
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("3")){%>
                <tr><td rowspan="6" ><img src="mazda3.jpg" width="300px" height="160px"/></td>
            <%}%>
                    
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("cx-9")){%>
                <tr > <td rowspan="6" ><img src="cx-9.png" width="300px" height="160px"/></td>
            <%}%>
            
            <th>Id</th>
            <td><%= p.getIdProducto() %></td>
            </tr>

            <tr> <th>Marca</th>
            <td><%= p.getVehiculo().getMarca() %></td>
            </tr>

            <tr><th>Modelo</th>
            <td><%= p.getVehiculo().getModelo() %></td>
            </tr>

            <tr><th>Año</th>
            <td><%= p.getVehiculo().getAnio() %></td>
            </tr>

            <tr> <th>Precio</th>
            <td><%= df.format(p.getVehiculo().getPrecio()) %></td>
            </tr>

            <tr> <th>Stock</th>
            <td><%= p.getVehiculo().getStock() %></td>
            </tr>
            
            <%}%>
            
               
               <% if (p.getAccesorio() != null){%>
                    <tr><td rowspan="4"><img src="logo mazda.png" width="300px" height="160px"/></td>
                    <th>Id</th>
                    <td><%= p.getIdProducto() %></td>
                    </tr>

                    <tr><th>Accesorio</th>
                    <td><%= p.getAccesorio().getNombre() %></td>
                    </tr>

                    <tr> <th>Precio</th>
                    <td><%= df.format(p.getAccesorio().getPrecio()) %></td>
                    </tr>

                    <tr> <th>Stock</th>
                    <td><%= p.getAccesorio().getStock() %></td>
                    </tr>
               <%}%>
               
            <%}
            %>
        </table>
        <font face="Agency FB" color="#5499C7" style="font-size: 14pt;">
        </div>
        
        <form method="POST" action="ServletCarrito">
            
            <h3><font face="arial black">Ingrese el Id del producto</font></h3>
            <input type="text" name="producto" id="producto" style="font-family: Arial; font-size: 12pt;width:70px;height:20px;text-align:left">
            <input type="Submit" name="agregarProducto" value="Agregar al carrito">
            <input type="hidden" name="carrito" value="agregarProducto"/>
        </form>
       
        <br>
        <form method="POST" action="ServletCarrito">
            
            <input type="Submit" name="verCarrito" value="Ver Carrito">
            <input type="hidden" name="carrito" value="verCarrito"/>
            
        </form>
        
        <br>
        
        <form method="POST" action="ServletPedido">
            
            <input type="Submit" name="verPedidos" value="Ver Pedidos">
            <input type="hidden" name="pedido" value="verPedidos"/>
            
        </form>
        
    </center>
        <a href="inicioSesion.jsp"><h4><font face="arial">Cerrar Sesion</font></h4></a>
        
    </body>
</html>
