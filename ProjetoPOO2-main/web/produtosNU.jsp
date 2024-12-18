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
        <h2>Criando um novo produto
        </h2>

        <!-- Formulário de edição do pedido -->
        <div class="up" style="    background-color: var(--color-white);
             padding: var(--card-padding);
             box-shadow: var(--box-shadow);
             border-radius: var(--card-border-radius);">
            <form style=" margin-top: 125px; margin-bottom: 150px; font-size: 25px;" action="createProduto" method="POST">

                <span style="margin-left: 25px;"><b>NOME</b></span>
                <input type="text" name="nome" value="" style="padding: 5px; border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>CATEGORIA</b></span>
                <input type="text" name="tipo" value=""
                       style="padding: 5px;border-radius: 5px;"><br><br>


                <span style="margin-left: 25px;"><b>VALOR</b><span
                        style="margin-left: 30px">R$</span>
                    <input type="number" step="0.01" name="price" value=""
                           style="padding: 5px;border-radius: 5px;"><br><br>
                    <input type="hidden" name="userid" value=<%= userid %>>

                    <a class="btn btn-danger" type="button" href="dashboard.jsp"
                       style="padding: 15px; padding-left: 40px; padding-right: 40px; margin-left: 25px; margin-top: 25px;">Cancelar</a>

                    <button class="btn btn-outline-primary" type="submit"
                            style="padding: 15px; padding-left: 50px; padding-right: 50px; margin-left: 25px; margin-top: 25px;">Adicionar</button>
            </form>


        </div>

</main>
<%@ include file="WEB-INF/jspf/rightSection.jsp" %> <!-- Inclui rightSection -->
</body>

</html>
<% 
    conn.close(); // Fechar a conexão com o banco de dados
%>
<% } else {
        response.sendRedirect("index.jsp"); // Redireciona para a página de login
    }%>