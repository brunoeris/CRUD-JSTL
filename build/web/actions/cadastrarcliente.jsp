<%-- 
    Document   : cadastrarproduto
    Created on : 13/01/2015, 04:16:31
    Author     : fromd_000
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastrar Cliente</title>
  </head>
  <body>
    <c:if test="${ empty param.nome or param.email or empty param.telefone or empty param.endereco}">
      <c:redirect url="../clientes.jsp" >
              <c:param name="errMsg" value="Please Enter UserName and Password" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.nome and not empty param.email and not empty param.telefone and not empty param.endereco}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/projetojstl"
                       user="root" password=""/>
 
      <sql:update dataSource="${ds}" var="result">
          
        INSERT INTO clientes(nome,email,telefone,endereco,cod_loja) VALUES (?,?,?,?,?);
        
        <sql:param value="${param.nome}"/>
        <sql:param value="${param.email}"/>
        <sql:param value="${param.telefone}"/>
        <sql:param value="${param.endereco}"/>
        <sql:param value="${sessionScope['idLoja']}"/>
      </sql:update>
      <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="../clientes.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
       </c:if>  
 
    </c:if>
 
  </body>
</html>


