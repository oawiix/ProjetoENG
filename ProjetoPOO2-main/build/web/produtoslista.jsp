<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.conBd" %>
<% if(session.getAttribute("tipo") != null) { %>
<% conBd conexao = new conBd();
        Connection conn = conexao.getConnection();
        Statement s = conn.createStatement();
        int uid = (int)session.getAttribute("id"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <title>Painel | Projeto ENG</title>
</head>

<body>

    <%@ include file="WEB-INF/jspf/navbar.jsp" %>
    <!-- End of Sidebar Section -->

    <!-- Main Content -->
    <main>

        <!-- End of Analyses -->

        <!-- New Users Section -->

        <!-- End of New Users Section -->

        <!-- Recent Orders Table -->
        <div class="container">
            <h1 style="margin-top:20px">Produtos</h1>
        
        <div class="" >
            <%
            String pQuery = "SELECT * FROM produtos WHERE usuario_id = ?";
            PreparedStatement pQueryDone = conn.prepareStatement(pQuery);
            pQueryDone.setInt(1, uid);
            ResultSet usuarios = pQueryDone.executeQuery();
            while (usuarios.next()) {
                String nome = usuarios.getString("produto_name");
                int tipo = usuarios.getInt("produto_price");
                String data = usuarios.getString("produto_type");
                int id = usuarios.getInt("produto_id");
                %>

            <div class="col-md-4" >
                <div class="new-users">
                    <div class="user-list">
                        <div class="user">
                            <h2 ><%= nome %></h2>
                            <p></p>
                            <p><b>Categoria </b> <%= data %></p>
                            <form action="deleteProduto" method="GET">
                                <input type="hidden" name="id" value=<%= id %>>
                                <button style="margin-left: -20px" type="submit"
                                    class="btn btn-outline-danger">Excluir</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            usuarios.close();
            %>
            </div>

    </main>


    <!-- Right Section -->
    <%@ include file="WEB-INF/jspf/rightSection.jsp" %>
</body>

</html>
<% 
    conn.close(); // Fechar a conexão com o banco de dados
%>
<% }
else {
    response.sendRedirect("dashboard.jsp");
} %>