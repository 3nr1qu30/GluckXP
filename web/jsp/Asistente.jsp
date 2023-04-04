<%@page import="java.util.List"%>
<%@page import="Clases.Asistente"%>
<%@page import="java.sql.*" %>
<%
    // Establecer conexión a la base de datos
    String url = "jdbc:mysql://25.69.42.78:3306/GluckyXp?useSSL=false&serverTimezone=America/Mexico_City";
    String user = "GluckyXp";
    String password = "Sardipondi69";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
        
        // Ejecutar query
        String sql = "SELECT id_usuario FROM usuario JOIN tipoUsuario " +
                     "ON usuario.id_tipo_usuario = tipoUsuario.id_tipo_usuario " +
                     "WHERE tipoUsuario.nombre_tipo_usuario = 'Gerente de Soporte'";
        resultSet = statement.executeQuery(sql);
        
        // Generar opciones para el select
        String options = "";
        while (resultSet.next()) {
            options += "<option value='" + resultSet.getString("id_usuario") + "'>" + resultSet.getString("id_usuario") + "</option>";
        }
        
        // Pasar las opciones al select
        request.setAttribute("options", options);
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar reporte</title>
</head>
<body>
    <h1>Agregar reporte</h1>
    <form action="${pageContext.request.contextPath}/agregar" method="POST">
            
        <label for="nombre">Descripción del reporte:</label>
        <input type="text" name="descripcion" id="descripcion" required><br>
                
        <label for="descripcion">Id de usuario solicitante:</label>
        <textarea id="usuario" name="usuario" minlength="18" maxlength="18" required></textarea><br>
        
        <%-- Mostrar ids de gerentes de soporte en un select --%>
        <label for="gerentesSoporte">Gerentes de soporte:</label>
        <select name="gerentesSoporte" id="gerentesSoporte">
            <%= request.getAttribute("options") %>
        </select><br>
         
        <input type="submit" value="Agregar reporte">
    </form>
    <br>
    
    
   
</body>
</html>