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
    <style>
        aside .sidebar a.perfil{
            color: var(--color-dark);
        }
        
        aside .sidebar a.perfil span{
            margin-left: 0.6rem;
        }
         </style>
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
        margin-right: 20px;
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
                    <a class="otguias" href="usersPage.jsp">Geral</a>
                    <a class="guias" href="usersPage2.jsp">Seguranca</a>
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
                    .info2 {
                        background-color: #f0f0f0;
                        border-radius: 5px;
                        padding: 10px 15px 10px;
                        margin-bottom: 15px;
                    }
                    #confirmbutton {
                        padding: 10px 15px 10px;
                        font-weight: 700;
                        border-radius: 5px;
                    }
                    #savebutton {
                        padding: 10px 15px 10px;
                        font-weight: 700;
                        border-radius: 5px;
                        margin-left: 970px;
                    }
                </style>

<div id="openconfirm3" class="popup" style="display: none;
position: fixed;
width: 415px;
box-shadow: 0 0 15px rgba(0, 0, 0, 0.10);
height: 170px;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
padding: 25px;
border-radius: 10px;
background-color:var(--color-background)">
<h1>As alteracoes foram salvas</h1>
<button id="closeconfirm" class="btn btn-outline-primary" type="button"
                    >Confirmar</button>
</div>
<!-- Script para mostrar ou esconder o Pop-up -->
<% 
if(request.getParameter("success") != null) 
    { %>
  <script>
      document.getElementById('openconfirm3').style.display = 'block'; // Mostra o pop-up
      document.getElementById('closeconfirm').addEventListener('click', function () {
                        document.getElementById('openconfirm3').style.display = 'none'; // Esconde o pop-up
                    });
  </script> 
  <% } 
%>


<div id="openconfirm2" class="popup" style="display: none;
position: fixed;
width: 415px;
box-shadow: 0 0 15px rgba(0, 0, 0, 0.10);
height: 150px;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
padding: 25px;
border-radius: 10px;
background-color:var(--color-background)">
<h1>As senhas nao conferem</h1>
<button id="closeconfirm2" class="btn btn-outline-primary" type="button"
                    >Voltar</button>
</div>
<!-- Script para mostrar ou esconder o Pop-up -->
<% 
if(request.getParameter("error") != null) 
    { %>
  <script>
      document.getElementById('openconfirm2').style.display = 'block'; // Mostra o pop-up
      document.getElementById('closeconfirm2').addEventListener('click', function () {
                        document.getElementById('openconfirm2').style.display = 'none'; // Esconde o pop-up
                    });
  </script> 
  <% } 
%>
            <form style="margin-top: 20px;" action="updateUsuario" method="POST">
                <h2>Nome</h2>
            <input class="info2" type="text" name="nome" value="<%= usuarios.getString("nome") %>"> 
             <h2>Usuario</h2>
             <input class = "info2" type="text" name="usuario" value="<%= usuarios.getString("usuario") %>">	
                <h2>Email</h2>
                <input class="info2" type="email" name="email" value="<%= usuarios.getString("email") %>"> 
            <h2>Senha</h2>
            <input type="hidden" name="usuario" value=<%= usuarios.getString("usuario") %>>
            <input class="info2" type="password" name="senha2"  placeholder="Insira a nova senha..."><br>
            <input class="info2" type="password" name="senha3"  placeholder="Confirme a senha..."><br>
            <input type="hidden" name="senhadb" value=<%= usuarios.getString("senha") %>>
            <input type="hidden" name="tipo" value=<%= usuarios.getString("tipo") %>>
            <input type="hidden" name="id" value=<%= uid %>>
            <h2>Para salvar as alteracoes, insira a senha atual</h2>
            <input class="info2" type="password" name="senha1" value="" placeholder="Senha atual..."><br>
            <button class="btn btn-outline-danger" id="confirmbutton" type="button">Excluir conta</button> 
            <button class="btn btn-outline-success" id="savebutton" type="submit">Salvar</button>   
        </form>

               <% } %>

               <div id="openconfirm" class="popup" style="display: none;
               position: fixed;
               width: 400px;
               box-shadow: 0 0 15px rgba(0, 0, 0, 0.10);
               height: 175px;
               top: 50%;
               left: 50%;
               transform: translate(-50%, -50%);
               padding: 25px;
               border-radius: 10px;
               background-color:var(--color-background)">
                <h2>Tem certeza que deseja excluir sua conta?</h2>
                <h3>Este processo e irreversivel</h3>

                <form action="deleteUser2" method="POST">
                <input type="hidden" name="id" value=<%= uid %>>
                <button type="submit" class="btn btn-danger" style="margin-top: 20px; margin-right: 5px;">Sim</button>
                <button type="button" class="btn btn-primary" style="margin-top: 20px;" id="closeform">Nao</button>
            </form>
            </div>
       </div>
<script>
 document.getElementById('confirmbutton').addEventListener('click', function () {
    document.getElementById('openconfirm').style.display = 'block';});
document.getElementById('closeform').addEventListener('click', function () {
    document.getElementById('openconfirm').style.display = 'none';});
</script>
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