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
      <p align=center>Reportes enviados por asistente</p>
      <form action="../jsp/Gerente_de_Soporte.jsp" method="post" name="altas">
       <table  border=1 align=center>
        <tr align=center bgcolor=#FFFFCC>
         <td>Folio Reporte</td>
         <td>Destinatario</td>
         <td>Id Destinatario</td>
         <td>Id Gerente de Soporte</td>
         <td>Id asistente</td>
         <td>Descripción</td>
         <td>estatus</td>
         <td>Fecha y Hora</td>
        </tr>
   <%   
       int id_folio = Integer.parseInt(request.getParameter("id_folio"));
       Conexion sql = new Conexion();
        String Query = "select * from reporte where id_reporte =  " +id_folio+ "";
       ResultSet rs = sql.consultar(Query);
       while(rs.next()){
   %>
   
    <tr> 
     <td><%=rs.getInt(1)%></td>
     <td><select name='destinatario' id='destino' ><option value='' selected> Elige a quien enviar </option>
     <option value="value1">Gerente de Mantenimiento</option>
     <option value="value3">Ingeniero de Soporte</option>
     </td>
     <td><input type="text" name="iddestino" id="destino" value="<%=rs.getString(4)%>"></td>
     <td><%out.println(usuario);%></td>
     <td><%=rs.getString(2)%></td>
     <td><%=rs.getString(6)%></td>
     <td><input type="text" name="iddestino" id="destino" value="<%=rs.getInt(5)%>"></td>
     <td><%out.println(fechaHoraReporte);%></td>
     <td><input type="submit" value="Enviar" name="envia"></td>
    </tr>
   
      <%
        }
      %>
     
    </table>
       </form>
    </body>
</html>