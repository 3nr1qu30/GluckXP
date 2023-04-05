/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;
import java.sql.*;
/**
 *
 * @author urien
 */
public class Conexion {
    private Connection cnn;
    private Statement st;
    
    public Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cnn=DriverManager.getConnection("jdbc:mysql://25.69.42.78:3306/GluckyXp?useSSL=false&serverTimezone=America/Mexico_City","Escuela","Sardipondi69.");
        }catch  (ClassNotFoundException | SQLException e){
            System.err.println("Error al conectar " + e);
        }
    }
    //Altas
    public boolean ejecutar(String query){
        try{
          st = cnn.createStatement();
          st.execute(query);
          return true;
        }
        catch (SQLException e){
            System.err.println("Error al ejecutar" + e);
            return false;
        }
    }
    //Consultas
    public ResultSet consultar(String query){
        try{
            st=cnn.createStatement();
            ResultSet tabla = st.executeQuery(query);
            return tabla;
        }
        catch (SQLException e){
           System.err.println("Error al consultar" + e);
           return null;
        }
    }
    //modificar
    public boolean modificar(String query){
        try{
            st=cnn.createStatement();
            st.executeUpdate(query);
            return true;
        }
        catch (SQLException e){
           System.err.println("Error al modificar" + e);
           return false;
        }
    }
    //Desconectar
    public void desconectar(){
        try{
        cnn.close();
        st.close();
        }
        catch(SQLException e){
           System.err.println("Error al cerrar la conexion" + e); 
        }
    }
    
      public Connection getConnection() {
        return cnn;
    }
}
