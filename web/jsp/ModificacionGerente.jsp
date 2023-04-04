<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="Clases.Conexion"%>
<%@ page import="java.sql.*" %>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

     <%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();     
        %>
          
  <%
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String fechaHoraReporte = dtf.format(LocalDateTime.now());
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerente de Soporte</title>
    </head>
     <body>   

    
    
    <p align=center>Reportes enviados por Gerente de Mantenimiento</p>
    <form action="../jsp/Gerente_de_Soporte.jsp" method="post" name="altas">
    <table border=1 align=center>
    <tr align=center bgcolor=#FFFFCC>
    <td>Id asistente</td>
    <td>Id Ingeniero de Soporte</td>
    <td>Id Gerente de Soporte</td>
    <td>Folio Reporte</td>
    <td>Descripción</td>
    <td>Solución</td>
    <td>Fecha y Hora</td>
    <td>Status</td>
    </tr>
       <%
       int id_folio = Integer.parseInt(request.getParameter("id_folio"));    
       Conexion Sql = new Conexion();
        String Query = "select * from reporte where id_reporte =  " +id_folio+ "";
       ResultSet rs2 = Sql.consultar(Query);
       while(rs2.next()){
   %>
     <tr> 
     <td><%=rs2.getString(2)%></td>
     <td><%=rs2.getString(4)%></td>
     <td><%out.println(usuario);%></td>
     <td><%=rs2.getInt(1)%></td>
     <td><%=rs2.getString(6)%></td>
     <td><%=rs2.getString(7)%></td>
     <td><%out.println(fechaHoraReporte);%></td>
     <td><%=rs2.getInt(5)%></td>
     <td><input type="submit" value="Enviar" name="enviar"></td>
    </tr>
     <%
        }
      %>
    
    </table>   
      </form>
    </body>
</html>