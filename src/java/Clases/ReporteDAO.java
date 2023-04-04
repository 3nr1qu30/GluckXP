package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import Clases.Asistente;

public class ReporteDAO {

    private Connection connection;

    public ReporteDAO(Connection connection) {
        this.connection = connection;
    }
    
    public List<String> getIdsGerentesSoporte() throws SQLException {
    List<String> ids = new ArrayList<>();
    String sql = "SELECT id_usuario FROM usuario JOIN tipoUsuario " +
                 "ON usuario.id_tipo_usuario = tipoUsuario.id_tipo_usuario " +
                 "WHERE tipoUsuario.nombre_tipo_usuario = 'Gerente de Soporte'";
    try (PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery()) {
        while (resultSet.next()) {
            ids.add(resultSet.getString("id_usuario"));
        }
    }
    return ids;
}
    
    
    

    public void addReporte(Asistente reporte) throws SQLException {
        System.out.println("Connection object is null? " + (connection == null));
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO reporte (id_usuario_solicitante, id_usuario_manipula_reporte, id_usuario_asignado_tarea, id_estatus, descripcion_reporte, solucion_reporte, fecha_hora_reporte) VALUES (?, ?, ?, ?, ?, ?, ?)");
            // Parameters start with 1
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String fechaHoraReporte = dtf.format(LocalDateTime.now());
            
            preparedStatement.setString(1, reporte.getId_usuario_solicitante()); //F
            preparedStatement.setString(2, reporte.getId_usuario_manipula_reporte()); //F
            preparedStatement.setString(3, reporte.getId_usuario_asignado_tarea()); //F
            preparedStatement.setInt(4, reporte.getId_estatus()); //L
            preparedStatement.setString(5, reporte.getDescripcion_reporte()); //L
            preparedStatement.setString(6,  reporte.getSolucion_reporte()); //L
            preparedStatement.setString(7, fechaHoraReporte); //L

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw e;
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }

    public List<Asistente> getAllReportes() throws SQLException {
    List<Asistente> reportes = new ArrayList<>();

    if (connection == null) {
        throw new SQLException("La conexión es nula.");
    }

    try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM reporte");
            ResultSet rs = preparedStatement.executeQuery()) {

        while (rs.next()) {
            Asistente reporte = new Asistente();
            reporte.setId_reporte(rs.getInt("id_reporte"));
            reporte.setId_usuario_solicitante(rs.getString("id_usuario_solicitante"));
            reporte.setId_usuario_manipula_reporte(rs.getString("id_usuario_manipula_reporte"));
            reporte.setId_usuario_asignado_tarea(rs.getString("id_usuario_asignado_tarea"));
            reporte.setId_estatus(rs.getInt("id_estatus"));
            reporte.setDescripcion_reporte(rs.getString("descripcion_reporte"));
            reporte.setSolucion_reporte(rs.getString("solucion_reporte"));
            reporte.setFecha_hora_reporte(rs.getDate("fecha_hora_reporte"));
            reportes.add(reporte); // Agregar objeto Asistente a la lista
        }
    } catch (SQLException e) {
        throw e;
    }
    return reportes;
}

    // Add this method to close the connection
    public void close() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
}
