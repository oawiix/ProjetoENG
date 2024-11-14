
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="css/signup.css">
    <title>Registrar | ENG</title>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    <div class="container" id="container">
        <div class="form-container sign-in">
            <form action="addUsuario" method="POST">
                <a href="login.jsp" style="margin-left: -230px; padding:5px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
                      </svg>
                    voltar
                    </a>
                <h1>Criar uma conta</h1>
                <span>Prrencha os campos</span><br>
                <input type="text" id="formName" name="nome" placeholder="Nome Completo">
                <input type="text" id="formName" name="usuario" placeholder="Usuario">
                <input type="password" id="formName" name="senha" placeholder="Senha">
                <input type="email" id="formName" name="email" placeholder="Email">
                <input name="tipo" id="tipo" style="border-radius: 5px; padding:5px" type="hidden" value="1">
                <input type="hidden" name="data" style="padding: 5px;border-radius: 5px;" 
                value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">

                <button type="submit" class="btn btn-outline-dark" style="padding:10px; padding-left: 120px; padding-right:120px; font-size:15px; margin-top: 10px" > Concluir </button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-right">
                    <svg xmlns="http://www.w3.org/2000/svg" width="75" height="75" fill="currentColor" class="bi bi-wrench-adjustable-circle-fill" viewBox="0 0 16 16">
                        <path d="M6.705 8.139a.25.25 0 0 0-.288-.376l-1.5.5.159.474.808-.27-.595.894a.25.25 0 0 0 .287.376l.808-.27-.595.894a.25.25 0 0 0 .287.376l1.5-.5-.159-.474-.808.27.596-.894a.25.25 0 0 0-.288-.376l-.808.27z"/>
                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m-6.202-4.751 1.988-1.657a4.5 4.5 0 0 1 7.537-4.623L7.497 6.5l1 2.5 1.333 3.11c-.56.251-1.18.39-1.833.39a4.5 4.5 0 0 1-1.592-.29L4.747 14.2a7.03 7.03 0 0 1-2.949-2.951M12.496 8a4.5 4.5 0 0 1-1.703 3.526L9.497 8.5l2.959-1.11q.04.3.04.61"/>
                      </svg>
                      <br>
                    <h1 style="font-weight: 800;">Projeto ENG</h1>
                    <p style="color: white;">-<br>
                        <b style="color: white;">-</b></p>
                    <p style="margin-bottom: -100px;
                    margin-top: 60px;">
                    <b style="color: white;">Felipe</b></p>  
                </div>
            </div>
        </div>
    </div>
    <br>
</body>
</html>
