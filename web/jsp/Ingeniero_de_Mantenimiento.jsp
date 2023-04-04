<%-- 
    Document   : Ingeniero de Mantenimiento
    Created on : 2 abr 2023, 19:52:18
    Author     : marco
--%>

<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="Clases.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ingeniero de Mantenimiento</title>
  <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <h1>Ingeniero de Mantenimiento </h1>

    <h1>Lista de Reportes</h1>
    
        <table>
        <tr>
          <th>Folio del reporte</th>
          <th>Usuario solicitante</th>
          <th>Usuario que manipula el reporte</th>
          <th>Usuario asignado a la tarea</th>
          <th>Estatus</th>
          <th>Descripción</th>
          <th>Solución</th>
          <th>Fecha y hora</th>
          <th>Editar</th>
        </tr>
    
    <%
        Conexion sql = new Conexion();
        String query = "select * from reporte where id_estatus = 4";
        ResultSet rs = sql.consultar(query);
        
        while (rs.next()) {
    %>
    
        <tr>
            <th> <%=rs.getInt(1)%> </th>
            <th> <%=rs.getString(2) %> </th>
            <th> <%=rs.getString(3) %> </th>
            <th> <%=rs.getString(4) %> </th>
            <th> <%=rs.getInt(5) %> </th>
            <th> <%=rs.getString(6) %> </th>
            <th> <%=rs.getString(7) %> </th>
            <th> <%=rs.getString(8) %> </th>
            <th>
                <button>Accion 2</button>
            </th>
        <tr>

  
            <%
                }
                rs.close();
            %>            
       
        </table>
        <br><br>
    
    <button class="boton">Consultar</button>
        
</body>
</html>