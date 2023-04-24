<%-- 
    Document   : Ingeniero de Soporte
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
    if (nivel.equals("6") || nivel.equals("5") || nivel.equals("4")) {%>

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
        <div class="container">
            <h1>Ingeniero de Soporte </h1>
            <br>
            <br>
            <br>
            <br>
            <div class="nota">
                Solo podrás ver y editar los reportes enviados por el gerente de soporte con el estatus de "en proceso"
            </div>
            <h1>Lista de Reportes</h1>
            <table>
                <thead>
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
                </thead>

                <%
                    Conexion sql = new Conexion();
                    String query = "select * from reporte where id_estatus = 2";
                    ResultSet rs = sql.consultar(query);

                    while (rs.next()) {
                %>

                <tbody>
                <tr>
                    
                    <% 
                    
                    String modificador = "";
                    String status = rs.getString(3);

                     if (status.equals('3')) {
                        modificador = "Roberto Negrete Gonzalez";
                     }
                        else if (status.equals('4')) {
                            modificador = "Marco Nieves Bartolo";
                     }        
                    String nose = rs.getString(4);
                    String yo = "";
                    
                    if (nose.equals('4')) {
                        yo = "Marco Nieves Bartolo";
                    } else {
                        yo = "null";
                    }
                    %>
                    
                    <th class="blancos"> <%=rs.getInt(1)%> </th>
                    <th class="blancos"> <%=rs.getString(2)%> </th>
                    <th class="blancos"> <%=modificador%> </th>
                    <th class="blancos"> <%=yo%> </th>
                    <th class="blancos"> En proceso </th>
                    <th class="blancos"> <%=rs.getString(6)%> </th>
                    <th class="blancos"> <%=rs.getString(7)%> </th>
                    <th class="blancos"> <%=rs.getString(8)%> </th>
                    <th class="blancos"><a href="Ingeniero_de_Soporte_Editar1.jsp?id_reporte=<%=rs.getString(1)%>"> <button class="boton mi-enlace">Solucionar</button> </a></th>
                <tr>
                </tbody>

                    <%
                        }
                        rs.close();
                    %>    
            </table>


        </div>
            
            <div class="container">
            <div class="nota">
                Solo podrás ver y editar los reportes enviados el estatus de "solucionado"
            </div>
            <h1>Lista de Reportes</h1>
            <table>
                <thead>
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
                </thead>

                <%
                    Conexion sql2 = new Conexion();
                    String query2 = "select * from reporte where id_estatus = 7";
                    ResultSet rs2 = sql.consultar(query2);

                    while (rs2.next()) {
                %>

                <tbody>
                <tr>
                    <th class="blancos"> <%=rs2.getInt(1)%> </th>
                    <th class="blancos"> <%=rs.getString(2)%> </th>
                    <th class="blancos"> Roberto Negrete Gonzalez </th>
                    <th class="blancos"> Marco Nieves Bartolo </th>
                    <th class="blancos"> Solucionado </th>
                    <th class="blancos"> <%=rs2.getString(6)%> </th>
                    <th class="blancos"> <%=rs2.getString(7)%> </th>
                    <th class="blancos"> <%=rs2.getString(8)%> </th>
                    <th class="blancos"><a href="Ingeniero_de_Soporte_Editar2.jsp?id_reporte=<%=rs2.getString(1)%>"> <button class="boton mi-enlace">Cerrar</button> </a></th>
                <tr>
                </tbody>

                    <%
                        }
                        rs2.close();
                    %>    
            </table>


        </div>
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
