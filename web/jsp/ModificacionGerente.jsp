<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="Clases.Conexion"%>
<%@ page import="java.sql.*" %>
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

    
    
    <p align=center>Modificar reporte enviado por Gerente de Mantenimiento</p>
  
       <%
       int id_folio = Integer.parseInt(request.getParameter("id_folio"));    
       Conexion Sql = new Conexion();
        String Query = "select * from reporte where id_reporte =  " +id_folio+ "";
       ResultSet rs2 = Sql.consultar(Query);
       while(rs2.next()){
   %>
    <form method="POST" action="FormCambioGerente?id_reporte=<%=id_folio%>">
    <div class="input-group">
        <label>Id usuario</label>
     <input type="text" name="asistente" id="destinos" value="<%=rs2.getString(2)%>" readonly="readonly">
     <label>Id Ingeniero de Soporte</label>
     <select name='ingenierosoporte' id='destinos'>
         <option selected> Elige el Id </option>
          <option value="4">4</option>
     </select>
     <br>
         <br> 
     <label>Id Gerente de Soporte</label>
     <input type="text" name="gerentesoporte" id="destinos" value="<%out.println(usuario);%>" readonly="readonly">
     <label>Folio Reporte</label>
     <input type="text" name="folioreporte" id="destinos" value="<%=rs2.getInt(1)%>" readonly="readonly">
     <label>Descripción</label>
     <input type="text" name="descripcion" id="destinos" value="<%=rs2.getString(6)%>" readonly="readonly">
     <label>Solución</label>
     <input type="text" name="solucion" id="destinos" value="<%=rs2.getString(7)%>" readonly="readonly">
     <label>Fecha</label>
     <input type="text" name="fecha" id="destinos" value="<%out.println(fechaHoraReporte);%>" readonly="readonly">
     <label>Estatus</label>
     <select name='status' id='status' ><option value='' selected> Nuevo estatus </option>
     <option value="2">En proceso</option>
     </select>
     <br>
         <br> 
     <button type="submit">Enviar</button>
   <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
     
      </div>
     <%}%>
    
     
      </form>
    
    </body>
</html>