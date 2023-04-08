



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
    if(nivel.equals("4") || nivel.equals("3")){%>
    
    <link href="../css/tablas_forms.css" rel="stylesheet" type="text/css"/>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        
        <body>
            

            <div class="containerauto">
                
                            <h1>Asistente</h1>
                <h3 class="grismini">Bienvenido <%out.println(usuario);%></h3>
                    <br>
                
                <a href="Asistente.jsp" class="boton rojo mi-enlace">Regresar</a>
             <br> 
                 
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
    




        
                    
