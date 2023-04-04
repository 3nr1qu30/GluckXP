<%-- 
    Document   : Ingeniero de Soporte Editar
    Created on : Apr 3, 2023, 9:59:57 PM
    Author     : Marco
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/forms_edit.css" rel="stylesheet" type="text/css"/>
        <title>Ingeniero de Soporte</title>
    </head>

    <body>
        <h1>Hello World!</h1>
        
        <div class="container">
    <h1>Ingeniero de Mantenimiento </h1>

    <form>
      <div class="input-group">
        <label for="usuario">Id de Gerente de Mantenimiento</label>
        <input type="text" id="usuario" name="usuario">
           
        <label for="descripcion">Solución</label>
        <input type="text" id="descripcion" name="descripcion">
        
        <label for="estatus">Estatus</label>
        <select name="estatusM" id="estatus">
        <option value="estatus0">Selecciona una opción</option>
        <option value="estatus1">En programación</option>
        <option value="estatus2">Programación terminada</option>
        </select>
        
        <br><br>
      
        <button type="submit">Enviar</button>
        </div>
     
    </form>
    </body>
</html>
