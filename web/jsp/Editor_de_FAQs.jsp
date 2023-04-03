<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="PublicarFAQ.jsp"><button>Publicar FAQ</button><a/>
        <a href="VisualizarFAQ.jsp"><button>Visualizar FAQ</button><a/>
        <a href="PublicarFAQ.jsp"><button>Modificar FAQ</button><a/>
        <a href="PublicarFAQ.jsp"><button>Eliminar FAQ</button><a/>
        <a href="PublicarFAQ.jsp"><button>Visualizar Reportes Cerrados</button><a/>
        <%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();
          out.println(nivel);
          out.println(usuario);%>
    </body>
</html>
