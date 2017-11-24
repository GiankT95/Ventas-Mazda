<%-- 
    Document   : index
    Created on : 30-oct-2017, 17:00:02
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>:: Login ::</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-color:#34495E;">
    <center>
      <font face="Agency FB" color="#5499C7" style="font-size: 18pt;">  
        <img src="http://www.carlogos.org/logo/Mazda-logo-1997-1920x1080.png" width="300px" height="160px"/>
        
        <h1>Iniciar Sesion</h1>
                
                <form method="POST" action="ServletLogin">
                    
                    Usuario<br>
                    <input type="Text" name="nombreInicio" id="nombreInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
                    Clave<br>
                    <input type="Password" name="claveInicio" id="claveInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
                    <input type="Submit" name="iniciarSesion" value="Iniciar Sesion">
                </form>

                <form method="POST" action="registroUsuario.jsp">
                    <br><input type="Submit" name="registrar" value="Registrarse">
                </form>
        
        <% if(request.getSession().getAttribute("mensaje") != null) { %>
            <h1 style="color: red">
            <%= request.getSession().getAttribute("mensaje") %>
            </h1>
        <% } %>
    </center>
        </center>
    </body>
    
</html>
