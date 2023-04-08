<%-- 
    Document   : Ingeniero Mantenimiento Editar
    Created on : Apr 3, 2023, 9:58:45 PM
    Author     : Marco
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%session = request.getSession();
              String nivel = session.getAttribute("lvl").toString();
              String usuario = session.getAttribute("usuario").toString();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Ingeniero de Mantenimiento</title>
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
function SoloLetras(e)
{
key = e.keyCode || e.which;
tecla = String.fromCharCode(key).toString();
letras = " ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnopqrstuvwxyzáéíóú";

especiales = [8,13];
tecla_especial = false
for(var i in especiales) {
if(key == especiales[i]){
 tecla_especial = true;
 break;
}
}

if(letras.indexOf(tecla) == -1 && !tecla_especial)
{
 alert("Ingresar solo letras");
 return false;
}
}
</script>

<form>        
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
                    <td><input type="text" name="manipulante" value="<%=usuario%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Estatus</td>
                    <td>
                        <select name="idestatus" id="idestatus" onchange="mostrarOpciones()">
                        <option value="4">En programación</option>
                        <option value="5">Programacion finalizada</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Usuario al que se asigna la tarea
                    <td>
                        <select name="idusuarioasig" id="idusuarioasig" onchange="mostrarEstatus()">
                            <option value="5">5</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Descripción</td>
                    <td><input type="text" name="descripcionrep" value="<%=rs.getString(6)%>" readonly="readonly" ></td>
                </tr>
                <tr>
                    <td>Solución</td>
                    <td><input type="text" name="solucionrep" value="<%=rs.getString(7)%>" maxlength = "15"  readonly="false" onkeypress="return SoloLetras(event);" required></td>
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
                    <br><br><br>
                            <a href="Ingeniero_de_Mantenimiento.jsp"><input type="submit" name="btnSalir" value="Volver" class="boton izquierda"></a>
                            <br><br>
                            <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>

                <%
                    }
                } catch (Exception e){
                }

if (request.getParameter("btnGrabar") != null){
    int idreporte = Integer.parseInt(request.getParameter("idreporte"));
    String idusuariosoli = request.getParameter("solicitante");
    String idusuariomani = request.getParameter("manipulante");
    String idusuarioasig = request.getParameter("idusuarioasig");
    int idestatus = Integer.parseInt(request.getParameter("idestatus"));
    String descripcionrep = request.getParameter("descripcionrep");
    String solucionrep = request.getParameter("solucionrep");
    String fecha = request.getParameter("fecha");



    sta.executeUpdate("update reporte set id_usuario_solicitante='"+idusuariosoli+"', id_usuario_manipula_reporte='"+idusuariomani+"', id_usuario_asignado_tarea='"+idusuarioasig+"', id_estatus='"+idestatus+"', descripcion_reporte='"+descripcionrep+"', solucion_reporte='"+solucionrep+"', fecha_hora_reporte='"+fecha+"' where id_reporte='"+idreporte+"'");

    request.getRequestDispatcher("Ingeniero_de_Mantenimiento.jsp").forward(request, response);
}
                %>
    </body>
    
<script>
   var solucionAnt = document.getElementById("solucionrep")[0].value;

function mostrarEstatus() {
    var selectEstatus = document.getElementById("idestatus");
    var selectUsuario = document.getElementById("idusuarioasig");
    var valorUsuario = selectUsuario.value;

    if (valorUsuario === "SAVG050624HDFNSNA2") {
        selectEstatus.value = "5";
    }
}
    
function actualizarForm() {
  var solucionN = document.getElementById("solucionN");
  solucionN.value = solucionAnt;
   }
}
</script>

</html>
