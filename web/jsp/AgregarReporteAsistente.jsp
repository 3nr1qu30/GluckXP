<%-- 
    Document   : AgregarReporteAsistente
    Created on : 4 abr 2023, 3:33:30
    Author     : Isaac
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Clases.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="" onsubmit="return validarFormulario();">
            <label for="IdUsuario">Id de usuario</label>
            <input type="text" id="IdUsuario" name="IdUsuario">
            <label for="GerenteSop">Id de gerente</label>
            <select name="GerenteSop">
                <option value="NEGR080905HDFGNBA7">NEGR080905HDFGNBA7</option>
            </select>
            <label for="Desc">Descripción</label>
            <input type="text" id="Desc" name="Desc">
            <input type="submit" value="Submit" name="btnG">
        </form>
         <%
             
             if(request.getParameter("btnG")!=null){
         String id_usuario_solicitante = request.getParameter("IdUsuario");
         String usuario_manipula_reporte = "MORI050816HDFNDSA3";
         String GerenteSop = request.getParameter("GerenteSop");
         int id_estatus =1;
         String descripcion_reporte = request.getParameter("Desc");
         String solucion_reporte = "Sin solución";
         
         DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
         String fechaHoraReporte = dtf.format(LocalDateTime.now());
         
         
         Conexion sql1 = new Conexion();
         String query="insert into reporte values(default,'"+id_usuario_solicitante+"','"+usuario_manipula_reporte+"','"+GerenteSop+"','"+id_estatus+"','"+descripcion_reporte+"','"+solucion_reporte+"','"+fechaHoraReporte+"')";
         sql1.ejecutar(query);
         request.getRequestDispatcher("Asistente.jsp").forward(request, response) ;
             }
         
         %>
        
    </body>
    <script>
function validarFormulario() {
    var idUsuario = document.getElementById("IdUsuario").value;
    var descripcion = document.getElementById("Desc").value;
    if (idUsuario.length < 18 || idUsuario.length > 18) {
        alert("El Id de usuario debe tener exactamente 18 caracteres.");
        return false;
    }
    if (descripcion.length < 50 || descripcion.length > 500) {
        alert("La descripción debe tener entre 50 y 500 caracteres.");
        return false;
    }
    return true;
}
</script>
</html>
