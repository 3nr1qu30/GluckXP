package Clases;
import java.sql.*;
/**
 *
 * @author urien
 */
public class Login {
    private int codigoLogin;
    private String usuario;
    private String pass;
    private int nivel;
    Conexion sql = new Conexion();
    
    public Login(){
    }

    public Login(int codigoLogin, String usuario, String pass, int nivel) {
        this.codigoLogin = codigoLogin;
        this.usuario = usuario;
        this.pass = pass;
        this.nivel = nivel;
    }

    public int getCodigoLogin() {
        return codigoLogin;
    }

    public void setCodigoLogin(int codigoLogin) {
        this.codigoLogin = codigoLogin;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public Conexion getSql() {
        return sql;
    }

    public void setSql(Conexion sql) {
        this.sql = sql;
    }
    
    public int autenticar(String user, String clave){
        String query;
        int lvl=0;
        try{
            query = "select id_tipo_usuario from usuario where id_usuario = '" +user+"'and pass_usuario= '"+clave+"'";
            ResultSet rs = sql.consultar(query);
            System.out.println(rs);
            while(rs.next()){
                lvl = rs.getInt("id_tipo_usuario");
            }
        }
        catch (SQLException e){
            System.err.println("Algo salio mal al autenticar " + e);
        }
        return lvl;
    } 
}
