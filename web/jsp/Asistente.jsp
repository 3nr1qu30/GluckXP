<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Clases.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Agregar reporte</title>
        <link href="../css/estiloAsistente.css" rel="stylesheet" type="text/css"/>y

    </head>
    <body>

        <h1>Asistente</h1>

        <div class="table-container">
            <h2 align="center">Reportes creados</h2>
            <table class="reportes-table">
                <tr bgcolor="skyblue">
                    <th colspan="9">Reportes de Asistente</th>
                </tr>
                <tr bgcolor="skyblue">
                    <th>id_reporte</th>
                    <th>id_usuario_solicitante</th>
                    <th>id_usuario_manipula_reporte</th>
                    <th>id_usuario_asignado_tarea</th>
                    <th>id_estatus</th>
                    <th>descripcion_reporte</th>
                    <th>solucion_reporte</th>
                    <th>fecha_hora_reporte</th>
                </tr>
                <%  
                    Conexion sql = new Conexion();
                    String query = "select * from reporte where id_estatus = 1";
                    ResultSet rs = sql.consultar(query);
                    while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(8)%></td>
                </tr>
                <% }
                    rs.close();
                %>
            </table>
        </div>
            
                <a href="AgregarReporteAsistente.jsp">Agregar Reporte</a> 
    </body>
</html>
