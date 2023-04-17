<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="Clases.Conexion"%>
<%@page import="Clases.EdicionAsist"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();  
        if(nivel.equals("4")){%>
  <%
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String fechaHoraReporte = dtf.format(LocalDateTime.now());
%>
<html lang="en">
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
      <!-- Swiper CSS -->
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
                <li><a href="../jsp/plantillaPaciente.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Home</span>
                </a></li>
                <li><a href="../jsp/Asistente.jsp" >
                    <i class="uil uil-envelope-edit"></i>
                    <span class="link-name">Asistente</span>
                </a></li>
                <li><a href="../jsp/Editor_de_FAQs.jsp">
                    <i class="uil uil-chat"></i>
                    <span class="link-name">Editor</span>
                </a></li>
                <li><a href="../jsp/Gerente_de_Mantenimiento.jsp">
                    <i class="uil uil-plus-circle"></i>
                    <span class="link-name">Gerente de mantenimiento</span>
                </a></li>
                <li><a href="../jsp/Ingeniero_de_Soporte.jsp">
                  <i class="uil uil-bag"></i>
                  <span class="link-name">Ingeniero de soporte</span>
                </a></li>
                <li><a href="../jsp/Ingeniero_de_Mantenimiento.jsp">
                    <i class="uil uil-analysis"></i>
                    <span class="link-name">Ingeniero de mantenimiento</span>
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
        <!-- Aqui ponen sus cosas-->
            



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <title>Gerente de Soporte</title>
    </head>
     <body>   
      <p align=center>Modificar reporte enviado por asistente</p>
          
   <%   
       int id_folio = Integer.parseInt(request.getParameter("id_folio"));
       Conexion sql = new Conexion();
       String Query = "select * from reporte where id_reporte =  " +id_folio+ "";
       ResultSet rs = sql.consultar(Query);
       while(rs.next()){
   %>
   
     <form method="POST" onsubmit="return validarFormulario();" action="FormUsuarioUnico?id_reporte=<%=id_folio%>">
<div class="input-group">
        <label>Id usuario</label>
     <input type="text" name="asistente" id="destinos" value="<%=rs.getString(2)%>" readonly="readonly" class="omitir">
      <label>Elige al destinatario</label>        
      <select name='destinatario' id='destino' onchange="agregaropcion()" >
         <option selected> Elige a quien enviar </option>
     <option value="1">Gerente de Mantenimiento</option>
     <option value="2">Ingeniero de Soporte</option>
     </select>
         <br>
         <br>
      <label>Id de destinatario</label>
     <select name='ingenierosoporte' id='iddestinos'>
     <option selected value="0"> Elige el Id </option>   
     </select>
      <br>
         <br> 
     <label>Id Gerente de Soporte</label>
     <input type="text" name="gerentesoporte" id="destinos" value="<%out.println(usuario);%>" readonly="readonly" class="omitir">
     <label>Folio Reporte</label>
     <input type="text" name="folioreporte" id="destinos" value="<%=rs.getInt(1)%>" readonly="readonly" class="omitir">
     <label>Descripción</label>
     <input type="text" name="descripcion" id="destinos" value="<%=rs.getString(6)%>" readonly="readonly" class="omitir">
     <label>Fecha</label>
     <input type="text" name="fecha" id="destinos" value="<%out.println(fechaHoraReporte);%>" readonly="readonly" class="omitir">
     <label>Estatus</label>
     <select name='status' id='status' disabled="true" >
     <option value='0' selected> Nuevo estatus </option>
     <option value="2">En proceso</option>
     <option value="3">En Mantenimiento</option>
     </select>
     <br>
     <br>
     <button type="submit">Asignar</button>
  
     
      </div>
   
   <%
    }
   %>
      
       </form>
 

    </body>
    
           <script>
               
function agregaropcion() {
    var selectEstatus = document.getElementById("destino").value;
    var selectUsuario = document.getElementById("iddestinos");
    var selectestado = document.getElementById("status");


    if (selectEstatus === "1") {
        document.getElementById("iddestinos").innerHTML= "";
        document.getElementById("status").innerHTML= "";
        var option = document.createElement("option"); 
        option.text = "Elige el Id";
        option.value = "0";
        selectUsuario.add(option);
        var option = document.createElement("option");
        option.value = "5";
        option.text = "Sandoval Vásquez Gonzalo";
        selectUsuario.add(option);
        var option = document.createElement("option");
        option.value = "3";
        option.text = "En Mantenimiento";
        selectestado.add(option);
        }

     else if (selectEstatus === "2") {
        document.getElementById("iddestinos").innerHTML= "";
        document.getElementById("status").innerHTML= "";
        var option = document.createElement("option");
        option.text = "Elige el Id";
        option.value = "0";
        selectUsuario.add(option);
        var option = document.createElement("option");
        option.value = "4";
        option.text = "Nieves Bartolo Marco Antonio";
        selectUsuario.add(option);
        var option = document.createElement("option");
        option.value = "2";
        option.text = "En proceso";
        selectestado.add(option);
    }
   
}
      function validarFormulario() {
        var idUsuario = document.getElementById("iddestinos").value;
        var estatus = document.getElementById("status").value;
     
        if ( idUsuario == 0 && estatus == 0) {
            alert("Tienes que elegir un Id y un Estatus");
            return false;
        }
        if (idUsuario == 0) {
            alert("Tienes que elegir un Id");
            return false;
        }  
        if (estatus == 0) {
            alert("Tienes que elegir un estatus ");
            return false;
        }      
        return true;
    }
</script>

</html>

        
                    
        <!-- Aqui ponen sus cosas-->
        </div>
    </div>

    
    <script src="js/peticionesDoctor.js">


    </script>

  
    
</body>
</html>

<%} else{%>
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