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
            <a href="PublicarFAQ.jsp"><button class="boton">FAQ's</button><a/>
            <a href="PublicarFAQsReporte.jsp"><button class="boton">FAQ's con Reportes Cerrados</button><a/>
                <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
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
        <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
    </body>
</html>
<%}%>
