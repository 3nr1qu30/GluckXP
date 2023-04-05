<%@page import="Clases.ReportesCerrados"%>
<%@page import="java.sql.*"%>
<%@page import="Clases.FAQs"%>
<%@page import="java.sql.ResultSet"%>
<%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();
if(nivel.equals("8") || nivel.equals("4")){%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/forms_edit.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <h2 align="center">Reportes cerrados</h2>
        <table>
      <thead>
        <tr>
          <th>Folio reporte</th>
          <th>Descripción</th>
          <th>Solución</th>
          <th>Generar FAQ</th>
        </tr>
        <%ReportesCerrados rpc = new ReportesCerrados();
        ResultSet rs = rpc.ConsultarReportesCerrados();
        while(rs.next()){%>
      </thead>
      <tbody>
        <tr>
          <td><%=rs.getString(1)%></td>
          <td><%=rs.getString(6)%></td>
          <td><%=rs.getString(7)%></td>
          <td><a href="FAQReporte.jsp?id_Reporte=<%=rs.getString(1)%>"><button>Generar FAQ</button></a></td>
      </tbody>
      <%}%>
    </table> 
        </div>
    </body>
</html>
<%} else{%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        No tienes permiso de acceder a esta pagina
        <script src="../css/alertify.min.js" type="text/javascript"></script>
        <script>function validar_pregunta(){
            
        }</script>
    </body>
</html>

<%}%>
