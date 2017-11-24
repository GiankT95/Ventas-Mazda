<%-- 
    Document   : documentos
    Created on : 24-nov-2017, 1:21:39
    Author     : Asus
--%>

<%@page import="Modelo.Documento"%>
<%@page import="Modelo.ConstructorDocumentacionPDF"%>
<%@page import="Modelo.ConstructorDocumentacionVehiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.pdfa.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Documentacion</title>
    </head>
    <body>
        
        <%
            ConstructorDocumentacionVehiculo cdv = new ConstructorDocumentacionPDF();
            Documento doc = cdv.creaDocumento();
            String formato = doc.getFormato();

        %>
        
        <h3><%= formato %></h3>
        
    </body>
</html>
