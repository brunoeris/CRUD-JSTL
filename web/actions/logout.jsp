<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
 session.removeAttribute("user_login");
%>
<c:redirect url="../index.jsp"/>


