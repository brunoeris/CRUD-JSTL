<%-- 
    Document   : cadastrarloja
    Created on : 13/01/2015, 02:06:11
    Author     : fromd_000
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastrar Loja</title>
  </head>
  <body>
    <c:if test="${ empty param.nome or empty param.cnpj or empty param.email or empty param.usuario or empty param.senha}">
      <c:redirect url="../cadastroloja.jsp" >
              <c:param name="errMsg" value="Please Enter UserName and Password" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.nome and not empty param.cnpj and not empty param.email and not empty param.usuario and not empty param.senha}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/projetojstl"
                       user="root" password=""/>
 
      <sql:update dataSource="${ds}" var="result">
          
        INSERT INTO loja(nome,cnpj,email,usuario,senha) VALUES (?,?,?,?,?);
        
        <sql:param value="${param.nome}"/>
        <sql:param value="${param.cnpj}"/>
        <sql:param value="${param.email}"/>
        <sql:param value="${param.usuario}"/>
        <sql:param value="${param.senha}"/>
      </sql:update>
      <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="../index.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
       </c:if>  
 
    </c:if>
 
  </body>
</html>


