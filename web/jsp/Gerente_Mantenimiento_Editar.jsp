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
        <title>JSP Page</title>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2 align="center">Editar Reporte</h2>
        <%
            String id_reporte = request.getParameter("id_reporte");
            
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection ("jdbc:mysql://25.4.71.201:3306/GluckyXp?useSSL=false&serverTimezone=America/Mexico_City","Escuela","Sardipondi69.");
                    sta = cnx.createStatement();
                    rs = sta.executeQuery("select * from reporte where id_reporte='"+id_reporte+"'");
                    
                    while (rs.next()){
        %>
        <form action="">
            <table border="1" width="250" align="center" class="tablasinnada">
                <tr>
                    <td>Id reporte: </td>
                    <td><input type="text" name="idreporte" value="<%=rs.getString(1)%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Id de usuario solicitante: </td>
                    <td><input type="text" name="idusuariosoli" value="<%=rs.getString(2)%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Id de usuario manipulante: </td>
                    <td><input type="text" name="idusuariomani" value="SAVG050624HDFNSNA2" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Id de estatus: </td>
                    <td>
                        <select name="idestatus" id="idestatus" onchange="mostrarOpciones()">
                        <option value="6">Mantenimiento finalizado</option>
                        <option value="4">En programación</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Id de usuario asigando: </td>
                    <td>
                        <select name="idusuarioasig" id="idusuarioasig" onchange="mostrarEstatus()">
                            <option value="NEGR080905HDFGNBA7">NEGR080905HDFGNBA7</option>
                            <option value="NIBM050825HDFVRRA1">NIBM050825HDFVRRA1</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Descripción del reporte: </td>
                    <td><input type="text" name="descripcionrep" value="<%=rs.getString(6)%>" readonly="readonly" ></td>
                </tr>
                <tr>
                    <td>Solución del reporte: </td>
                    <td><input type="text" name="solucionrep" value="<%=rs.getString(7)%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Fecha de envío: </td>
                    <td><%
                            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                            String fechaHoraReporte = dtf.format(LocalDateTime.now());
                        %>
                        <input type="text" name="fecha" value="<%=fechaHoraReporte%>" readonly="readonly">
                    </td>
                </tr>
                    <th colspan="2" align="center" class="nose">
                        <input type="submit" name="btnGrabar" value="Enviar Reporte" class="boton" >
                    </th>
            </table>
        </form>
                    <table class="tablasinnada">
                    <tr align="center">
                        <th colspan="2" align="center" class="">
                            <a href="Gerente_de_Mantenimiento.jsp"><input type="submit" name="btnSalir" value="Volver a Reportes" class="boton izquierda" align="center"></a>
                            <br>
                            <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
                    </th>
                    </tr>
                    </table>
                <%
                    }
                } catch (Exception e){
                }

if (request.getParameter("btnGrabar") != null){
    int idreporte = Integer.parseInt(request.getParameter("idreporte"));
    String idusuariosoli = request.getParameter("idusuariosoli");
    String idusuariomani = request.getParameter("idusuariomani");
    String idusuarioasig = request.getParameter("idusuarioasig");
    int idestatus = Integer.parseInt(request.getParameter("idestatus"));
    String descripcionrep = request.getParameter("descripcionrep");
    String solucionrep = request.getParameter("solucionrep");
    String fecha = request.getParameter("fecha");



    sta.executeUpdate("update reporte set id_usuario_solicitante='"+idusuariosoli+"', id_usuario_manipula_reporte='"+idusuariomani+"', id_usuario_asignado_tarea='"+idusuarioasig+"', id_estatus='"+idestatus+"', descripcion_reporte='"+descripcionrep+"', solucion_reporte='"+solucionrep+"', fecha_hora_reporte='"+fecha+"' where id_reporte='"+idreporte+"'");

    request.getRequestDispatcher("Gerente_de_Mantenimiento.jsp").forward(request, response);
}
                %>
    </body>
    
<script>
function mostrarOpciones() {
    var selectEstatus = document.getElementById("idestatus");
    var selectUsuario = document.getElementById("idusuarioasig");
    var valorEstatus = selectEstatus.value;

    selectUsuario.innerHTML = "";

    if (valorEstatus === "6") {
        var option1 = document.createElement("option");
        option1.value = "NEGR080905HDFGNBA7";
        option1.text = "NEGR080905HDFGNBA7";
        selectUsuario.add(option1);

    } else if (valorEstatus === "4") {
        var option1 = document.createElement("option");
        option1.value = "NIBM050825HDFVRRA1";
        option1.text = "NIBM050825HDFVRRA1";
        selectUsuario.add(option1);

    }
}

function mostrarEstatus() {
    var selectEstatus = document.getElementById("idestatus");
    var selectUsuario = document.getElementById("idusuarioasig");
    var valorUsuario = selectUsuario.value;

    if (valorUsuario === "NEGR080905HDFGNBA7") {
        selectEstatus.value = "6";
    } else if (valorUsuario === "NIBM050825HDFVRRA1") {
        selectEstatus.value = "4";
    }
}
</script>

</html>