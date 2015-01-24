<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastrar Cliente</title>
  </head>
  <body>
    <c:if test="${ empty param.name or param.mail or empty param.phone}">
      <c:redirect url="../clientes.jsp" >
              <c:param name="errMsg" value="Erro na leitura de dados do cliente" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.name and not empty param.mail and not empty param.phone}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/infostore"
                       user="root" password=""/>
 
      <sql:update dataSource="${ds}" var="result">
          
        INSERT INTO clientes(cli_name,cli_mail,cli_phone) VALUES (?,?,?);
        
        <sql:param value="${param.name}"/>
        <sql:param value="${param.mail}"/>
        <sql:param value="${param.phone}"/>
      </sql:update>
      <c:if test="${result>=1}">
            <font size="5" color='green'> Cliente cadastrado com sucesso.</font>
 
            <c:redirect url="../clientes.jsp" >
                <c:param name="susMsg" value="Cliente cadastrado com sucesso." />
            </c:redirect>
       </c:if>  
 
    </c:if>
 
  </body>
</html>


