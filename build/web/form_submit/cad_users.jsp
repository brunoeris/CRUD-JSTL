<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <c:if test="${ empty param.login or empty param.password}">
      <c:redirect url="../cad_users.jsp" >
              <c:param name="errMsg" value="Digite login e senha" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.login and not empty param.password}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/infostore"
                       user="root" password=""/>
 
      <sql:update dataSource="${ds}" var="result">
          
        INSERT INTO usuarios(user_login,user_password) VALUES (?,?);
        
        <sql:param value="${param.login}"/>
        <sql:param value="${param.password}"/>
      </sql:update>
      <c:if test="${result>=1}">
            <font size="5" color='green'> Usuário cadastrado com sucesso.</font>
 
            <c:redirect url="../index.jsp" >
                <c:param name="susMsg" value="Usuário cadastrado com sucesso." />
            </c:redirect>
       </c:if>  
 
    </c:if>
 
  </body>
</html>


