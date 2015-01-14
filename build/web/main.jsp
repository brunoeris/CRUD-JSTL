
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

    <title>Gerenciador de Loja</title>
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
              <li class="text-center"><a href="funcionarios.jsp">Funcionários</a></li>
              <li class="text-center"><a href="clientes.jsp">Clientes</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="active text-center"><a href="actions/logout.jsp">SAIR<span class="sr-only">(current)</span></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
          <h2>BEM VINDO ! <i class="fa fa-shopping-cart"></i></br>
        <small>Gerencie sua loja, melhore resultados.</small></h2>
      </div>

    </div> <!-- /container -->
    
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3>Produtos <a href="produtos.jsp" class="btn btn-default pull-right">Ver Mais</a></h3>
                    </br>
                    
                    
                    <table class="table table-hover">
                        <tbody>
                            <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                                                url="jdbc:mysql://localhost/projetojstl"
                                                user="root"  password=""/>

                             <sql:query dataSource="${dbsource}" var="result">
                                 SELECT * from produtos where cod_loja=?;
                                 <sql:param value="${sessionScope['idLoja']}"/>
                             </sql:query>
                            <c:forEach var="row" items="${result.rows}">  
                            <tr>
                                <th scope="row"><c:out value="${row.id}"/></th>                           
                                <td><c:out value="${row.nome}"/></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-4">
                    <h3>Funcionários <a href="funcionarios.jsp" class="btn btn-default pull-right">Ver Mais</a></h3>
                    </br>
                    <table class="table table-hover">
                        <tbody>
                            <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                                                url="jdbc:mysql://localhost/projetojstl"
                                                user="root"  password=""/>

                             <sql:query dataSource="${dbsource}" var="result">
                                 SELECT * from funcionarios where cod_loja=?;
                                 <sql:param value="${sessionScope['idLoja']}"/>
                             </sql:query>
                            <c:forEach var="row" items="${result.rows}">  
                            <tr>
                                <th scope="row"><c:out value="${row.id}"/></th>                           
                                <td><c:out value="${row.nome}"/></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>                    
                    
                </div>
                <div class="col-md-4">
                    <h3>Clientes <a href="clientes.jsp" class="btn btn-default pull-right">Ver Mais</a></h3>
                    </br>
                    <table class="table table-hover">
                        <tbody>
                            <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                                                url="jdbc:mysql://localhost/projetojstl"
                                                user="root"  password=""/>

                             <sql:query dataSource="${dbsource}" var="result">
                                 SELECT * from clientes where cod_loja=?;
                                 <sql:param value="${sessionScope['idLoja']}"/>
                             </sql:query>
                            <c:forEach var="row" items="${result.rows}">  
                            <tr>
                                <th scope="row"><c:out value="${row.id}"/></th>                           
                                <td><c:out value="${row.nome}"/></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>                    
                    
                </div>

            </div>

        </div>
        
    </section>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

