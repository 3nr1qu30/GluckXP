
<%@page import="java.time.LocalDateTime"%>
        <%@page import="java.time.format.DateTimeFormatter"%>
        <%@page import="Clases.Conexion"%>
        <%@page import="java.util.List"%>
        <%@page import="java.sql.*" %>    

<%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString(); 

     %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
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

        <div class="dash-content">
        <!-- Aqui ponen sus cosas-->
            



            <p align=center>Reportes enviados por asistente</p>
<div class="container">
        <table border="1" width="600" align="center" class="reporte-table">
            <thead class="thead">
            <tr>
          <th>Folio Reporte</th>
          <th>Id Usuario</th>
          <th>Id Gerente de Soporte</th>
          
          <th>Descripcion</th>
          
          <th>Fecha y Hora</th>
          <th>estatus</th>
          <th> </th>
            </tr>
            </thead>
       
   <%
       Conexion sql = new Conexion();
       String query = "select * from reporte where id_estatus = 1";
       ResultSet rs = sql.consultar(query);
       while(rs.next()){
   %>
   <tbody>
       <% String estatus;
       if(rs.getInt(5)== 1){
       estatus = "Abierto";
       
  String nombre;
       if(rs.getInt(2)== 1){
       nombre = "Varillas Figueroa Enrique";
           } else if(rs.getInt(2)==2){
          nombre = "Montoya Rodriguez Isaac";   
          } else if(rs.getInt(2)==3){
          nombre = "Negrete González Roberto";      
          }else {
          nombre = "";   
          }
           String nombre2;
       if(rs.getInt(3)== 1){
       nombre2 = "Varillas Figueroa Enrique";
           } else if(rs.getInt(3)==2){
          nombre2 = "Montoya Rodriguez";   
          } else if(rs.getInt(3)==3){
          nombre2 = "Negrete González Roberto";      
          }else {
          nombre2 = "";   
          }
       %>
        <tr>
          <td><%=rs.getString(1)%></td>
          
          <td><%=nombre%></td>
          <td><%=nombre2%></td>
          
          <td><%=rs.getString(6)%></td>
         
          <td><%=rs.getString(8)%></td>
           <td><%=estatus%></td>
          <td><a href="ModificaciónAsistente.jsp?id_folio=<%=rs.getString(1)%>"><button>Asignar</button></a></td>
      </tbody>
    <% }
        }
      %>
     
    </table>
      </div>
    <br>
    <p align=center>Reportes enviados por Gerente de Mantenimiento</p>
    
    <div class="container">
        <table border="1" width="600" align="center" class="reporte-table">
            <thead class="thead">
            <tr>
     <th>Folio reporte</th>            
    <th>Id Usuario</th>
    <th>Id Gerente de Mantenimiento</th>
    <th>Id Gerente de Soporte</th>
   
    <th>Descripción</th>
    <th>Solución</th>
    <th>Fecha y Hora</th>
    <th>Estatus</th>
     <th> </th>
            </tr>
            </thead>
 
    
       <%
      
        query = "select * from reporte where id_estatus = 6";
        rs = sql.consultar(query);
       while(rs.next()){
   %> 
     <tbody>

        <tr>
      <td><%=rs.getInt(1)%></td>     
                  <%      
  String nombre;
       if(rs.getInt(2)== 1){
       nombre = "Varillas Figueroa Enrique";
           } else if(rs.getInt(2)==2){
          nombre = "Montoya Rodriguez Isaac";   
          } else if(rs.getInt(2)==3){
          nombre = "Negrete González Roberto";      
          }else {
          nombre = "";   
          }
           String nombre2;
       if(rs.getInt(3)== 1){
       nombre2 = "Varillas Figueroa Enrique";
           } else if(rs.getInt(3)==2){
          nombre2 = "Montoya Rodriguez Isaac";   
          } else if(rs.getInt(3)==3){
          nombre2 = "Negrete González Roberto";      
          }else {
          nombre2 = "";   
          }
          
           String nombre3;
       if(rs.getInt(3)== 1){
       nombre3 = "Varillas Figueroa Enrique";
           } else if(rs.getInt(3)==2){
          nombre3 = "Montoya Rodriguez Isaac";   
          } else if(rs.getInt(3)==3){
          nombre3 = "Sandoval Vasquez Gonzalo";      
          }else {
          nombre3 = "";   
          }
       %>
          <td><%=nombre%></td>
     <td><%=nombre3%></td>
     <td><%=nombre2%></td>
     <td><%=rs.getString(6)%></td>
     <td><%=rs.getString(7)%></td>
     <td><%=rs.getString(8)%></td>
       
      <% String estatus;
       if(rs.getInt(5)== 6){
       estatus = "Mantenimiento Finalizado";
           }else {
          estatus = "";   
          }
       %>
    
       <td><%=estatus%></td>
       

          <td><a href="ModificacionGerente.jsp?id_folio=<%=rs.getString(1)%>"><button>Asignar</button></a></td>
      </tbody>
    
     <%
        }
      %>
    
    </table>
    </div>

<br>
    <p align=center>Reportes</p>
    
    <div class="container">
        <table border="1" width="600" align="center" class="reporte-table">
            <thead class="thead">
            <tr>
              <th>Folio reporte</th>   
              <th>Id Usuario</th>
   
    <th>Descripción</th>
    <th>Solución</th>
    <th>Fecha y Hora</th>
          <th>Estatus</th>

            </tr>
            </thead>
 
    
       <%
      
        query = "select * from reporte";
        rs = sql.consultar(query);
       while(rs.next()){
   %>
 
     <tbody>
        <tr>
        <td><%=rs.getInt(1)%></td>
                        <%      
  String nombre;
       if(rs.getInt(2)== 1){
       nombre = "Varillas Figueroa Enrique";
           } else if(rs.getInt(2)==2){
          nombre = "Montoya Rodriguez Isaac";   
          } else if(rs.getInt(2)==3){
          nombre = "Negrete González Roberto";      
          }else {
          nombre = "";   
          }
           %>
           
     <td><%=nombre%></td>
    
     <td><%=rs.getString(6)%></td>
     <td><%=rs.getString(7)%></td>
     <td><%=rs.getString(8)%></td> 
     
      <% String estatus;
       if(rs.getInt(5)== 1){
       estatus = "Abierto";
           } else if(rs.getInt(5)==2){
          estatus = "En proceso";   
          } else if(rs.getInt(5)==3){
          estatus = "En mantenimiento";   
          } else if(rs.getInt(5)==4){
          estatus = "En programacion";   
          }else if(rs.getInt(5)==5){
          estatus = "Programacion finalizada";   
          }else if(rs.getInt(5)==6){
          estatus = "Mantenimiento finalizado";   
          }else if(rs.getInt(5)==7){
          estatus = "Solucionado";   
          }else if(rs.getInt(5)==8){
          estatus = "Cerrado";   
          }else {
          estatus = "";   
          }
       %>
     
       <td><%=estatus%></td>
       
      </tbody>
    
     <%        
         
}
      %>
    
    </table>
    </div>
      
    




        
                    
        <!-- Aqui ponen sus cosas-->
        </div>

    
    <script src="js/peticionesDoctor.js">


    </script>

  
    
</body>
</html>

