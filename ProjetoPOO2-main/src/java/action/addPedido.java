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

import model.pedido;
@WebServlet(urlPatterns = {"/addPedido"})
public class addPedido extends HttpServlet {

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
                    pedido pedido = new pedido();

                    // Obtém os valores enviados pelo formulário
                    String cliente = request.getParameter("nome");
                    String produto = request.getParameter("produto");
                    String descricao = request.getParameter("descricao");
                    int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                    double valor = Double.parseDouble(request.getParameter("valor"));
                    int userid = Integer.parseInt(request.getParameter("userid"));

                    // Define os valores do pedido
                    pedido.setCliente(cliente);
                    pedido.setProduto(produto);
                    pedido.setDescricao(descricao);
                    pedido.setQuantidade(quantidade);
                    pedido.setValor(valor);
                    pedido.setUserId(userid);

                    // Salva o pedido
                    pedido.save();

                    // Redireciona para a página de dashboard
                    response.sendRedirect("dashboard.jsp");
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
