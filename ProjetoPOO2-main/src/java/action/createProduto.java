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

import model.produto;
@WebServlet(urlPatterns = {"/createProduto"})
public class createProduto extends HttpServlet {

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
                    produto produto = new produto();

                    // Obtém os valores enviados pelo formulário
                    String nome = request.getParameter("nome");
                    String tipo = request.getParameter("tipo");
                    Double price = Double.parseDouble(request.getParameter("price"));
                    int userid = Integer.parseInt(request.getParameter("userid"));

                    // Define os valores do pedido
                    produto.setNome(nome);
                    produto.setTipo(tipo);
                    produto.setValor(price);
                    produto.setUserId(userid); 

                    // Salva o pedido
                    produto.save();

                    // Redireciona para a página de dashboard
                    response.sendRedirect("pteste.jsp?confirm=1");
                } catch (Exception e) {
                    // Handle the exception here
                    e.printStackTrace();
                }
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
