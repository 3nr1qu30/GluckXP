<%-- 
    Document   : Ingeniero Mantenimiento Editar
    Created on : Apr 3, 2023, 9:58:45 PM
    Author     : Marco
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/forms_edit.css" rel="stylesheet" type="text/css"/>
        <title>Ingeniero de Mantenimiento</title>
    </head>

    <body>

    <h1>Ingeniero de Mantenimiento </h1>

        <%
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String fechaHoraReporte = dtf.format(LocalDateTime.now()); 
        %>
    
    <form>
      <div class="input-group">
        <label for="usuario">Folio del reporte</label>
        <input type="text" id="reporte" name="usuario">
           
        <label for="descripcion">Usuario que manipula el reporte</label>
        <input type="text" id="ingeniero" name="descripcion">
        
        <label for="descripcion">Usuario asignado a la tarea</label>
        <input type="text" id="gerente" name="descripcion">
        
        <label for="estatus">Estatus</label>
        <select name="estatusM" id="estatus">
        <option value="estatus0">Selecciona una opción</option>
        <option value="estatus1">En programación</option>
        <option value="estatus2">Programación terminada</option>
        </select>
        
        <label for="descripcion">Descripción</label>
        <input type="text" id="descripcion" name="descripcion">
        
        <label for="descripcion">Solución</label>
        <input type="text" id="solucion" name="descripcion">
        
        <label for="descripcion">Fecha y hora</label>
        <input type="text" id="fechaHora" name="descripcion">
        
        <br><br>
      
        <button type="submit">Enviar</button>
        </div>
     
    </form>
        
    </body>
</html>
