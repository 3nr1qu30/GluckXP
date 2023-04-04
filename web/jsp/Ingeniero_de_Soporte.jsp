<%-- 
    Document   : Ingeniero de Mantenimiento
    Created on : 2 abr 2023, 19:52:18
    Author     : marco
--%>

<%@page import="Clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ingeniero de Mantenimiento</title>
  <link rel="stylesheet" href="estilos.css">
</head>
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  margin: 0;
}

.container {
  max-width: 90%;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.2);
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

form label {
  font-weight: bold;
  margin-bottom: 10px;
}

form input[type="text"] {
  padding: 10px;
  border-radius: 5px;
  border: none;
  margin-bottom: 20px;
  width: 100%;
  border:  solid;
  border-width: 3px;
  border-color: #ddd;
}

form button {
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  transition: all 0.2s;
}

.boton{
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  transition: all 0.2s;
}


form button:hover {
  background-color: #3e8e41;
}

table {
  margin-top: 20px;
  width: 100%;
  border-collapse: collapse;
}

table th,
table td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

table th {
  background-color: #f2f2f2;
}

table td {
  background-color: #fff;
}

table td button {
  background-color: #00a2ff;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 5px 10px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.2s;
  margin-right: 10px;
}

table td button:hover {
  background-color: #0041cc;
}

table td button.edit .boton{
  background-color: #4CAF50;
  
}

table td button.edit .boton:hover {
  background-color: #3e8e41;
}

.input-group{
    background-color:rgb(255, 255, 255) ;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.2);

}
    
</style>
<body>
  <div class="container">
    <h1>Ingeniero de Soporte </h1>

    <form>
      <div class="input-group">
        <label for="usuario">Id de Gerente de Soporte</label>
        <input type="text" id="usuario" name="usuario">
      
     
        <label for="descripcion">Solución</label>
        <input type="text" id="descripcion" name="descripcion">
        <button type="submit">Enviar</button>
        </div>
     
    </form>

    <%
        Conexion sql = new Conexion();
        String query = "select * where from reporte = 3";
        
    %>
    
    <h1>Lista de Reportes</h1>
    <button class="boton">Consultar</button>
    <table>
      <thead>
        <tr>
          <th>Folio del reporte</th>
          <th>Id del Usuario</th>
          <th>Id del Gerente de soporte</th>
          <th>Descripición del reporte</th>
          <th>Solución</th>
          <th>Estatus</th>
          <th>Fecha y hora</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Usuario 1</td>
          <td>Descripción 1</td>
          <td><button>Accion 1</button></td>
          <td><button>Accion 2</button></td>
        </tr>
        <tr>
          <td>Usuario 2</td>
          <td>Descripción 2</td>
          <td><button>Accion 1</button></td>
          <td><button>Accion 2</button></td>
        </tr>
        <tr>
          <td>Usuario 3</td>
          <td>Descripción 3</td>
          <td><button>Accion 1</button></td>
          <td><button>Accion 2</button></td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>