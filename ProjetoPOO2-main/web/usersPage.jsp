<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.conBd" %>
<% if (session.getAttribute("nome") != null) { %>
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
        <% 
        String pQuery = "SELECT * FROM usuarios WHERE id = ?";
        PreparedStatement pQueryDone = conn.prepareStatement(pQuery);
        pQueryDone.setInt(1, uid);
        ResultSet usuarios = pQueryDone.executeQuery();
        %>


        <div class="container">
            <h1 style="margin-top:20px">Pagina de Usuario</h1>
        
            <div class="up" style="    background-color: var(--color-white);
            padding: var(--card-padding);
            box-shadow: var(--box-shadow);
            border-radius: var(--card-border-radius);">

            <style>
                .guias {
                margin-right: 20px;
                text-decoration: none;
                color: var(--color-text);
                transition: color 0.3s;
                font-weight: 700;
                font-size: 20px;
                }
                .otguias {
                color: var(--color-usertext);
                text-decoration: none;
                font-size: 20px;
                transition: color 0.3s;
                font-weight: 300;
                }
                .otguias:hover {
                    color: var(--color-dark);
                }
                .guias:hover {
                    color: var(--color-dark);
            }
                </style>

            <nav style="background-color: var(--color-white)">
                <div class="container-fluid">
                    <a class="guias" href="usersPage.jsp">Geral</a>
                    <a class="otguias" href="usersPage2.jsp">Seguranca</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                    </div>
                    </div>
                    </nav>
                <div style="margin-top:25px" >
            <% if (usuarios.next()) { %>
            <h1><%= usuarios.getString("nome") %> <span style="font-size: 18px; color: var(--color-usertext); margin-left: 5px;">(<%= usuarios.getString("usuario") %>)</span><br>
                <span style="font-size: 14px; font-weight: 300;">Entrou em <%= usuarios.getString("data") %></span></h1>
            <hr>
            
                <style>
                    .info {
                        background-color: #f0f0f0;
                        border-radius: 5px;
                        padding: 10px;
                        margin-bottom: 15px;
                    }
                    #savebutton {
                        padding: 10px 15px 10px;
                        font-weight: 700;
                        border-radius: 5px;
                        margin-left: 910px;
                    }
                </style>

            <form style="margin-top: 20px;">
            <h2>Nome</h2>
            <input class="info" type="text" name="nome" value="<%= usuarios.getString("nome") %>"> 
            <button class="btn btn-outline-success" id="savebutton" type="submit">Salvar</button>   
            </form>
               <% } %>
            </div>
       </div>

    </main>


    <!-- Right Section -->
    <%@ include file="WEB-INF/jspf/rightSection.jsp" %>
</body>

</html>
<% 
    conn.close(); // Fechar a conexão com o banco de dados
%>
<% } else {
    response.sendRedirect("index.jsp");
} %>