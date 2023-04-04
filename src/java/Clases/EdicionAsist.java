/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Marco
 */
public class EdicionAsist {
    int id_reporte,estatus;
    String id_destinatario, id_gerentesoporte, id_asistente, descripcion, fechahora;
    Conexion sql = new Conexion();

    public int getId_reporte() {
        return id_reporte;
    }

    public void setId_reporte(int id_reporte) {
        this.id_reporte = id_reporte;
    }

    public int getEstatus() {
        return estatus;
    }

    public void setEstatus(int estatus) {
        this.estatus = estatus;
    }

    public String getId_destinatario() {
        return id_destinatario;
    }

    public void setId_destinatario(String id_destinatario) {
        this.id_destinatario = id_destinatario;
    }

    public String getId_gerentesoporte() {
        return id_gerentesoporte;
    }

    public void setId_gerentesoporte(String id_gerentesoporte) {
        this.id_gerentesoporte = id_gerentesoporte;
    }

    public String getId_asistente() {
        return id_asistente;
    }

    public void setId_asistente(String id_asistente) {
        this.id_asistente = id_asistente;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechahora() {
        return fechahora;
    }

    public void setFechahora(String fechahora) {
        this.fechahora = fechahora;
    }

    public Conexion getSql() {
        return sql;
    }

    public void setSql(Conexion sql) {
        this.sql = sql;
    }
 

        //public void ModAsist(int reporte, int estatus,){
            //String query;
            //DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            //String fechaHoraReporte = dtf.format(LocalDateTime.now());
            //query = "update FAQs set pregunta ='"+pregunta+"',respuesta = '"+respuesta+"',id_editor='"+id_editor+"',fecha_y_hora_publicacion='"+fechaHoraReporte+"'"
              //      + "where id_FAQs = "+id_FAQs+"";
            //sql.modificar(query);
           // sql.desconectar();
       // }
}
