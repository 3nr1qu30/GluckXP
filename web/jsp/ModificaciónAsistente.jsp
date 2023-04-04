<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="Clases.Conexion"%>
<%@page import="Clases.EdicionAsist"%>
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

   <%   
       int id_folio = Integer.parseInt(request.getParameter("id_folio"));
       Conexion sql = new Conexion();
       String Query = "select * from reporte where id_reporte =  " +id_folio+ "";
       ResultSet rs = sql.consultar(Query);
       EdicionAsist ea = new EdicionAsist();
        int id_reporte = Integer.parseInt(request.getParameter("id_report"));
        ea.ModAsist(reporte, estatus, id_destinatario, id_gerentesoporte, id_asistente, descripcion, fechahora);
       while(rs.next()){
   %>
   

   
      <%
        }
      %>
     
    </table>
       </form>
    </body>
</html>