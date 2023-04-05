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
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h2 align="center">Generar FQA's</h2>
        <%ReportesCerrados rpc= new ReportesCerrados();
        int id_reporte = Integer.parseInt(request.getParameter("id_Reporte"));
        ResultSet rs = rpc.ConsultarReportesCerrados(id_reporte);
        while(rs.next()){%>
        <form method="POST" action="ServletPublicarFAQ" name="FAQS" onsubmit="return validar_FAQ()">
      <div class="input-group">
        <label for="pregunta">Pregunta</label>
        <input type="text"  readonly="readonly" id="usuario" name="PreguntaForm" value="<%=rs.getString(6)%>" onkeypress="return validar_texto(event)">
        <label for="solucion">Solución</label>
        <input type="text" id="descripcion" name="SolucionForm" value="<%=rs.getString(7)%>" readonly="readonly" onkeypress="return validar_texto(event)">
        <button type="submit">Publicar</button>
        </div>
        <%}%>
     <script src="../css/alertify.min.js" type="text/javascript"></script>
    <script>function validar_FAQ(){
            pregunta = document.FAQS.PreguntaForm.value;
            respuesta = document.FAQS.SolucionForm.value;
            console.log(pregunta);
            console.log(respuesta);
            if(pregunta.length==0 || pregunta.length < 15){
                alertify.alert("Error","Ingrese una pregunta con una extension de 15 o más caracteres").set('label','ok');
                return false;
            }else{
                if(respuesta.length==0|| respuesta.length < 15){
                    alertify.alert("Error","Ingrese una respuesta con una extension de 15 o más caracteres").set('label','ok');
                    return false;
                }else{
                    alertify.success("FAQ registrada");
                    return true;
                    }
                }
            }
            function validar_texto(){
                teclas = e.keyCode;
                teclado = String.fromCharCode(teclas);
                if(teclado < 'A' || teclado > 'z' || teclado < 0 || teclado > 9 && teclado !=""){
                    return false;
                }
            }
        </script>
    </form>
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

