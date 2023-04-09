<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();
          if(nivel.equals("6")){%>
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
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



    <title>Peticiones</title> 
        <!--====== Favicon Icon ======-->
        <link
        rel="shortcut icon"
        href="https://i.ibb.co/2qbH6y4/730-sin-t-tulo-20221221143952.png"
        type="image/svg"
      />
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
                <li><a href="../index.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Home</span>
                </a></li>
                <li><a href="../jsp/Gerente_de_Mantenimiento.jsp" >
                    <i class="uil uil-envelope-edit"></i>
                    <span class="link-name">Regresar a Gerente de mantenimiento</span>
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

                <div class="icon" onclick="toggleNotifi()">
			        <div class="noti"></div>
		        </div>

                <div class="notifi-box" id="box">
                    <h2>Notificaciones: <span>17</span></h2>
                    <div class="notifi-item">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/checkmark-cross/cross-icon.png" alt="img">
                        <div class="text">
                           <h4>Elias Abdurrahman</h4>
                           <p>@lorem ipsum dolor sit amet</p>
                        </div> 
                    </div>
        
                   
        
                </div>

            <img src="https://i.pinimg.com/originals/0c/3b/3a/0c3b3adb1a7530892e55ef36d3be6cb8.png" alt="" onclick="toggleNotifi2()">

            <div class="notifi-box2" id="box2">
                <div class="profile-card">
                    <div class="image">
                      <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png" alt="" class="profile-img" />
                    </div>
                    <div class="text-data">
                      <span class="name">Nombre completito jeje</span>
                      <span class="job">Email@cum.com</span>
                      <span class="job">Paciente</span>
                      <span class="job">Dirección??</span>
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
              
                    <div class="analytics">
                      <div class="data">
                        <i class="bx bx-circle"></i>
                      </div>
                      <div class="data">
                        <i class="bx bx-heart"></i>
                        <span class="number">Paciente</span>
                      </div>
                      <div class="data">
                        <i class="bx bx-award"></i>
                        <span class="number">...</span>
                      </div>
                    </div>
                  </div>
    
            </div>
        
        </div>
        
        <div class="dash-content">
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
        <form action="" onsubmit="return validarFormulario();">
            <table border="1" width="250" align="center" class="tablasinnada margen">
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
                    <td><input type="text" name="idusuariomani" value="<%=usuario%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Estatus: </td>
                    <td>
                        <select name="idestatus" id="idestatus" onchange="siemprepasa()">
                        <option selected value="0"> Selecciona el estatus</option>
                        <option value="6">Mantenimiento finalizado</option>
                        <option value="4">En programación</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Id de usuario asigando: </td>
                    <td>
                        <select name="idusuarioasig" id="idusuarioasig">
                            <option selected value="0"> Elige el Id </option>   
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
                        <input type="submit" name="btnGrabar" value="Enviar Reporte" class="boton2">
                    </th>
            </table>
        </form>
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
        </div>
    </body>
    
<script>
function siemprepasa() {
    var selectEstatus = document.getElementById("idestatus").value;
    var selectUsuario = document.getElementById("idusuarioasig");


    if (selectEstatus === "6") {
        document.getElementById("idusuarioasig").innerHTML= "";
        var option = document.createElement("option");
        option.text = "Elige el Id";
        option.value = "0";
        selectUsuario.add(option);
        var option = document.createElement("option");
        option.value = "3";
        option.text = "3";
        selectUsuario.add(option);
        }

     else if (selectEstatus === "4") {
          document.getElementById("idusuarioasig").innerHTML= "";
       var option = document.createElement("option");
       option.text = "Elige el Id";
       option.value = "0";
        selectUsuario.add(option);
        var option = document.createElement("option");
        option.value = "6";
        option.text = "6";
        selectUsuario.add(option);
    }
}

function validarFormulario() {   
    var selectEstatus = document.getElementById("idestatus").value;
    var selectUsuario = document.getElementById("idusuarioasig").value;
    
    if (selectEstatus == 0 && selectUsuario == 0){
        alert("Requieres seleccionar un estatus y a un usuario");
        return false;
    }
    if (selectEstatus == 0){
        alert("Requieres seleccionar un estatus");
        return false;
    }
    if (selectUsuario == 0){
        alert("Requieres seleccionar un usuario");
        return false;
    }
    return true;
}


</script>

</html>
<%} else if (nivel.equals("4")){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
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



    <title>Peticiones</title> 
        <!--====== Favicon Icon ======-->
        <link
        rel="shortcut icon"
        href="https://i.ibb.co/2qbH6y4/730-sin-t-tulo-20221221143952.png"
        type="image/svg"
      />
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
                <li><a href="../index.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Home</span>
                </a></li>
                <li><a href="../jsp/Gerente_de_Mantenimiento.jsp" >
                    <i class="uil uil-envelope-edit"></i>
                    <span class="link-name">Regresar a Gerente de mantenimiento</span>
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

                <div class="icon" onclick="toggleNotifi()">
			        <div class="noti"></div>
		        </div>

                <div class="notifi-box" id="box">
                    <h2>Notificaciones: <span>17</span></h2>
                    <div class="notifi-item">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/checkmark-cross/cross-icon.png" alt="img">
                        <div class="text">
                           <h4>Elias Abdurrahman</h4>
                           <p>@lorem ipsum dolor sit amet</p>
                        </div> 
                    </div>
        
                   
        
                </div>

            <img src="https://i.pinimg.com/originals/0c/3b/3a/0c3b3adb1a7530892e55ef36d3be6cb8.png" alt="" onclick="toggleNotifi2()">

            <div class="notifi-box2" id="box2">
                <div class="profile-card">
                    <div class="image">
                      <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png" alt="" class="profile-img" />
                    </div>
                    <div class="text-data">
                      <span class="name">Nombre completito jeje</span>
                      <span class="job">Email@cum.com</span>
                      <span class="job">Paciente</span>
                      <span class="job">Dirección??</span>
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
              
                    <div class="analytics">
                      <div class="data">
                        <i class="bx bx-circle"></i>
                      </div>
                      <div class="data">
                        <i class="bx bx-heart"></i>
                        <span class="number">Paciente</span>
                      </div>
                      <div class="data">
                        <i class="bx bx-award"></i>
                        <span class="number">...</span>
                      </div>
                    </div>
                  </div>
    
            </div>
        
        </div>
        
        <div class="dash-content">
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
        <form action="" onsubmit="return validarFormulario();">
            <table border="1" width="250" align="center" class="tablasinnada margen">
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
                    <td><input type="text" name="idusuariomani" value="<%=usuario%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Estatus: </td>
                    <td>
                        <select name="idestatus" id="idestatus" onchange="siemprepasa()">
                        <option selected value="0"> Selecciona el estatus</option>
                        <option value="6">Mantenimiento finalizado</option>
                        <option value="4">En programación</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Id de usuario asigando: </td>
                    <td>
                        <select name="idusuarioasig" id="idusuarioasig">
                            <option selected value="0"> Elige el Id </option>   
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
                        <input type="submit" name="btnGrabar" value="Enviar Reporte" class="boton2" >
                    </th>
            </table>
        </form>
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
        </div>
    </body>
    
<script>
function siemprepasa() {
    var selectEstatus = document.getElementById("idestatus").value;
    var selectUsuario = document.getElementById("idusuarioasig");


    if (selectEstatus === "6") {
        document.getElementById("idusuarioasig").innerHTML= "";
        var option = document.createElement("option");
        option.text = "Elige el Id";
        option.value = "0";
        selectUsuario.add(option);
        var option = document.createElement("option");
        option.value = "3";
        option.text = "3";
        selectUsuario.add(option);
        }

     else if (selectEstatus === "4") {
          document.getElementById("idusuarioasig").innerHTML= "";
       var option = document.createElement("option");
       option.text = "Elige el Id";
       option.value = "0";
        selectUsuario.add(option);
        var option = document.createElement("option");
        option.value = "6";
        option.text = "6";
        selectUsuario.add(option);
    }
}

function validarFormulario() {   
    var selectEstatus = document.getElementById("idestatus").value;
    var selectUsuario = document.getElementById("idusuarioasig").value;
    
    if (selectEstatus == 0 && selectUsuario == 0){
        alert("Requieres seleccionar un estatus y a un usuario");
        return false;
    }
    if (selectEstatus == 0){
        alert("Requieres seleccionar un estatus");
        return false;
    }
    if (selectUsuario == 0){
        alert("Requieres seleccionar un usuario");
        return false;
    }
    return true;
}
</script>

</html>
<%} else{%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        No tienes permiso de acceder a esta pagina
        <a href="../index.jsp" class="boton rojo mi-enlace izquierda">Regresar a inicio</a>
    </body>
</html>

<%}%>