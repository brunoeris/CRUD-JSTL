<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
 session.removeAttribute("loginUser");
%>
<c:redirect url="../index.jsp"/>


