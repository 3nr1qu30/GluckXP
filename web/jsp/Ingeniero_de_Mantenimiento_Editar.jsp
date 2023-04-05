<%-- 
    Document   : Ingeniero Mantenimiento Editar
    Created on : Apr 3, 2023, 9:58:45 PM
    Author     : Marco
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%session = request.getSession();
              String nivel = session.getAttribute("lvl").toString();
              String usuario = session.getAttribute("usuario").toString();
    if(nivel.equals("6") || nivel.equals("7") || nivel.equals("4")){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/forms_edit.css" rel="stylesheet" type="text/css"/>
        <title>Ingeniero de Mantenimiento</title>
    </head>

    <body>

    <h1>Ingeniero de Mantenimiento </h1>

    
    <form>
      <div class="input-group">
        <label for="usuario">Folio del reporte</label>
        <input type="text" id="reporte" name="usuario">
        <br>   
        <label for="descripcion">Usuario que manipula el reporte</label>
        <input type="text" id="ingeniero" name="descripcion">
        <br>   
        <label for="descripcion">Usuario asignado a la tarea</label>
        <input type="text" id="gerente" name="descripcion">
        <br>   
        <label for="estatus">Estatus</label>
        <select name="estatusM" id="estatus">
        <option value="estatus0">Selecciona una opción</option>
        <option value="estatus1">En programación</option>
        <option value="estatus2">Programación terminada</option>
        </select>
        <br><br>
        <label for="descripcion">Descripción</label>
        <input type="text" id="descripcion" name="descripcion">
        <br>   
        <label for="descripcion">Solución</label>
        <input type="text" id="solucion" name="descripcion">
        <br>   
        <label for="descripcion">Fecha y hora</label>
        <input type="text" id="fechaHora" name="descripcion">
      </div> 
        <br><br>
      
        <button type="submit">Enviar</button>
     
    </form>
        
    </body>
</html>

   <%} else{%>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Error</title>
        </head>
        <body>
        <center><h1>No tienes permiso de acceder a esta pagina</h1></center>
        </body>
    </html>

    <%}%>
