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
    <body>

        <table border="1" cellpadding="8" cellspacing="0" >

            <tr><th align="center" colspan="5" >Pedidos de <%= request.getSession().getAttribute("nombreUsuario")%></th>
            </tr>

            <tr align="center">

                <th>Pedido N°</th>
                <th>Fecha</th>
                <th>Medio de Pago</th>
                <th>Monto</th>
                <th>Documentación</th>

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
                <td><a href="documentos.jsp">Descargar</a></td>
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

    </body>
</html>
