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

    <%session = request.getSession();
              String nivel = session.getAttribute("lvl").toString();
              String usuario = session.getAttribute("usuario").toString();
    if(nivel.equals("6") || nivel.equals("7") || nivel.equals("4")){%>
    
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ingeniero de Mantenimiento</title>
  <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
</head>

<body>

    <h1>Ingeniero de Soporte </h1>
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
        String query = "select * from reporte where id_estatus = 2";
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
                <a href="Gerente_Mantenimiento_Editar.jsp?id_reporte=<%=rs.getString(1)%>">
                <button class="image-button"><img src="../imagenes/botonmodif.png" alt="Modificar"/></button>
                </a>
            </th>
        <tr>
  
            <%
                }
                rs.close();
            %>    
    </table>
    
        <br><br>
    
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