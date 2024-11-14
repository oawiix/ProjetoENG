<%@ page import="java.sql.*" %>
<%@ page import="model.conBd" %>
<% if (session.getAttribute("nome") != null) { // Verifica se o usuário está logado %>
<% conBd conexao=new conBd(); // Instancia a conexão
            Connection conn = conexao.getConnection(); // Pega a conexão
            Statement s = conn.createStatement(); // Cria um statement 
            Integer userid = (Integer) session.getAttribute("id"); %>  


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <title>Editar | Projeto ENG</title>
</head>
<%@ include file="WEB-INF/jspf/navbar.jsp" %> <!-- Inclui navbar -->
<style>
    .up form input {
        margin-left: 20px;
        background-color: rgb(241, 241, 241);
    }
</style>
<main>

    <h2>
        <h1>Produtos</h1>
        </h2>

        <!-- Formulário de edição do pedido -->
        <div class="up" style="    background-color: var(--color-white);
             padding: var(--card-padding);
             box-shadow: var(--box-shadow);
             border-radius: var(--card-border-radius);">
           
           <h1 style="">
           
           Produto criado com sucesso.</h1>
           <a href="produtos.jsp" style="text-decoration: none; font-size: 20px; font-weight: 500; padding: 20px">Voltar</a>
            <a href="pteste.jsp" style="text-decoration: none; font-size: 20px; font-weight: 500; ">Ver produtos</a>


        </div>

</main>
<%@ include file="WEB-INF/jspf/rightSection.jsp" %> <!-- Inclui rightSection -->
</body>

</html>
<% } else {
        response.sendRedirect("index.jsp"); // Redireciona para a página de login
    }%>