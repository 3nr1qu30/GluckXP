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
        <title>Editor de FAQ's</title>
    </head>
    <body>
        <a href="PublicarFAQ.jsp"><button class="boton">Publicar FAQ</button><a/>
        <a href="VisualizarFAQ.jsp"><button class="boton">Visualizar FAQ</button><a/>
        <a href="PublicarFAQ.jsp"><button class="boton">Modificar FAQ</button><a/>
        <a href="PublicarFAQ.jsp"><button class="boton">Eliminar FAQ</button><a/>
            <a href="PublicarFAQ.jsp"><button class="boton">Visualizar Reportes Cerrados</button><a/>
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
    </body>
</html>
<%}%>
