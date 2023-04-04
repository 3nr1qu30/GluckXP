package Servlets;

import Clases.Login;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author urien
 */
@WebServlet(name = "Login", urlPatterns = {"/html/ServletLogin"})

public class ServletLogin extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            Login log= new Login();
            HttpSession session = request.getSession(true);
            String user,pass;
            int nivel=0;
            user=request.getParameter("CurpForm");
            pass = request.getParameter("PassForm");
            out.println(user);
            out.println(pass);
            nivel = log.autenticar(user, pass);
            out.println(nivel);
            session.setAttribute("usuario", user);
            session.setAttribute("lvl", nivel);
            switch (nivel) {
                case 0:
                    response.sendRedirect("../index.html");
                    break;
                case 1:
                    response.sendRedirect("../jsp/Doctor.jsp");
                    break;
                case 2:
                    response.sendRedirect("../jsp/Paciente.jsp");
                    break;
                case 3:
                    response.sendRedirect("../jsp/Asistente.jsp");
                    break;
                case 4:
                    response.sendRedirect("../jsp/Gerente_de_Soporte.jsp");
                    break;
                case 5:
                    response.sendRedirect("../jsp/Ingeniero_de_Soporte.jsp");
                    break;
                case 6:
                    response.sendRedirect("../jsp/Gerente_de_Mantenimiento.jsp");
                    break;
                case 7:
                    response.sendRedirect("../jsp/Ingeniero_de_Mantenimiento.jsp");
                    break;
                case 8:
                    response.sendRedirect("../jsp/Editor_de_FAQs.jsp");
                    break;
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
