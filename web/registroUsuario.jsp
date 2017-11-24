<%-- 
    Document   : registroUsuario
    Created on : 30-oct-2017, 18:24:33
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Usuario</title>
    </head>
    <body style="background-color:#34495E;">   
    <center>
        
        <img src="http://www.carlogos.org/logo/Mazda-logo-1997-1920x1080.png" width="300px" height="160px"/>
    
        <font face="Agency FB" color="#5499C7" style="font-size: 14pt;">
        
        <h1>Crear Usuario</h1>
        
        <form method="POST" action="ServletRegistro">
            
            
            <font face="Agency FB" color="#5499C7" style="font-size: 18pt;">Nombre de usuario</font> 
            <br><input type="Text" name="nombreUsuario" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
            <font face="Agency FB" color="#5499C7" style="font-size: 18pt;">Nombre</font>
            <br><input type="Text" name="nombre" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
            <font face="Agency FB" color="#5499C7" style="font-size: 18pt;">Apellido</font>
            <br><input type="Text" name="apellido" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
            <font face="Agency FB" color="#5499C7" style="font-size: 18pt;">Clave</font>
            <br><input type="Password" name="clave" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
            <input type="Submit" name="crear" value="Crear Usuario">
            
        </form>
        
        <% if(request.getSession().getAttribute("mensaje3") != null) { %>
            <h1 style="color: red">
            <%= request.getSession().getAttribute("mensaje3") %>
            </h1>
        <% } %>
        </font>
    </center>    
    </body>
</html>
