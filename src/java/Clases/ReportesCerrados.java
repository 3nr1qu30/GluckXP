package Clases;
import java.sql.*;
public class ReportesCerrados {
    private int id_reporte;
    private String descripcion,resultado;
    Conexion sql = new Conexion();
    
    public ReportesCerrados(){
    }
    
    public ReportesCerrados(int id_reporte, String descripcion, String resultado) {
        this.id_reporte = id_reporte;
        this.descripcion = descripcion;
        this.resultado = resultado;
    }

    public int getId_reporte() {
        return id_reporte;
    }

    public void setId_reporte(int id_reporte) {
        this.id_reporte = id_reporte;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public Conexion getSql() {
        return sql;
    }

    public void setSql(Conexion sql) {
        this.sql = sql;
    }
    public ResultSet ConsultarReportesCerrados(){
        String query;
        query = "select * from reporte where id_estatus = 8";
        return sql.consultar(query);
    }
    public ResultSet ConsultarReportesCerrados(int id_Reporte){
        String query;
        query = "select * from reporte where id_reporte = "+id_Reporte+"";
        return sql.consultar(query);
    }
}
