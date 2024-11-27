<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="test.AppListener" %>
<% if(session.getAttribute("nome") != null) { %>
<% AppListener appListener = new AppListener();
        Connection conn = appListener.getConnection();
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
    <title>Historico | Projeto ENG</title>
</head>

<body>
    <style>
        aside .sidebar a.produtos{
            color: var(--color-dark);
        }
        
        aside .sidebar a.produtos span{
            margin-left: 0.6rem;
        }
         </style>
    <%@ include file="WEB-INF/jspf/navbar.jsp" %> <!-- Inclui navbar -->
 
    <%
    int page2 = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1; // Pega o valor da página
    String pesquisaNotAtivo = request.getParameter("pesquisaNotAtivo"); // Recebe o valor de pesquisaNotAtivo via GET   
    int limit = 12; // Define o limite de pedidos por página
    if (pesquisaNotAtivo != null && !pesquisaNotAtivo.isEmpty()) {
    limit = 11; // Define o limite de pedidos por página
    }
    int offset = (page2 - 1) * limit; // Calcula o offset

    String countQuery = "SELECT COUNT(*) FROM produtos WHERE usuario_id = ?";  // Query para contar o total de pedidos

    if (pesquisaNotAtivo != null && !pesquisaNotAtivo.isEmpty()) {
        countQuery += " AND produto_name LIKE '%" + pesquisaNotAtivo + "%'"; // Adiciona a cláusula de pesquisa
    }
    PreparedStatement countStmt = conn.prepareStatement(countQuery); // Prepara a query
    countStmt.setInt(1, uid); // Adiciona o id do usuário
    ResultSet countResult = countStmt.executeQuery(); // Executa a query
    countResult.next(); // Pega o resultado
    int totalRows = countResult.getInt(1); // Pega o total de pedidos
    int totalPages = (int) Math.ceil(totalRows / (double) limit); // Calcula o total de páginas

    String selectQuery = "SELECT * FROM produtos WHERE usuario_id = ?"; // Query para selecionar os pedidos

    if (pesquisaNotAtivo != null && !pesquisaNotAtivo.isEmpty()) {
        selectQuery += " AND produto_name LIKE '%" + pesquisaNotAtivo + "%'"; // Adiciona a cláusula de pesquisa
    }

    selectQuery += " ORDER BY produto_id DESC LIMIT ?, ?"; // Adiciona a cláusula de limite e offset

    PreparedStatement selectStmt = conn.prepareStatement(selectQuery); // Prepara a query
    selectStmt.setInt(1, uid); // Adiciona o id do usuário
    selectStmt.setInt(2, offset); // Adiciona o offset
    selectStmt.setInt(3, limit); // Adiciona o limite
    ResultSet pedidosResult = selectStmt.executeQuery(); // Executa a query
%>
    <!-- Conteudo Main -->
    <main>
        <style>
            .pages {
                text-decoration: none;
                display: flex;
                justify-content: flex-end;
                gap: 20px;
                margin-bottom: -130px;
                margin-top: 75px;
                margin-right: 20px;

            }

            .pages a {
                text-decoration: none;
            }
        </style>
        <!-- Paginacao -->
        <div class="pages">
            <form action="" method="GET" style="font-size: 15px;"> 
                <input type="text" name="pesquisaNotAtivo" placeholder="&nbsp; Pesquisar..." style="border-radius: 5px; padding: 5px; margin-top: -5px;">
            </form>
            <% if (pesquisaNotAtivo != null && !pesquisaNotAtivo.isEmpty()) { %>
                <% if (totalPages > 1) { %> 
                <% if (page2 > 1) {%> 
                <a href="?page=<%= page2 - 1%>&pesquisaNotAtivo=<%= pesquisaNotAtivo %>">Anterior</a> 
                <% } // Verifica se há mais de uma página %>

                <% for (int i = 1; i <= totalPages; i++) { %>
                <% if (i == page2) { %>
                <span><b><%= i%></b></span>
                <% } else {%>
                <a href="?page=<%= i%>&pesquisaNotAtivo=<%= pesquisaNotAtivo %> "><%= i%></a>
                <% } %>
                <% } // Loop para mostrar as páginas %>

                <% if (page2 < totalPages) { %>
                <a href="?page=<%= page2 + 1%>&pesquisaNotAtivo=<%= pesquisaNotAtivo %>">Proximo</a>
                <% } %>
                <% } // Verifica se há mais páginas %>
                <% } else if (totalPages > 1) { %> 
                    <% if (page2 > 1) {%> 
                    <a href="?page=<%= page2 - 1%>">Anterior</a> 
                    <% } // Verifica se há mais de uma página %>
    
                    <% for (int i = 1; i <= totalPages; i++) { %>
                    <% if (i == page2) { %>
                    <span><b><%= i%></b></span>
                    <% } else {%>
                    <a href="?page=<%= i%>"><%= i%></a>
                    <% } %>
                    <% } // Loop para mostrar as páginas %>
    
                    <% if (page2 < totalPages) { %>
                    <a href="?page=<%= page2 + 1%>">Proximo</a>
                    <% } } %>
        </div>
        <!-- Fim Paginacao -->

        <!-- Tabela Historico de Pedidos -->
        <div class="recent-orders" style="margin-top: 50px;">
            <!-- Botão para abrir o pop-up -->
            <h1>Todos os produtos       
                <p>                 
                    <span style="color: rgb(119, 119, 119);"><%= totalRows %></span>
            </p> 
            <button id="openFormButton" class="btn btn-outline-primary" type="button"
                                          style="">Adicionar um novo produto</button>
        </h1>
                <% if (pesquisaNotAtivo != null && !pesquisaNotAtivo.isEmpty()) { %>
                    <p style="font-size: 20px;"><b>Mostrando resultados para</b> <%= pesquisaNotAtivo != null ? pesquisaNotAtivo : "Todos os pedidos" %></p>
                      <% } %>


                      <div id="opentesteform" class="popup" style="display: none;
                      position: fixed;
                      width: 455px;
                      box-shadow: 0 0 15px rgba(0, 0, 0, 0.10);
                      height: 380px;
                      top: 50%;
                      left: 50%;
                      transform: translate(-50%, -50%);
                      padding: 25px;
                      border-radius: 10px;
                      background-color:var(--color-form)">
                     <div>
                        <style>
                            .addinput {
                                padding: 10px 15px 10px;background-color:var(--color-background); color: var(--color-dark); border-radius: 8px; margin-left:10px;
                            }
                        </style>
                         <div>
                             <!-- Formulario para adicionar um novo produto -->
                             <form id="testeform" action="createProduto" method="POST">
                                <h1>Adicionar um novo produto</h1>
                                <span style="margin-left: 25px;"><b>NOME</b></span>
                                <input class="addinput" type="text" name="nome" placeholder="Nome do Cliente" style="padding: 15px;background-color:var(--color-background); color: var(--color-dark);"
                                       required><hr>
                           
                                   
                                <span style="margin-left: 25px;"><b>CATEGORIA</b></span>
                                <input class="addinput" type="text" name="tipo" placeholder="Nenhum" style="padding: 10px;background-color:var(--color-background); color: var(--color-dark);"><hr>


                                <span style="margin-left: 25px;"><b>VALOR</b>&nbsp; R$</span>
                                <input class="addinput" type="number" step="0.01" name="price" placeholder="0"
                                       ><br><br><br>

                                       <input type="hidden" name="userid" value=<%= uid %>> <!-- Input para armazenar o id do usuário -->
                                <button class="btn btn-danger" id="closeFormButton" type="button"
                                        style="padding-left: 155px;margin-left:15px; padding-right: 155px; padding:10px">Cancelar</button>

                                <button id="adicionarButton" class="btn btn-outline-primary" type="submit"
                                        style="padding-right: 108px; padding-top: 10px; padding-bottom: 10px; padding-left: 108px; margin-left: 10px;">Adicionar</button>
                            </form>
                             <!-- Script para incremento e decremento da Quantidade -->
                             <!-- Fim do Script -->
                         </div>
 
                     </div>
                 </div>
                 <div id="openconfirm" class="popup" style="display: none;
                      position: fixed;
                      width: 455px;
                      box-shadow: 0 0 15px rgba(0, 0, 0, 0.10);
                      height: 150px;
                      top: 50%;
                      left: 50%;
                      transform: translate(-50%, -50%);
                      padding: 25px;
                      border-radius: 10px;
                      background-color:var(--color-background)">
                    <h1>Produto criado com sucesso.</h1>
                    <button id="closeconfirm" class="btn btn-outline-primary" type="button"
                                          >Voltar</button>
                                          <button id="openFormButton3" class="btn btn-outline-primary" type="button"
                                          >Adicionar mais um produto</button>
                    </div>
                 <!-- Script para mostrar ou esconder o Pop-up -->
                    <% 
                    if(request.getParameter("confirm") != null) { %>
                        <script>
                            document.getElementById('openconfirm').style.display = 'block'; // Mostra o pop-up
                        </script> 
                        <% } 
                    %>

                 <script>
                    document.getElementById('closeconfirm').addEventListener('click', function () {
                        document.getElementById('openconfirm').style.display = 'none'; // Esconde o pop-up
                    });
                     document.getElementById('openFormButton').addEventListener('click', function () {
                         document.getElementById('opentesteform').style.display = 'block'; // Mostra o pop-up
                     });
                     document.getElementById('openFormButton3').addEventListener('click', function () {
                        document.getElementById('openconfirm').style.display = 'none'; // Esconde o pop-up
                         document.getElementById('opentesteform').style.display = 'block'; // Mostra o pop-up
                     });
                     document.getElementById('closeFormButton').addEventListener('click', function () {
                         document.getElementById('opentesteform').style.display = 'none'; // Esconde o pop-up
                     });
                     document.getElementById('adicionarButton').addEventListener('click', function () {
                         document.getElementById('opentesteform').style.display = 'none'; // Esconde o pop-up
                     });
 
                 </script>




            <table border="1" id="testetable">
                <!-- Cabecalho da Tabela -->
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>PRODUTO</th>
                        <th>CATEGORIA</th>
                        <th>VALOR</th>
                        <th></th>
                    </tr>
                </thead>

                <!-- Corpo da Tabela -->
                <tbody>
                    <%if (totalRows == 0) { %>
                        <tr>
                            <td colspan="7" style="text-align: center;">Nenhum resultado encontrado</td>
                        </tr>
                    <% } else { 
                         while (pedidosResult.next()) { %>
                                <tr>
                                    <td><%= pedidosResult.getInt("produto_id") %></td>
                                    <td><%= pedidosResult.getString("produto_name") %></td> 
                                    <td><%= pedidosResult.getString("produto_type") %></td>
                                    <td><b>R$: </b><%= pedidosResult.getInt("produto_price") %> </td>
                                    <td>
                                        <!-- Excluir pedido do Banco de Dados -->
                                        <form action="deleteProduto" method="GET">
                                        <input type="hidden" name="id" value=<%= pedidosResult.getInt("produto_id") %>>
                                            <button style="margin-left: -20px" type="submit"
                                                class="btn btn-outline-danger">Excluir</button>

                                        </form>
                                    </td>
                                </tr>
                        <% }} %>
                </tbody>
            </table>

        </div>
        <!-- Fim Tabela Historico de Pedidos -->

    </main>
     <!-- Fim do Main -->

    <!-- Conteudo da Direia -->
    <!-- Nome do Usuario + Cargo e Hora -->
        <!-- Perfil do Usuario -->
        <!-- Lembretes -->
        <%@ include file="WEB-INF/jspf/rightSection.jsp" %>
        <!-- Fim Perfil do Usuario -->
     <!-- Fim do Nome do Uusuario + Cargo e Hora  -->

</body>
</html>
<% 
    conn.close(); // Fechar a conexão com o banco de dados
%>
<% }
else {
    response.sendRedirect("index.jsp"); // Redireciona para a página de login
} %>