package action;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.AppListener;

/**
 *
 * @author dange
 */
@WebServlet(urlPatterns = {"/login2"})
public class login extends HttpServlet {

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
        
                if (request.getParameter("usuario") == null || request.getParameter("senha") == null) {
                    response.sendRedirect("index.jsp");
                    // Redirect to index.jsp if the form is empty or if the usuario and senha fields are empty.
                }
        
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
        
                try {
                    try {
                        conn = AppListener.getConnection();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    stmt = conn.createStatement();

                    String usuario = request.getParameter("usuario");
                    String senha = request.getParameter("senha");

                    String sql = "SELECT * FROM usuarios " +
                            "WHERE usuario = '" + usuario + "' " +
                            "AND senha = '" + senha + "'";

                    rs = stmt.executeQuery(sql);
        
                    // ...
                    if (rs.next()) {
                        HttpSession session = request.getSession(); // Initialize the session object
                        session.setAttribute("usuario", usuario);
                        session.setAttribute("nome", rs.getString("nome"));
                        session.setAttribute("tipo", rs.getString("tipo"));
                        session.setAttribute("id", rs.getInt("id"));
                        response.sendRedirect("dashboard.jsp");
                    }
                        // If the number of records found is greater than zero, store the user information in the session and redirect to dashboard.jsp.
                     else {
                        response.sendRedirect("login.jsp?wt=1");
                        // Otherwise, redirect to indexw.jsp.
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
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
