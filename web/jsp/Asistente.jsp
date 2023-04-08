<%-- 
Document   : Asistente
Created on : 4 abr 2023, 3:33:30
Author     : Isaac
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Clases.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*" %>

<%session = request.getSession();
    String nivel = session.getAttribute("lvl").toString();
    String usuario = session.getAttribute("usuario").toString();
    if (nivel.equals("4") || nivel.equals("3")) {%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Agregar reporte</title>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <br>
        <div class="container">
            <h1>Asistente</h1>
            <h3 class="grismini">Bienvenido <%out.println(usuario);%></h3>
            <br>
            <a href="AgregarReporteAsistente.jsp" class="boton mi-enlace">Agregar Reporte</a> 
            <br>
            <br>
            <br>
            <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
            <br>
            <br>
            <br>
            <div class="nota">
                Solo podrás crear y observar tus reportes con estado "abierto"
                podrás asignar los reportes a cualquier gerente de soporte existente.
                Asegurate de escribir datos correctamente.
            </div>
            <br>
            <br>
            <table class="reportes-table">
                <tr >
                    <th>Folio de reporte</th>
                    <th>Usuario solicitante</th>
                    <th>Asistente</th>
                    <th>Gerente de soporte</th>
                    <th>Estatus</th>
                    <th>Descripcion de reporte</th>
                    <th>Fecha de enviÂ­o</th>
                </tr>
                <%
                    Conexion sql = new Conexion();
                    String query = "select * from reporte where id_estatus = 1";
                    ResultSet rs = sql.consultar(query);
                    if (rs != null) {
                        while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td>Abierto</td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(8)%></td>
                </tr>
                <% }
                } else {
                %>
                <div class="nota rojo">
                    No hay reportes creados
                </div>
                <%
                    }
                    rs.close();
                %>
            </table>
        </div>
    </body>
</html>
<%} else {%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        No tienes acceso
    </body>
</html>
<%}%>
