<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="Clases.Conexion"%>
<%@page import="Clases.EdicionAsist"%>
<%@page import="java.sql.*" %>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();                 
        %>
          
  <%
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String fechaHoraReporte = dtf.format(LocalDateTime.now());
%>
                 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <title>Gerente de Soporte</title>
    </head>
     <body>   
      <p align=center>Reportes enviados por asistente</p>
          
   <%   
       int id_folio = Integer.parseInt(request.getParameter("id_folio"));
       Conexion sql = new Conexion();
       String Query = "select * from reporte where id_reporte =  " +id_folio+ "";
       ResultSet rs = sql.consultar(Query);
       while(rs.next()){
   %>
   
     <form method="POST" action="FormUsuarioUnico?id_reporte=<%=id_folio%>">
     <div class="input-group">
         <label>Folio del Reporte</label>
     <input type="text" name="idreporte" id="id_reporte" value="<%=rs.getInt(1)%>" readonly="readonly">             
         <label>Elige al destinatario</label>
     <select name='destinatario' id='destino' ><option value='' selected> Elige a quien enviar </option>
     <option value="SAVG050624HDFNSNA2">Gerente de Mantenimiento</option>
     <option value="NIBM050825HDFVRRA1">Ingeniero de Soporte</option>
     </select>
         <br>
         <br>
         <label>Id de destinatario</label>
     <input type="text" name="iddestinos" id="destinos">
         <label>Id Gerente de Soporte</label>
     <input type="text" name="idgerentesoporte" id="gerentesoporte" value="<%out.println(usuario);%>" readonly="readonly">
         <label>Id usuario</label>
     <input type="text" name="idusuario" id="usuario" value="<%=rs.getString(2)%>" readonly="readonly">
         <label>Descripción</label>
     <input type="text" name="descripcion" id="desc" value="<%=rs.getString(6)%>" readonly="readonly">
         <label>Estatus</label>
     <select name='estatus' id='estatus' ><option value='' selected> Nuevo estatus </option>
     <option value="2">En proceso</option>
     <option value="3">En mantenimiento</option>
     </select>
         <br>
         <br>         
         <label>Fecha</label>
     <input type="text" name="fecha" id="fecha" value="<%out.println(fechaHoraReporte);%>" readonly="readonly">
     <button type="submit">Enviar</button>
     <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
    </div>
   
   <%
    }
   %>
      
       </form>
    </body>
</html>