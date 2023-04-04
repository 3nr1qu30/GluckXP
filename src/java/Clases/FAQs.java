package Clases;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author urien
 */
public class FAQs {
    int id_faq;
    String id_edtitor,pregunta,respuesta,fechayhora;
    Conexion sql = new Conexion();

    public FAQs(){
    }
    
    public FAQs(int id_faq, String id_edtitor, String pregunta, String respuesta, String fechayhora) {
        this.id_faq = id_faq;
        this.id_edtitor = id_edtitor;
        this.pregunta = pregunta;
        this.respuesta = respuesta;
        this.fechayhora = fechayhora;
    }

    public int getId_faq() {
        return id_faq;
    }

    public void setId_faq(int id_faq) {
        this.id_faq = id_faq;
    }

    public String getId_edtitor() {
        return id_edtitor;
    }

    public void setId_edtitor(String id_edtitor) {
        this.id_edtitor = id_edtitor;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public String getFechayhora() {
        return fechayhora;
    }

    public void setFechayhora(String fechayhora) {
        this.fechayhora = fechayhora;
    }

    public Conexion getSql() {
        return sql;
    }

    public void setSql(Conexion sql) {
        this.sql = sql;
    }
    public boolean PublicarFAQ (String pregunta,String respuesta,String id_editor){
        String query;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String fechaHoraReporte = dtf.format(LocalDateTime.now());
        query = "insert into FAQs values(default,'"+pregunta+"','"+respuesta+"','"+id_editor+"','"+fechaHoraReporte+"')";
        boolean publicacion = sql.ejecutar(query);
        sql.desconectar();
        return publicacion;
    }
    public ResultSet VisualizarFAQ(){
        String query;
        query = "select * from FAQs";
        return sql.consultar(query);
    }
        public ResultSet VisualizarFAQEspecifica(int id_faq){
        String query;
        query = "select * from FAQs where id_FAQs = "+id_faq+"";
        return sql.consultar(query);
    }
        public void ModificarFAQ(String pregunta,String respuesta,String id_editor, int id_FAQs){
            String query;
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String fechaHoraReporte = dtf.format(LocalDateTime.now());
            query = "update FAQs set pregunta ='"+pregunta+"',respuesta = '"+respuesta+"',id_editor='"+id_editor+"',fecha_y_hora_publicacion='"+fechaHoraReporte+"'"
                    + "where id_FAQs = "+id_FAQs+"";
            sql.modificar(query);
            sql.desconectar();
        }
        public void EliminarFAQ(int id_FAQs){
            String query;
            query = "delete from FAQs where id_FAQs = "+id_FAQs+"";
            sql.modificar(query);
            sql.desconectar();
        }
}
