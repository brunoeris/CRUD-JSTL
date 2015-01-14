<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Autenticação</title>
  </head>
  <body>
    <c:if test="${ empty param.usuario or empty param.senha}">
      <c:redirect url="../index.jsp" >
              <c:param name="errMsg" value="Please Enter UserName and Password" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.usuario and not empty param.senha}">
      <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/projetojstl"
                       user="root" password=""/>
 
      <s:query dataSource="${ds}" var="selectQ">
        select count(*) as kount from loja
        where usuario = ?
        and senha = ?
        <s:param value="${param.usuario}"/>
        <s:param value="${param.senha}"/>
      </s:query>
 
      <c:forEach items="${selectQ.rows}" var="r">
        <c:choose>
            
          <c:when test="${r.kount gt 0}">
              
              <s:query dataSource="${ds}" var="result">
                select * from loja
                where usuario = ?
                and senha = ?
                <s:param value="${param.usuario}"/>
                <s:param value="${param.senha}"/>
              </s:query>
              <c:forEach var="row" items="${result.rows}">
                <c:set scope="session"
                   var="loginUser"
                   value="${row.nome}"/>  
                <c:set scope="session"
                   var="idLoja"
                   value="${row.id}"/>  
              </c:forEach>
                
            
            <c:redirect url="../main.jsp"/>
          </c:when>
          <c:otherwise>
            <c:redirect url="../index.jsp" >
              <c:param name="errMsg" value="Usuário e/ou Senha Inválido" />
            </c:redirect>
          </c:otherwise>
        </c:choose>
 
      </c:forEach>
 
    </c:if>
 
  </body>
</html>


