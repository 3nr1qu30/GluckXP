<%@page import="java.sql.*"%>        
<%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();
if(nivel.equals("8") || nivel.equals("4")){%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tablas_forms.css">
        <title>Publicar FAQ's</title>
    </head>
    <body>
        <h1>Publicar FAQ's</h1>
        <form method="POST" action="ServletPublicarFAQ">
      <div class="input-group">
        <label for="pregunta">Pregunta</label>
        <input type="text" id="usuario" name="PreguntaForm">
      
     
        <label for="solucion">Solución</label>
        <input type="text" id="descripcion" name="SolucionForm">
        <button type="submit">Publicar</button>
        </div>
     
    </form>
    </body>
</html>
<%} else{%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        No tienes permiso de acceder a esta pagina
    </body>
</html>
<%}%>