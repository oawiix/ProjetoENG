<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.conBd" %>

<% conBd conexao2 = new conBd();
    Connection conn2 = conexao2.getConnection();
    Statement s2 = conn.createStatement();
        int uid2 = (int)session.getAttribute("id");

   %>
<div class="right-section">
    <div class="nav">
        <div class="dark-mode" style="border-radius:8px; margin-top: 10px;">
            <span style="border-radius:15px 0px 0px 15px">
                L
            </span>
            <span style="border-radius:0px 15px 15px 0px">
                D
            </span>
        </div>

        <div class="profile">
            <div class="info">
                <p>hoje<b><br>
                        <!-- Usuario  -->

                        <!-- Hora -->
                        <small class="text-muted">
                            <%= java.time.LocalDate.now() %>
                        </small>
            </div>
        </div>
    </div>
    <script>const darkMode = document.querySelector('.dark-mode');
        const darkModeState = localStorage.getItem('darkModeState');
        
        if (darkModeState === 'true') {
            document.body.classList.add('dark-mode-variables');
            darkMode.querySelector('span:nth-child(2)').classList.add('active');
            
        } 
        else {
            document.body.classList.remove('dark-mode-variables');
            darkMode.querySelector('span:nth-child(1)').classList.add('active');
        }
        
        darkMode.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode-variables');
            darkMode.querySelector('span:nth-child(1)').classList.toggle('active');
            darkMode.querySelector('span:nth-child(2)').classList.toggle('active');
        
            const isDarkMode = document.body.classList.contains('dark-mode-variables');
            localStorage.setItem('darkModeState', isDarkMode);
        
            if (isDarkMode) {
                darkMode.querySelector('span:nth-child(1)').classList.remove('active');
            } else {
                darkMode.querySelector('span:nth-child(2)').classList.remove('active');
            }
        });</script>
    <!-- Fim do Nome do Uusuario + Cargo e Hora  -->

    <!-- Perfil do Usuario -->
    <div style="margin-top:22px" class="user-profile">
        <div class="usuario-logado" style="margin-top:10px">
            <!-- Usuario -->
            <% String nome2=(String) session.getAttribute("nome"); %>
            <a href="usersPage.jsp" style="text-decoration: none;">
                <h2>
                    <%= nome2 %>
                </h2>
            </a>
                <!-- Cargo -->
                    <p>
                    </p>
        </div>
    </div>
    <!-- Fim Perfil do Usuario -->

    <!-- Lembretes - Nao finalizado -->
    <div class="reminders">
        <div class="header">
            <h2>Lembretes</h2>
            <span class="material-icons-sharp">
                notifications_none
            </span>
        </div>

        <% 
            String lembretesQuery = "SELECT * FROM lembretes WHERE userid = ? ORDER BY id DESC";
            PreparedStatement lembretesQueryDone = conn.prepareStatement(lembretesQuery);
            lembretesQueryDone.setInt(1, uid2);
            ResultSet lembretes = lembretesQueryDone.executeQuery();
            while (lembretes.next()) {
                int id = lembretes.getInt("id");
                String nome3 = lembretes.getString("nome");
                String desc = lembretes.getString("descricao");
                String data = lembretes.getString("data");
                String hora = lembretes.getString("hora");
        %>
                <div class="notification">
                    <div class="content">
                        <div class="info">
                          </small>  <h3><%= nome3 %></h3>
                          <p><%= desc %></p>
                            <small class="text_muted">
                                <%= data %> | <%= hora %>
                            </small>
                        </div>
                        <a href="deletelembrete?id=<%= id %>" style="text-decoration: none;">
                            Excluir
                        </a>
                    </div>
                </div>
        <%
            }
        %>

        <div class="notification add-reminder" id="openFormButton2">
            <div>
                <span class="material-icons-sharp">
                    add
                </span>
                <h3>Adicionar Lembrete</h3>
            </div>
        </div>

    </div>
    <div id="opentesteform2" class="popup" style="display: none;
    position: fixed;
    width: 425px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
    height: 375px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 25px;
    border-radius: 15px;
    background-color: var(--color-background);">
   <div>
       <div>
           <!-- Formulario para adicionar um novo produto -->
           <form id="testeform" action="addlembrete" method="POST">
               <h1>Adicionar lembrete</h1>
               <span style="margin-left: 25px; "><b>NOME</b></span>
               <input type="text" name="nome" placeholder="Nome" style="margin-top: 5px; margin-bottom: 5px; margin-left: 5px; padding: 10px;
               background-color:var(--color-background); color: var(--color-dark);"
                      required><br>

               <span style="margin-left: 25px;"><b>DESCRICAO</b></span>
               <input type="text" name="descricao" placeholder="..." style="margin-top: 5px; margin-bottom: 5px; margin-left: 5px; padding: 10px;
               background-color:var(--color-background); color: var(--color-dark);" required><br>

               <span style="margin-left: 25px;"><b>DATA</b></span>
            <input type="date" name="data" placeholder="" style="margin-top: 5px; margin-bottom: 5px; margin-left: 5px; padding: 10px;
            background-color:var(--color-background); color: var(--color-dark);"
            value="" pattern="\d{4}-\d{2}-\d{2}" required><br>

                <span style="margin-left: 25px;"><b>HORA</b></span>
                <input type="time" name="hora" placeholder="Horario" style="margin-top: 5px; margin-bottom: 5px; margin-left: 5px; padding: 10px;
                background-color:var(--color-background); color: var(--color-dark);"
                       required><br><br>
                       <input type="hidden" name="uid" value=<%= uid2 %>>
            <div style="margin-top:10px;">
               <button class="btn btn-danger" id="closeFormButton2" type="button"
                       style="padding-left: 155px; padding-right: 155px; padding:10px">Cancelar</button>

               <button id="adicionarButton" class="btn btn-outline-primary" type="submit"
                       style="padding-right: 100px; padding-top: 10px; padding-bottom: 10px; padding-left: 100px; margin-left:15px;">Adicionar</button>
                    </div>
                    </form>
           <script>
            document.getElementById('openFormButton2').addEventListener('click', function () {
                document.getElementById('opentesteform2').style.display = 'block'; // Mostra o pop-up
            });
            document.getElementById('closeFormButton2').addEventListener('click', function () {
                document.getElementById('opentesteform2').style.display = 'none'; // Esconde o pop-up
            });
            document.getElementById('adicionarButton2').addEventListener('click', function () {
                document.getElementById('opentesteform2').style.display = 'none'; // Esconde o pop-up
            });
        </script>

    <!-- Fim Lembretes - Nao finalizado -->
    </section>
    <% 
    conn.close(); // Fechar a conexão com o banco de dados
%>