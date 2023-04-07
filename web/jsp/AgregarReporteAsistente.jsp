<!DOCTYPE html>
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
            <ul class="nav-links">
                <li><a href="../index.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Casa</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
            
              
                <div class="mode-toggle">
                 
                </div>
            </li>
            </ul>
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
			        <div class="noti">0</div>
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
            



        <%-- 
        Document   : AgregarReporteAsistente
        Created on : 4 abr 2023, 3:33:30
        Author     : Isaac
    --%>
    
    <%@page import="java.time.LocalDateTime"%>
    <%@page import="java.time.format.DateTimeFormatter"%>
    <%@page import="Clases.Conexion"%>
    <%@page import="java.util.List"%>
    <%@page import="java.sql.*" %>
    
    <%session = request.getSession();
              String nivel = session.getAttribute("lvl").toString();
              String usuario = session.getAttribute("usuario").toString();
    if(nivel.equals("8") || nivel.equals("3")){%>
    
    <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        
        <body>
            
            <h1>Asistente</h1>
                <h3 class="grismini">Bienvenido <%out.println(usuario);%></h3>
                    <br>
                
                <a href="Asistente.jsp" class="boton rojo mi-enlace">Regresar</a>
             <br> 
            <div class="containerauto">
                 
             <h3>Agregar reporte </h3>
             
                             <%
                 
                 if(request.getParameter("btnG")!=null){
             String id_usuario_solicitante = request.getParameter("IdUsuario");
             String usuario_manipula_reporte = usuario;
             String GerenteSop = request.getParameter("GerenteSop");
             int id_estatus =1;
             String descripcion_reporte = request.getParameter("Desc");
             String solucion_reporte = "";
             
             DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
             String fechaHoraReporte = dtf.format(LocalDateTime.now());
             
             Conexion sql2 = new Conexion();
             String query2 = "SELECT * FROM usuario WHERE id_usuario = '" + id_usuario_solicitante + "'";
             ResultSet rs = sql2.consultar(query2); 
             
             if (rs.next()) {
                    Conexion sql1 = new Conexion();
                    String query="insert into reporte values(default,'"+id_usuario_solicitante+"','"+usuario_manipula_reporte+"','"+GerenteSop+"','"+id_estatus+"','"+descripcion_reporte+"','"+solucion_reporte+"','"+fechaHoraReporte+"')";
                    sql1.ejecutar(query);
                    request.getRequestDispatcher("Asistente.jsp").forward(request, response) ;
                    out.println("");
                } else {
                %>
                    <h3 class='nota rojo'>El ID de Usuario que has escrito " <%=GerenteSop%> " no está registrado :( '.</h3>
                <%
                    }
             
                 }
             
             %>
             
             <div class="nota">
                    Solo podrás crear y observar tus reportes con estado "abierto"
                    podrás asignar los reportes a cualquier gerente de soporte existente.
                    Asegurate de escribir datos correctamente.
                </div>
             
             <h1>⠀⠀⠀⠀⠀⠀⠀</h1>
                
           
                
               
                
            
             <form action="" onsubmit="return validarFormulario();" style="text-align: left">
                 <label for="IdUsuario" class="izq" >Id de usuario que solicita</label>
                <input type="text" id="IdUsuario" name="IdUsuario"  maxlength="18" class="withtot" required >
                <label for="GerenteSop" class="izq">Identificador del gerente</label>
                <select name="GerenteSop" class="withtot" class="select">
                    <%Conexion sql = new Conexion();
                        String query = "select * from usuario where id_tipo_usuario = 4";
                        ResultSet rs = sql.consultar(query);
                    while (rs.next()){%>
                    
                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                    
                    <%}%>
                </select>
                <label for="Desc" class="izq" >Descripción</label>
                <input type="text" id="Desc" name="Desc" class="grandisimo withtot" placeholder="Escribe la descripción del problema reportado por el usuario">
                <input type="submit" value="Enviar reporte a la gerencia de soporte" class="boton" name="btnG" >
            </form>
            
                 </div>
            
             
             
            
        </body>
        
        
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
    
        <script>
    function validarFormulario() {
        var idUsuario = document.getElementById("IdUsuario").value;
        var descripcion = document.getElementById("Desc").value;
        var caracteresEspeciales = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/g; // Expresión regular para caracteres especiales
        
        if ( idUsuario.length > 18) {
            alert("El Id de usuario debe tener exactamente 18 caracteres.");
            return false;
        }
        if (caracteresEspeciales.test(idUsuario)) {
            alert("El Id de usuario no puede contener caracteres especiales.");
            return false;
        }
        if (descripcion.length < 15 || descripcion.length > 500) {
            alert("La descripción debe tener entre 15 y 500 caracteres.");
            return false;
        }
        if (caracteresEspeciales.test(descripcion)) {
            alert("La descripción no puede contener caracteres especiales.");
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
