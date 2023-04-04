<%@page import="Clases.ReportesCerrados"%>
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
        <h2 align="center">Generar FQA's</h2>
        <%ReportesCerrados rpc= new ReportesCerrados();
        int id_reporte = Integer.parseInt(request.getParameter("id_Reporte"));
        ResultSet rs = rpc.ConsultarReportesCerrados(id_reporte);
        while(rs.next()){%>
        <form method="POST" action="ServletPublicarFAQ">
      <div class="input-group">
        <label for="pregunta">Pregunta</label>
        <input type="text" id="usuario" name="PreguntaForm" value="<%=rs.getString(6)%>">
        <label for="solucion">Solución</label>
        <input type="text" id="descripcion" name="SolucionForm" value="<%=rs.getString(7)%>">
        <button type="submit">Publicar</button>
        </div>
        <%}%>
     
    </form>
    </body>
</html>
