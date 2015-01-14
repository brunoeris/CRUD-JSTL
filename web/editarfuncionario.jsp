<%-- 
    Document   : editarfuncionario
    Created on : 13/01/2015, 13:44:36
    Author     : fromd_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>DASHBOARD - LOJA</title>

 <link rel="stylesheet" href="css/reset.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/fontawesome/css/font-awesome.min.css"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="css/favicon.ico" type="image/x-icon"/>
  </head>

  <body>
      <c:if test="${ empty sessionScope.loginUser}" >  
        <c:redirect url="index.jsp" >
            </c:redirect>  
        </c:if>  
          <div class="bg-primary navbar-fixed-top">
          
          <h4 class="text-center">Gerenciador de Loja <i class="fa fa-globe"></i></h4>
          
      </div>  
    
    <div class="container">
         
      <!-- Static navbar -->
      <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-uppercase" href="main.jsp"><%= session.getAttribute("loginUser") %>  </a>
            
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="text-center"><a class="configlink" onclick="config(${sessionScope['idLoja']});"><i class="fa fa-gears"></i></a></li>   
              <li class="text-center"><a href="produtos.jsp">Produtos</a></li>
              <li class="active text-center"><a href="funcionarios.jsp">Funcionários</a></li>
              <li class="text-center"><a href="clientes.jsp">Clientes</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="active text-center"><a href="actions/logout.jsp">SAIR<span class="sr-only">(current)</span></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
      

      <div class="container">
          <div class="row">
              <blockquote class="col-md-12"> 
                  <h2>Funcionários<br><small>Gerencie os Funcionários da sua loja.</small></h2>
                  <a type="button" class="btn btn-default btn-lg" href="funcionarios.jsp">VOLTAR</a>
              </blockquote>
          </div>
        
      </div>

    </div> <!-- /container -->
    
     <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/projetojstl"
                       user="root" password=""/>
    <sql:query dataSource="${ds}" var="result">
            SELECT * from funcionarios where id=?;
            <sql:param value="${param.id}" />
        </sql:query>
    <section>
        <div class="container">
            <c:forEach var="row" items="${result.rows}">
            <div class="row">
                 <form class="form-horizontal" action="actions/atualizarfuncionario.jsp" method="post">  
                <div class="col-md-8 center-block">
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">Nome</label>
                    <div class="col-sm-10">
                        <input type="hidden" value="${param.id}" name="id"/>
                      <input type="text" class="form-control" name="nome" placeholder="Digite o nome do Funcionário" value="${row.nome}">
                    </div>
                  </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">CPF</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="cpf" placeholder="Digite o CPF do Funcionário" value="${row.cpf}">
                        </div>
                      </div>
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="email" placeholder="Digite o Email do Funcionário" value="${row.email}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">Telefone</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="telefone" placeholder="Digite o Telefone do Funcionário" value="${row.telefone}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">Cargo</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="cargo" placeholder="Digite o Cargo do Funcionário" value="${row.cargo}">
                    </div>
                  </div>
                     <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                          <button type="submit" class="btn btn-default">Atualizar</button>
                        </div>
                      </div>
                </div>
                 </form>
            </div>
            </c:forEach>
        </div>
        
        
    </section>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">          
          <form class="form-horizontal" action="actions/cadastrarproduto.jsp">  
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="myModalLabel">Cadastrar Produto</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
              <button type="submit" class="btn btn-primary">Cadastrar</button>
            </div>
          </form>  
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>



