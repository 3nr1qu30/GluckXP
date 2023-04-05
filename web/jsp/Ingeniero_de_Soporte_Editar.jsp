<%-- 
    Document   : Ingeniero Mantenimiento Editar
    Created on : Apr 3, 2023, 9:58:45 PM
    Author     : Marco
--%>
    <%session = request.getSession();
              String nivel = session.getAttribute("lvl").toString();
              String usuario = session.getAttribute("usuario").toString();%>
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
        
        
<script>
function validarFormulario() {
    var solucion = document.getElementById("descripcionrep")[0].value;
    var caracteresEspeciales = /[!@#$%^&*()_+-=[]{};':"\|,.<>/?]/g; 

    if (solucion.value.length > 50) {
        alert("La descripción debe tener 50");
        return false;
    }
    if (caracteresEspeciales.test(solucion)) {
        alert("La descripción no puede contener caracteres especiales.");
        return false;
    }
    return true;
    
}
</script>

<form action="" onsubmit="return validarFormulario();">        
        <form action="">
            <table border="1" width="250" align="center" class="tablasinnada">
                <tr>
                    <td>Folio del reporte</td>
                    <td><input type="text" name="idreporte" value="<%=rs.getString(1)%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Usuario solicitante</td>
                    <td><input type="text" name="solicitante" value="<%=rs.getString(2)%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Usuario manipulante</td>
                    <td><input type="text" name="manipulante" value="<%=usuario%>"readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Estatus</td>
                    <td>
                        <select name="idestatus" id="idestatus" onchange="mostrarOpciones()">
                        <option value="8">Cerrado</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Descripción</td>
                    <td><input type="text" name="descripcionrep" value="<%=rs.getString(6)%>" readonly="readonly" ></td>
                </tr>
                <tr>
                    <td>Solución</td>
                    <td><input type="text" name="solucionrep" value="<%=rs.getString(7)%>"></td>
                </tr>
                <tr>
                    <td>Fecha y hora</td>
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
                    <div class="clasesita">
                    <tr align="center">
                        <th colspan="2" align="center" class="">
                            <a href="Ingeniero_de_Soporte.jsp"><input type="submit" name="btnSalir" value="Volver" class="boton izquierda" align="center"></a>
                            <br>
                            <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
                    </th>
                    </tr>
                    </div>
                <%
                    }
                } catch (Exception e){
                }

if (request.getParameter("btnGrabar") != null){
    int idreporte = Integer.parseInt(request.getParameter("idreporte"));
    String idusuariosoli = request.getParameter("solicitante");
    String idusuariomani = request.getParameter("manipulante");
    int idestatus = Integer.parseInt(request.getParameter("idestatus"));
    String descripcionrep = request.getParameter("descripcionrep");
    String solucionrep = request.getParameter("solucionrep");
    String fecha = request.getParameter("fecha");



    sta.executeUpdate("update reporte set id_usuario_solicitante='"+idusuariosoli+"', id_usuario_manipula_reporte='"+idusuariomani+"', id_estatus='"+idestatus+"', descripcion_reporte='"+descripcionrep+"', solucion_reporte='"+solucionrep+"', fecha_hora_reporte='"+fecha+"' where id_reporte='"+idreporte+"'");

    request.getRequestDispatcher("Ingeniero_de_Soporte.jsp").forward(request, response);
}
                %>
    </body>
    
<script>
   var solucionAnt = document.getElementById("solucionrep")[0].value;
           
function mostrarOpciones() {
    var selectEstatus = document.getElementById("idestatus");
    var selectUsuario = document.getElementById("idusuarioasig");
    var valorEstatus = selectEstatus.value;

    selectUsuario.innerHTML = "";

    if (valorEstatus === "8") {
        var option1 = document.createElement("option");
        option1.value = "SAVG050624HDFNSNA2";
        option1.text = "SAVG050624HDFNSNA2";
        selectUsuario.add(option1);
}
        
function actualizarForm() {
  var solucionN = document.getElementById("solucionN");
  solucionN.value = solucionAnt;
   }
}
</script>

</html>