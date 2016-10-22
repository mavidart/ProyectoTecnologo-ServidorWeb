/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Fabrica;
import Logica.ISistema;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nicop
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Registro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
            
            String nickname = request.getParameter("nick");
            String contrasena = request.getParameter("pass1");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String fecha = request.getParameter("fecha");
            String email = request.getParameter("email");
            String foto = request.getParameter("uploadedfile");
            
            String[] split = fecha.split("-");
            /*
            out.println(nickname);
            out.println(contrasena);
            out.println(nombre);
            out.println(apellido);
            out.println(fecha);
            out.println(email);
            out.println(foto);
            /*
            out.println("<br/>"+split[0]+"<br/>");//anio
            out.println(split[1]+"<br/>");//mes
            out.println(split[2]);//fecha
            */
            
            Date nacimiento = new Date(Integer.parseInt(split[0])-1900, Integer.parseInt(split[1]), Integer.parseInt(split[2]));
            
            ISistema IS = Fabrica.getInstance().getISistema();
            boolean correcto = IS.altaCliente(nickname, contrasena, nombre, apellido, email, nacimiento, foto);
            
            if(correcto){
                request.getRequestDispatcher("registrado.jsp").forward(request, response);
            }
            if(!correcto){
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
