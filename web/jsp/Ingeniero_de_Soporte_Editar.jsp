<%-- 
    Document   : Ingeniero Mantenimiento Editar
    Created on : Apr 3, 2023, 9:58:45 PM
    Author     : Marco
--%>

<%session = request.getSession();
    String nivel = session.getAttribute("lvl").toString();
    String usuario = session.getAttribute("usuario").toString();
%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Ingeniero de Soporte</title>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
    </head>
    <body onload="actualizarForm()">


        <%
            String id_reporte = request.getParameter("id_reporte");

            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://25.4.71.201:3306/GluckyXp?useSSL=false&serverTimezone=America/Mexico_City", "Escuela", "Sardipondi69.");
                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from reporte where id_reporte='" + id_reporte + "'");

                while (rs.next()) {
        %>
        <div class="container pap">
            <h2 align="center">Editar Reporte</h2>
            <br>
            <a href="Ingeniero_de_Soporte.jsp" class="boton rojo mi-enlace">Regresar</a>
            <br><br>
            <div class="nota">
                Solo podrás enviar los reportes a...
            </div>
            <br>
            <form>        

                <b>Folio del reporte</b>
                <input type="text" name="idreporte" value="<%=rs.getString(1)%>" readonly="readonly" class="buenisimo">

                <b>Usuario solicitante</b>
                <input type="text" name="solicitante" value="<%=rs.getString(2)%>" readonly="readonly">

                <b>Usuario manipulante</b>
                <input type="text" name="manipulante" value="<%=usuario%>"readonly="readonly">

                <b>Estatus</b>
                <select name="idestatus" id="idestatus">
                    <option value="8">Cerrado</option>
                </select>

                <b>Descripción</b>
                <input type="text" name="descripcionrep" value="<%=rs.getString(6)%>" readonly="readonly" >

                <b>Solución</b>
                <input type="text" name="solucionrep" value="<%=rs.getString(7)%>" maxlength = "15" onkeypress="return SoloLetras(event);" required>


                <b>Fecha y hora</b>
                <%
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    String fechaHoraReporte = dtf.format(LocalDateTime.now());
                %>
                <input type="text" name="fecha" value="<%=fechaHoraReporte%>" readonly="readonly">

                <input type="submit" name="btnGrabar" value="Enviar Reporte" class="boton" >
                </table>
            </form>
        </div>


        <br>
        <%
                }
            } catch (Exception e) {
            }

            if (request.getParameter("btnGrabar") != null) {
                int idreporte = Integer.parseInt(request.getParameter("idreporte"));
                String idusuariosoli = request.getParameter("solicitante");
                String idusuariomani = request.getParameter("manipulante");
                int idestatus = Integer.parseInt(request.getParameter("idestatus"));
                String descripcionrep = request.getParameter("descripcionrep");
                String solucionrep = request.getParameter("solucionrep");
                String fecha = request.getParameter("fecha");

                sta.executeUpdate("update reporte set id_usuario_solicitante='" + idusuariosoli + "', id_usuario_manipula_reporte='" + idusuariomani + "', id_estatus='" + idestatus + "', descripcion_reporte='" + descripcionrep + "', solucion_reporte='" + solucionrep + "', fecha_hora_reporte='" + fecha + "' where id_reporte='" + idreporte + "'");
                request.getRequestDispatcher("Ingeniero_de_Soporte.jsp").forward(request, response);
            }
        %>

    </body>

    <script>
        var solucionAnt = document.getElementById("solucionrep")[0].value;

        function actualizarForm() {
            var solucionN = document.getElementById("solucionN");
            if (solucionAnt === " " || solucionAnt === "null") {
                solucionN.value = solucionAnt;
            } else {
                solucionAnt.disabled = true;
            }
        }
    </script>

<script>
    function SoloLetras(e)
    {
        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toString();
        letras = " ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnopqrstuvwxyzáéíóú";

        especiales = [8, 13];
        tecla_especial = false
        for (var i in especiales) {
            if (key == especiales[i]) {
                tecla_especial = true;
                break;
            }
        }

        if (letras.indexOf(tecla) == -1 && !tecla_especial)
        {
            alert("Ingresar solo letras");
            return false;
        }
    }
</script>
</html>
