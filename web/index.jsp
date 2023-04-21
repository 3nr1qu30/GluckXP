<%-- 
    Document   : index
    Created on : 4 abr 2023, 21:34:34
    Author     : urien
--%>
<%@page import="java.sql.*"%>
<%@page import="Clases.FAQs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>GLUCKY</title>
    <link rel="stylesheet" href="css/index.css">
    <link href="css/abc.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="https://i.ibb.co/2qbH6y4/730-sin-t-tulo-20221221143952.png" type="image/svg"/>
</head>
<body>

    <div class="navbar">
        <div class="logo">
            <img src="imagenes/logo_temp.png" alt="logo" class="logito">
        </div>
        <div class="enlaces">
            <button onclick="location.href='https://play.google.com/'" class="get-app">Descargar</button>
        </div>
    </div>

    <div class="info">
        <div class="text">
            <h1>GLUCKY</h1>
            <!--Contenido temporal-->
            <p>Es una aplicación web y móvil la cual tiene como objetivo ayudar a controlar de
                una mejor manera la diabetes a traves de la mejora en la comunicacion paciente-doctor.</p>
        </div>
        <div class="imagen">
            <img class="telefono" src="imagenes/phone_index.png" alt="Telefono ilustrativo">
        </div>
    </div>

    <br><br>

    <div class="info-pacientes-doctores">
        <h1>Glucky y sus características para pacientes</h1>
        <p>Glucky cuenta con las siguientes características para ayudar a los pacientes en su tratamiento.</p>
    </div>

    <br><br>

    <div class="but-pacientes">
        <div class="pc1">
            <img src="imagenes/logo_temp.png" alt="Logo de la Aplicación" height="auto"width="30px">
            <h3>Registrar niveles de azúcar/presión</h3>
            <p>Lorem, ipsum dolor sit amet consectetur adipisi</p>
        </div>
        <div class="pc2">
            <img src="imagenes/logo_temp.png" alt="Logo de la Aplicación" height="auto"width="30px">
            <h3>Consultar dietas</h3>
            <p>Lorem, ipsum dolor sit amet consectetur adipisi</p>
        </div>
        <div class="pc3">
            <img src="imagenes/logo_temp.png" alt="Logo de la Aplicación" height="auto"width="30px">
            <h3>Consultar tratamientos</h3>
            <p>Lorem, ipsum dolor sit amet consectetur adipisi</p>
        </div>
        <div class="pc4">
            <img src="imagenes/logo_temp.png" alt="Logo de la Aplicación" height="auto"width="30px">
            <h3>Solicitar citas</h3>
            <p>Lorem, ipsum dolor sit amet consectetur adipisi</p>
        </div>
        <div class="pc5">
            <img src="imagenes/logo_temp.png" alt="Logo de la Aplicación" height="auto"width="30px">
            <h3>Botón de pánico</h3>
            <p>Lorem, ipsum dolor sit amet consectetur adipisi</p>
        </div>
        <div class="pc6">
            <img src="imagenes/logo_temp.png" alt="Logo de la Aplicación" height="auto"width="30px">
            <h3>Chat</h3>
            <p>Lorem, ipsum dolor sit amet consectetur adipisi</p>
        </div>
        <div class="pc7">
            <img src="imagenes/logo_temp.png" alt="Logo de la Aplicación" height="auto"width="30px">
            <h3>Vincular paciente con un doctor</h3>
            <p>Lorem, ipsum dolor sit amet consectetur adipisi</p>
        </div>
        <div class="pc8">
            <img src="imagenes/logo_temp.png" alt="Logo de la Aplicación" height="auto"width="30px">
            <h3>Administrar notificaciones/recordatorios</h3>
            <p>Lorem, ipsum dolor sit amet consectetur adipisi</p>
        </div>
    </div>



   
    
    
    

    <div class="botones1">
        <div class="signin">
            <button onclick="location.href='Login'" class="s-pac">REGISTRARSE</button>
        </div>  
        <div class="login">
            <button onclick="location.href='html/IniciodeSesion.html'" class="l-pac">INICIAR SESIÓN</button>
        </div>
    </div>


    <div class="info-pacientes-doctores">
      <h1>FAQS</h1>
      <p>en esta sección recopilamos las preguntas frecuentes que nuestros clientes suelen tener sobre nuestros productos y servicios. Aquí encontrarás respuestas a algunas de las dudas más comunes que nuestros clientes nos han planteado. Si no encuentras la respuesta que buscas, no dudes en ponerte en contacto con nuestro equipo de atención al cliente para obtener más información. ¡Estamos aquí para ayudarte! A continuación, te presentamos algunas de las preguntas frecuentes que hemos recopilado:</p>
  </div>


  <div class="faq-container">

        <%FAQs faq = new FAQs();
        ResultSet rs = faq.VisualizarFAQ();
         %>
        
        <%
while(rs.next()){%>
        <div class="faq-item">
        <div class="faq-question">
            <h3><%=rs.getString(2)%></h3>
        <div class="arrow"></div>
      </div>
      <div class="faq-answer">
        <p><%=rs.getString(3)%></p>
      </div> 
      </div>
      <%}%>
    </div>
</body>
</html>