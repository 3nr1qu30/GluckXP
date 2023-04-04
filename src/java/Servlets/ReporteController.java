package Servlets;

import Clases.ReporteDAO;
import Clases.Conexion;
import Clases.Asistente;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReporteController")
public class ReporteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReporteDAO reporteDAO;

    public void init() throws ServletException {
        super.init();
        Conexion conexionBD = new Conexion();
        Connection connection = conexionBD.getConnection();
        if (connection == null) {
            // Mostrar mensaje de error o lanzar una excepción
            System.out.println("Error al conectar a la base de datos.");
        } else {
            reporteDAO = new ReporteDAO(connection);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("agregar")) {
            request.getRequestDispatcher("jsp/Asistente.jsp").forward(request, response);
        } else {
            List<Asistente> reportes = null;
            try {
                reportes = reporteDAO.getAllReportes();
            } catch (SQLException ex) {
                Logger.getLogger(ReporteController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("reportes", reportes);
            request.getRequestDispatcher("jsp/Asistente.jsp").forward(request, response);
        }
    }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String desc = request.getParameter("descripcion");
        String usuSolicitante = request.getParameter("usuario");
        String usuAsignado = "MORI050816HDFNDSA3";
        String sol = "Sin solución";
        String gerenteSoporteId = request.getParameter("gerentesSoporte");
      

        Asistente reporte = new Asistente();
        reporte.setDescripcion_reporte(desc);
        reporte.setId_estatus(1); //asignamos automaticamente el valor del estatus
        reporte.setSolucion_reporte(sol); 
        reporte.setId_usuario_solicitante(usuSolicitante);
        reporte.setId_usuario_asignado_tarea(gerenteSoporteId);
        reporte.setId_usuario_manipula_reporte(usuAsignado);
        
        try {
            reporteDAO.addReporte(reporte);
        } catch (SQLException ex) {
            Logger.getLogger(ReporteController.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Redirigir a la página que muestra la lista de reportes
        List<Asistente> reportes = null;
        try {
            reportes = reporteDAO.getAllReportes();
        } catch (SQLException ex) {
            Logger.getLogger(ReporteController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("reportes", reportes);
        request.getRequestDispatcher("jsp/ver_reportes.jsp").forward(request, response);
    }
}