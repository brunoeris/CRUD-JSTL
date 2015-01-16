<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <c:if test="${ empty param.type or empty param.mark or empty param.details or empty param.reference}">
      <c:redirect url="../produtos.jsp" >
              <c:param name="errMsg" value="Preencha todos os dados" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.type and not empty param.mark and not empty param.details and not empty param.reference}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/infostore"
                       user="root" password=""/>
 
      <sql:update dataSource="${ds}" var="result">
          
        INSERT INTO produtos(pro_type,pro_mark,pro_details,pro_reference) VALUES (?,?,?,?);
        
        <sql:param value="${param.type}"/>
        <sql:param value="${param.mark}"/>
        <sql:param value="${param.details}"/>
        <sql:param value="${param.reference}"/>
      </sql:update>
      <c:if test="${result>=1}">
            <font size="5" color='green'>Produto cadastrado com sucesso.</font>
 
            <c:redirect url="../produtos.jsp" >
                <c:param name="susMsg" value="Produto cadastrado com sucesso." />
            </c:redirect>
       </c:if>  
 
    </c:if>
 
  </body>
</html>


