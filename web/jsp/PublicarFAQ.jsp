<%-- 
    Document   : PublicarFAQ
    Created on : 2 abr 2023, 23:39:31
    Author     : urien
    String usuario = session.getAttribute('usuario').toString();
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();
          out.println(nivel);
          out.println(usuario);%>
    </body>
</html>
