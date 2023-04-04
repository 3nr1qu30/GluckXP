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
        <h2 align="center">FAQ's Modificar FQA's</h2>
        <%FAQs faq = new FAQs();
        int id_FAQs = Integer.parseInt(request.getParameter("id_FAQs"));
        ResultSet rs = faq.VisualizarFAQEspecifica(id_FAQs);
        while(rs.next()){%>
        <form method="POST" action="ServletModificarFAQs?id_FAQs=<%=id_FAQs%>">
      <div class="input-group">
        <label for="pregunta">Pregunta</label>
        <input type="text" id="usuario" name="PreguntaForm" value="<%=rs.getString(2)%>">
        <label for="solucion">Solución</label>
        <input type="text" id="descripcion" name="SolucionForm" value="<%=rs.getString(3)%>">
        <button type="submit">Modificar</button>
        </div>
        <%}%>
     
    </form>
    </body>
</html>
