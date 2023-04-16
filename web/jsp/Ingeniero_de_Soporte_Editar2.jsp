<%--
    Document   : Ingeniero Mantenimiento Editar
    Created on : Apr 3, 2023, 9:58:45 PM
    Author     : Marco
--%>

<%session = request.getSession();
    String nivel = session.getAttribute("lvl").toString();
    String usuario = session.getAttribute("usuario").toString();
        if (nivel.equals("6") || nivel.equals("5") || nivel.equals("4")){
%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

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
    

var solucionAnt = document.getElementById("solucionrep").value;
function actualizarForm() {
  var solucionN = document.getElementById("solucionN");
  var solucionCont = document.getElementById(rs.getString(7));
  if(solucionCont === "" || solucionCont === "null"){
       solucionAnt.disabled = false;
       solucionN.value = solucionAnt;
  } else if(solucionCont !== "" || solucionCont !== "null"){
      solucionrep.disabled = true;
}   
}
</script>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/asignacionesCitasPacientes.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/swiper-bundle.min.css" />
        <link rel="shortcut icon" href="https://i.ibb.co/2qbH6y4/730-sin-t-tulo-20221221143952.png" type="image/svg"/>
        <title>Ingeniero de Soporte</title>
    </head>

    <body>
        <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img src="https://i.ibb.co/8bjZVfw/731-sin-t-tulo-20221215205600.png" alt="">
            </div>

            <span class="logo_name">Glucky</span>
        </div>

        <div class="menu-items">
            <form action="ServletLogin" method="post">
            <ul class="nav-links">
                <br>
                <li><a href= "Ingeniero_de_Soporte.jsp">
                    <i class="uil uil-envelope-edit"></i>
                    <span class="link-name">Lista de Reportes</span>
                </a></li>
                <br>
                <li><a href="plantillaPaciente.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Regresar al inicio</span>
                </a></li>
                <br>
                <li><a href="../index.jsp">
                    <i class="uil uil-chat"></i>
                    <span class="link-name">Cerrar sesión</span>
                </a></li>
            </ul>

            <ul class="logout-mode">


                <div class="mode-toggle">

                </div>
            </li>
            </ul>
        </form>
        </div>

    </nav>
        
        <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-circle"></i>
                <input type="text" placeholder="Aplicación de soporte" disabled>
            </div>

            <img src="https://i.pinimg.com/originals/0c/3b/3a/0c3b3adb1a7530892e55ef36d3be6cb8.png" alt="" onclick="toggleNotifi2()">

            <div class="notifi-box2" id="box2">
                <div class="profile-card">
                    <div class="image">
                      <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png" alt="" class="profile-img" />
                    </div>  
                    <div class="media-buttons">
                      <a href="#" style="background: #a1a1a136" class="link">
                        <i class="bx bx-plus-medical"></i>
                      </a>
                    </div>
               
                    <div class="buttons">
                      <button class="button" onclick="toggleNotifi2()"">Cerrar</button>
                      <button class="button">Cuenta</>
                    </div>
                    </div>
                  </div>
    
            </div>
        
        <br>


        <%
            String id_reporte = request.getParameter("id_reporte");

            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://26.160.48.186:3306/GluckyXp?useSSL=false&serverTimezone=America/Mexico_City", "Escuela", "Sardipondi69.");
                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from reporte where id_reporte='" + id_reporte + "'");

                while (rs.next()) {
        %>
<div class="dash-content">
    <div class="container pap">
        <h2 align="center">Editar Reporte</h2>
            <br><br><br>
            <div class="nota">
                Soluciona el reporte
            </div>
            <br>
    <form onload="actualizarForm()">        
                        <div class="contenedorsss" style="width: 100%">
                   Folio del reporte
                    <input type="text" name="idreporte" value="<%=rs.getString(1)%>" readonly="readonly">
                    Usuario solicitante
                    <input type="text" name="solicitante" value="<%=rs.getString(2)%>" readonly="readonly">
                    Estatus
                        <select name="idestatus" id="idestatus"">
                        <option value="7">Solucionado</option>
                        <option value="8">Cerrado</option>
                        </select>
                    Descripción
                    <input type="text" name="descripcionrep" value="<%=rs.getString(6)%>" readonly="readonly" >
                    Solución
                    <input type="text" name="solucionrep" value="<%=rs.getString(7)%>"  maxlength="500"></td>
                    Fecha y hora
                    <%
                            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                            String fechaHoraReporte = dtf.format(LocalDateTime.now());
                        %>
                        <input type="text" name="fecha" value="<%=fechaHoraReporte%>" readonly="readonly">
                    
                        <input type="submit" name="btnGrabar" value="Enviar Reporte" class="boton">
                        </div>
    </form>
</div>


        <br>
        <%
                }
            } catch (Exception e) {
            }

           if (request.getParameter("btnGrabar") != null){
    int idreporte = Integer.parseInt(request.getParameter("idreporte"));
    int idestatus = Integer.parseInt(request.getParameter("idestatus"));
    String descripcionrep = request.getParameter("descripcionrep");
    String solucionrep = request.getParameter("solucionrep");
    String fecha = request.getParameter("fecha");



    sta.executeUpdate("update reporte set id_estatus='"+idestatus+"', descripcion_reporte='"+descripcionrep+"', solucion_reporte='"+solucionrep+"', fecha_hora_reporte='"+fecha+"' where id_reporte='"+idreporte+"'");
                request.getRequestDispatcher("Ingeniero_de_Soporte.jsp").forward(request, response);
            }
        %>

    </body>

</html>
<%} else {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
    <center><h1>No tienes permiso de acceder a esta pagina</h1></center>

    <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
</body>
</html>

<%}%>
