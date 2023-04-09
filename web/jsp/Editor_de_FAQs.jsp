<%@page import="Clases.FAQs"%>
<%@page import="java.sql.*"%>
<%session = request.getSession();
          String nivel = session.getAttribute("lvl").toString();
          String usuario = session.getAttribute("usuario").toString();
if(nivel.equals("8")){%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tablas_forms.css">
        <link href="../css/asignacionesCitasPacientes.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <title>Editor de FAQ's</title>
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
                <li><a href="">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">FAQ's</span>
                </a></li>
                <br>
                <li><a href="PublicarFAQsReporte.jsp" >
                    <i class="uil uil-envelope-edit"></i>
                    <span class="link-name">FAQ's con Reportes Cerrados</span>
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
    <h1 align="center">Publicar FAQ's Editor; <%=usuario%></h1>
        <form method="POST" action="ServletPublicarFAQ" name="FAQS" onsubmit="return validar_FAQ()">
      <div class="input-group">
        <label for="pregunta">Pregunta</label>
        <input type="text" id="usuario" name="PreguntaForm" onkeypress="return validar_texto(event)">
        <label for="solucion">Solución</label>
        <input type="text" id="descripcion" name="SolucionForm" onkeypress="return validar_texto(event)">
        <button type="submit">Publicar</button>
        </div>
     
    </form>
        <br><!-- comment -->
        <br>
        <div class="container">
        <h2 align="center">FAQ's publicadas</h2>
        <table>
      <thead>
        <tr>
          <th>Folio FAQ's</th>
          <th>Pregunta</th>
          <th>Respuesta</th>
          <th>Visualizar</th>
          <th>Modificar</th>
          <th>Eliminar</th>
        </tr>
        <%FAQs faq = new FAQs();
        ResultSet rs = faq.VisualizarFAQ();
        while(rs.next()){%>
      </thead>
      <tbody>
        <tr>
          <td><%=rs.getString(1)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><a href="VisualizarFAQ.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Visualizar</button></a></td>
          <td><a href="ModificarFAQ.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Modificar</button></a></td>
          <td><a href="EliminarFAQs.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Eliminar</button><a/></td>
      </tbody>
      <%}%>
    </table> 
        </div>
        </div>
        <script src="../css/alertify.min.js" type="text/javascript"></script>
    <script>function validar_FAQ(){
            pregunta = document.FAQS.PreguntaForm.value;
            respuesta = document.FAQS.SolucionForm.value;
            console.log(pregunta);
            console.log(respuesta);
            if(pregunta.length==0 || pregunta.length < 15){
                alertify.alert("Error","Ingrese una pregunta con una extension de 15 o más caracteres").set('label','ok');
                return false;
            }else{
                if(respuesta.length==0|| respuesta.length < 15){
                    alertify.alert("Error","Ingrese una respuesta con una extension de 15 o más caracteres").set('label','ok');
                    return false;
                }else{
                    alertify.success("FAQ registrada");
                    return true;
                    }
                }
            }
            function validar_texto(){
                teclas = e.keyCode;
                teclado = String.fromCharCode(teclas);
                if(teclado < 'A' || teclado > 'z' || teclado < 0 || teclado > 9 && teclado !=""){
                    return false;
                }
            }
        </script>             
    </body>
</html>
<%}else if(nivel.equals("4")){%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tablas_forms.css">
        <link href="../css/asignacionesCitasPacientes.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
        <title>Editor de FAQ's</title>
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
                <li><a href="">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">FAQ's</span>
                </a></li>
                <br>
                <li><a href="PublicarFAQsReporte.jsp" >
                    <i class="uil uil-envelope-edit"></i>
                    <span class="link-name">FAQ's con Reportes Cerrados</span>
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
    <h1 align="center">Publicar FAQ's Editor; <%=usuario%></h1>
        <form method="POST" action="ServletPublicarFAQ" name="FAQS" onsubmit="return validar_FAQ()">
      <div class="input-group">
        <label for="pregunta">Pregunta</label>
        <input type="text" id="usuario" name="PreguntaForm" onkeypress="return validar_texto(event)">
        <label for="solucion">Solución</label>
        <input type="text" id="descripcion" name="SolucionForm" onkeypress="return validar_texto(event)">
        <button type="submit">Publicar</button>
        </div>
     
    </form>
        <br><!-- comment -->
        <br>
        <div class="container">
        <h2 align="center">FAQ's publicadas</h2>
        <table>
      <thead>
        <tr>
          <th>Folio FAQ's</th>
          <th>Pregunta</th>
          <th>Respuesta</th>
          <th>Visualizar</th>
          <th>Modificar</th>
          <th>Eliminar</th>
        </tr>
        <%FAQs faq = new FAQs();
        ResultSet rs = faq.VisualizarFAQ();
        while(rs.next()){%>
      </thead>
      <tbody>
        <tr>
          <td><%=rs.getString(1)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><a href="VisualizarFAQ.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Visualizar</button></a></td>
          <td><a href="ModificarFAQ.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Modificar</button></a></td>
          <td><a href="EliminarFAQs.jsp?id_FAQs=<%=rs.getString(1)%>"><button>Eliminar</button><a/></td>
      </tbody>
      <%}%>
    </table> 
        </div>
        </div>
        <script src="../css/alertify.min.js" type="text/javascript"></script>
    <script>function validar_FAQ(){
            pregunta = document.FAQS.PreguntaForm.value;
            respuesta = document.FAQS.SolucionForm.value;
            console.log(pregunta);
            console.log(respuesta);
            if(pregunta.length==0 || pregunta.length < 15){
                alertify.alert("Error","Ingrese una pregunta con una extension de 15 o más caracteres").set('label','ok');
                return false;
            }else{
                if(respuesta.length==0|| respuesta.length < 15){
                    alertify.alert("Error","Ingrese una respuesta con una extension de 15 o más caracteres").set('label','ok');
                    return false;
                }else{
                    alertify.success("FAQ registrada");
                    return true;
                    }
                }
            }
            function validar_texto(){
                teclas = e.keyCode;
                teclado = String.fromCharCode(teclas);
                if(teclado < 'A' || teclado > 'z' || teclado < 0 || teclado > 9 && teclado !=""){
                    return false;
                }
            }
        </script>             
    </body>
</html>
<%} else{%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        No tienes permiso de acceder a esta pagina
        <a href="../index.jsp" class="boton rojo mi-enlace">Regresar a inicio</a>
    </body>
</html>

<%}%>
