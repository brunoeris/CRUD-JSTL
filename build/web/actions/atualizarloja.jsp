<%-- 
    Document   : atualizarloja
    Created on : 13/01/2015, 15:17:23
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
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/projetojstl"
                           user="root"  password=""/>
        <sql:update dataSource="${ds}" var="count">
            UPDATE loja SET nome = ?, email=?,usuario=?,cnpj=?,senha=? WHERE id=?;
            <sql:param value="${param.nome}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.usuario}" />
            <sql:param value="${param.cnpj}" />
            <sql:param value="${param.senha}" />
            <%-- 
            <c:choose>
                <c:when test="${empty param.novasenha}"><sql:param value="${param.senha}" /></c:when> <!-- if condition -->                
                <c:otherwise><sql:param value="${param.novasenha}" /></c:otherwise>    <!-- else condition -->
             </c:choose>
             --%>
            <sql:param value="${param.id}" />

        </sql:update>
        <c:set scope="session"
                   var="loginUser"
                   value="${param.nome}"/>  
        <c:if test="${count>=1}">
             <c:redirect url="../main.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>               
        </c:if>
    </body>
</html>