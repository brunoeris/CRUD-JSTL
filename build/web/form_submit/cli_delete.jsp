<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Cliente</title>
    </head>
    <body>
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/infostore"
                       user="root" password=""/>
        <sql:update dataSource="${ds}" var="count">
            DELETE FROM clientes WHERE cli_id = ?
            <sql:param value="${param.id}"/>
        </sql:update>
        <c:if test="${count>=1}">
            <c:redirect url="../clientes.jsp" >
                <c:param name="susMsg" value="Cliente excluido com sucesso" />
            </c:redirect>       
        </c:if>
    </body>
</html>
