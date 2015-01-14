<%-- 
    Document   : deletarproduto
    Created on : 13/01/2015, 04:54:40
    Author     : fromd_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletar Funcionario</title>
    </head>
    <body>
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/projetojstl"
                       user="root" password=""/>
        <sql:update dataSource="${ds}" var="count">
            DELETE FROM funcionarios
            WHERE id=?
            <sql:param value="${param.id}"/>
        </sql:update>
        <c:if test="${count>=1}">
            <c:redirect url="../funcionarios.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>       
        </c:if>
    </body>
</html>
