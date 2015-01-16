<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Administração - Info Store</title>

 <link rel="stylesheet" href="css/reset.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/fontawesome/css/font-awesome.min.css"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="css/favicon.ico" type="image/x-icon"/>
  </head>

  <body>
      <c:if test="${ empty sessionScope.user_login}" >  
        <c:redirect url="index.jsp" >
            <c:param name="errMsg" value="Sessao não iniciada." />
            </c:redirect>  
        </c:if>  
       
    <div class="bg-default navbar-top">
        <h4 class="text-center"><i class="fa fa-info-circle fa-4x"></i></h4><h2 class="text-center logotop"><a href="main.jsp" >Info Store</a></h2>   
    </div>
    
    <div class="container">
      <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-uppercase" href="main.jsp">  </a>
            
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">  
              <li class="text-center"><a href="clientes.jsp">Clientes</a></li>
              <li class="text-center"><a href="produtos.jsp">Produtos</a></li>
              <li class="text-center"><a href="pecas.jsp">Peças</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="active text-center"><a href="actions/logout.jsp">SAIR<span class="sr-only">(current)</span></a></li>
            </ul>
          </div>
        </div>
      </nav>
      

      <div class="container">
          <div class="row">
              <blockquote class="col-md-12 text-center"> 
                  <h2 class="text-center">Gerenciamento de clientes</h2><br>
                  <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">Cadastrar Cliente</button>
              </blockquote>
          </div>
        
      </div>
    </div><br><br>
    
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th>ID</th>
                              <th>Nome</th>
                              <th>E-mail</th>
                              <th>Telefone</th>
                              <th>Vendedor</th>
                            </tr>
                          </thead>
                          <tbody>
                             <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                                                url="jdbc:mysql://localhost/infostore"
                                                user="root"  password=""/>

                             <sql:query dataSource="${dbsource}" var="result">
                                 SELECT * from clientes;
                             </sql:query>
                            <c:forEach var="row" items="${result.rows}">  
                                <tr>
                                    <th scope="row"><c:out value="${row.cli_id}"/></th>                           
                                    <td><c:out value="${row.cli_name}"/></td>
                                    <td><c:out value="${row.cli_mail}"/></td>
                                    <td><c:out value="${row.cli_phone}"/></td>
                                    <td><button type="button" onclick="atualizarCliente(<c:out value="${row.cli_id}"/>);" class="btn btn-warning pull-right"><i class="fa fa-pencil"></i></button></td>
                                    <td><button type="button" onclick="excluirCliente(<c:out value="${row.cli_id}"/>);" class="btn btn-danger pull-right"><i class="fa fa-trash-o"></i></button></td>
                                </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                    </div>
                    
                </div>

            </div>

        </div>
        
        
    </section>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">          
          <form class="form-horizontal" action="actions/cad_client.jsp">  
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="myModalLabel">Cadastrar Cliente</h4>
            </div>
            <div class="modal-body">
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">Nome</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="name" placeholder="Nome do cliente">
                    </div>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="mail" placeholder="E-mail do cliente">
                    </div>
                  </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Telefone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" placeholder="Telefone do cliente">
                        </div>
                      </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
              <button type="submit" class="btn btn-primary">Cadastrar</button>
            </div>
          </form>  
        </div>
      </div>
    </div>
    
    <!-- JS ##################################
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

