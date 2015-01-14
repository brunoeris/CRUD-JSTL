<%-- 
    Document   : cadastrar
    Created on : 13/01/2015, 01:00:28
    Author     : fromd_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Cadastro - LOJA</title>
    
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
                <h2 class="form-signin-heading text-center"> GERENCIADOR DE LOJA <i class="fa fa-shopping-cart"></i> </h2>
                
                <h3 class="text-center bg-primary">CADASTRO</h3>
                
                <form class="form-horizontal" action="actions/cadastrarloja.jsp">
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">Loja</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="nome" placeholder="Digite o nome da sua loja">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">CNPJ</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="cnpj" placeholder="Digite o cnpj da sua empresa">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Email</label>
                      <div class="col-sm-10">
                        <input type="email" class="form-control"  name="email" placeholder="Digite seu email">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Usuário</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control"  name="usuario" placeholder="Digite o nome de usuário para login">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Senha</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" name="senha" placeholder="Digite a senha para login">
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">CADASTRAR</button>
                        <a class="btn btn-default" href="index.jsp">Cancelar</a>
                      </div>
                    </div>
                  </form>
            </div>
        </div>  
    </div> 


    <script src="bootstrap.min.js"></script>
  </body>
</html>
