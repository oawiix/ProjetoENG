package action;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.usuario;


/**
 *
 * @author dange
 */
@WebServlet(urlPatterns = {"/updateUsuario"})
public class updateUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws Exception 
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                try {
                    if (request.getParameter("senha2").equals(request.getParameter("senha3")) && request.getParameter("senha2").length() > 0 && request.getParameter("senha1").equals(request.getParameter("senhadb"))) {
                    usuario user = new usuario();
                    String nome = request.getParameter("nome");
                    String email = request.getParameter("email");
                    String usuario = request.getParameter("usuario");
                    String senha = request.getParameter("senha3");
                    String tipo = request.getParameter("tipo");
                    int id = Integer.parseInt(request.getParameter("id"));

                    user.setNome(nome);
                    user.setEmail(email);
                    user.setUsuario(usuario);
                    user.setSenha(senha);
                    user.setTipo(tipo);
                    user.setId(id);

                    user.update();

                    // Redireciona para a página de dashboard após a atualização
                    response.sendRedirect("usersPage2.jsp?success=1"); }
                    else {
                        response.sendRedirect("usersPage2.jsp?error=1");
                    }
                } catch (Exception e) {
                    // Handle the exception here
                    e.printStackTrace();
                }}
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
