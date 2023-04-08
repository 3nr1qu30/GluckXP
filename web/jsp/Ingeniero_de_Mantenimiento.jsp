<%-- 
    Document   : Ingeniero de Mantenimiento
    Created on : 2 abr 2023, 19:52:18
    Author     : marco
--%>

<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="Clases.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <%session = request.getSession();
              String nivel = session.getAttribute("lvl").toString();
              String usuario = session.getAttribute("usuario").toString();
    if(nivel.equals("6") || nivel.equals("7") || nivel.equals("4")){%>

<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ingeniero de Mantenimiento</title>
  <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
</head>

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
                <li><a href="../index.jsp">
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


<body>
    <h1>Ingeniero de Mantenimiento </h1>

    <h1>Lista de Reportes</h1>
    
        <table>
        <tr>
          <th>Folio del reporte</th>
          <th>Usuario solicitante</th>
          <th>Usuario que manipula el reporte</th>
          <th>Usuario asignado a la tarea</th>
          <th>Estatus</th>
          <th>Descripción</th>
          <th>Solución</th>
          <th>Fecha y hora</th>
          <th>Editar</th>
        </tr>
    
    <%
        Conexion sql = new Conexion();
        String query = "select * from reporte where id_estatus = 4";
        ResultSet rs = sql.consultar(query);
        
        while (rs.next()) {
    %>
    
        <tr>
            <th> <%=rs.getInt(1)%> </th>
            <th> <%=rs.getString(2) %> </th>
            <th> <%=rs.getString(3) %> </th>
            <th> <%=rs.getString(4) %> </th>
            <th> <%=rs.getInt(5) %> </th>
            <th> <%=rs.getString(6) %> </th>
            <th> <%=rs.getString(7) %> </th>
            <th> <%=rs.getString(8) %> </th>
            <th>
                <a href="Ingeniero_de_Mantenimiento_Editar.jsp?id_reporte=<%=rs.getString(1)%>">
                <button class="image-button"><img src="../imagenes/botonmodif.png" alt="Modificar"/></button>
                </a>
            </th>
        <tr>

  
            <%
                }
                rs.close();
            %>            
       
        </table>
        <br>
        <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
</body>
</html>

    <%} else{%>
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