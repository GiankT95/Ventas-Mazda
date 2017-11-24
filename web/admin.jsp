<%-- 
    Document   : admin
    Created on : 01-nov-2017, 19:35:28
    Author     : Asus
--%>

<%@page import="Modelo.Pedido"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Set"%>
<%@page import="Modelo.ServicioLogin"%>
<%@page import="Modelo.CarroCompras"%>
<%@page import="Modelo.Producto"%>
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

    <body style="background-color:#34495E;">
      
    <center>
        
        <img src="http://www.carlogos.org/logo/Mazda-logo-1997-1920x1080.png" width="300px" height="160px"/>
        
        <h1><font face="Agency FB" color="#BADFF5">Bienvenido <%= request.getSession().getAttribute("nombreUsuario") %> </font></h1><br>
        <font face="Agency FB" color="#5499C7" style="font-size: 14pt;"><table style="background-color:#BADFF5;" border="1" cellspacing="0">
            <tr>
            <th>Id</th>
            <th>Rol</th>
            <th>Usuario</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Clave</th>
            
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
        

        
        <form method="POST" action="ServletAdmin">
            <br>
            <input type="text" name="elimUsuario" id="claveInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left">
            <input type="Submit" name="eliminar" value="Eliminar">
            <input type="hidden" name="admin" value="eliminar">
        </form>

        <br>
        
        
        
        <font face="Agency FB" color="#5499C7" style="font-size: 14pt;"><table style="background-color:#BADFF5;" border="1" cellpadding="8" cellspacing="0" >
  
        <tr><th align="center" colspan="5" >Pedidos</th>
        </tr>

        <tr align="center">

            <th>Pedido N°</th>
            <th>Fecha</th>
            <th>Medio de Pago</th>
            <th>Documentacion</th>
            <th>Monto</th>

        </tr>

        <%
            
            double total = 0;
            
            DecimalFormat d = new DecimalFormat("$###,###.###");
            
             Usuario usuario = (Usuario) request.getSession().getAttribute("usuariop");
            
            List<CarroCompras> listaCarritos = ServicioLogin.instance().listaCarritos(usuario);  
            
            if (listaCarritos != null && usuario != null) {
                
                int i=1;
                
                for (CarroCompras carrito : listaCarritos) {
                    
                    Set<Pedido> listaPedidos = carrito.getPedidos();
                    
                    
                    
                    for (Pedido pedido : listaPedidos) {
                        
                    total = total + pedido.getMonto(); %>

                        <tr align="center">
                        
                            <td><%= i %></td>
                            <td><%= pedido.getFecha() %></td>
                            <td><%= pedido.getMedioPago() %></td>
                            <td><a href="documentos.jsp">Descargar</a></td>
                            <td><%= d.format(pedido.getMonto()) %></td>
                        
                        </tr>

                        <% i++; %>  
                        
                    <%}
                }
            }
        %>

        <tr><th align="right" colspan="4" >Total Pedidos</td>
            <td align="center"><%= d.format(total) %></td>
        </tr>

        </table>
        
        
        <br>
        
        <form method="POST" action="ServletAdmin">
            
            <input type="text" name="nombrep" id="nombrep" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left">
            <input type="Submit" name="pedidosUsuario" value="Ver Pedidos">
            <input type="hidden" name="admin" value="pedidosUsuario"/>
            
        </form>
        
        <br>
        
        <h2> <font face="arial black">Catalogo Mazda</font></h2>
        
        <div style="overflow: scroll; height: 225px; width:45%; overflow:auto">
        <table style="background-color:#BADFF5;" border="1" CELLSPACING="0" cellpadding="8">
            
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
        </div>
        </font>
        
        <br><br>
        <a href="inicioSesion.jsp">Cerrar Sesion</a>
    
    </center>
        
    </body>
</html>
