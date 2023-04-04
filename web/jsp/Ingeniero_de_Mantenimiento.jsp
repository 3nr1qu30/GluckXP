<%-- 
    Document   : Ingeniero de Mantenimiento
    Created on : 2 abr 2023, 19:52:18
    Author     : marco
--%>

<%@page import="Clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ingeniero de Mantenimiento</title>
  <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <h1>Ingeniero de Mantenimiento </h1>

    <%
        Conexion sql = new Conexion();
        String query = "select * where from reporte = 3";
        
    %>
    
    <h1>Lista de Reportes</h1>

    <table>
      <thead>
        <tr>
          <th>Folio del reporte</th>
          <th>Usuario solicitante</th>
          <th>Usuario que manipula el reporte</th>
          <th>Usuario asignado a la tarea</th>
          <th>Estatus</th>
          <th>Descripción</th>
          <th>Solución</th>
          <th>Fecha y hora</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>55</td>
          <td>Descripción</td>
          <td>a</td>
          <td>a</td>
          <td>a</td>
          <td>a</td>
          <td>a</td>
          <td><button>Accion 2</button></td>
      </tbody>
    </table>
  
    <br><br>
    
    <button class="boton">Consultar</button>
        
</body>
</html>