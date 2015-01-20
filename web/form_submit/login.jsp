<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <c:if test="${ empty param.login or empty param.password}">
      <c:redirect url="../index.jsp" >
              <c:param name="errMsg" value="Digite seu usuário e senha." />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.login and not empty param.password}">
      <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/infostore"
                       user="root" password=""/>
      
      <s:query dataSource="${ds}" var="selectQ">
        select count(*) as kount from usuarios
        where user_login = ?
        and user_password = ?
        <s:param value="${param.login}"/>
        <s:param value="${param.password}"/>
      </s:query>
 
      <c:forEach items="${selectQ.rows}" var="r">
        <c:choose>
            
          <c:when test="${r.kount gt 0}">
              
              <s:query dataSource="${ds}" var="result">
                select * from usuarios
                where user_login = ?
                and user_password = ?
                <s:param value="${param.login}"/>
                <s:param value="${param.password}"/>
              </s:query>
              <c:forEach var="row" items="${result.rows}">
                <c:set scope="session"
                   var="user_login"
                   value="${row.user_login}"/>  
                <c:set scope="session"
                   var="user_id"
                   value="${row.user_id}"/>  
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


