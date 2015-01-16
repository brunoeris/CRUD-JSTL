<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro de usuários</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/fontawesome/css/font-awesome.min.css"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="css/favicon.ico" type="image/x-icon"/>
  </head>

  <body>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="form-signin-heading text-center"> Info Store <i class="fa fa-desktop"></i></h2><br>
                
                <h3 class="text-center bg-primary">Cadastro de Usuários</h3><br><br>
                
                <form class="form-horizontal" action="actions/cad_users.jsp">
                    <div class="form-group">
                      <label for="login" class="col-sm-2 control-label">Usuário</label>
                      <div class="col-sm-8">
                          <input type="text" class="form-control" name="login" placeholder="Informe seu nome de usuário" required>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="senha" class="col-sm-2 control-label">Senha</label>
                      <div class="col-sm-8">
                          <input type="password" class="form-control" name="password" placeholder="Informe sua senha" required>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-8">
                        <button type="submit" class="btn btn-primary">Cadastrar</button>
                        <a class="btn btn-warning" href="index.jsp">Cancelar</a>
                      </div>
                    </div>
                  </form>
            </div>
        </div>  
    </div> 
    <script src="bootstrap.min.js"></script>
  </body>
</html>
