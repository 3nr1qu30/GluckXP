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
        <link rel="stylesheet" href="../css/tablas_forms.css">
        <link href="../css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <title>Publicar FAQ's</title>
    </head>
    <body>
        <h1 align="center">Publicar FAQ's <%=usuario%></h1>
     <form method="POST" action="ServletPublicarFAQ">
      <div class="input-group">
        <label for="pregunta">Pregunta</label>
        <input type="text" id="usuario" name="PreguntaForm">
      
     
        <label for="solucion">Solución</label>
        <input type="text" id="descripcion" name="SolucionForm">
        <button type="submit">Publicar</button>
        </div>
     
    </form>
        <br><!-- comment -->
        <br>
        <div class="container">
        <h2 align="center">FAQ's publicadas</h2>
        <table>
      <thead>
        <tr>
          <th>Folio FAQ's</th>
          <th>Pregunta</th>
          <th>Respuesta</th>
          <th>Visualizar</th>
          <th>Modificar</th>
          <th>Eliminar</th>
        </tr>
        <%FAQs faq = new FAQs();
        ResultSet rs = faq.VisualizarFAQ();
        while(rs.next()){%>
      </thead>
      <tbody>
        <tr>
          <td><%=rs.getString(1)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><a href="VisualizarFAQ.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Visualizar</button></a></td>
          <td><a href="ModificarFAQ.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Modificar</button></a></td>
          <td><a href="EliminarFAQs.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Eliminar</button><a/></td>
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