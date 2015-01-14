<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Info Store</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/fontawesome/css/font-awesome.min.css"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    
    <link rel="shortcut icon" href="css/favicon.ico" type="image/x-icon"/>
    
    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">
        
        <div class="row">
             <div class="col-md-12">
               <div class="row">
                    <div class="col-md-4 text-center">
                          
                    </div>
                    <div class="col-md-4 text-center">
                           <h1 class="bg-primary img-circle"><i class="fa fa-shopping-cart fa-4x "></i></h1>
                    </div>
                   <div class="col-md-4 text-center">
                          
                    </div>
               </div>
                
                    <h2 class="form-signin-heading text-center text-uppercase">Gerenciador de Loja</h2>
                
                
                <form class="form-signin text-center" action="actions/validalogin.jsp" role="form" method="post">                    
                    <input type="text" name="usuario" class="form-control" placeholder="Digite seu nome de usuário" required autofocus>
                    <input type="password" name="senha" class="form-control" placeholder="Digite sua senha" required>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">ENTRAR</button>
                    <a class="btn btn-lg btn-link " href="cadastroloja.jsp">CADASTRAR</a>
                </form>
            </div>
            
        </div>
           
        </div>  
    </div> 


    <script src="bootstrap.min.js"></script>
  </body>
</html>
