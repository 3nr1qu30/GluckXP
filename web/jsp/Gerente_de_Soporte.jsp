<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="Clases.Conexion"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerente de Soporte</title>
    </head>
     <body>   
      <p align=center>Reportes enviados por asistente</p>
<table border=1 align=center>
    <tr align=center bgcolor=#FFFFCC>
        <tr>
          <th>Folio Reporte</th>
          <th>Id Gerente de Soporte</th>
          <th>Id Usuario</th>
          <th>Descripcion</th>
          <th>estatus</th>
          <th>Fecha y Hora</th>
         
        </tr>
       
   <%
       Conexion sql = new Conexion();
       String query = "select * from reporte where id_estatus = 1";
       ResultSet rs = sql.consultar(query);
       while(rs.next()){
   %>
   <tbody>
        <tr>
          <td><%=rs.getString(1)%></td>
          <td><%=rs.getString(3)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(6)%></td>
          <td><%=rs.getInt(5)%></td>
          <td><%=rs.getString(8)%></td>
          <td><a href="ModificaciónAsistente.jsp?id_folio=<%=rs.getString(1)%>"><button>Modificar</button></a></td>
      </tbody>
    
      <%
        }
      %>
     
    </table>
      
    <br>
    <p align=center>Reportes enviados por Gerente de Soporte</p>
    <table border=1 align=center>
    <tr align=center bgcolor=#FFFFCC>
        <tr>
          <td>Id Usuario</td>
    <td>Id Gerente de Mantenimiento</td>
    <td>Id Gerente de Soporte</td>
    <td>Folio reporte</td>
    <td>Descripción</td>
    <td>Solución</td>
    <td>Fecha y Hora</td>
          <th>Estatus</th>
        </tr>
 
    
       <%
       Conexion Sql = new Conexion();
       String Query = "select * from reporte where id_estatus = 6";
       ResultSet rs2 = Sql.consultar(Query);
       while(rs2.next()){
   %>
 
     <tbody>
        <tr>
          <td><%=rs2.getString(2)%></td>
     <td><%=rs2.getString(4)%></td>
     <td><%=rs2.getString(3)%></td>
     <td><%=rs2.getInt(1)%></td>
     <td><%=rs2.getString(6)%></td>
     <td><%=rs2.getString(7)%></td>
     <td><%=rs2.getString(8)%></td>
     <td><%=rs2.getInt(5)%></td>
          <td><a href="ModificacionGerente.jsp?id_folio=<%=rs2.getString(1)%>"><button>Modificar</button></a></td>
      </tbody>
    
     <%
        }
      %>
    
    </table>
    
    </body>
</html>
