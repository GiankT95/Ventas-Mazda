<%-- 
    Document   : documentacion
    Created on : 22-nov-2017, 20:33:58
    Author     : Asus
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
    </head>
    <body style="background-color:#34495E;">
    <center>
        <img src="http://www.carlogos.org/logo/Mazda-logo-1997-1920x1080.png" width="300px" height="160px"/>
        
        <font face="Agency FB" color="#5499C7" style="font-size: 14pt;"><table style="background-color:#BADFF5;" border="1" cellpadding="8" cellspacing="0" >

            <tr><th align="center" colspan="5" >Pedidos de <%= request.getSession().getAttribute("nombreUsuario")%></th>
            </tr>

            <tr align="center">

                <th>Pedido N°</th>
                <th>Fecha</th>
                <th>Medio de Pago</th>
                <th>Documentacion</th>
                <th>Monto</th>

            </tr>

            <%
                Usuario usuario = (Usuario) request.getSession().getAttribute("Usuario");
                double total = 0;

                DecimalFormat d = new DecimalFormat("$###,###.###");

                List<CarroCompras> listaCarritos = ServicioLogin.instance().listaCarritos(usuario);

                if (listaCarritos != null && usuario != null) {

                    int i = 1;

                    for (CarroCompras carrito : listaCarritos) {

                        Set<Pedido> listaPedidos = carrito.getPedidos();

                        for (Pedido pedido : listaPedidos) {

                        total = total + pedido.getMonto();%>

            <tr align="center">

                <td><%= i%></td>
                <td><%= pedido.getFecha()%></td>
                <td><%= pedido.getMedioPago()%></td>
                <td>
                    <form method="POST" action="ServletDocumento">
            
                        <input type="Submit" name="descargar" value="Decargar">
                        <input type="hidden" name="documento" value="descargar"/>

                    </form>
                </td>
                <td><%= d.format(pedido.getMonto())%></td>

            </tr>

            <% i++; %>  

            <%}
                    }
                }
            %>

            <tr><th align="right" colspan="4" >Total Pedidos</td>
                <td align="center"><%= d.format(total)%></td>
            </tr>

        </table>
            </font>
    </center>
    </body>
</html>
