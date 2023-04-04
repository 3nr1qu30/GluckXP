<%@page import="java.sql.*"%>
<%@page import="Clases.FAQs"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <h2 align="center">FAQ's publicadas</h2>
        <table>
      <thead>
        <tr>
          <th>Folio FAQ's</th>
          <th>Pregunta</th>
          <th>Respuesta</th>
          <th>id editor</th>
          <th>fecha y hora de publicación</th>
        </tr>
        <%FAQs faq = new FAQs();
        int id_FAQs = Integer.parseInt(request.getParameter("id_FAQs"));
        ResultSet rs = faq.VisualizarFAQEspecifica(id_FAQs);
        while(rs.next()){%>
      </thead>
      <tbody>
        <tr>
          <td><%=rs.getInt(1)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><%=rs.getString(4)%></td>
          <td><%=rs.getString(5)%></td>
      </tbody>
      <%}%>
    </table> 
    </div>
    </body>
</html>
