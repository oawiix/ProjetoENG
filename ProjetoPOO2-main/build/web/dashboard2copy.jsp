<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.conBd" %>

<% if (session.getAttribute("nome") != null) { %>

<% conBd conexao = new conBd();
    Connection conn = conexao.getConnection();
    Statement s = conn.createStatement();
    int uid = (int)session.getAttribute("id");
   %>
<!DOCTYPE html>
<html lang="pt-br">

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

        <%@ include file="WEB-INF/jspf/navbar.jsp" %> <!-- Inclui a navbar -->
        <%
            int page2 = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1; // Pega o valor da página
            String pesquisaAtivo = request.getParameter("pesquisaAtivo"); // Recebe o valor de pesquisaAtivo via GET   
            int limit = 7; // Define o limite de pedidos por página
            if (pesquisaAtivo != null && !pesquisaAtivo.isEmpty()) {
            limit = 6; // Define o limite de pedidos por página
            }
            int offset = (page2 - 1) * limit; // Calcula o offset

            String countQuery = "SELECT COUNT(*) FROM pedidos WHERE active = 1";  // Query para contar o total de pedidos

            if (pesquisaAtivo != null && !pesquisaAtivo.isEmpty()) {
                countQuery += " AND cliente LIKE '%" + pesquisaAtivo + "%'"; // Adiciona a cláusula de pesquisa
            }
            PreparedStatement countStmt = conn.prepareStatement(countQuery); // Prepara a query
            ResultSet countResult = countStmt.executeQuery(); // Executa a query
            countResult.next(); // Pega o resultado
            int totalRows = countResult.getInt(1); // Pega o total de pedidos
            int totalPages = (int) Math.ceil(totalRows / (double) limit); // Calcula o total de páginas

            String selectQuery = "SELECT * FROM pedidos WHERE active = 1"; // Query para selecionar os pedidos

            if (pesquisaAtivo != null && !pesquisaAtivo.isEmpty()) {
                selectQuery += " AND cliente LIKE '%" + pesquisaAtivo + "%'"; // Adiciona a cláusula de pesquisa
            }

            selectQuery += " ORDER BY id DESC LIMIT ?, ?"; // Adiciona a cláusula de limite e offset

            PreparedStatement selectStmt = conn.prepareStatement(selectQuery); // Prepara a query
            selectStmt.setInt(1, offset); // Adiciona o offset
            selectStmt.setInt(2, limit); // Adiciona o limite
            ResultSet pedidosResult = selectStmt.executeQuery(); // Executa a query
        %>
        <style>
            .pages {
                text-decoration: none;
                display: flex;
                justify-content: flex-end;
                align-items: center;
                margin-right: 20px;
                gap: 20px;
                margin-top: -50px;

            }

            .pages a {
                text-decoration: none;
            }
        </style> <!-- Fim do Estilo da paginação -->

        <!-- Conteudo da Main -->
        <main>
            <!-- Analise -->
            <h1 style="margin-top:20px">Analise</h1>
            <div class="analyse">
                <div class="sales">
                    <div class="status">
                        <div style="margin-left: -10px;">
                            <h3>Vendas</h3> 
                            <h1> 
                                <%
                                    double total = 0;  // Variável para armazenar o total 
                                    ResultSet pedidos = s.executeQuery("SELECT valor FROM pedidos WHERE active = 2");  // Query para pegar o valor dos pedidos
                                    while (pedidos.next()) {  // Loop para somar os valores
                                        total += pedidos.getDouble("valor"); // Soma os valores
                                    }
                                    out.print("Total: R$ " + String.format("%.2f", total)); // Mostra o total
                                %>
                            </h1>
                            <span style="margin-left:10px;">
                                <%
                                    double total2 = 0; // Variável para armazenar o total
                                    ResultSet pedidos2 = s.executeQuery("SELECT valor FROM pedidos WHERE active = 1"); // Query para pegar o valor dos pedidos
                                    while (pedidos2.next()) { // Loop para somar os valores
                                        total2 += pedidos2.getDouble("valor"); // Soma os valores
                                    }
                                    out.print("Em andamento: R$ " + String.format("%.2f", total2)); // Mostra o total
                                %>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="visits">
                    <div class="status">
                        <div class="info">
                            <h3>Pedidos Concluidos</h3>
                            <h1>
                                <%
                                    int total3 = 0; // Variável para armazenar o total
                                    ResultSet pedidos3 = s.executeQuery("SELECT id FROM pedidos WHERE active = 2"); // Query para pegar os pedidos concluídos
                                    while (pedidos3.next()) { // Loop para contar os pedidos
                                        total3 += 1; // Conta os pedidos
                                    }
                                    out.print(total3); // Mostra o total
                                %>
                            </h1>
                        </div>
                    </div>
                </div>
                <div class="searches">
                    <div class="status">
                        <div class="info">
                            <h3>Pedidos em Andamento</h3>
                            <h1>
                                <%
                                    int total4 = 0; // Variável para armazenar o total
                                    ResultSet pedidos4 = s.executeQuery("SELECT id FROM pedidos WHERE active = 1"); // Query para pegar os pedidos em andamento
                                    while (pedidos4.next()) { // Loop para contar os pedidos
                                        total4 += 1; // Conta os pedidos
                                    }
                                    out.print(total4); // Mostra o total
                                %> 
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fim Analise -->

            <!-- Paginacao e Formulario  -->
            <div class="recent-orders" style="padding:10px">
                <!-- Botão para abrir o pop-up -->
                <h1>Pedidos Ativos <span style="color: rgb(119, 119, 119);"><%= totalRows %></span><button id="openFormButton" class="btn btn-outline-primary" type="button"
                                          style="margin-left: 15px; margin-bottom: 2px;">Adicionar</button>
                                          </h1>
                                          <% if (pesquisaAtivo != null && !pesquisaAtivo.isEmpty()) { %>
                                          <p style="font-size: 20px;"><b>Mostrando resultados para</b> <%= pesquisaAtivo != null ? pesquisaAtivo : "Todos os pedidos" %></p>
                                            <% } %>
                                       </div>
                                        
            <!-- Paginação -->
            <div class="pages">  
                <!-- Mecanismo de busca -->

                <form action="" method="GET" style="font-size: 15px;"> 
                    <input type="text" name="pesquisaAtivo" placeholder="&nbsp; Pesquisar..." style="border-radius: 5px; padding: 5px">
                </form>
                <% if (pesquisaAtivo != null && !pesquisaAtivo.isEmpty()) { %>
                <% if (totalPages > 1) { %> 
                <% if (page2 > 1) {%> 
                <a href="?page=<%= page2 - 1%>&pesquisaAtivo=<%= pesquisaAtivo %>">Anterior</a> 
                <% } // Verifica se há mais de uma página %>

                <% for (int i = 1; i <= totalPages; i++) { %>
                <% if (i == page2) { %>
                <span><b><%= i%></b></span>
                <% } else {%>
                <a href="?page=<%= i%>&pesquisaAtivo=<%= pesquisaAtivo %> "><%= i%></a>
                <% } %>
                <% } // Loop para mostrar as páginas %>

                <% if (page2 < totalPages) { %>
                <a href="?page=<%= page2 + 1%>&pesquisaAtivo=<%= pesquisaAtivo %>">Proximo</a>
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
            <!-- Fim da Paginação -->
            <div class="recent-orders">
                <!-- O pop-up (inicialmente oculto com display: none) -->
                <div id="opentesteform" class="popup" style="display: none;
                     position: fixed;
                     width: 455px;
                     box-shadow: 0 0 15px rgba(0, 0, 0, 0.10);
                     height: 535px;
                     top: 50%;
                     left: 50%;
                     transform: translate(-50%, -50%);
                     padding: 25px;
                     border-radius: 10px;
                     background-color:var(--color-background)">
                    <div>
                        <div>
                            <!-- Formulario para adicionar um novo produto -->
                            <form id="testeform" action="addPedido" method="POST">
                                <h1>Adicionar um novo produto</h1>
                                <span style="margin-left: 25px;"><b>NOME</b></span>
                                <input type="text" name="nome" placeholder="Nome do Cliente" style="padding: 15px;background-color:var(--color-background); color: var(--color-dark);"
                                       required><hr>

                                       <span style="margin-left: 25px;"><b>PRODUTO</b></span>
                                       <select name="produto" id="produto" style="border-radius: 5px; padding:10px;padding-right: 100px; margin-left: 40px;">
                                        <%
                                        int uproduto = 0; // Variável para armazenar o produto
                                        ResultSet uprodutos = conn.createStatement().executeQuery("select * from produtos where usuario_id = 12 "); // Query para pegar os produtos
                                        while (uprodutos.next()) {
                                            String nome = uprodutos.getString("produto_name"); %>
                                            
                                            <option value="<%= nome %>"><%= nome %></option>
                                            
                                    <%
                                        }
                                    %>
                                    </select><hr>
                                <span style="margin-left: 25px;"><b>DETALHES</b></span>
                                <input type="text" name="descricao" placeholder="Nenhum" style="padding: 10px;background-color:var(--color-background); color: var(--color-dark);"><hr>

                                <span style="margin-left: 25px;"><b>QUANTIDADE</b></span>
                                <input type="number" name="quantidade" placeholder="1" value="1" min="1"
                                       style="padding: 10px;background-color:var(--color-background); color: var(--color-dark); margin-right: -100px;">

                                <button id="incrementButton" class="btn btn-outline-primary" type="button"
                                        style="margin-left:25px;">+</button>

                                <button id="decrementButton" class="btn btn-outline-primary" type="button">-</button>

                                <button id="incrementButton5x" class="btn btn-outline-primary" type="button">+5</button>

                                <button id="decrementButton5x" class="btn btn-outline-primary" type="button">-5</button><hr> 

                                <span style="margin-left: 25px;"><b>VALOR</b>&nbsp; R$</span>
                                <input type="number" step="0.01" name="valor" placeholder="0"
                                       style="padding: 15px; background-color:var(--color-background);color: var(--color-dark);"><br><br><br>

                                <button class="btn btn-danger" id="closeFormButton" type="button"
                                        style="padding-left: 155px;margin-left:15px; padding-right: 155px; padding:10px">Cancelar</button>

                                <button id="adicionarButton" class="btn btn-outline-primary" type="submit"
                                        style="padding-right: 108px; padding-top: 10px; padding-bottom: 10px; padding-left: 108px;">Adicionar</button>
                            </form>
                            <!-- Script para incremento e decremento da Quantidade -->
                            <script>

                                document.getElementById('incrementButton5x').addEventListener('click', function () {
                                    for (var i = 0; i < 5; i++) {
                                        var input = document.getElementsByName('quantidade')[0];
                                        input.value++;
                                    }
                                });

                                document.getElementById('incrementButton').addEventListener('click', function () {
                                    var input = document.getElementsByName('quantidade')[0];
                                    input.value = parseInt(input.value) + 1;
                                });

                                document.getElementById('decrementButton5x').addEventListener('click', function () {
                                    for (var i = 0; i < 5; i++) {
                                        var input = document.getElementsByName('quantidade')[0];
                                        if (input.value > 1)
                                            input.value--;
                                    }
                                });

                                document.getElementById('decrementButton').addEventListener('click', function () {
                                    var input = document.getElementsByName('quantidade')[0];
                                    if (input.value > 1)
                                        input.value = parseInt(input.value) - 1;
                                });
                            </script>
                            <!-- Fim do Script -->
                        </div>

                    </div>
                </div>
                <!-- Script para mostrar ou esconder o Pop-up -->
                <script>
                    document.getElementById('openFormButton').addEventListener('click', function () {
                        document.getElementById('opentesteform').style.display = 'block'; // Mostra o pop-up
                    });
                    document.getElementById('closeFormButton').addEventListener('click', function () {
                        document.getElementById('opentesteform').style.display = 'none'; // Esconde o pop-up
                    });
                    document.getElementById('adicionarButton').addEventListener('click', function () {
                        document.getElementById('opentesteform').style.display = 'none'; // Esconde o pop-up
                    });
                </script>
                <!-- Fim do Script -->

                <!-- Inicio Pedidos Recentes -->
                <!-- Tabela com Pedidos -->
                <!-- Cabecalho da Tabela  -->
                <table border="1" id="testetable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>CLIENTE</th>
                            <th>PRODUTO</th>
                            <th>DESCRICAO</th>
                            <th>QUANTIDADE</th>
                            <th>VALOR</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>

                    <div>
                        <!-- Corpo da Tabela -->
                        <tbody>
                            <!-- Foreach para apresentar todos os resultados na tabela -->
                            <%if (totalRows == 0) { %>
                                <tr>
                                    <td colspan="7" style="text-align: center;">Nenhum resultado encontrado</td>
                                </tr>
                            <% } else { 
                         while (pedidosResult.next()) { %>
                            <tr>
                                <td><%= pedidosResult.getInt("id") %></td>
                                <td><%= pedidosResult.getString("cliente")%></td>
                                <td><%= pedidosResult.getString("produto")%></td>
                                <td><%= pedidosResult.getString("descricao")%></td>
                                <td><%= pedidosResult.getInt("quantidade")%></td>
                                <td><b>R$: </b> <%= pedidosResult.getDouble("valor")%></td>
                                <td>
                                    <!-- Edicao do Conetudo -->
                                    <a style="text-decoration: none;"
                                       <a style="text-decoration: none;" href="updatePage.jsp?id=<%= pedidosResult.getInt("id")%>">Editar</a>
                                </td>
                                <td>
                                    <!-- Tornar o pedido inativo/concluido -->
                                    <form action="noactive" method="GET">
                                        <input type="hidden" name="id" value=<%= pedidosResult.getInt("id")%>>
                                        <button style="margin-left: -20px" type="submit"
                                                class="btn btn-outline-success">Concluir</button>

                                    </form>
                                </td>
                            </tr>
                            <% }} %>
                        </tbody>
                </table>
                <!-- Fim da Tabela com Pedidos -->

                <a href="historicoPedido.jsp" style="text-decoration: none;">Mostrar tudo</a> <!-- Link para mostrar todos os pedidos -->
            </div>

            <!-- Fim Pedidos Recentes -->

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
<% }
else {
    response.sendRedirect("index.jsp"); // Redireciona para a página de login
} %>