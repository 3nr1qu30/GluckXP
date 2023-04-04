/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.util.Date;

/**
 *
 * @author Isaac
 */

public class Asistente {

    public int getId_reporte() {
        return id_reporte;
    }

    public void setId_reporte(int id_reporte) {
        this.id_reporte = id_reporte;
    }

    public String getId_usuario_solicitante() {
        return id_usuario_solicitante;
    }

    public void setId_usuario_solicitante(String id_usuario_solicitante) {
        this.id_usuario_solicitante = id_usuario_solicitante;
    }

    public String getId_usuario_manipula_reporte() {
        return id_usuario_manipula_reporte;
    }

    public void setId_usuario_manipula_reporte(String id_usuario_manipula_reporte) {
        this.id_usuario_manipula_reporte = id_usuario_manipula_reporte;
    }

    public String getId_usuario_asignado_tarea() {
        return id_usuario_asignado_tarea;
    }

    public void setId_usuario_asignado_tarea(String id_usuario_asignado_tarea) {
        this.id_usuario_asignado_tarea = id_usuario_asignado_tarea;
    }

    public int getId_estatus() {
        return id_estatus;
    }

    public void setId_estatus(int id_estatus) {
        this.id_estatus = id_estatus;
    }

    public String getDescripcion_reporte() {
        return descripcion_reporte;
    }

    public void setDescripcion_reporte(String descripcion_reporte) {
        this.descripcion_reporte = descripcion_reporte;
    }

    public String getSolucion_reporte() {
        return solucion_reporte;
    }

    public void setSolucion_reporte(String solucion_reporte) {
        this.solucion_reporte = solucion_reporte;
    }

    public Date getFecha_hora_reporte() {
        return fecha_hora_reporte;
    }

    public void setFecha_hora_reporte(Date fecha_hora_reporte) {
        this.fecha_hora_reporte = fecha_hora_reporte;
    }
  
    
    private int id_reporte ;
    private String id_usuario_solicitante ;
    private String id_usuario_manipula_reporte ;
    private String id_usuario_asignado_tarea ;
    private int id_estatus ;
    private String descripcion_reporte ;
    private String solucion_reporte ;
    private Date fecha_hora_reporte;
    
    

   
}