<%@page import="java.util.List"%>
<%@page import="model.Asistente"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Lista de reportes</title>
  </head>
  <body>
    <h1>Lista de reportes</h1>
    <% 
      List<Asistente> reportes = (List<Asistente>) request.getAttribute("reportes");
      if(reportes.isEmpty()) { %>
        <p>No hay reportes.</p>
      <% } else { %>
        <table>
          <tr>
            <th>ID</th>
            <th>Usuario solicitante</th>
            <th>Usuario que manipula el reporte</th>
            <th>Usuario asignado a la tarea</th>
            <th>Estatus</th>
            <th>Descripción</th>
            <th>Solución</th>
            <th>Fecha y hora</th>
          </tr>
          <% for (Asistente reporte : reportes) { %>
            <tr>
              <td><%= reporte.getId_reporte() %></td>
              <td><%= reporte.getId_usuario_solicitante() %></td>
              <td><%= reporte.getId_usuario_manipula_reporte() %></td>
              <td><%= reporte.getId_usuario_asignado_tarea() %></td>
              <td><%= reporte.getId_estatus() %></td>
              <td><%= reporte.getDescripcion_reporte() %></td>
              <td><%= reporte.getSolucion_reporte() %></td>
              <td><%= reporte.getFecha_hora_reporte() %></td>
            </tr>
          <% } %>
        </table>
      <% } %>
  </body>
</html>