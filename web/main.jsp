<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>Administração - Info Store</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/reset.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/fontawesome/css/font-awesome.min.css"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="css/ifav.ico" type="image/x-icon"/>
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

      
        <div class="jumbotron">
            <h2>Bem Vindo!<br>
            <small><%= session.getAttribute("user_login") %></small><br>
            <small><a class="configlink" onclick="config(${sessionScope['user_id']});">Configurações da conta</a></small>
            </h2>
        </div>
    </div> 
 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

