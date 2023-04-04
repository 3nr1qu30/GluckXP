<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="Clases.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 align="center">Gerente de mantenimiento</h1>
        
        <h2 align="center">Reportes enviados por el Gerente de Soporte</h2>
        
        <table border="1" width="600" align="center">
            <tr bgcolor="skyblue">
                <th colspan="9">Mantenimiento de Usurio</th>
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
                <th>Modificar</th>
            </tr>
            <%
                Conexion sql = new Conexion();
                String query = "select * from reporte where id_estatus = 3";
                ResultSet rs = sql.consultar(query);
                
                while (rs.next()){
            %>
        
            <tr>
                        <th><%=rs.getInt(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th><%=rs.getString(3)%></th>
                        <th><%=rs.getString(4)%></th>
                        <th><%=rs.getInt(5)%></th>
                        <th><%=rs.getString(6)%></th>
                        <th><%=rs.getString(7)%></th>
                        <th><%=rs.getString(8)%></th>
                    <th>
                            <a href="Gerente_Mantenimiento_Editar.jsp?id_reporte=<%=rs.getString(1)%>">
                            <img src="../imagenes/botonmodif.png" width="30" height="30"/>
                            </a>
                    </th>
            </tr>
            
        <%
                }
                rs.close();
        %>
        
        </table>
        
        <h2 align="center">Reportes enviados por el Gerente de Soporte</h2>
        
        <table border="1" width="600" align="center">
            <tr bgcolor="skyblue">
                <th colspan="9">Mantenimiento de Usurio</th>
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
                <th>Modificar</th>
            </tr>
            <%
                Conexion yo = new Conexion();
                query = "select * from reporte where id_estatus = 5";
                rs = sql.consultar(query);
                while (rs.next()){
            %>
        
            <tr>
                        <th><%=rs.getInt(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th><%=rs.getString(3)%></th>
                        <th><%=rs.getString(4)%></th>
                        <th><%=rs.getInt(5)%></th>
                        <th><%=rs.getString(6)%></th>
                        <th><%=rs.getString(7)%></th>
                        <th><%=rs.getString(8)%></th>
                    <th>
                            <a href="editar.jsp?cod=<%=rs.getString(1)%>">
                            <img src="iconos/icon2.png" width="30" height="30"> ||
                            </a>
                            <a href="eliminar.jsp?cod=<%=rs.getString(1)%>">
                            <img src="iconos/icon3.png" width="30" height="30">
                            </a>
                    </th>
            </tr>
            
        <%
                }
                rs.close();
        %>
        </table>
        
        <h2 align="center">Reportes enviados por el Gerente de Soporte</h2>
        
        <table border="1" width="600" align="center">
            <tr bgcolor="skyblue">
                <th colspan="9">Mantenimiento de Usurio</th>
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
                <th>Modificar</th>
            </tr>
            <%
                query = "select * from reporte where id_estatus = 4";
                rs = sql.consultar(query);
                while (rs.next()){
            %>
        
            <tr>
                        <th><%=rs.getInt(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th><%=rs.getString(3)%></th>
                        <th><%=rs.getString(4)%></th>
                        <th><%=rs.getInt(5)%></th>
                        <th><%=rs.getString(6)%></th>
                        <th><%=rs.getString(7)%></th>
                        <th><%=rs.getString(8)%></th>
            </tr>
            
        <%
                }
                rs.close();
        %>
        
          <%
                query = "select * from reporte where id_estatus = 6";
                rs = sql.consultar(query);
                while (rs.next()){
            %>
        
            <tr>
                        <th><%=rs.getInt(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th><%=rs.getString(3)%></th>
                        <th><%=rs.getString(4)%></th>
                        <th><%=rs.getInt(5)%></th>
                        <th><%=rs.getString(6)%></th>
                        <th><%=rs.getString(7)%></th>
                        <th><%=rs.getString(8)%></th>
            </tr>
            
        <%
                }
                rs.close();
        %>
        </table>
        
    </body>
</html>
