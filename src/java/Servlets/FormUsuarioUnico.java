package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CLON 2018
 */
@WebServlet(name = "FormUsuarioUnico", urlPatterns = {"/FormUsuarioUnico"})
public class FormUsuarioUnico extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
   String uno = request.getParameter("uno");
   String dos = request.getParameter("dos");
   String tres = request.getParameter("tres");
   String cuatro = request.getParameter("cuatro");
   String cinco = request.getParameter("cinco");
   String seis = request.getParameter("seis");
   
   response.setContentType("text/html; charset=UTF-8");
   try(PrintWriter out = response.getWriter())
   {
    
        out.println("Nombre" + uno);
       }

    }

}
