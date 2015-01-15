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

    <title>Info Store</title>
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
          
          <a href="main.jsp" ><h4 class="text-center"><i class="fa fa-info-circle fa-4x"></i></h4><h2 class="text-center logotop">Info Store</h2></a>
          
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
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
          <h2>Bem Vindo !<br>
        <small><%= session.getAttribute("user_login") %></small></h2>
      </div>

    </div> <!-- /container -->
    
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3>Clientes [PROD]<a href="clientes.jsp" class="btn btn-default pull-right">Ver Mais</a></h3>
                    </br>
                    
                    
                    <table class="table table-hover">
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
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-4">
                    <h3>Produtos [FUN]<a href="produtos.jsp" class="btn btn-default pull-right">Ver Mais</a></h3>
                    </br>
                    <table class="table table-hover">
                        <tbody>
                             <sql:query dataSource="${dbsource}" var="result">
                                 SELECT * from produtos;
                             </sql:query>
                            <c:forEach var="row" items="${result.rows}">  
                            <tr>
                                <th scope="row"><c:out value="${row.pro_id}"/></th>                           
                                <td><c:out value="${row.pro_details}"/></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>                    
                    
                </div>
                <div class="col-md-4">
                    <h3>Peças [CLI]<a href="pecas.jsp" class="btn btn-default pull-right">Ver Mais</a></h3>
                    </br>
                    <table class="table table-hover">
                        <tbody>
                             <sql:query dataSource="${dbsource}" var="result">
                                 SELECT * from pecas;
                             </sql:query>
                            <c:forEach var="row" items="${result.rows}">  
                            <tr>
                                <th scope="row"><c:out value="${row.pec_id}"/></th>                           
                                <td><c:out value="${row.pec_details}"/></td>
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

