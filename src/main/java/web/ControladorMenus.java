/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joseadolfoizaguirreflores
 */

public class ControladorMenus extends HttpServlet {

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

        String accion = request.getParameter("accion");

        switch (accion) {
            case "Dashboard":
                request.getRequestDispatcher("Vistas/Dashboard.jsp").forward(request, response);
                break;
            case "Perfil":
                request.getRequestDispatcher("Vistas/Perfil.jsp").forward(request, response);
                break;
            case "Administradores":
                request.getRequestDispatcher("Vistas/Administradores.jsp").forward(request, response);
                break;
            case "Magistrados":
                request.getRequestDispatcher("Vistas/Magistrados.jsp").forward(request, response);
                break;
            case "EncargadoMesa":
                request.getRequestDispatcher("Vistas/EncargadoMesa.jsp").forward(request, response);
                break;
            case "Electores":
                request.getRequestDispatcher("Vistas/Electores.jsp").forward(request, response);
                break;
            case "Partidos":
                request.getRequestDispatcher("Vistas/Partidos.jsp").forward(request, response);
                break;
            case "Presidentes":
                request.getRequestDispatcher("Vistas/Presidentes.jsp").forward(request, response);
                break;
            case "Alcaldes":
                request.getRequestDispatcher("Vistas/Alcaldes.jsp").forward(request, response);
                break;
            case "Diputados":
                request.getRequestDispatcher("Vistas/Diputados.jsp").forward(request, response);
                break;
            case "Mesas":
                request.getRequestDispatcher("Vistas/Mesas.jsp").forward(request, response);
                break;
            case "Votaciones":
                request.getRequestDispatcher("Vistas/Votacion.jsp").forward(request, response);
                break;
            case "MesaCerrada":
                response.sendRedirect("Vistas/Info_MesaCerrada.jsp");
    
                break;
            case "Inhabilitado":
                response.sendRedirect("Vistas/Info_UsuarioNoHabilitado.jsp");
    
                break;
            case "YaVoto":
                response.sendRedirect("Vistas/Info_YaVoto.jsp");
    
                break;
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
